/**
 * TRENDORA LUXURY E-COMMERCE - LOGIN PAGE INTERACTIVITY
 * Handles floating label states, password visibility toggle, and client-side validation.
 * NOTE: Role switching removed – authentication is now handled server-side based on DB Role column.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // --- DOM ELEMENT REFERENCES ---
    const txtEmail          = document.getElementById('txtEmail');
    const txtPassword       = document.getElementById('txtPassword');
    const btnTogglePassword = document.getElementById('btnTogglePassword');
    const passwordEyeIcon   = document.getElementById('passwordEyeIcon');

    // Alert Banners (client-side only)
    const alertError      = document.getElementById('alertError');
    const alertSuccess    = document.getElementById('alertSuccess');
    const lblErrorMessage = document.getElementById('lblErrorMessage');

    // --- 1. PASSWORD SHOW/HIDE TOGGLE ---
    if (btnTogglePassword && txtPassword && passwordEyeIcon) {
        btnTogglePassword.addEventListener('click', (e) => {
            e.preventDefault();
            const type = txtPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            txtPassword.setAttribute('type', type);

            if (type === 'text') {
                passwordEyeIcon.classList.remove('fa-eye');
                passwordEyeIcon.classList.add('fa-eye-slash');
                passwordEyeIcon.style.color = '#D4AF37'; // Gold when visible
            } else {
                passwordEyeIcon.classList.remove('fa-eye-slash');
                passwordEyeIcon.classList.add('fa-eye');
                passwordEyeIcon.style.color = '#AAA';
            }
        });
    }

    // --- 2. HELPER FUNCTIONS ---
    const validateEmail = (email) => {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    };

    const hideAlerts = () => {
        if (alertError)   alertError.style.display   = 'none';
        if (alertSuccess) alertSuccess.style.display = 'none';
    };

    const showClientError = (message) => {
        hideAlerts();
        if (alertError && lblErrorMessage) {
            lblErrorMessage.innerText = message;
            alertError.style.display  = 'flex';
        }
    };

    // --- 3. Clear validation error on input focus ---
    [txtEmail, txtPassword].forEach(input => {
        if (input) {
            input.addEventListener('input', function () {
                const group = this.closest('.floating-input-group');
                if (group) group.classList.remove('invalid');
                hideAlerts();
            });
        }
    });
});

// --- 4. CLIENT-SIDE VALIDATION (called by OnClientClick of asp:Button) ---
// Returns false to stop postback if validation fails.
function validateLoginForm() {
    const txtEmail    = document.getElementById('txtEmail');
    const txtPassword = document.getElementById('txtPassword');
    const alertError  = document.getElementById('alertError');
    const lblError    = document.getElementById('lblErrorMessage');

    const emailVal    = txtEmail    ? txtEmail.value.trim()    : '';
    const passwordVal = txtPassword ? txtPassword.value.trim() : '';

    const emailGroup    = txtEmail    ? txtEmail.closest('.floating-input-group')    : null;
    const passwordGroup = txtPassword ? txtPassword.closest('.floating-input-group') : null;

    let isValid = true;

    // Email validation
    const emailRe = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailVal || !emailRe.test(emailVal)) {
        if (emailGroup) emailGroup.classList.add('invalid');
        isValid = false;
    } else {
        if (emailGroup) emailGroup.classList.remove('invalid');
    }

    // Password validation (min 6 chars)
    if (!passwordVal || passwordVal.length < 6) {
        if (passwordGroup) passwordGroup.classList.add('invalid');
        isValid = false;
    } else {
        if (passwordGroup) passwordGroup.classList.remove('invalid');
    }

    if (!isValid) {
        if (alertError && lblError) {
            lblError.innerText        = 'Please correct the highlighted fields before signing in.';
            alertError.style.display  = 'flex';
        }
        return false; // Stop postback
    }

    return true; // Allow postback to server
}