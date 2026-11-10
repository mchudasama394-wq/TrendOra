/**
 * TRENDORA LUXURY E-COMMERCE - GLOBAL ACCOUNT REGISTRATION LOGIC
 * Handles password visibility toggle, real-time strength meter calculation, password matching, and client validation.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // --- DOM ELEMENT REFERENCES ---
    const txtFullName = document.getElementById('txtFullName');
    const txtEmail = document.getElementById('txtEmail');
    const txtPhone = document.getElementById('txtPhone');
    const txtPassword = document.getElementById('txtPassword');
    const txtConfirmPassword = document.getElementById('txtConfirmPassword');
    const btnTogglePassword = document.getElementById('btnTogglePassword');
    const passwordEyeIcon = document.getElementById('passwordEyeIcon');
    const matchStatusIcon = document.getElementById('matchStatusIcon');
    const chkTerms = document.getElementById('chkTerms');
    const btnRegisterSubmit = document.getElementById('btnRegisterSubmit');

    // Password Strength Meter Elements
    const passwordStrengthWrapper = document.getElementById('passwordStrengthWrapper');
    const strengthBarFill = document.getElementById('strengthBarFill');
    const strengthText = document.getElementById('strengthText');

    // Alert Banners
    const alertError = document.getElementById('alertError');
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

    // --- 2. LIVE PASSWORD STRENGTH CALCULATOR ---
    const calculateStrength = (password) => {
        let score = 0;
        if (!password) return { score: 0, text: 'None', color: '#E8E8E8', width: '0%' };

        // Length checks
        if (password.length >= 8) score += 25;
        if (password.length >= 12) score += 15;

        // Complexity checks
        if (/[A-Z]/.test(password)) score += 20; // Uppercase
        if (/[0-9]/.test(password)) score += 20; // Numbers
        if (/[^A-Za-z0-9]/.test(password)) score += 20; // Special symbols

        if (score < 40) {
            return { score, text: 'Weak', color: '#E74C3C', width: '33%' };
        } else if (score < 75) {
            return { score, text: 'Medium', color: '#F39C12', width: '66%' };
        } else {
            return { score, text: 'Strong', color: '#2ECC71', width: '100%' };
        }
    };

    if (txtPassword && passwordStrengthWrapper && strengthBarFill && strengthText) {
        txtPassword.addEventListener('input', function () {
            const val = this.value;

            if (val.length > 0) {
                passwordStrengthWrapper.classList.add('active');
            } else {
                passwordStrengthWrapper.classList.remove('active');
            }

            const strength = calculateStrength(val);
            strengthBarFill.style.width = strength.width;
            strengthBarFill.style.backgroundColor = strength.color;
            strengthText.innerText = strength.text;
            strengthText.style.color = strength.color;

            // Trigger confirm password re-check if filled
            if (txtConfirmPassword.value.length > 0) {
                checkPasswordMatch();
            }
        });
    }

    // --- 3. CONFIRM PASSWORD MATCH CHECKER ---
    const checkPasswordMatch = () => {
        const pwd = txtPassword.value;
        const confirmPwd = txtConfirmPassword.value;

        if (!matchStatusIcon) return;

        if (confirmPwd.length === 0) {
            matchStatusIcon.className = 'fa-solid fa-check match-status-icon';
            return false;
        }

        if (pwd === confirmPwd && pwd.length >= 8) {
            matchStatusIcon.className = 'fa-solid fa-circle-check match-status-icon valid';
            return true;
        } else {
            matchStatusIcon.className = 'fa-solid fa-circle-xmark match-status-icon invalid';
            return false;
        }
    };

    if (txtConfirmPassword) {
        txtConfirmPassword.addEventListener('input', checkPasswordMatch);
    }

    // --- 4. VALIDATION HELPER FUNCTIONS ---
    const validateEmail = (email) => {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    };

    const validatePhone = (phone) => {
        const re = /^[0-9]{8,12}$/;
        return re.test(String(phone).replace(/\s+/g, ''));
    };

    const hideAlerts = () => {
        if (alertError) alertError.style.display = 'none';
    };

    const showError = (message) => {
        hideAlerts();
        if (alertError && lblErrorMessage) {
            lblErrorMessage.innerText = message;
            alertError.style.display = 'flex';
        }
    };

    // --- 5. FORM SUBMISSION VALIDATION LOGIC ---
    if (btnRegisterSubmit) {
        btnRegisterSubmit.addEventListener('click', (e) => {
            hideAlerts();

            let isValid = true;

            const nameVal = txtFullName.value.trim();
            const emailVal = txtEmail.value.trim();
            const phoneVal = txtPhone.value.trim();
            const pwdVal = txtPassword.value;
            const confirmVal = txtConfirmPassword.value;
            const isTermsChecked = chkTerms.checked;

            const nameGroup = txtFullName.closest('.floating-input-group');
            const emailGroup = txtEmail.closest('.floating-input-group');
            const phoneGroup = txtPhone.closest('.floating-input-group');
            const pwdGroup = txtPassword.closest('.floating-input-group');
            const confirmGroup = txtConfirmPassword.closest('.floating-input-group');

            // Name Check
            if (!nameVal || nameVal.length < 2) {
                if (nameGroup) nameGroup.classList.add('invalid');
                isValid = false;
            } else {
                if (nameGroup) nameGroup.classList.remove('invalid');
            }

            // Email Check
            if (!emailVal || !validateEmail(emailVal)) {
                if (emailGroup) emailGroup.classList.add('invalid');
                isValid = false;
            } else {
                if (emailGroup) emailGroup.classList.remove('invalid');
            }

            // Phone Check
            if (!phoneVal || !validatePhone(phoneVal)) {
                if (phoneGroup) phoneGroup.classList.add('invalid');
                isValid = false;
            } else {
                if (phoneGroup) phoneGroup.classList.remove('invalid');
            }

            // Password Check
            if (!pwdVal || pwdVal.length < 8) {
                if (pwdGroup) pwdGroup.classList.add('invalid');
                isValid = false;
            } else {
                if (pwdGroup) pwdGroup.classList.remove('invalid');
            }

            // Confirm Password Check
            if (pwdVal !== confirmVal || !confirmVal) {
                if (confirmGroup) confirmGroup.classList.add('invalid');
                isValid = false;
            } else {
                if (confirmGroup) confirmGroup.classList.remove('invalid');
            }

            // Terms Check
            if (!isTermsChecked) {
                e.preventDefault();
                showError('You must agree to the Terms of Service and Privacy Policy to proceed.');
                return;
            }

            if (!isValid) {
                e.preventDefault();
                showError('Please correct the highlighted fields before completing registration.');
                return;
            }
        });
    }

    // Clear validation error styling on input
    [txtFullName, txtEmail, txtPhone, txtPassword, txtConfirmPassword].forEach(input => {
        if (input) {
            input.addEventListener('input', function () {
                const group = this.closest('.floating-input-group');
                if (group) group.classList.remove('invalid');
            });
        }
    });
});