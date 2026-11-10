/**
 * TRENDORA LUXURY E-COMMERCE - PRODUCTS LISTING DEDICATED JAVASCRIPT
 * Handles sidebar filter toggles, grid column switches, sorting, quick view, and URL category synchronization.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // --- DOM REFERENCES ---
    const productsSidebar = document.getElementById('productsSidebar');
    const mobileFilterToggle = document.getElementById('mobileFilterToggle');
    const sidebarCloseBtn = document.getElementById('sidebarCloseBtn');
    const mainProductsGrid = document.getElementById('mainProductsGrid');
    const btnView4Col = document.getElementById('btnView4Col');
    const btnView2Col = document.getElementById('btnView2Col');
    const ddlSortBy = document.getElementById('ddlSortBy');
    const filterCheckboxes = document.querySelectorAll('.filter-checkbox');
    const btnClearAllFilters = document.getElementById('btnClearAllFilters');
    const activeFiltersChipsContainer = document.getElementById('activeFiltersChipsContainer');
    const activeFilterBadge = document.getElementById('activeFilterBadge');
    const lblShowingCount = document.getElementById('lblShowingCount');

    // Quick View Modal
    const quickViewModal = document.getElementById('quickViewModal');
    const modalCloseBtn = document.getElementById('modalCloseBtn');
    const quickViewTriggers = document.querySelectorAll('.btn-quick-view');

    // --- 1. MOBILE SIDEBAR DRAWER TOGGLE ---
    if (mobileFilterToggle && productsSidebar) {
        mobileFilterToggle.addEventListener('click', () => {
            productsSidebar.classList.add('open');
            document.body.style.overflow = 'hidden';
        });
    }

    if (sidebarCloseBtn) {
        sidebarCloseBtn.addEventListener('click', () => {
            productsSidebar.classList.remove('open');
            document.body.style.overflow = '';
        });
    }

    // --- 2. GRID COLUMN VIEW TOGGLE (4 COL vs 2 COL) ---
    if (btnView4Col && btnView2Col && mainProductsGrid) {
        btnView4Col.addEventListener('click', () => {
            mainProductsGrid.classList.remove('col-2');
            mainProductsGrid.classList.add('col-4');
            btnView4Col.classList.add('active');
            btnView2Col.classList.remove('active');
        });

        btnView2Col.addEventListener('click', () => {
            mainProductsGrid.classList.remove('col-4');
            mainProductsGrid.classList.add('col-2');
            btnView2Col.classList.add('active');
            btnView4Col.classList.remove('active');
        });
    }

    // --- 3. FILTER & CHIP SYNCHRONIZATION ---
    const updateActiveFilterChips = () => {
        if (!activeFiltersChipsContainer) return;
        activeFiltersChipsContainer.innerHTML = '';
        let selectedCount = 0;

        filterCheckboxes.forEach(cb => {
            if (cb.checked) {
                selectedCount++;
                const labelText = cb.closest('.custom-checkbox').querySelector('.label-text').innerText;
                const chip = document.createElement('div');
                chip.className = 'filter-chip';
                chip.innerHTML = `${labelText} <span class="remove-chip" data-value="${cb.value}">&times;</span>`;
                activeFiltersChipsContainer.appendChild(chip);
            }
        });

        if (activeFilterBadge) activeFilterBadge.innerText = selectedCount;

        // Attach remove events to chips
        document.querySelectorAll('.remove-chip').forEach(btn => {
            btn.addEventListener('click', function () {
                const val = this.getAttribute('data-value');
                const targetCb = document.querySelector(`.filter-checkbox[value="${val}"]`);
                if (targetCb) {
                    targetCb.checked = false;
                    applyFilters();
                }
            });
        });
    };

    const applyFilters = () => {
        const selectedCategories = Array.from(filterCheckboxes)
            .filter(cb => cb.checked)
            .map(cb => cb.value);

        const productCards = document.querySelectorAll('.database-products .product-card');
        let visibleCount = 0;

        productCards.forEach(card => {
            const cardCategory = card.getAttribute('data-category');
            const shouldShow = selectedCategories.length === 0 || selectedCategories.includes(cardCategory);
            card.style.display = shouldShow ? 'block' : 'none';
            if (shouldShow) visibleCount++;
        });

        if (lblShowingCount) lblShowingCount.innerText = visibleCount;
        updateActiveFilterChips();
    };

    filterCheckboxes.forEach(cb => {
        cb.addEventListener('change', applyFilters);
    });

    if (btnClearAllFilters) {
        btnClearAllFilters.addEventListener('click', () => {
            filterCheckboxes.forEach(cb => cb.checked = false);
            applyFilters();
        });
    }

    // --- 4. URL CATEGORY QUERY STRING SYNC ---
    const urlParams = new URLSearchParams(window.location.search);
    const catParam = urlParams.get('cat');
    if (catParam) {
        filterCheckboxes.forEach(cb => {
            cb.checked = (cb.value === catParam);
        });
        applyFilters();
    } else {
        updateActiveFilterChips();
    }

    // --- 5. SORTING LOGIC ---
    if (ddlSortBy) {
        ddlSortBy.addEventListener('change', function () {
            const sortVal = this.value;
            const productCards = Array.from(document.querySelectorAll('.database-products .product-card'));

            productCards.sort((a, b) => {
                const priceA = parseFloat(a.getAttribute('data-price'));
                const priceB = parseFloat(b.getAttribute('data-price'));

                if (sortVal === 'price-low') return priceA - priceB;
                if (sortVal === 'price-high') return priceB - priceA;
                return 0; // default order
            });

            const databaseProducts = document.querySelector('.database-products');
            productCards.forEach(card => databaseProducts.appendChild(card));
        });
    }

    // --- 6. WISHLIST TOGGLE ---
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

    // --- 7. QUICK VIEW MODAL LOGIC ---
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
});