<%@ Page Title="Trendora - Home of Luxury Accessories" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Dedicated Home Page Stylesheet -->
    <link href="css/home.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ==========================================================================
         SECTION 1: HERO BANNER CAROUSEL
         ========================================================================== -->
    <section class="hero-carousel-section" aria-label="Featured Collections">
        <div class="carousel-container" id="heroCarousel">
            
            <!-- Slide 1 -->
            <div class="carousel-slide active" style="background-image: linear-gradient(rgba(17, 17, 17, 0.45), rgba(17, 17, 17, 0.65)), url('https://images.unsplash.com/photo-1584917865442-de89df76afd3?q=80&w=2000&auto=format&fit=crop');">
                <div class="hero-content">
                    <span class="hero-subtitle">THE AUTUMN ATELIER COLLECTION 2026</span>
                    <h1 class="hero-title">Elegance Redefined<span class="gold-dot">.</span></h1>
                    <p class="hero-description">Discover hand-stitched leather masterpieces, 18k gold-encrusted timepieces, and ethically sourced diamond jewelry crafted for timeless allure.</p>
                    <div class="hero-cta-group">
                        <a href="Products.aspx?cat=new" class="btn-hero-primary">
                            <span>EXPLORE COLLECTION</span>
                            <i class="fa-solid fa-arrow-right-long"></i>
                        </a>
                        <a href="#heritageSection" class="btn-hero-secondary">
                            <i class="fa-solid fa-circle-play"></i>
                            <span>WATCH RUNWAY EDITORIAL</span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-slide" style="background-image: linear-gradient(rgba(17, 17, 17, 0.45), rgba(17, 17, 17, 0.65)), url('https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=2000&auto=format&fit=crop');">
                <div class="hero-content">
                    <span class="hero-subtitle">SWISS HOROLOGY MASTERY</span>
                    <h1 class="hero-title">Timeless Precision<span class="gold-dot">.</span></h1>
                    <p class="hero-description">Engineered in Geneva, worn worldwide. Explore our automatic chronographs featuring scratch-resistant sapphire crystal and 18k rose gold bezels.</p>
                    <div class="hero-cta-group">
                        <a href="Products.aspx?cat=watches" class="btn-hero-primary">
                            <span>DISCOVER TIMEPIECES</span>
                            <i class="fa-solid fa-arrow-right-long"></i>
                        </a>
                        <a href="AboutUs.aspx" class="btn-hero-secondary">
                            <span>THE HOROLOGY CRAFT</span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="carousel-slide" style="background-image: linear-gradient(rgba(17, 17, 17, 0.45), rgba(17, 17, 17, 0.65)), url('https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?q=80&w=2000&auto=format&fit=crop');">
                <div class="hero-content">
                    <span class="hero-subtitle">HAUTE JOAILLERIE</span>
                    <h1 class="hero-title">Luminous Diamonds<span class="gold-dot">.</span></h1>
                    <p class="hero-description">Every stone is meticulously selected for unsurpassed brilliance, color, and clarity. Adorn yourself in pure, ethical radiance.</p>
                    <div class="hero-cta-group">
                        <a href="Products.aspx?cat=jewelry" class="btn-hero-primary">
                            <span>SHOP FINE JEWELRY</span>
                            <i class="fa-solid fa-arrow-right-long"></i>
                        </a>
                        <a href="ContactUs.aspx" class="btn-hero-secondary">
                            <span>BOOK PRIVATE BOUTIQUE VISIT</span>
                        </a>
                    </div>
                </div>
            </div>

        </div>

        <!-- Carousel Navigation Controls -->
        <button type="button" class="carousel-nav-btn prev" id="heroPrevBtn" aria-label="Previous Slide">
            <i class="fa-solid fa-chevron-left"></i>
        </button>
        <button type="button" class="carousel-nav-btn next" id="heroNextBtn" aria-label="Next Slide">
            <i class="fa-solid fa-chevron-right"></i>
        </button>

        <!-- Carousel Indicator Dots -->
        <div class="carousel-indicators" id="heroIndicators">
            <span class="dot active" data-slide="0"></span>
            <span class="dot" data-slide="1"></span>
            <span class="dot" data-slide="2"></span>
        </div>
    </section>

    <!-- ==========================================================================
         SECTION 2: INFINITE ANIMATED BRAND VALUE MARQUEE
         ========================================================================== -->
    <div class="brand-marquee-container" aria-hidden="true">
        <div class="marquee-track">
            <div class="marquee-content">
                <span>100% ETHICALLY SOURCED MATERIALS</span>
                <span>HANDCRAFTED LUXURY ACCESSORIES</span>
                <span>COMPLIMENTARY EXPRESS WORLDWIDE SHIPPING</span>
                <span>2-YEAR WARRANTY ON ALL TIMEPIECES</span>
                <span>PRIVATE CONCIERGE SUPPORT</span>
            </div>
            <!-- Duplicate for seamless infinite loop -->
            <div class="marquee-content">
                <span>100% ETHICALLY SOURCED MATERIALS</span>
                <span>HANDCRAFTED LUXURY ACCESSORIES</span>
                <span>COMPLIMENTARY EXPRESS WORLDWIDE SHIPPING</span>
                <span>2-YEAR WARRANTY ON ALL TIMEPIECES</span>
                <span>PRIVATE CONCIERGE SUPPORT</span>
            </div>
        </div>
    </div>

    <!-- ==========================================================================
         SECTION 3: CURATED CATEGORIES VISUAL GRID
         ========================================================================== -->
    <section class="section-padding category-grid-section">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">THE ATELIER SELECTIONS</span>
                <h2 class="section-title">Curated Categories<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
            </div>

            <div class="category-grid">
                <!-- Category Card 1 -->
                <div class="category-card large">
                    <img src="https://images.unsplash.com/photo-1584917865442-de89df76afd3?q=80&w=1000&auto=format&fit=crop" alt="Handbags and Leather Goods" class="category-bg-img" />
                    <div class="category-overlay"></div>
                    <div class="category-content">
                        <span class="category-sub">LEATHER CRAFTSMANSHIP</span>
                        <h3 class="category-name">Handbags & Clutches</h3>
                        <a href="Products.aspx?cat=handbags" class="category-link">
                            <span>SHOP CATEGORY</span>
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>

                <!-- Category Card 2 -->
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?q=80&w=800&auto=format&fit=crop" alt="Fine Jewelry and Diamonds" class="category-bg-img" />
                    <div class="category-overlay"></div>
                    <div class="category-content">
                        <span class="category-sub">18K GOLD & DIAMONDS</span>
                        <h3 class="category-name">Fine Jewelry</h3>
                        <a href="Products.aspx?cat=jewelry" class="category-link">
                            <span>SHOP CATEGORY</span>
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>

                <!-- Category Card 3 -->
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=800&auto=format&fit=crop" alt="Swiss Timepieces" class="category-bg-img" />
                    <div class="category-overlay"></div>
                    <div class="category-content">
                        <span class="category-sub">GENEVA HOROLOGY</span>
                        <h3 class="category-name">Swiss Timepieces</h3>
                        <a href="Products.aspx?cat=watches" class="category-link">
                            <span>SHOP CATEGORY</span>
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>

                <!-- Category Card 4 -->
                <div class="category-card large">
                    <img src="https://images.unsplash.com/photo-1511499767150-a48a237f0083?q=80&w=1000&auto=format&fit=crop" alt="Premium Eyewear" class="category-bg-img" />
                    <div class="category-overlay"></div>
                    <div class="category-content">
                        <span class="category-sub">UV400 PROTECTION</span>
                        <h3 class="category-name">Premium Eyewear</h3>
                        <a href="Products.aspx?cat=sunglasses" class="category-link">
                            <span>SHOP CATEGORY</span>
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         SECTION 4: TABBED BESTSELLER PRODUCT SHOWCASE
         ========================================================================== -->
    <section class="section-padding bg-alabaster bestseller-section">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">ICONIC CREATIONS</span>
                <h2 class="section-title">The Masterpiece Gallery<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
            </div>

            <!-- Tabbed Filter Buttons -->
            <div class="product-filter-tabs">
                <button type="button" class="tab-btn active" data-filter="all">ALL ICONIC</button>
                <button type="button" class="tab-btn" data-filter="new">NEW ARRIVALS</button>
                <button type="button" class="tab-btn" data-filter="bestseller">BESTSELLERS</button>
                <button type="button" class="tab-btn" data-filter="limited">LIMITED EDITION</button>
            </div>

            <!-- Product Grid -->
            <div class="products-grid">
                
                <!-- Product Card 1 -->
                <div class="product-card" data-category="bestseller">
                    <div class="product-media-wrapper">
                        <span class="product-badge gold">EXCLUSIVE</span>
                        <button type="button" class="wishlist-toggle-btn" aria-label="Add to Wishlist">
                            <i class="fa-regular fa-heart"></i>
                        </button>
                        <a href="ProductDetails.aspx?id=101" class="product-img-link">
                            <img src="https://images.unsplash.com/photo-1584917865442-de89df76afd3?q=80&w=600&auto=format&fit=crop" alt="Aurelia Gold Chain Leather Flap Bag" class="product-img default-img" />
                            <img src="https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=600&auto=format&fit=crop" alt="Aurelia Flap Bag Lifestyle View" class="product-img hover-img" />
                        </a>
                        <div class="product-action-overlay">
                            <button type="button" class="btn-quick-view" data-product-id="101">
                                <i class="fa-regular fa-eye"></i> QUICK VIEW
                            </button>
                            <button type="button" class="btn-quick-add">
                                <i class="fa-solid fa-bag-shopping"></i> ADD TO BAG
                            </button>
                        </div>
                    </div>
                    <div class="product-info">
                        <span class="product-cat">Handbags</span>
                        <h4 class="product-title"><a href="ProductDetails.aspx?id=101">Aurelia Gold Chain Leather Flap Bag</a></h4>
                        <div class="product-rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <span class="review-count">(48)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">Rs. 12,490</span>
                            <span class="original-price">Rs. 15,990</span>
                        </div>
                    </div>
                </div>

                <!-- Product Card 2 -->
                <div class="product-card" data-category="new">
                    <div class="product-media-wrapper">
                        <span class="product-badge dark">NEW</span>
                        <button type="button" class="wishlist-toggle-btn" aria-label="Add to Wishlist">
                            <i class="fa-regular fa-heart"></i>
                        </button>
                        <a href="ProductDetails.aspx?id=102" class="product-img-link">
                            <img src="https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?q=80&w=600&auto=format&fit=crop" alt="Celeste Solitaire Diamond Pendant" class="product-img default-img" />
                            <img src="https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?q=80&w=600&auto=format&fit=crop" alt="Celeste Diamond Pendant Worn" class="product-img hover-img" />
                        </a>
                        <div class="product-action-overlay">
                            <button type="button" class="btn-quick-view" data-product-id="102">
                                <i class="fa-regular fa-eye"></i> QUICK VIEW
                            </button>
                            <button type="button" class="btn-quick-add">
                                <i class="fa-solid fa-bag-shopping"></i> ADD TO BAG
                            </button>
                        </div>
                    </div>
                    <div class="product-info">
                        <span class="product-cat">Fine Jewelry</span>
                        <h4 class="product-title"><a href="ProductDetails.aspx?id=102">Celeste 18k Rose Gold Diamond Pendant</a></h4>
                        <div class="product-rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <span class="review-count">(32)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">Rs. 28,900</span>
                        </div>
                    </div>
                </div>

                <!-- Product Card 3 -->
                <div class="product-card" data-category="limited">
                    <div class="product-media-wrapper">
                        <span class="product-badge rose">LIMITED</span>
                        <button type="button" class="wishlist-toggle-btn" aria-label="Add to Wishlist">
                            <i class="fa-regular fa-heart"></i>
                        </button>
                        <a href="ProductDetails.aspx?id=103" class="product-img-link">
                            <img src="https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=600&auto=format&fit=crop" alt="Geneva Horizon Automatic Chronograph" class="product-img default-img" />
                            <img src="https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=600&auto=format&fit=crop" alt="Geneva Horizon Watch Wrist Shot" class="product-img hover-img" />
                        </a>
                        <div class="product-action-overlay">
                            <button type="button" class="btn-quick-view" data-product-id="103">
                                <i class="fa-regular fa-eye"></i> QUICK VIEW
                            </button>
                            <button type="button" class="btn-quick-add">
                                <i class="fa-solid fa-bag-shopping"></i> ADD TO BAG
                            </button>
                        </div>
                    </div>
                    <div class="product-info">
                        <span class="product-cat">Swiss Timepieces</span>
                        <h4 class="product-title"><a href="ProductDetails.aspx?id=103">Geneva Horizon Automatic Chronograph</a></h4>
                        <div class="product-rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half-stroke"></i>
                            <span class="review-count">(19)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">Rs. 45,000</span>
                            <span class="original-price">Rs. 52,000</span>
                        </div>
                    </div>
                </div>

                <!-- Product Card 4 -->
                <div class="product-card" data-category="bestseller">
                    <div class="product-media-wrapper">
                        <button type="button" class="wishlist-toggle-btn" aria-label="Add to Wishlist">
                            <i class="fa-regular fa-heart"></i>
                        </button>
                        <a href="ProductDetails.aspx?id=104" class="product-img-link">
                            <img src="https://images.unsplash.com/photo-1511499767150-a48a237f0083?q=80&w=600&auto=format&fit=crop" alt="Versailles Gold Accent Sunglasses" class="product-img default-img" />
                            <img src="https://images.unsplash.com/photo-1508296695146-257a814070b4?q=80&w=600&auto=format&fit=crop" alt="Versailles Sunglasses Model View" class="product-img hover-img" />
                        </a>
                        <div class="product-action-overlay">
                            <button type="button" class="btn-quick-view" data-product-id="104">
                                <i class="fa-regular fa-eye"></i> QUICK VIEW
                            </button>
                            <button type="button" class="btn-quick-add">
                                <i class="fa-solid fa-bag-shopping"></i> ADD TO BAG
                            </button>
                        </div>
                    </div>
                    <div class="product-info">
                        <span class="product-cat">Eyewear</span>
                        <h4 class="product-title"><a href="ProductDetails.aspx?id=104">Versailles Cat-Eye Gold Frame Sunglasses</a></h4>
                        <div class="product-rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <span class="review-count">(54)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">Rs. 9,800</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- ==========================================================================
         SECTION 5: CRAFTSMANSHIP & HERITAGE EDITORIAL SPLIT-SCREEN
         ========================================================================== -->
    <section class="heritage-editorial-section" id="heritageSection">
        <div class="heritage-split-wrapper">
            <!-- Left Side Visual Showcase -->
            <div class="heritage-visual-col">
                <img src="https://images.unsplash.com/photo-1537832816519-689ad163238b?q=80&w=1200&auto=format&fit=crop" alt="Artisan Leather Craftsmanship" class="heritage-img" />
                <div class="heritage-badge-card">
                    <span class="badge-num">100%</span>
                    <span class="badge-lbl">Handcrafted in Italy & Switzerland</span>
                </div>
            </div>

            <!-- Right Side Editorial Copy -->
            <div class="heritage-text-col">
                <span class="section-subtitle">OUR UNYIELDING LEGACY</span>
                <h2 class="editorial-heading">Mastery Born from Passion and Artisan Precision<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line align-left"></div>
                <p class="editorial-body">
                    At Trendora, luxury is not merely produced; it is born through meticulous devotion. Each piece is constructed by master artisans using century-old techniques combined with modern Swiss horological accuracy.
                </p>
                <p class="editorial-body">
                    From ethically mined conflict-free diamonds to full-grain vegetable-tanned Italian leathers, every raw material undergoes rigorous inspection to guarantee unmatched quality and longevity.
                </p>
                
                <div class="heritage-feature-list">
                    <div class="feature-item">
                        <i class="fa-solid fa-gem feature-icon"></i>
                        <div>
                            <h5>Certified Ethical Gems</h5>
                            <p>Kimberley Process certified diamonds with complete provenance tracking.</p>
                        </div>
                    </div>
                    <div class="feature-item">
                        <i class="fa-solid fa-hands-holding-circle feature-icon"></i>
                        <div>
                            <h5>Sustainable Metallurgy</h5>
                            <p>100% recycled 18k gold and platinum refined in zero-emission facilities.</p>
                        </div>
                    </div>
                </div>

                <a href="AboutUs.aspx" class="btn-read-heritage">
                    <span>READ OUR HERITAGE STORY</span>
                    <i class="fa-solid fa-arrow-right-long"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         SECTION 6: "COMPLETE THE LOOK" INTERACTIVE STYLING
         ========================================================================== -->
    <section class="section-padding complete-look-section">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">BEATRIX EDITORIAL LOOKBOOK</span>
                <h2 class="section-title">Complete The Look<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
                <p class="section-desc">Click on the glowing gold accents to explore and shop each accessory from this autumn runway look.</p>
            </div>

            <div class="lookbook-wrapper">
                <!-- Main Editorial Image -->
                <img src="https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=1600&auto=format&fit=crop" alt="Trendora Autumn Runway Model" class="lookbook-main-img" />

                <!-- Hotspot 1: Rose Gold Watch -->
                <div class="hotspot-pin" style="top: 62%; left: 35%;" data-popover="popover1">
                    <span class="pin-pulse"></span>
                    <i class="fa-solid fa-plus pin-icon"></i>
                    
                    <div class="hotspot-popover" id="popover1">
                        <img src="https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=200&auto=format&fit=crop" alt="Rose Gold Watch" class="popover-img" />
                        <div class="popover-details">
                            <span class="popover-cat">Swiss Watch</span>
                            <h5 class="popover-title">Geneva Horizon Automatic</h5>
                            <span class="popover-price">Rs. 45,000</span>
                            <button type="button" class="btn-popover-add">ADD ITEM</button>
                        </div>
                    </div>
                </div>

                <!-- Hotspot 2: Silk Scarf / Neckwear -->
                <div class="hotspot-pin" style="top: 28%; left: 52%;" data-popover="popover2">
                    <span class="pin-pulse"></span>
                    <i class="fa-solid fa-plus pin-icon"></i>

                    <div class="hotspot-popover" id="popover2">
                        <img src="https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?q=80&w=200&auto=format&fit=crop" alt="Gold Pendant" class="popover-img" />
                        <div class="popover-details">
                            <span class="popover-cat">Fine Jewelry</span>
                            <h5 class="popover-title">Celeste 18k Gold Pendant</h5>
                            <span class="popover-price">Rs. 28,900</span>
                            <button type="button" class="btn-popover-add">ADD ITEM</button>
                        </div>
                    </div>
                </div>

                <!-- Hotspot 3: Designer Leather Bag -->
                <div class="hotspot-pin" style="top: 50%; left: 68%;" data-popover="popover3">
                    <span class="pin-pulse"></span>
                    <i class="fa-solid fa-plus pin-icon"></i>

                    <div class="hotspot-popover" id="popover3">
                        <img src="https://images.unsplash.com/photo-1584917865442-de89df76afd3?q=80&w=200&auto=format&fit=crop" alt="Leather Bag" class="popover-img" />
                        <div class="popover-details">
                            <span class="popover-cat">Handbags</span>
                            <h5 class="popover-title">Aurelia Flap Bag</h5>
                            <span class="popover-price">Rs. 12,490</span>
                            <button type="button" class="btn-popover-add">ADD ITEM</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         SECTION 7: CUSTOMER VIP TESTIMONIALS SLIDER
         ========================================================================== -->
    <section class="section-padding bg-alabaster testimonials-section">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">PATRON REFLECTIONS</span>
                <h2 class="section-title">Words from Our VIP Clients<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
            </div>

            <div class="testimonials-slider-wrapper" id="testimonialSlider">
                <!-- Testimonial Card 1 -->
                <div class="testimonial-card active">
                    <i class="fa-solid fa-quote-left quote-icon"></i>
                    <div class="rating-stars">
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    </div>
                    <p class="testimonial-text">
                        "The craftsmanship on the Aurelia bag is on par with the historic houses of Paris. The gold chain weight and leather aroma speak volumes about its authenticity."
                    </p>
                    <div class="client-profile">
                        <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=150&auto=format&fit=crop" alt="Eleanor Vance" class="client-avatar" />
                        <div>
                            <h5 class="client-name">Eleanor Vance <i class="fa-solid fa-circle-check verified-icon" title="Verified Buyer"></i></h5>
                            <span class="client-title">Mumbai - Patron since 2024</span>
                        </div>
                    </div>
                </div>

                <!-- Testimonial Card 2 -->
                <div class="testimonial-card">
                    <i class="fa-solid fa-quote-left quote-icon"></i>
                    <div class="rating-stars">
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    </div>
                    <p class="testimonial-text">
                        "Unboxing my Geneva Horizon watch felt like a royal unveiling. The white-glove concierge delivery service in Delhi was beyond reproach."
                    </p>
                    <div class="client-profile">
                        <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=150&auto=format&fit=crop" alt="Vikramaditya Roy" class="client-avatar" />
                        <div>
                            <h5 class="client-name">Vikramaditya Roy <i class="fa-solid fa-circle-check verified-icon" title="Verified Buyer"></i></h5>
                            <span class="client-title">New Delhi - Collector</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slider Dots -->
            <div class="testimonial-dots" id="testimonialDots">
                <span class="t-dot active" data-t-slide="0"></span>
                <span class="t-dot" data-t-slide="1"></span>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         SECTION 8: INSTAGRAM AESTHETIC STYLE GALLERY
         ========================================================================== -->
    <section class="instagram-gallery-section">
        <div class="insta-header">
            <i class="fa-brands fa-instagram insta-logo"></i>
            <h3 class="insta-handle">@TrendoraBoutique</h3>
            <p class="insta-sub">Tag #TrendoraLuxury to be featured on our global gallery</p>
        </div>

        <div class="insta-grid">
            <div class="insta-item">
                <img src="https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=500&auto=format&fit=crop" alt="Instagram Style 1" />
                <div class="insta-overlay">
                    <i class="fa-brands fa-instagram"></i>
                    <span class="likes-count"><i class="fa-solid fa-heart"></i> 1.4k</span>
                </div>
            </div>
            <div class="insta-item">
                <img src="https://images.unsplash.com/photo-1508296695146-257a814070b4?q=80&w=500&auto=format&fit=crop" alt="Instagram Style 2" />
                <div class="insta-overlay">
                    <i class="fa-brands fa-instagram"></i>
                    <span class="likes-count"><i class="fa-solid fa-heart"></i> 2.1k</span>
                </div>
            </div>
            <div class="insta-item">
                <img src="https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?q=80&w=500&auto=format&fit=crop" alt="Instagram Style 3" />
                <div class="insta-overlay">
                    <i class="fa-brands fa-instagram"></i>
                    <span class="likes-count"><i class="fa-solid fa-heart"></i> 980</span>
                </div>
            </div>
            <div class="insta-item">
                <img src="https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=500&auto=format&fit=crop" alt="Instagram Style 4" />
                <div class="insta-overlay">
                    <i class="fa-brands fa-instagram"></i>
                    <span class="likes-count"><i class="fa-solid fa-heart"></i> 3.5k</span>
                </div>
            </div>
            <div class="insta-item">
                <img src="https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=500&auto=format&fit=crop" alt="Instagram Style 5" />
                <div class="insta-overlay">
                    <i class="fa-brands fa-instagram"></i>
                    <span class="likes-count"><i class="fa-solid fa-heart"></i> 1.8k</span>
                </div>
            </div>
            <div class="insta-item">
                <img src="https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=500&auto=format&fit=crop" alt="Instagram Style 6" />
                <div class="insta-overlay">
                    <i class="fa-brands fa-instagram"></i>
                    <span class="likes-count"><i class="fa-solid fa-heart"></i> 4.2k</span>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         QUICK VIEW MODAL OVERLAY
         ========================================================================== -->
    <div id="quickViewModal" class="quickview-modal">
        <div class="modal-content-card">
            <button type="button" class="modal-close-btn" id="modalCloseBtn">Close</button>
            <div class="modal-body-grid">
                <div class="modal-img-col">
                    <img id="qvModalImg" src="https://images.unsplash.com/photo-1584917865442-de89df76afd3?q=80&w=800&auto=format&fit=crop" alt="Product Quick View" />
                </div>
                <div class="modal-details-col">
                    <span class="qv-cat" id="qvCat">HANDBAGS</span>
                    <h3 class="qv-title" id="qvTitle">Aurelia Gold Chain Flap Bag</h3>
                    <div class="product-rating">
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        <span>(48 Verified Reviews)</span>
                    </div>
                    <div class="qv-price" id="qvPrice">Rs. 12,490</div>
                    <p class="qv-desc">
                        Handcrafted from vegetable-tanned full-grain Italian calfskin, featuring a 24k gold-plated chain link shoulder strap and signature turn-lock clasp.
                    </p>
                    <div class="qv-actions">
                        <button type="button" class="btn-modal-add">ADD TO SHOPPING BAG</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- Dedicated Home Page Client-Side JavaScript -->
    <script src="js/home.js"></script>
</asp:Content>