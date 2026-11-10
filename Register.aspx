<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TrendOra.Register" %>



<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trendora - Join The Privilege Club</title>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <!-- FontAwesome 6 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Dedicated Register Stylesheet -->
    <link href="css/register.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="split-screen-container">

            <!-- LEFT PANEL: EDITORIAL LIFESTYLE BANNER -->
            <div class="editorial-panel">
                <div class="editorial-overlay"></div>
                
                <div class="editorial-header">
                    <a href="Visitor/VisitorDefault.aspx" class="back-link">
                        <i class="fa-solid fa-arrow-left-long"></i>
                        <span>BACK TO BOUTIQUE</span>
                    </a>
                </div>

                <div class="editorial-content">
                    <div class="brand-signature">
                        TRENDORA<span class="gold-dot">.</span>
                    </div>
                    <blockquote class="fashion-quote">
                        "Step Into a World of Bespoke Elegance."
                        <cite>- The Atelier Collection</cite>
                    </blockquote>
                    <p class="editorial-subtext">Membership Privileges & VIP Rewards</p>

                    <!-- VIP Perks Badge List -->
                    <div class="vip-perks-list">
                        <div class="perk-item">
                            <i class="fa-solid fa-crown perk-icon"></i>
                            <span>Private Trunk Show Access</span>
                        </div>
                        <div class="perk-item">
                            <i class="fa-solid fa-gem perk-icon"></i>
                            <span>Exclusive Member Price Savings</span>
                        </div>
                        <div class="perk-item">
                            <i class="fa-solid fa-user-sparkles perk-icon"></i>
                            <span>Personalized Stylist Advisory</span>
                        </div>
                    </div>
                </div>

                <div class="editorial-footer">
                    <span>Copyright <%= DateTime.Now.Year %> TRENDORA HAUTE COUTURE. ALL RIGHTS RESERVED.</span>
                </div>
            </div>

            <!-- RIGHT PANEL: REGISTRATION CARD CONTAINER -->
            <div class="auth-panel">
                <div class="auth-card-wrapper">
                    <div class="auth-card">

                        <!-- Card Header -->
                        <div class="auth-card-header">
                            <div class="brand-logo-mobile">
                                <a href="Visitor/VisitorDefault.aspx">TRENDORA<span class="gold-dot">.</span></a>
                            </div>
                            <h1 class="auth-title">Create Your Account<span class="gold-dot">.</span></h1>
                            <p class="auth-subtext">Join the Trendora Privilege Club to enjoy seamless shopping and bespoke rewards. </p>
                            <p class="auth-subtext">
                                <asp:Label ID="Label1" style="color:forestgreen;" runat="server" Text=""></asp:Label>
                            </p>
                        </div>

                        <!-- Error & Success Notification Banners -->
                        <div id="alertError" class="auth-alert alert-error">
                            <i class="fa-solid fa-circle-exclamation alert-icon"></i>
                            <span id="lblErrorMessage">Please complete all required fields correctly.</span>
                        </div>
                        <div id="alertSuccess" class="auth-alert alert-success">
                            <i class="fa-solid fa-circle-check alert-icon"></i>
                            <span id="lblSuccessMessage">Your account has been created! Redirecting to sign in...</span>
                        </div>

                        <!-- Registration Form -->
                        <div class="register-form">

                            <!-- Full Name Field -->
                            <div class="floating-input-group">
                                <div class="input-inner-wrapper">
                                    <asp:TextBox ID="txtFullName" runat="server" ClientIDMode="Static" CssClass="floating-input" autocomplete="name" required="required" placeholder=" " />
                                    <label for="txtFullName" class="floating-label">Full Name</label>
                                    <i class="fa-regular fa-user field-icon"></i>
                                </div>
                                <span class="input-error-text" id="errFullName">Please enter your full name.</span>
                            </div>

                            <!-- Email Address Field -->
                            <div class="floating-input-group">
                                <div class="input-inner-wrapper">
                                    <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" CssClass="floating-input" TextMode="Email" autocomplete="email" required="required" placeholder=" " />
                                    <label for="txtEmail" class="floating-label">Email Address</label>
                                    <i class="fa-regular fa-envelope field-icon"></i>
                                </div>
                                <span class="input-error-text" id="errEmail">Please enter a valid email address.</span>
                            </div>

                            <!-- Mobile Phone Field -->
                            <div class="floating-input-group phone-group">
                                <div class="input-inner-wrapper">
                                    <asp:TextBox ID="txtPhone" runat="server" ClientIDMode="Static" CssClass="floating-input phone-input" TextMode="Phone" autocomplete="tel" required="required" placeholder=" " />
                                    <label for="txtPhone" class="floating-label phone-label">Mobile Number</label>
                                    <i class="fa-solid fa-mobile-screen-button field-icon"></i>
                                </div>
                                <span class="input-error-text" id="errPhone">Please enter a valid mobile number.</span>
                            </div>

                            <!-- Gender Selection -->
                            <div class="floating-input-group gender-group">
                                <label class="form-section-label">Gender</label>
                                <div class="radio-option-group">
                                    <label class="radio-option">
                                        <input type="radio" name="gender" value="Male" />
                                        <span class="radio-dot"></span>
                                        <span>Male</span>
                                    </label>
                                    <label class="radio-option">
                                        <input type="radio" name="gender" value="Female" />
                                        <span class="radio-dot"></span>
                                        <span>Female</span>
                                    </label>
                                    <label class="radio-option">
                                        <input type="radio" name="gender" value="Other" />
                                        <span class="radio-dot"></span>
                                        <span>Other</span>
                                    </label>
                                </div>
                            </div>

                            <!-- Password Field -->
                            <div class="floating-input-group">
                                <div class="input-inner-wrapper">
                                    <asp:TextBox ID="txtPassword" runat="server" ClientIDMode="Static" CssClass="floating-input" TextMode="Password" autocomplete="new-password" required="required" placeholder=" " />
                                    <label for="txtPassword" class="floating-label">Password</label>
                                    <button type="button" class="btn-toggle-password" id="btnTogglePassword" aria-label="Toggle Password Visibility">
                                        <i class="fa-regular fa-eye" id="passwordEyeIcon"></i>
                                    </button>
                                </div>
                                <div class="password-strength-wrapper" id="passwordStrengthWrapper">
                                    <div class="strength-bar-track">
                                        <div class="strength-bar-fill" id="strengthBarFill"></div>
                                    </div>
                                    <div class="strength-meta-row">
                                        <span class="strength-label-title">Password Strength:</span>
                                        <span class="strength-text" id="strengthText">None</span>
                                    </div>
                                </div>
                                <span class="input-error-text" id="errPassword">Password must be at least 8 characters with numbers & symbols.</span>
                            </div>

                            <!-- Confirm Password Field -->
                            <div class="floating-input-group">
                                <div class="input-inner-wrapper">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" ClientIDMode="Static" CssClass="floating-input" TextMode="Password" autocomplete="new-password" required="required" placeholder=" " />
                                    <label for="txtConfirmPassword" class="floating-label">Confirm Password</label>
                                    <i class="fa-solid fa-check match-status-icon" id="matchStatusIcon"></i>
                                </div>
                                <span class="input-error-text" id="errConfirmPassword">Passwords do not match.</span>
                            </div>

                            <!-- Checkboxes Group -->
                            <div class="checkbox-group-wrapper">
                                <!-- Terms & Privacy Checkbox -->
                                <label class="custom-checkbox-container">
                                    <input type="checkbox" id="chkTerms" required />
                                    <span class="custom-checkmark"></span>
                                    <span class="checkbox-label">I agree to the <a href="#" class="legal-link">Terms of Service</a> and <a href="#" class="legal-link">Privacy Policy</a> <span class="req">*</span></span>
                                </label>

                                <!-- Newsletter Opt-In Checkbox -->
                                <label class="custom-checkbox-container">
                                    <input type="checkbox" id="chkNewsletter" checked="checked" />
                                    <span class="custom-checkmark"></span>
                                    <span class="checkbox-label">Send me exclusive launches, offers, and styling updates.</span>
                                </label>
                            </div>

                            <!-- Primary Action Button -->
                            <div class="primary-action-wrapper">
                                <asp:Button ID="btnRegisterSubmit" runat="server" CssClass="btn-luxury-register-submit" Text="Create Account" OnClick="btnRegisterSubmit_Click" />
                            </div>

                            <!-- Social Registration Divider -->
                            <div class="social-divider">
                                <span>OR REGISTER WITH</span>
                            </div>

                            <!-- Social Registration Buttons -->
                            <div class="social-auth-grid">
                                <button type="button" class="btn-social-auth">
                                    <svg class="social-svg" viewBox="0 0 24 24" width="18" height="18" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                                        <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                                        <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z" fill="#FBBC05"/>
                                        <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z" fill="#EA4335"/>
                                    </svg>
                                    <span>Google</span>
                                </button>

                                <button type="button" class="btn-social-auth">
                                    <svg class="social-svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M15.97 6.13c.68-.83 1.14-1.99.01-3.13-1.04.09-2.3.74-3.01 1.58-.64.74-1.2 1.93-1.05 3.07 1.16.09 2.37-.69 3.05-1.52z"/>
                                    </svg>
                                    <span>Apple ID</span>
                                </button>
                            </div>

                        <!-- Login Prompt Footer -->
                        <div class="auth-card-footer">
                            <p>Already have an account? <a href="Login.aspx" class="login-link">Sign In</a></p>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </form>

    <!-- Dedicated Client-Side Interactivity Logic -->
    <script src="js/register.js"></script>
</body>
</html>
