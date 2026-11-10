<%@ Page Title="Trendora - Products" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="TrendOra.Visitor.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="css/products.css" rel="stylesheet" type="text/css" />
    <style>
        .database-products-page { padding: 45px 0 70px; }
        .database-products-title { margin-bottom: 28px; text-align: center; }
        .database-products-title h1 { margin: 0 0 8px; }
        .database-products-title p { color: #777; }
        .database-products-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; }
        .database-product-card { background: #fff; border: 1px solid #e8e8e8; }
        .database-product-image { display: block; width: 100%; height: 280px; padding: 12px; background: #fafafa; }
        .database-product-image img { width: 100%; height: 100%; object-fit: contain; }
        .database-product-info { padding: 18px; }
        .database-product-category { display: block; color: #999; font-size: 11px; text-transform: uppercase; letter-spacing: 1px; }
        .database-product-name { margin: 8px 0 12px; font-size: 16px; }
        .database-product-name a { color: #171717; text-decoration: none; }
        .database-product-price { display: block; color: #171717; font-weight: 700; font-size: 17px; margin-bottom: 15px; }
        .database-product-actions { display: flex; gap: 8px; }
        .database-product-button { flex: 1; display: inline-flex; align-items: center; justify-content: center; min-height: 38px; padding: 0 8px; font-size: 11px; font-weight: 700; letter-spacing: .4px; text-decoration: none; border: 1px solid #171717; }
        .database-view-button { color: #171717; background: #fff; }
        .database-cart-button { color: #fff; background: #171717; }
        @media (max-width: 1000px) { .database-products-grid { grid-template-columns: repeat(3, 1fr); } }
        @media (max-width: 700px) { .database-products-grid { grid-template-columns: repeat(2, 1fr); gap: 15px; } }
        @media (max-width: 450px) { .database-products-grid { grid-template-columns: 1fr; } }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="database-products-page">
        <div class="container-luxury">
            <div class="database-products-title">
                <h1>Our Products<span class="gold-dot">.</span></h1>
                <p>Discover products from the Trendora collection.</p>
            </div>
            <div class="database-products-grid">
                <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                    <ItemTemplate>
                        <article class="database-product-card">
                            <a class="database-product-image" href="ProductDetails.aspx?id=<%# Eval("ProductId") %>">
                                <img src="../<%# Eval("ImageUrl") %>" alt="<%# Eval("ProductName") %>" />
                            </a>
                            <div class="database-product-info">
                                <span class="database-product-category"><%# Eval("CategoryName") %></span>
                                <h2 class="database-product-name">
                                    <a href="ProductDetails.aspx?id=<%# Eval("ProductId") %>"><%# Eval("ProductName") %></a>
                                </h2>
                                <span class="database-product-price">Rs. <%# Eval("Price", "{0:#,##0.##}") %></span>
                                <div class="database-product-actions">
                                    <a class="database-product-button database-view-button" href="ProductDetails.aspx?id=<%# Eval("ProductId") %>">View</a>
                                    <asp:LinkButton ID="btnAddToCart" runat="server" CommandName="add_cart" CommandArgument='<%# Eval("ProductId") %>' CssClass="database-product-button database-cart-button" CausesValidation="false">Add to Cart</asp:LinkButton>
                                </div>
                            </div>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
