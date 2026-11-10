<%@ Page Title="Trendora - Our Heritage & Story" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Dedicated About Us Page Stylesheet -->
    <link href="css/about.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ==========================================================================
         HERO EDITORIAL BANNER
         ========================================================================== -->
    <section class="about-hero-section">
        <div class="about-hero-overlay"></div>
        <div class="container-luxury about-hero-content">
            <span class="about-hero-subtitle">HAUTE HORLOGERIE & MAROQUINERIE</span>
            <h1 class="about-hero-title">The Legacy of Trendora<span class="gold-dot">.</span></h1>
            <p class="about-hero-desc">
                Founded with a relentless commitment to perfection, Trendora bridges historic European artisan craftsmanship with contemporary haute couture.
            </p>
        </div>
    </section>

    <!-- ==========================================================================
         FOUNDER'S NARRATIVE & BRAND VISION
         ========================================================================== -->
    <section class="section-padding vision-section">
        <div class="container-luxury">
            <div class="vision-grid">
                <div class="vision-text-col">
                    <span class="section-subtitle">OUR GENESIS</span>
                    <h2 class="editorial-heading">Born from Passion, Handcrafted for Eternity<span class="gold-dot">.</span></h2>
                    <div class="gold-accent-line align-left"></div>
                    <p class="editorial-body">
                        Trendora was conceived in the historic ateliers of Florence and Geneva as a rebellion against mass-produced fast fashion. We believe true luxury lies in patience, provenance, and precision.
                    </p>
                    <p class="editorial-body">
                        Every leather handbag, diamond solitaire, and automatic timepiece in our collection represents hundreds of hours of painstaking hand-craftsmanship by artisans whose families have guarded their techniques for generations.
                    </p>
                    <blockquote class="founder-quote">
                        "Luxury is not defined by a price tag; it is defined by the soul embedded in every stitch and the eternity forged in every gemstone."
                        <cite>- Genevieve De La Tour, Founder & Creative Director</cite>
                    </blockquote>
                </div>
                <div class="vision-visual-col">
                    <div class="vision-image-frame">
                        <img src="https://images.unsplash.com/photo-1537832816519-689ad163238b?q=80&w=1000&auto=format&fit=crop" alt="Genevieve De La Tour Atelier" class="vision-img" />
                        <div class="experience-badge">
                            <span class="exp-number">25+</span>
                            <span class="exp-label">Years of Uncompromising Excellence</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         THE THREE PILLARS OF TRENDORA (INTERACTIVE TABS)
         ========================================================================== -->
    <section class="section-padding bg-alabaster pillars-section">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">OUR UNYIELDING CODE</span>
                <h2 class="section-title">The Three Pillars of Atelier Excellence<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
            </div>

            <div class="pillars-grid">
                <!-- Pillar 1 -->
                <div class="pillar-card">
                    <div class="pillar-icon-wrapper">
                        <i class="fa-solid fa-gem"></i>
                    </div>
                    <h3 class="pillar-title">100% Ethical Provenance</h3>
                    <p class="pillar-desc">
                        Every diamond and precious stone is sourced exclusively through Kimberley Process certified mines, guaranteeing conflict-free origin and sustainable mining practices.
                    </p>
                </div>

                <!-- Pillar 2 -->
                <div class="pillar-card">
                    <div class="pillar-icon-wrapper">
                        <i class="fa-solid fa-hands-holding-circle"></i>
                    </div>
                    <h3 class="pillar-title">Heritage Craftsmanship</h3>
                    <p class="pillar-desc">
                        Our full-grain leathers are vegetable-tanned in Tuscany using natural tree tannins, avoiding harmful chromium chemicals while creating an enduring, rich patina.
                    </p>
                </div>

                <!-- Pillar 3 -->
                <div class="pillar-card">
                    <div class="pillar-icon-wrapper">
                        <i class="fa-solid fa-stopwatch-20"></i>
                    </div>
                    <h3 class="pillar-title">Swiss Horology Precision</h3>
                    <p class="pillar-desc">
                        Engineered in Geneva, our automatic chronographs undergo 500 hours of continuous movement testing to achieve chronometer-grade Swiss accuracy.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         MILESTONE TIMELINE
         ========================================================================== -->
    <section class="section-padding timeline-section">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">A JOURNEY THROUGH TIME</span>
                <h2 class="section-title">Our Heritage Milestones<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
            </div>

            <div class="timeline-wrapper">
                <!-- Milestone 1 -->
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <span class="timeline-year">2012</span>
                        <h4 class="timeline-title">The Florence Atelier</h4>
                        <p>Opened our inaugural leather workshop in Florence, assembling a team of 12 veteran leather masters.</p>
                    </div>
                </div>

                <!-- Milestone 2 -->
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <span class="timeline-year">2016</span>
                        <h4 class="timeline-title">Swiss Horology Expansion</h4>
                        <p>Partnered with historic watchmaker ateliers in Geneva to debut our first Swiss automatic timepiece collection.</p>
                    </div>
                </div>

                <!-- Milestone 3 -->
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <span class="timeline-year">2020</span>
                        <h4 class="timeline-title">100% Ethical Guarantee</h4>
                        <p>Achieved complete supply chain transparency, transitioning to 100% recycled 18k gold and certified ethical gems.</p>
                    </div>
                </div>

                <!-- Milestone 4 -->
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <span class="timeline-year">2026</span>
                        <h4 class="timeline-title">Global Flagship Expansion</h4>
                        <p>Unveiled private client boutiques across Paris, London, New York, Mumbai, and New Delhi.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         AUTHENTICITY & CARE ANCHOR SECTIONS
         ========================================================================== -->
    <section class="section-padding bg-alabaster care-authenticity-section" id="care">
        <div class="container-luxury">
            <div class="care-grid">
                <div class="care-card" id="authenticity">
                    <i class="fa-solid fa-shield-halved care-icon"></i>
                    <h3>Digital Authenticity Passport</h3>
                    <p>
                        Every Trendora creation is embedded with an invisible NFC digital certificate. Scan your handbag or watch with your smartphone to verify its unique serial number, artisan signature, and birth date.
                    </p>
                </div>

                <div class="care-card">
                    <i class="fa-solid fa-sparkles care-icon"></i>
                    <h3>Lifetime Concierge Restorations</h3>
                    <p>
                        We offer complimentary annual cleaning, gold polishing, and leather conditioning for all registered Trendora patrons at any of our flagship boutiques worldwide.
                    </p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- Dedicated About Us Client-Side JavaScript -->
    <script src="js/about.js"></script>
</asp:Content>