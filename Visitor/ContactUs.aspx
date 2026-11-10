<%@ Page Title="Trendora - Client Concierge & Boutiques" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" %>

<script runat="server">

    protected void txtnm_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Dedicated Contact Us Page Stylesheet -->
    <link href="css/contact.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ==========================================================================
         HERO BANNER
         ========================================================================== -->
    <section class="contact-hero-section">
        <div class="contact-hero-overlay"></div>
        <div class="container-luxury contact-hero-content">
            <span class="contact-hero-subtitle">AT YOUR SERVICE</span>
            <h1 class="contact-hero-title">Client Concierge & Boutiques<span class="gold-dot">.</span></h1>
            <p class="contact-hero-desc">
                Whether seeking advice on haute joaillerie, reserving a private boutique consultation, or inquiring about bespoke commissions, our ambassadors are at your total disposal.
            </p>
        </div>
    </section>

    <!-- ==========================================================================
         CONCIERGE CONTACT & PRIVATE APPOINTMENT FORM
         ========================================================================== -->
    <section class="section-padding contact-main-section">
        <div class="container-luxury">
            <div class="contact-grid">

                <!-- LEFT COLUMN: DIRECT CONTACT DETAILS -->
                <div class="contact-info-col">
                    <span class="section-subtitle">DIRECT INQUIRIES</span>
                    <h2 class="editorial-heading">Personalized Client Assistance<span class="gold-dot">.</span></h2>
                    <div class="gold-accent-line align-left"></div>
                    <p class="editorial-body">
                        Our private client advisors offer dedicated assistance across time zones. Select your preferred channel of communication below.
                    </p>

                    <div class="info-cards-wrapper">
                        <!-- Card 1 -->
                        <div class="info-card">
                            <div class="info-icon-box">
                                <i class="fa-solid fa-headset"></i>
                            </div>
                            <div class="info-text-box">
                                <h4>Private Advisory Hotline</h4>
                                <p><a href="tel:+9118008736367">+91 1800-TRENDORA (873-6367)</a></p>
                                <span class="info-sub">Monday - Sunday: 09:00 - 21:00 IST</span>
                            </div>
                        </div>

                        <!-- Card 2 -->
                        <div class="info-card">
                            <div class="info-icon-box">
                                <i class="fa-solid fa-envelope-open-text"></i>
                            </div>
                            <div class="info-text-box">
                                <h4>Concierge Email Desk</h4>
                                <p><a href="mailto:concierge@trendora.com">concierge@trendora.com</a></p>
                                <span class="info-sub">Guaranteed response within 4 hours</span>
                            </div>
                        </div>

                        <!-- Card 3 -->
                        <div class="info-card">
                            <div class="info-icon-box">
                                <i class="fa-brands fa-whatsapp"></i>
                            </div>
                            <div class="info-text-box">
                                <h4>Bespoke WhatsApp Assistance</h4>
                                <p><a href="https://wa.me/919876543210" target="_blank" rel="noopener">+91 98765 43210</a></p>
                                <span class="info-sub">Instant messaging with a luxury stylist</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- RIGHT COLUMN: APPOINTMENT & INQUIRY FORM -->
                <div class="contact-form-col" id="appointment">
                    <div class="form-card">
                        <h3 class="form-title">Book an Appointment or Send a Message</h3>
                        <p class="form-sub">Please fill in your details and an ambassador will confirm your private invitation.</p>

                        <div id="contactSuccessMsg" class="contact-success-msg">
                            <i class="fa-solid fa-circle-check"></i>
                            <span>Thank you. Your message has been received by our Client Concierge. An advisor will contact you shortly.</span>
                        </div>

                        <div class="form-group-row">
                            <div class="form-group">
                                <label for="txtFirstName">FIRST NAME <span class="req">*</span></label>
<%--                                <input type="text" id="txtFirstName" class="luxury-input" placeholder="e.g. Eleanor" required />--%>
                                <asp:TextBox ID="txtfnm" runat="server" class="luxury-input" placeholder="e.g. Eleanor" OnTextChanged="txtnm_TextChanged"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <label for="txtLastName">LAST NAME <span class="req">*</span></label>
<%--                                <input type="text" id="txtLastName" class="luxury-input" placeholder="e.g. Vance" required />--%>
                                <asp:TextBox ID="txtlnm" runat="server" class="luxury-input" placeholder="e.g. Vance" ></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group-row">
                            <div class="form-group">
                                <label for="txtEmail">EMAIL ADDRESS <span class="req">*</span></label>
<%--                                <input type="email" id="txtEmail" class="luxury-input" placeholder="eleanor@vance.com" required />--%>
                                <asp:TextBox ID="Txteml" runat="server" class="luxury-input" placeholder="eleanor@vance.com"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtPhone">PHONE NUMBER</label>
<%--                                <input type="tel" id="txtPhone" class="luxury-input" placeholder="+91 98765 00000" />--%>
                                <asp:TextBox ID="Txtpn" runat="server" class="luxury-input" placeholder="+91 98765 00000"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="ddlSubject">INQUIRY TYPE <span class="req">*</span></label>
                            <%--<select id="ddlSubject" class="luxury-select-field">
                                <option value="appointment">Private Boutique Appointment</option>
                                <option value="order">Order Inquiry & Shipping</option>
                                <option value="bespoke">Bespoke Jewelry / Watch Commission</option>
                                <option value="restoration">Product Care & Restoration Service</option>
                                <option value="general">General Concierge Question</option>
                            </select>--%>
                            <asp:DropDownList ID="Drp1" runat="server" class="luxury-select-field" AutoPostBack="True">
                                <asp:ListItem>private boutique appointment</asp:ListItem>
                                <asp:ListItem>Order Inquiry &amp; shipping </asp:ListItem>
                                <asp:ListItem>Bespoke jewelry / Watch Comission </asp:ListItem>
                                <asp:ListItem>Product care &amp; Restoration service</asp:ListItem>
                                <asp:ListItem>general Concierge question</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="txtMessage">YOUR MESSAGE OR REQUEST <span class="req">*</span></label>
<%--                            <textarea id="txtMessage" rows="5" class="luxury-textarea" placeholder="Please detail your request or preferred appointment date..." required></textarea>--%>
                            <asp:TextBox ID="txtmsg" runat="server" class="luxury-textarea" placeholder="Please detail your request or preferred appointment date..." TextMode="MultiLine"></asp:TextBox>
                        </div>

<%--                        <button type="button" class="btn-submit-contact" id="btnSubmitContact">--%>
                        <asp:Button ID="Button1" runat="server" Text="SUBMIT INQUIRY" class="btn-submit-contact" OnClick="Button1_Click"/>
<%--                            <span>SUBMIT INQUIRY</span>--%>
<%--                            <i class="fa-solid fa-paper-plane"></i>--%>
                        <%--</button>--%>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- ==========================================================================
         GLOBAL BOUTIQUE LOCATIONS
         ========================================================================== -->
    <section class="section-padding bg-alabaster boutiques-section" id="boutiques">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">OUR FLAGSHIP SANCTUARIES</span>
                <h2 class="section-title">Global Boutique Locations<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
            </div>

            <div class="boutiques-grid">
                <!-- Boutique 1 -->
                <div class="boutique-card">
                    <img src="https://images.unsplash.com/photo-1541123437800-1bb1317badc2?q=80&w=600&auto=format&fit=crop" alt="Mumbai Boutique" class="boutique-img" />
                    <div class="boutique-info">
                        <span class="city-tag">MUMBAI</span>
                        <h3 class="boutique-name">The Taj Mahal Palace Boutique</h3>
                        <p class="boutique-address">Apollo Bunder, Colaba, Mumbai, Maharashtra 400001</p>
                        <span class="boutique-hours"><i class="fa-regular fa-clock"></i> Daily: 10:30 - 20:00 IST</span>
                        <a href="https://maps.google.com" target="_blank" class="boutique-map-link">GET DIRECTIONS <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>

                <!-- Boutique 2 -->
                <div class="boutique-card">
                    <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=600&auto=format&fit=crop" alt="Delhi Boutique" class="boutique-img" />
                    <div class="boutique-info">
                        <span class="city-tag">NEW DELHI</span>
                        <h3 class="boutique-name">DLF Emporio Atelier</h3>
                        <p class="boutique-address">4, Nelson Mandela Marg, Vasant Kunj, New Delhi 110070</p>
                        <span class="boutique-hours"><i class="fa-regular fa-clock"></i> Daily: 11:00 - 21:00 IST</span>
                        <a href="https://maps.google.com" target="_blank" class="boutique-map-link">GET DIRECTIONS <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>

                <!-- Boutique 3 -->
                <div class="boutique-card">
                    <img src="https://images.unsplash.com/photo-1513694203232-719a280e022f?q=80&w=600&auto=format&fit=crop" alt="Geneva Sanctuary" class="boutique-img" />
                    <div class="boutique-info">
                        <span class="city-tag">GENEVA</span>
                        <h3 class="boutique-name">Rue du Rhône Horologie</h3>
                        <p class="boutique-address">Rue du Rhône 42, 1204 Genève, Switzerland</p>
                        <span class="boutique-hours"><i class="fa-regular fa-clock"></i> Mon - Sat: 10:00 - 19:00 CET</span>
                        <a href="https://maps.google.com" target="_blank" class="boutique-map-link">GET DIRECTIONS <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================================================
         FREQUENTLY ASKED QUESTIONS (FAQ ACCORDION)
         ========================================================================== -->
    <section class="section-padding faq-section" id="faq">
        <div class="container-luxury">
            <div class="section-header center">
                <span class="section-subtitle">COMMON INQUIRIES</span>
                <h2 class="section-title">Frequently Asked Questions<span class="gold-dot">.</span></h2>
                <div class="gold-accent-line"></div>
            </div>

            <div class="faq-accordion-wrapper">
                <!-- FAQ Item 1 -->
                <div class="faq-item active">
                    <div class="faq-question">
                        <h4>How are Trendora orders packaged and delivered?</h4>
                        <i class="fa-solid fa-plus faq-toggle-icon"></i>
                    </div>
                    <div class="faq-answer">
                        <p>Every creation is enclosed in our signature velvet-lined presentation box, tied with gold satin ribbon, and protected by tamper-evident armored packaging. All shipments are fully insured during transit.</p>
                    </div>
                </div>

                <!-- FAQ Item 2 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <h4>What is the warranty coverage on Swiss Timepieces?</h4>
                        <i class="fa-solid fa-plus faq-toggle-icon"></i>
                    </div>
                    <div class="faq-answer">
                        <p>All Trendora Swiss Timepieces include an international 2-year warranty covering mechanical movement defects. Additional extended coverage is available through our concierge club.</p>
                    </div>
                </div>

                <!-- FAQ Item 3 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <h4>Can I request custom engraving or bespoke leather modifications?</h4>
                        <i class="fa-solid fa-plus faq-toggle-icon"></i>
                    </div>
                    <div class="faq-answer">
                        <p>Yes. Complimentary monogramming and laser engraving are available for all fine jewelry and select leather items. Please specify your request during boutique booking or checkout.</p>
                    </div>
                </div>

                <!-- FAQ Item 4 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <h4>What is your complimentary return policy?</h4>
                        <i class="fa-solid fa-plus faq-toggle-icon"></i>
                    </div>
                    <div class="faq-answer">
                        <p>We accept complimentary returns within 30 days of receipt, provided the item is unworn, in its original presentation box, and accompanied by its Digital Authenticity Passport.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- Dedicated Contact Us Client-Side JavaScript -->
    <script src="js/contact.js"></script>
</asp:Content>