<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TrendOra.Buyer.Cart" %>

<asp:Content ID="CartCss" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .cart-page { min-height:62vh; padding:72px 0 105px; background:linear-gradient(180deg,#faf9f6 0,#f5f3ef 100%); }
        .cart-heading { display:flex; align-items:flex-end; justify-content:space-between; gap:24px; margin-bottom:34px; }
        .cart-kicker { display:block; color:#b18a1a; font-size:10px; font-weight:800; letter-spacing:2.4px; text-transform:uppercase; margin-bottom:10px; }
        .cart-heading h1 { color:#181820; font-family:var(--font-heading); font-size:48px; font-weight:600; letter-spacing:-.5px; line-height:.95; }
        .cart-heading p { max-width:250px; color:#8a8a8a; font-size:12px; line-height:1.7; text-align:right; }
        .cart-card { overflow:hidden; background:#fff; border:1px solid #e9e4da; border-radius:14px; box-shadow:0 18px 45px rgba(30,25,15,.08); }
        .cart-table { width:100%; border-collapse:collapse; }
        .cart-table th { padding:17px 25px; background:#fdfcf9; border-bottom:1px solid #e8e3d9; color:#969087; font-size:10px; font-weight:800; letter-spacing:1.5px; text-transform:uppercase; text-align:left; }
        .cart-table td { padding:22px 25px; border-bottom:1px solid #f0ede7; color:#625f66; font-size:12px; vertical-align:middle; }
        .cart-table tr:last-child td { border-bottom:0; }
        .cart-product { display:flex; align-items:center; gap:17px; min-width:280px; }
        .cart-product img { width:88px; height:88px; padding:7px; border:1px solid #eee9df; border-radius:10px; object-fit:contain; background:#faf9f6; transition:transform .25s ease; }
        .cart-product img:hover { transform:scale(1.04); }
        .cart-product-name { color:#24232a; font-size:13px; font-weight:700; line-height:1.5; text-decoration:none; }
        .cart-product-name:hover { color:#b18a1a; }
        .cart-quantity { display:inline-flex; align-items:center; justify-content:center; min-width:38px; height:34px; border:1px solid #e2ddd3; border-radius:6px; color:#292831; font-weight:800; }
        .cart-table select { min-width:65px; padding:9px 8px; border:1px solid #ddd8ce; border-radius:6px; background:#fff; color:#33313a; }
        .cart-table input[type="submit"], .cart-table input[type="button"] { border:1px solid #ded8cc; border-radius:5px; background:#fff; color:#5d5960; padding:8px 11px; margin:2px; font-size:9px; font-weight:800; letter-spacing:.5px; text-transform:uppercase; cursor:pointer; transition:all .2s ease; }
        .cart-table input[type="submit"]:hover, .cart-table input[type="button"]:hover { border-color:#b18a1a; background:#fffaf0; color:#8e6d12; }
        .cart-total { display:block; margin:0; padding:26px 28px; border-top:1px solid #e8e3d9; color:#1e1d24; font-size:23px; font-weight:800; letter-spacing:.2px; text-align:right; }
        .cart-total:before { content:'Order total  '; color:#98939a; font-size:10px; font-weight:700; letter-spacing:1.5px; text-transform:uppercase; }
        .cart-checkout { display:flex; justify-content:flex-end; padding:0 28px 27px; }
        .checkout-button { display:inline-flex; align-items:center; gap:10px; padding:13px 21px; border:0; border-radius:6px; background:#171820; color:#fff; font-family:inherit; font-size:11px; font-weight:800; letter-spacing:.7px; text-decoration:none; text-transform:uppercase; cursor:pointer; transition:background .2s ease, transform .2s ease; }
        .checkout-button:hover { background:#b18a1a; color:#fff; transform:translateY(-1px); }
        @media (max-width:700px) { .cart-page{padding:44px 0 70px}.cart-heading{display:block;margin-bottom:25px}.cart-heading h1{font-size:39px}.cart-heading p{margin-top:13px;text-align:left}.cart-table-wrap{overflow-x:auto}.cart-table{min-width:760px}.cart-card{border-radius:10px}.cart-total{font-size:19px}.cart-checkout{justify-content:stretch;padding:0 18px 22px}.checkout-button{width:100%;justify-content:center} }
    </style>
</asp:Content>

<asp:Content ID="CartContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="cart-page">
        <div class="container-luxury">
            <div class="cart-heading">
                <div><span class="cart-kicker">Your selection</span><h1>Shopping Cart<span class="gold-dot">.</span></h1></div>
                <p>Review your chosen pieces before checkout.</p>
            </div>
            <div class="cart-card">
                <div class="cart-table-wrap">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Cart_Id"
                    CssClass="cart-table" EmptyDataText="Your cart is empty."
                    OnRowEditing="GridView1_RowEditing"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Product">
                            <ItemTemplate>
                                <div class="cart-product">
                                    <img src="../<%# Eval("ImageUrl") %>" alt="<%# Eval("ProductName") %>" />
                                    <a class="cart-product-name" href="../Visitor/ProductDetails.aspx?id=<%# Eval("ProductId") %>"><%# Eval("ProductName") %></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="Rs. {0:#,##0.##}" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate><span class="cart-quantity"><%# Eval("Quantity") %></span></ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="drpqnt" runat="server" SelectedValue='<%# Bind("Quantity") %>'>
                                    <asp:ListItem Text="1" Value="1" /><asp:ListItem Text="2" Value="2" /><asp:ListItem Text="3" Value="3" /><asp:ListItem Text="4" Value="4" /><asp:ListItem Text="5" Value="5" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="Rs. {0:#,##0.##}" ReadOnly="true" />
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" />
                    </Columns>
                    </asp:GridView>
                </div>
                <asp:Label ID="lblGrandTotal" runat="server" CssClass="cart-total" />
                <div class="cart-checkout">
                    <asp:Button ID="btnCheckout" runat="server" CssClass="checkout-button" Text="Proceed to Checkout" OnClick="btnCheckout_Click" />
                    <asp:Label ID="lblCartMessage" runat="server" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
