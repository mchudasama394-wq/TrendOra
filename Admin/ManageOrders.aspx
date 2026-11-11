<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="TrendOra.Admin.ManageOrders" %>

<asp:Content ID="ManageOrdersCss" ContentPlaceHolderID="PageCSS" runat="server">
    <link href="css/manage_orders.css" rel="stylesheet" />
    <style>
        .orders-table{width:100%;border-collapse:collapse;background:#fff}
        .orders-table th,.orders-table td{padding:14px 12px;border-bottom:1px solid #ece8df;text-align:left;vertical-align:middle}
        .orders-table th{color:#777;font-size:10px;letter-spacing:1px;text-transform:uppercase}
        .orders-table td{color:#45434a;font-size:12px}
        .orders-table select{max-width:125px;padding:8px;border:1px solid #ded8cc;border-radius:5px;background:#fff}
        .status-save{padding:8px 11px;border:0;border-radius:5px;background:#171820;color:#fff;font-size:10px;font-weight:700;cursor:pointer}
        .orders-message{display:block;margin:10px 0;color:#8e6d12}
        .table-scroll{overflow-x:auto;background:#fff;border:1px solid #ece8df;border-radius:10px}
        @media(max-width:800px){.orders-table{min-width:880px}}
    </style>
</asp:Content>
<asp:Content ID="ManageOrdersTitle" ContentPlaceHolderID="PageTitle" runat="server">Orders</asp:Content>
<asp:Content ID="ManageOrdersBreadcrumb" ContentPlaceHolderID="BreadcrumbTitle" runat="server">Orders</asp:Content>

<asp:Content ID="ManageOrdersContent" ContentPlaceHolderID="PageContent" runat="server">
    <section class="orders-page">
        <div class="page-header">
            <div><div class="eyebrow"><span></span> Fulfilment</div><h1>Customer orders</h1><p>Review purchases and update their status for customers.</p></div>
            <asp:Button ID="btnDownloadAllOrdersReport" runat="server" Text="Download All Orders Report" OnClick="btnDownloadAllOrdersReport_Click" style="padding:10px 16px;border:1px solid #d7c88e;border-radius:6px;background:#f9f3df;color:#8e6d12;font-weight:800;cursor:pointer;" />
        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="orders-message" />
        <div class="table-scroll">
            <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="false" DataKeyNames="Order_id" CssClass="orders-table" EmptyDataText="No customer orders have been placed yet." OnRowCommand="GridViewOrders_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Order_id" HeaderText="Order #" />
                    <asp:BoundField DataField="user_name" HeaderText="Customer" />
                    <asp:BoundField DataField="user_id" HeaderText="Email" />
                    <asp:BoundField DataField="order_date" HeaderText="Date" DataFormatString="{0:dd MMM yyyy, hh:mm tt}" />
                    <asp:BoundField DataField="order_total_amount" HeaderText="Total" DataFormatString="Rs. {0:N2}" />
                    <asp:BoundField DataField="order_payment_method" HeaderText="Payment" />
                    <asp:TemplateField HeaderText="Order status">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlOrderStatus" runat="server" SelectedValue='<%# Bind("order_status") %>'>
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Processing" Value="Processing" />
                                <asp:ListItem Text="Shipped" Value="Shipped" />
                                <asp:ListItem Text="Delivered" Value="Delivered" />
                                <asp:ListItem Text="Cancelled" Value="Cancelled" />
                            </asp:DropDownList>
                            <asp:LinkButton ID="btnUpdateStatus" runat="server" Text="Save" CssClass="status-save" CommandName="UpdateStatus" CommandArgument='<%# Container.DataItemIndex %>' CausesValidation="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bill">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDownloadBill" runat="server" Text="Download bill" CommandName="DownloadBill" CommandArgument='<%# Eval("Order_id") %>' CausesValidation="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </section>
</asp:Content>