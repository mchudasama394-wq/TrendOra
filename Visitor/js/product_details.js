/**
 * TRENDORA LUXURY E-COMMERCE - PRODUCT DETAILS DEDICATED JAVASCRIPT
 * Handles thumbnail gallery swapping, image lightbox zoom, swatch selection, quantity updates, and tab switching.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // --- DOM REFERENCES ---
    const thumbImages = document.querySelectorAll('.thumb-img');
    const mainProductStage = document.getElementById('mainProductStage');
    const btnZoomTrigger = document.getElementById('btnZoomTrigger');
    const pdpLightboxModal = document.getElementById('pdpLightboxModal');
    const lightboxImg = document.getElementById('lightboxImg');
    const lightboxCloseBtn = document.getElementById('lightboxCloseBtn');

    // Swatches & Option Selectors
    const colorSwatches = document.querySelectorAll('.color-swatch');
    const lblSelectedColor = document.getElementById('lblSelectedColor');

    // Quantity Selector
    const pdpQtyMinus = document.querySelector('.pdp-qty-btn.minus');
    const pdpQtyPlus = document.querySelector('.pdp-qty-btn.plus');
    const pdpQtyInput = document.getElementById('pdpQtyInput');

    // Tabs
    const tabButtons = document.querySelectorAll('.pdp-tab-btn');
    const tabPanes = document.querySelectorAll('.tab-pane');
    const reviewAnchor = document.querySelector('.review-anchor');

    // Wishlist Toggle Button
    const btnPdpWishlist = document.getElementById('btnPdpWishlist');

    // --- 1. GALLERY THUMBNAIL SWAP ---
    thumbImages.forEach(thumb => {
        thumb.addEventListener('click', function () {
            thumbImages.forEach(t => t.classList.remove('active'));
            this.classList.add('active');

            const newSrc = this.src;
            if (mainProductStage) {
                mainProductStage.style.opacity = '0.5';
                setTimeout(() => {
                    mainProductStage.src = newSrc;
                    mainProductStage.style.opacity = '1';
                }, 150);
            }
        });
    });

    // --- 2. LIGHTBOX ZOOM MODAL ---
    if (btnZoomTrigger && pdpLightboxModal && lightboxImg) {
        btnZoomTrigger.addEventListener('click', () => {
            lightboxImg.src = mainProductStage.src;
            pdpLightboxModal.classList.add('open');
            document.body.style.overflow = 'hidden';
        });
    }

    if (lightboxCloseBtn) {
        lightboxCloseBtn.addEventListener('click', () => {
            pdpLightboxModal.classList.remove('open');
            document.body.style.overflow = '';
        });
    }

    if (pdpLightboxModal) {
        pdpLightboxModal.addEventListener('click', (e) => {
            if (e.target === pdpLightboxModal) {
                pdpLightboxModal.classList.remove('open');
                document.body.style.overflow = '';
            }
        });
    }

    // --- 3. COLOR SWATCH SELECTION ---
    colorSwatches.forEach(swatch => {
        swatch.addEventListener('click', function () {
            colorSwatches.forEach(s => s.classList.remove('active'));
            this.classList.add('active');

            const colorName = this.getAttribute('data-color');
            if (lblSelectedColor) lblSelectedColor.innerText = colorName;
        });
    });

    // --- 4. QUANTITY INCREMENT & DECREMENT ---
    if (pdpQtyMinus && pdpQtyPlus && pdpQtyInput) {
        pdpQtyMinus.addEventListener('click', () => {
            let val = parseInt(pdpQtyInput.value, 10);
            if (val > 1) pdpQtyInput.value = val - 1;
        });

        pdpQtyPlus.addEventListener('click', () => {
            let val = parseInt(pdpQtyInput.value, 10);
            pdpQtyInput.value = val + 1;
        });
    }

    // --- 5. TAB SWITCHING LOGIC ---
    tabButtons.forEach(btn => {
        btn.addEventListener('click', function () {
            const targetTab = this.getAttribute('data-tab');

            tabButtons.forEach(b => b.classList.remove('active'));
            tabPanes.forEach(p => p.classList.remove('active'));

            this.classList.add('active');
            const activePane = document.getElementById(targetTab);
            if (activePane) activePane.classList.add('active');
        });
    });

    // Anchor smooth scroll to reviews
    if (reviewAnchor) {
        reviewAnchor.addEventListener('click', (e) => {
            e.preventDefault();
            const reviewsTabBtn = document.getElementById('reviewsTabBtn');
            if (reviewsTabBtn) reviewsTabBtn.click();

            const tabSection = document.querySelector('.pdp-info-tabs-wrapper');
            if (tabSection) {
                tabSection.scrollIntoView({ behavior: 'smooth' });
            }
        });
    }

    // --- 6. WISHLIST TOGGLE ---
    if (btnPdpWishlist) {
        btnPdpWishlist.addEventListener('click', function () {
            this.classList.toggle('active');
            const icon = this.querySelector('i');
            if (this.classList.contains('active')) {
                icon.classList.remove('fa-regular');
                icon.classList.add('fa-solid');
            } else {
                icon.classList.remove('fa-solid');
                icon.classList.add('fa-regular');
            }
        });
    }
});