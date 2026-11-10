/**
 * TRENDORA LUXURY E-COMMERCE - HOME PAGE DEDICATED JAVASCRIPT
 * Handles hero carousel, tab filters, interactive hotspots, quick view modal, and testimonials.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // --- 1. HERO BANNER CAROUSEL LOGIC ---
    const slides = document.querySelectorAll('.carousel-slide');
    const dots = document.querySelectorAll('#heroIndicators .dot');
    const prevBtn = document.getElementById('heroPrevBtn');
    const nextBtn = document.getElementById('heroNextBtn');
    let currentSlide = 0;
    let autoSlideTimer = null;

    const showSlide = (index) => {
        slides.forEach(slide => slide.classList.remove('active'));
        dots.forEach(dot => dot.classList.remove('active'));

        currentSlide = (index + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
        if (dots[currentSlide]) dots[currentSlide].classList.add('active');
    };

    const nextSlide = () => showSlide(currentSlide + 1);
    const prevSlide = () => showSlide(currentSlide - 1);

    const startAutoSlide = () => {
        autoSlideTimer = setInterval(nextSlide, 6000);
    };

    const stopAutoSlide = () => {
        if (autoSlideTimer) clearInterval(autoSlideTimer);
    };

    if (nextBtn && prevBtn) {
        nextBtn.addEventListener('click', () => { stopAutoSlide(); nextSlide(); startAutoSlide(); });
        prevBtn.addEventListener('click', () => { stopAutoSlide(); prevSlide(); startAutoSlide(); });
    }

    dots.forEach((dot, idx) => {
        dot.addEventListener('click', () => {
            stopAutoSlide();
            showSlide(idx);
            startAutoSlide();
        });
    });

    startAutoSlide();

    // --- 2. TABBED PRODUCT FILTER SHOWCASE ---
    const filterTabs = document.querySelectorAll('.product-filter-tabs .tab-btn');
    const productCards = document.querySelectorAll('.products-grid .product-card');

    filterTabs.forEach(tab => {
        tab.addEventListener('click', function () {
            filterTabs.forEach(t => t.classList.remove('active'));
            this.classList.add('active');

            const filterValue = this.getAttribute('data-filter');

            productCards.forEach(card => {
                const cardCategory = card.getAttribute('data-category');
                if (filterValue === 'all' || cardCategory === filterValue) {
                    card.style.display = 'block';
                    card.style.animation = 'fadeIn 0.5s ease forward';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });

    // --- 3. WISHLIST TOGGLE INTERACTION ---
    const wishlistBtns = document.querySelectorAll('.wishlist-toggle-btn');
    wishlistBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
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
    });

    // --- 4. QUICK VIEW MODAL LOGIC ---
    const quickViewModal = document.getElementById('quickViewModal');
    const modalCloseBtn = document.getElementById('modalCloseBtn');
    const quickViewTriggers = document.querySelectorAll('.btn-quick-view');

    quickViewTriggers.forEach(btn => {
        btn.addEventListener('click', function () {
            const card = this.closest('.product-card');
            const title = card.querySelector('.product-title').innerText;
            const price = card.querySelector('.current-price').innerText;
            const cat = card.querySelector('.product-cat').innerText;
            const imgSrc = card.querySelector('.default-img').src;

            document.getElementById('qvTitle').innerText = title;
            document.getElementById('qvPrice').innerText = price;
            document.getElementById('qvCat').innerText = cat;
            document.getElementById('qvModalImg').src = imgSrc;

            quickViewModal.classList.add('open');
            document.body.style.overflow = 'hidden';
        });
    });

    if (modalCloseBtn) {
        modalCloseBtn.addEventListener('click', () => {
            quickViewModal.classList.remove('open');
            document.body.style.overflow = '';
        });
    }

    if (quickViewModal) {
        quickViewModal.addEventListener('click', (e) => {
            if (e.target === quickViewModal) {
                quickViewModal.classList.remove('open');
                document.body.style.overflow = '';
            }
        });
    }

    // --- 5. CUSTOMER TESTIMONIAL SLIDER ---
    const tCards = document.querySelectorAll('.testimonial-card');
    const tDots = document.querySelectorAll('#testimonialDots .t-dot');
    let currentT = 0;

    const showTestimonial = (idx) => {
        tCards.forEach(c => c.classList.remove('active'));
        tDots.forEach(d => d.classList.remove('active'));

        currentT = idx;
        if (tCards[currentT]) tCards[currentT].classList.add('active');
        if (tDots[currentT]) tDots[currentT].classList.add('active');
    };

    tDots.forEach((dot, idx) => {
        dot.addEventListener('click', () => showTestimonial(idx));
    });

    setInterval(() => {
        currentT = (currentT + 1) % tCards.length;
        showTestimonial(currentT);
    }, 7000);
});