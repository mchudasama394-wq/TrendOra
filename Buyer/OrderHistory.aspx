<%@ Page Title="Order History" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="TrendOra.Buyer.OrderHistory" %>

<asp:Content ID="OrderHistoryCss" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .history-page{min-height:68vh;padding:64px 0 90px;background:#f7f6f2}
        .history-card{background:#fff;border:1px solid #e9e4da;border-radius:14px;box-shadow:0 15px 40px rgba(30,25,15,.06)}
        .history-header{display:flex;align-items:flex-end;justify-content:space-between;gap:18px;padding:24px 28px;border-bottom:1px solid #eeeae2}
        .history-header h1{margin:0;color:#181820;font-family:var(--font-heading);font-size:42px}
        .history-header p{margin:6px 0 0;color:#85838a;font-size:12px}
        .history-link{display:inline-flex;align-items:center;gap:8px;padding:10px 15px;border:1px solid #e2d9c5;border-radius:6px;color:#8e6d12;font-size:10px;font-weight:800;letter-spacing:.5px;text-decoration:none;text-transform:uppercase}
        .history-grid-wrap{overflow-x:auto}
        .history-grid{width:100%;border-collapse:collapse}
        .history-grid th{padding:14px 18px;background:#fdfcf9;color:#969087;font-size:10px;letter-spacing:1px;text-transform:uppercase;text-align:left}
        .history-grid td{padding:15px 18px;border-top:1px solid #f0ede7;color:#625f66;font-size:12px;vertical-align:middle}
        .history-grid a,.history-grid button{font-size:10px;font-weight:800;letter-spacing:.5px}
        .history-grid a{display:inline-flex;align-items:center;gap:6px;color:#8e6d12;text-decoration:none}
        .history-grid button{padding:8px 11px;border:0;border-radius:5px;background:#171820;color:#fff;cursor:pointer}
        .status-badge{display:inline-block;padding:6px 9px;border-radius:20px;background:#f4f1e8;color:#8e6d12;font-size:9px;font-weight:800;white-space:nowrap}
        .status-processing,.status-shipped{background:#edf3f9;color:#34648d}
        .status-delivered{background:#eaf5ee;color:#34744a}
        .status-cancelled{background:#fbeeee;color:#a74949}
        .empty-history{padding:38px 18px;text-align:center;color:#7e7a82}
        .empty-history i{color:#c3b484;font-size:26px}
        .empty-history strong{display:block;margin-top:10px;color:#2e2d34;font-size:14px}
        .empty-history p{margin:8px 0 0;color:#88848a;font-size:11px}
        @media(max-width:700px){.history-page{padding:36px 0 58px}.history-header{flex-direction:column;align-items:flex-start;padding:20px 18px}.history-header h1{font-size:34px}.history-grid{min-width:650px}}
    </style>
</asp:Content>

<asp:Content ID="OrderHistoryContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="history-page">
        <div class="container-luxury">
            <div class="history-card">
                <div class="history-header">
                    <div>
                        <h1>Order history</h1>
                        <p>Review every purchase, track delivery progress, and download bills for your orders.</p>
                    </div>
                    <a href="MyAccount.aspx" class="history-link">Back to dashboard <i class="fa-solid fa-arrow-left"></i></a>
                </div>
                <div class="history-grid-wrap">
                    <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="false" CssClass="history-grid" EmptyDataText="" OnRowCommand="GridViewOrders_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Order_id" HeaderText="Order #" />
                            <asp:BoundField DataField="order_date" HeaderText="Date" DataFormatString="{0:dd MMM yyyy, hh:mm tt}" />
                            <asp:BoundField DataField="order_total_amount" HeaderText="Total" DataFormatString="Rs. {0:N2}" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='status-badge <%# GetStatusClass(Eval("order_status")) %>'><%# Server.HtmlEncode(Convert.ToString(Eval("order_status"))) %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField HeaderText="Details" Text="View order" DataNavigateUrlFields="Order_id" DataNavigateUrlFormatString="OrderDetails.aspx?id={0}" />
                            <asp:TemplateField HeaderText="Bill">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDownloadBill" runat="server" CommandName="DownloadBill" CommandArgument='<%# Eval("Order_id") %>' CausesValidation="false">Download bill</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="empty-history">
                                <i class="fa-solid fa-bag-shopping"></i>
                                <strong>No orders yet</strong>
                                <p>Your recent purchases will show up here after checkout.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
