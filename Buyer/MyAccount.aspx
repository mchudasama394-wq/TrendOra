<%@ Page Title="My Account" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="TrendOra.Buyer.MyAccount" %>

<asp:Content ID="MyAccountCss" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .account-page{min-height:70vh;padding:54px 0 90px;background:#f7f6f2}
        .account-layout{display:grid;grid-template-columns:250px minmax(0,1fr);gap:28px;align-items:start}
        .account-sidebar{position:sticky;top:24px;padding:24px 18px;background:#fff;border:1px solid #e9e4da;border-radius:14px;box-shadow:0 12px 35px rgba(30,25,15,.06)}
        .account-profile{display:flex;align-items:center;gap:13px;padding:4px 5px 22px;border-bottom:1px solid #eeeae2}
        .profile-avatar{display:flex;flex:0 0 48px;align-items:center;justify-content:center;width:48px;height:48px;border-radius:50%;background:#181820;color:#d4af37;font-family:var(--font-heading);font-size:23px}
        .profile-copy{min-width:0}
        .profile-copy strong,.profile-copy span{display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
        .profile-copy strong{color:#22212a;font-size:13px}
        .profile-copy span{margin-top:5px;color:#929098;font-size:10px}
        .account-nav{display:grid;gap:6px;padding-top:18px}
        .account-nav a{display:flex;align-items:center;gap:12px;padding:12px 13px;border-radius:8px;color:#696771;font-size:12px;font-weight:700;text-decoration:none;transition:background .2s ease,color .2s ease}
        .account-nav a i{width:17px;color:#a49a80;text-align:center}
        .account-nav a:hover,.account-nav a.active{background:#f7f4ec;color:#8e6d12}
        .account-nav a.active i,.account-nav a:hover i{color:#b18a1a}
        .account-nav .nav-divider{height:1px;margin:9px 5px;background:#eeeae2}
        .account-main{min-width:0}
        .account-heading{display:flex;align-items:flex-end;justify-content:space-between;gap:20px;margin:0 0 25px}
        .account-kicker{display:block;margin-bottom:9px;color:#b18a1a;font-size:10px;font-weight:800;letter-spacing:2.2px;text-transform:uppercase}
        .account-heading h1{color:#181820;font-family:var(--font-heading);font-size:43px;font-weight:600;line-height:1}
        .account-heading p{margin-top:10px;color:#85838a;font-size:12px;line-height:1.6}
        .shop-link{display:inline-flex;flex:0 0 auto;align-items:center;gap:9px;padding:11px 15px;border:1px solid #e2d9c5;border-radius:6px;color:#8e6d12;font-size:10px;font-weight:800;letter-spacing:.5px;text-decoration:none;text-transform:uppercase;transition:all .2s ease}
        .shop-link:hover{background:#181820;border-color:#181820;color:#fff}
        .welcome-card{position:relative;overflow:hidden;margin-bottom:20px;padding:25px 28px;border-radius:12px;background:linear-gradient(115deg,#1b1b22,#292720);color:#fff}
        .welcome-card:after{position:absolute;top:-78px;right:-28px;width:230px;height:230px;border:1px solid rgba(212,175,55,.2);border-radius:50%;box-shadow:0 0 0 24px rgba(212,175,55,.035),0 0 0 50px rgba(212,175,55,.025);content:""}
        .welcome-card span{position:relative;z-index:1;display:block;color:#d4af37;font-size:9px;font-weight:800;letter-spacing:2px;text-transform:uppercase}
        .welcome-card h2{position:relative;z-index:1;margin:8px 0 6px;font-family:var(--font-heading);font-size:28px;font-weight:600}
        .welcome-card p{position:relative;z-index:1;color:#d0ced0;font-size:11px}
        .account-metrics{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:13px;margin-bottom:27px}
        .metric-card{min-height:105px;padding:17px 16px;background:#fff;border:1px solid #ece8df;border-radius:10px}
        .metric-top{display:flex;align-items:center;justify-content:space-between;gap:6px;color:#85838a;font-size:10px;font-weight:600}
        .metric-icon{display:flex;align-items:center;justify-content:center;width:29px;height:29px;border-radius:8px;background:#f8f4e9;color:#b18a1a}
        .metric-card strong{display:block;margin-top:12px;color:#22212a;font-size:22px;font-weight:800;line-height:1}
        .orders-section{overflow:hidden;background:#fff;border:1px solid #e9e4da;border-radius:12px;box-shadow:0 12px 35px rgba(30,25,15,.05)}
        .orders-header{display:flex;align-items:center;justify-content:space-between;gap:15px;padding:21px 22px;border-bottom:1px solid #eeeae2}
        .orders-header h2{color:#25242b;font-size:15px;font-weight:800}
        .orders-header p{margin-top:5px;color:#929098;font-size:10px}
        .orders-header a{color:#8e6d12;font-size:10px;font-weight:800;text-decoration:none;white-space:nowrap}
        .orders-scroll{overflow-x:auto}
        .orders-grid{width:100%;border-collapse:collapse}
        .orders-grid th{padding:13px 17px;background:#fdfcf9;color:#969087;font-size:9px;font-weight:800;letter-spacing:1px;text-align:left;text-transform:uppercase}
        .orders-grid td{padding:15px 17px;border-top:1px solid #f0ede7;color:#625f66;font-size:11px;vertical-align:middle}
        .orders-grid tr:hover td{background:#fdfcf9}
        .orders-grid a{display:inline-flex;align-items:center;gap:6px;color:#8e6d12;font-size:10px;font-weight:800;text-decoration:none;white-space:nowrap}
        .orders-grid a:hover{text-decoration:underline}
        .status-badge{display:inline-block;padding:6px 9px;border-radius:20px;background:#f4f1e8;color:#8e6d12;font-size:9px;font-weight:800;white-space:nowrap}
        .status-processing,.status-shipped{background:#edf3f9;color:#34648d}
        .status-delivered{background:#eaf5ee;color:#34744a}
        .status-cancelled{background:#fbeeee;color:#a74949}
        .empty-orders{padding:32px 18px;text-align:center}
        .empty-orders i{color:#c3b484;font-size:25px}
        .empty-orders strong{display:block;margin-top:10px;color:#302f36;font-size:13px}
        .empty-orders p{margin:6px 0 15px;color:#8e8b92;font-size:11px}
        .empty-orders a{color:#8e6d12;font-size:10px;font-weight:800;text-decoration:none;text-transform:uppercase}
        @media(max-width:1000px){.account-layout{grid-template-columns:215px minmax(0,1fr);gap:18px}.account-metrics{grid-template-columns:repeat(2,minmax(0,1fr))}}
        @media(max-width:700px){.account-page{padding:32px 0 58px}.account-layout{grid-template-columns:minmax(0,1fr);gap:18px}.account-sidebar{position:static;padding:13px}.account-profile{padding:4px 5px 13px}.account-nav{display:flex;overflow-x:auto;gap:6px;padding-top:11px}.account-nav a{flex:0 0 auto;padding:10px 11px;font-size:10px}.account-nav a i{width:auto}.account-nav .nav-divider{display:none}.account-heading{align-items:flex-start;flex-direction:column;gap:14px;margin-bottom:18px}.account-heading h1{font-size:37px}.account-heading p{font-size:11px}.account-metrics{gap:9px;margin-bottom:18px}.metric-card{min-height:92px;padding:13px}.metric-card strong{font-size:20px}.metric-top{font-size:9px}.welcome-card{padding:21px}.welcome-card h2{font-size:25px}.orders-header{padding:17px 15px}.orders-grid{min-width:650px}.orders-grid th,.orders-grid td{padding:13px 12px}}
        @media(max-width:380px){.account-metrics{grid-template-columns:1fr 1fr}.metric-card{padding:11px}.metric-top{align-items:flex-start}.metric-icon{width:25px;height:25px}}
    </style>
</asp:Content>

<asp:Content ID="MyAccountContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="account-page">
        <div class="container-luxury">
            <div class="account-layout">
                <aside class="account-sidebar" aria-label="Customer dashboard navigation">
                    <div class="account-profile">
                        <div class="profile-avatar"><asp:Literal ID="litAvatarInitial" runat="server" /></div>
                        <div class="profile-copy">
                            <strong><asp:Literal ID="litCustomerName" runat="server" /></strong>
                            <span><asp:Literal ID="litCustomerEmail" runat="server" /></span>
                        </div>
                    </div>
                    <nav class="account-nav">
                        <a href="#dashboard" class="active"><i class="fa-solid fa-grip"></i>Overview</a>
                        <a href="#orders"><i class="fa-solid fa-box-open"></i>My orders</a>
                        <a href="../Visitor/Products.aspx"><i class="fa-solid fa-bag-shopping"></i>Continue shopping</a>
                        <a href="Cart.aspx"><i class="fa-solid fa-cart-shopping"></i>Shopping cart</a>
                        <span class="nav-divider"></span>
                        <a href="../Logout.aspx"><i class="fa-solid fa-arrow-right-from-bracket"></i>Sign out</a>
                    </nav>
                </aside>

                <div class="account-main" id="dashboard">
                    <div class="account-heading">
                        <div>
                            <span class="account-kicker">Your Trendora account</span>
                            <h1>My dashboard<span class="gold-dot">.</span></h1>
                            <p>Manage your purchases and keep track of every order.</p>
                        </div>
                        <a href="../Visitor/Products.aspx" class="shop-link">Explore collection <i class="fa-solid fa-arrow-right"></i></a>
                    </div>

                    <div class="welcome-card">
                        <span>Welcome back</span>
                        <h2><asp:Literal ID="litWelcomeName" runat="server" /></h2>
                        <p>Your latest order updates and shopping activity, all in one place.</p>
                    </div>

                    <div class="account-metrics" aria-label="Order summary">
                        <div class="metric-card"><div class="metric-top">Total orders <span class="metric-icon"><i class="fa-solid fa-receipt"></i></span></div><strong><asp:Literal ID="litTotalOrders" runat="server" /></strong></div>
                        <div class="metric-card"><div class="metric-top">In progress <span class="metric-icon"><i class="fa-solid fa-truck-fast"></i></span></div><strong><asp:Literal ID="litActiveOrders" runat="server" /></strong></div>
                        <div class="metric-card"><div class="metric-top">Delivered <span class="metric-icon"><i class="fa-solid fa-circle-check"></i></span></div><strong><asp:Literal ID="litDeliveredOrders" runat="server" /></strong></div>
                        <div class="metric-card"><div class="metric-top">Total spent <span class="metric-icon"><i class="fa-solid fa-indian-rupee-sign"></i></span></div><strong><asp:Literal ID="litTotalSpent" runat="server" /></strong></div>
                    </div>

                    <section class="orders-section" id="orders">
                        <div class="orders-header">
                            <div><h2>Recent orders</h2><p>Your latest purchases and current delivery status.</p></div>
                            <a href="OrderHistory.aspx">View all orders <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                        <div class="orders-scroll">
                            <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="false" CssClass="orders-grid" EmptyDataText="">
                                <Columns>
                                    <asp:BoundField DataField="Order_id" HeaderText="Order #" />
                                    <asp:BoundField DataField="order_date" HeaderText="Date" DataFormatString="{0:dd MMM yyyy, hh:mm tt}" />
                                    <asp:BoundField DataField="order_total_amount" HeaderText="Total" DataFormatString="Rs. {0:N2}" />
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate><span class='status-badge <%# GetStatusClass(Eval("order_status")) %>'><%# Server.HtmlEncode(Convert.ToString(Eval("order_status"))) %></span></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:HyperLinkField HeaderText="Details" Text="View order" DataNavigateUrlFields="Order_id" DataNavigateUrlFormatString="OrderDetails.aspx?id={0}" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-orders"><i class="fa-solid fa-bag-shopping"></i><strong>Your order list is waiting</strong><p>When you place an order, its progress will appear here.</p><a href="../Visitor/Products.aspx">Discover the collection</a></div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
