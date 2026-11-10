/**
 * TRENDORA LUXURY E-COMMERCE - CONTACT US DEDICATED JAVASCRIPT
 * Handles FAQ accordion toggles and contact form submission feedback.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // --- 1. FAQ ACCORDION LOGIC ---
    const faqItems = document.querySelectorAll('.faq-item');

    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        question.addEventListener('click', () => {
            const isActive = item.classList.contains('active');

            // Close all items
            faqItems.forEach(i => i.classList.remove('active'));

            // Toggle selected item
            if (!isActive) {
                item.classList.add('active');
            }
        });
    });

    // --- 2. CONTACT FORM SUBMISSION SIMULATION ---
    const btnSubmitContact = document.getElementById('btnSubmitContact');
    const contactSuccessMsg = document.getElementById('contactSuccessMsg');

    if (btnSubmitContact) {
        btnSubmitContact.addEventListener('click', (e) => {
            e.preventDefault();

            const firstName = document.getElementById('txtFirstName').value.trim();
            const lastName = document.getElementById('txtLastName').value.trim();
            const email = document.getElementById('txtEmail').value.trim();
            const message = document.getElementById('txtMessage').value.trim();

            if (!firstName || !lastName || !email || !message) {
                alert('Please complete all required fields (*).');
                return;
            }

            // Show success message
            if (contactSuccessMsg) {
                contactSuccessMsg.classList.add('show');
                contactSuccessMsg.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }

            // Clear inputs
            document.getElementById('txtFirstName').value = '';
            document.getElementById('txtLastName').value = '';
            document.getElementById('txtEmail').value = '';
            document.getElementById('txtPhone').value = '';
            document.getElementById('txtMessage').value = '';
        });
    }
});