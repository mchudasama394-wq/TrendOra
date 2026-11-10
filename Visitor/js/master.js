/**
 * TRENDORA LUXURY E-COMMERCE - VISITOR MASTER JAVASCRIPT
 * Handles header scrolling effects, slide-down search, off-canvas mini-cart, and mobile nav.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // --- DOM ELEMENT REFERENCES ---
    const siteHeader = document.getElementById('siteHeader');
    const drawerBackdrop = document.getElementById('drawerBackdrop');

    // Search Drawer Elements
    const searchDrawer = document.getElementById('searchDrawer');
    const searchTriggerBtn = document.getElementById('searchTriggerBtn');
    const searchCloseBtn = document.getElementById('searchCloseBtn');
    const txtHeaderSearch = document.getElementById('txtHeaderSearch');

    // Mini Cart Drawer Elements
    const miniCartDrawer = document.getElementById('miniCartDrawer');
    const cartCloseBtn = document.getElementById('cartCloseBtn');

    // Mobile Navigation Elements
    const mainNav = document.getElementById('mainNav');
    const hamburgerBtn = document.getElementById('hamburgerBtn');
    const mobileNavCloseBtn = document.getElementById('mobileNavCloseBtn');

    // Quantity Selector Buttons
    const qtyMinusBtns = document.querySelectorAll('.qty-btn.minus');
    const qtyPlusBtns = document.querySelectorAll('.qty-btn.plus');

    // --- 1. STICKY HEADER SCROLL EFFECT ---
    const handleScroll = () => {
        if (window.scrollY > 40) {
            siteHeader.classList.add('scrolled');
        } else {
            siteHeader.classList.remove('scrolled');
        }
    };
    window.addEventListener('scroll', handleScroll, { passive: true });

    // --- 2. DRAWER CONTROL HELPER FUNCTIONS ---
    const closeAllDrawers = () => {
        if (searchDrawer) searchDrawer.classList.remove('open');
        if (miniCartDrawer) miniCartDrawer.classList.remove('open');
        if (mainNav) mainNav.classList.remove('open');
        if (drawerBackdrop) drawerBackdrop.classList.remove('active');
        document.body.style.overflow = ''; // Restore page scrolling
    };

    const openDrawer = (drawerElement, focusElement = null) => {
        closeAllDrawers();
        if (drawerElement) drawerElement.classList.add('open');
        if (drawerBackdrop) drawerBackdrop.classList.add('active');
        document.body.style.overflow = 'hidden'; // Lock background scrolling
        if (focusElement) {
            setTimeout(() => focusElement.focus(), 300);
        }
    };

    // --- 3. EVENT LISTENERS ---

    // Search Drawer Triggers
    if (searchTriggerBtn) {
        searchTriggerBtn.addEventListener('click', (e) => {
            e.preventDefault();
            openDrawer(searchDrawer, txtHeaderSearch);
        });
    }

    if (searchCloseBtn) {
        searchCloseBtn.addEventListener('click', closeAllDrawers);
    }

    if (cartCloseBtn) {
        cartCloseBtn.addEventListener('click', closeAllDrawers);
    }

    // Mobile Navigation Triggers
    if (hamburgerBtn) {
        hamburgerBtn.addEventListener('click', (e) => {
            e.preventDefault();
            openDrawer(mainNav);
        });
    }

    if (mobileNavCloseBtn) {
        mobileNavCloseBtn.addEventListener('click', closeAllDrawers);
    }

    // Close on Backdrop Click
    if (drawerBackdrop) {
        drawerBackdrop.addEventListener('click', closeAllDrawers);
    }

    // Close on Escape Key press
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            closeAllDrawers();
        }
    });

    // --- 4. MINI CART QUANTITY MODIFIERS ---
    qtyMinusBtns.forEach(btn => {
        btn.addEventListener('click', function () {
            const input = this.nextElementSibling;
            let val = parseInt(input.value, 10);
            if (val > 1) {
                input.value = val - 1;
            }
        });
    });

    qtyPlusBtns.forEach(btn => {
        btn.addEventListener('click', function () {
            const input = this.previousElementSibling;
            let val = parseInt(input.value, 10);
            input.value = val + 1;
        });
    });
});