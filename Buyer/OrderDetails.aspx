<%@ Page Title="Order Confirmed" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="TrendOra.Buyer.OrderDetails" %>

<asp:Content ID="OrderDetailsCss" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .order-page{min-height:62vh;padding:72px 0 100px;background:#f7f6f2}
        .order-card{max-width:900px;margin:0 auto;padding:36px;background:#fff;border:1px solid #e9e4da;border-radius:14px;box-shadow:0 18px 45px rgba(30,25,15,.08)}
        .order-success{text-align:center;margin-bottom:32px}
        .order-success i{color:#b18a1a;font-size:42px}
        .order-success h1{margin:14px 0 8px;color:#1c1b22;font-family:var(--font-heading);font-size:42px}
        .order-success p,.order-meta{color:#777;font-size:13px;line-height:1.8}
        .order-meta{padding:18px 0;border-top:1px solid #eee9df;border-bottom:1px solid #eee9df}
        .order-grid{width:100%;margin-top:24px;border-collapse:collapse}
        .order-grid th,.order-grid td{padding:14px;text-align:left;border-bottom:1px solid #eee9df}
        .order-grid th{color:#969087;font-size:10px;letter-spacing:1px;text-transform:uppercase}
        .order-link{display:inline-block;margin-top:24px;color:#8e6d12;font-weight:700;text-decoration:none}
        @media(max-width:640px){.order-page{padding:40px 15px}.order-card{padding:24px 18px}.order-success h1{font-size:34px}.order-grid{font-size:12px}}
    </style>
</asp:Content>

<asp:Content ID="OrderDetailsContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="order-page">
        <div class="order-card">
            <div class="order-success">
                <i class="fa-solid fa-circle-check"></i>
                <h1>Order placed successfully</h1>
                <p>Thank you for shopping with Trendora. You can follow the order status from your dashboard.</p>
            </div>
            <div class="order-meta">
                <strong>Order #<asp:Label ID="lblOrderId" runat="server" /></strong><br />
                <asp:Label ID="lblOrderSummary" runat="server" />
            </div>
            <asp:GridView ID="GridViewItems" runat="server" AutoGenerateColumns="false" CssClass="order-grid" EmptyDataText="No items found for this order.">
                <Columns>
                    <asp:BoundField DataField="product_name" HeaderText="Product" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="unit_price" HeaderText="Price" DataFormatString="Rs. {0:N2}" />
                    <asp:BoundField DataField="line_total" HeaderText="Total" DataFormatString="Rs. {0:N2}" />
                </Columns>
            </asp:GridView>
            <div style="margin-top:24px;display:flex;align-items:center;gap:14px;flex-wrap:wrap;">
                <asp:Button ID="btnDownloadBill" runat="server" Text="Download bill" OnClick="btnDownloadBill_Click" style="padding:10px 16px;border:0;border-radius:6px;background:#171820;color:#fff;font-weight:700;cursor:pointer;" />
                <a href="MyAccount.aspx" class="order-link" style="margin-top:0;">View your order history <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>
    </section>
</asp:Content>