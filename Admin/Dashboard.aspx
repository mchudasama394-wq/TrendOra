<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TrendOra.Admin.Dashboard" %>

<asp:Content ID="CSSContent" ContentPlaceHolderID="PageCSS" runat="server">
    <link href="css/dashboard.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="TitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="BreadcrumbContent" ContentPlaceHolderID="BreadcrumbTitle" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="PageContent" runat="server">

    <!-- ── Page Header ── -->
    <div class="page-header">
        <h1>Dashboard Overview</h1>
        <p>Welcome back, <strong id="welcomeName">Admin</strong>. Here's what's happening today.</p>
    </div>

    <!-- ── Stat Cards ── -->
    <div class="stats-grid">

        <div class="stat-card">
            <div class="stat-card-top">
                <span class="stat-label">Total Sales</span>
                <div class="stat-icon gold"><i class="fa-solid fa-indian-rupee-sign"></i></div>
            </div>
            <div class="stat-value">0</div>
            <div class="stat-change up">
                <i class="fa-solid fa-arrow-trend-up"></i>
                <span>vs last month</span>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-top">
                <span class="stat-label">Total Orders</span>
                <div class="stat-icon blue"><i class="fa-solid fa-bag-shopping"></i></div>
            </div>
            <div class="stat-value">0</div>
            <div class="stat-change up">
                <i class="fa-solid fa-arrow-trend-up"></i>
                <span>all time</span>
            </div>
            <div style="margin-top:14px;">
                <asp:Button ID="btnDownloadAllOrdersReport" runat="server" Text="Download All Orders Report" OnClick="btnDownloadAllOrdersReport_Click" style="width:100%;padding:10px 12px;border:1px solid #d7c88e;border-radius:6px;background:#f9f3df;color:#8e6d12;font-weight:800;cursor:pointer;" />
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-top">
                <span class="stat-label">Total Products</span>
                <div class="stat-icon purple"><i class="fa-solid fa-box-open"></i></div>
            </div>
            <div class="stat-value">0</div>
            <div class="stat-change up">
                <i class="fa-solid fa-arrow-trend-up"></i>
                <span>in catalogue</span>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-top">
                <span class="stat-label">Total Customers</span>
                <div class="stat-icon green"><i class="fa-solid fa-users"></i></div>
            </div>
            <div class="stat-value">0</div>
            <div class="stat-change up">
                <i class="fa-solid fa-arrow-trend-up"></i>
                <span>registered</span>
            </div>
        </div>

    </div>

    <!-- ── Bottom Grid ── -->
    <div class="dashboard-grid">

        <!-- Recent Orders Table -->
        <div class="section-card">
            <div class="section-card-header">
                <h3 class="section-title"><i class="fa-solid fa-clock-rotate-left" style="color:#D4AF37;margin-right:8px;"></i>Recent Orders</h3>
                <a href="ManageOrders.aspx" class="section-action">View All <i class="fa-solid fa-arrow-right" style="font-size:10px;"></i></a>
            </div>
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Placeholder rows – replace with DB data later -->
                    <tr>
                        <td colspan="5" style="text-align:center;padding:40px;color:#8a8fa8;font-size:13px;">
                            <i class="fa-solid fa-inbox" style="font-size:28px;display:block;margin-bottom:10px;opacity:.4;"></i>
                            No orders yet. Orders will appear here once customers start purchasing.
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Quick Access Panel -->
        <div class="section-card">
            <div class="section-card-header">
                <h3 class="section-title"><i class="fa-solid fa-bolt" style="color:#D4AF37;margin-right:8px;"></i>Quick Access</h3>
            </div>
            <div class="quick-links">

                <a href="ManageProducts.aspx" class="quick-link-item">
                    <div class="quick-link-icon gold"><i class="fa-solid fa-box-open"></i></div>
                    <div class="quick-link-info">
                        <div class="ql-title">Manage Products</div>
                        <div class="ql-sub">Add, edit or remove items</div>
                    </div>
                    <i class="fa-solid fa-chevron-right quick-link-arrow"></i>
                </a>

                <a href="ManageOrders.aspx" class="quick-link-item">
                    <div class="quick-link-icon blue"><i class="fa-solid fa-bag-shopping"></i></div>
                    <div class="quick-link-info">
                        <div class="ql-title">Manage Orders</div>
                        <div class="ql-sub">Track & update order status</div>
                    </div>
                    <i class="fa-solid fa-chevron-right quick-link-arrow"></i>
                </a>

                <a href="ViewCustomers.aspx" class="quick-link-item">
                    <div class="quick-link-icon green"><i class="fa-solid fa-users"></i></div>
                    <div class="quick-link-info">
                        <div class="ql-title">View Customers</div>
                        <div class="ql-sub">Browse registered users</div>
                    </div>
                    <i class="fa-solid fa-chevron-right quick-link-arrow"></i>
                </a>

                <a href="ManageCategories.aspx" class="quick-link-item">
                    <div class="quick-link-icon purple"><i class="fa-solid fa-envelope-open-text"></i></div>
                    <div class="quick-link-info">
                        <div class="ql-title">Contact Messages</div>
                        <div class="ql-sub">View customer enquiries</div>
                    </div>
                    <i class="fa-solid fa-chevron-right quick-link-arrow"></i>
                </a>

            </div>
        </div>

    </div>

</asp:Content>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="PageScripts" runat="server">
    <script>
        // Set welcome name from session
        const name = '<%= Session["UserName"] ?? "Admin" %>';
        const el   = document.getElementById('welcomeName');
        if (el && name) el.textContent = name;
    </script>
</asp:Content>
