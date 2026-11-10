<%@ Page Title="Trendora - Product Details" Language="C#" MasterPageFile="~/Visitor/Visitor.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="TrendOra.Visitor.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="css/product_details.css" rel="stylesheet" type="text/css" />
    <style>
        .database-detail-page { padding: 55px 0 80px; }
        .database-detail-card { display: grid; grid-template-columns: minmax(280px, 1fr) minmax(280px, 1fr); gap: 48px; padding: 30px; background: #fff; border: 1px solid #e8e3d9; }
        .database-detail-image { width: 100%; height: 480px; padding: 18px; object-fit: contain; background: #faf9f6; }
        .database-detail-info { align-self: center; }
        .database-detail-category { display: block; margin-bottom: 12px; color: #9a7a22; font-size: 11px; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase; }
        .database-detail-name { margin: 0 0 18px; color: #171717; font-family: var(--font-heading); font-size: 42px; line-height: 1.05; }
        .database-detail-price { display: block; margin-bottom: 24px; color: #171717; font-size: 24px; font-weight: 700; }
        .database-detail-description { display: block; margin-bottom: 30px; color: #777; font-size: 14px; line-height: 1.8; }
        .database-detail-cart { display: inline-flex; align-items: center; justify-content: center; min-height: 46px; padding: 0 24px; border: 0; background: #171717; color: #fff; font-size: 11px; font-weight: 700; letter-spacing: .8px; cursor: pointer; }
        .database-detail-cart:hover { background: #9a7a22; }
        @media (max-width: 700px) { .database-detail-card { grid-template-columns: 1fr; gap: 28px; padding: 18px; } .database-detail-image { height: 340px; } .database-detail-name { font-size: 34px; } }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="database-detail-page">
        <div class="container-luxury">
            <div class="database-detail-card">
                <asp:Image ID="mainProductStage" runat="server" CssClass="database-detail-image" />
                <div class="database-detail-info">
                    <asp:Label ID="lblProductCategory" runat="server" CssClass="database-detail-category" />
                    <h1 class="database-detail-name"><asp:Label ID="lblProductName" runat="server" /></h1>
                    <asp:Label ID="lblProductPrice" runat="server" CssClass="database-detail-price" />
                    <asp:Label ID="lblProductDescription" runat="server" CssClass="database-detail-description" />
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="database-detail-cart" CausesValidation="false" OnClick="btnAddToCart_Click" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
