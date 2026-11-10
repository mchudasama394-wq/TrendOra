<%@ Page Title="Products" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="TrendOra.Admin.ManageProducts" %>

<asp:Content ID="CSSContent" ContentPlaceHolderID="PageCSS" runat="server">
	<link href="css/manage_products.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="TitleContent" ContentPlaceHolderID="PageTitle" runat="server">Products</asp:Content>
<asp:Content ID="BreadcrumbContent" ContentPlaceHolderID="BreadcrumbTitle" runat="server">Products</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="PageContent" runat="server">
	<section class="products-page">
		<div class="page-header products-header">
			<div><div class="eyebrow"><span></span> Catalogue control</div><h1>Product library</h1><p>Curate the pieces your customers see in the Trendora store.</p></div>
			<div class="header-actions"><button type="button" class="secondary-button" id="openCategoryPanel"><i class="fa-solid fa-layer-group"></i><span>Add category</span></button><button type="button" class="primary-button" id="openProductPanel"><i class="fa-solid fa-plus"></i><span>Add product</span></button></div>
		</div>
		<div class="product-metrics">
			<div class="metric-card"><div class="metric-icon metric-gold"><i class="fa-solid fa-boxes-stacked"></i></div><div><span>Total products</span><strong><asp:Literal ID="litTotalProducts" runat="server" /></strong></div><small>In the catalogue</small></div>
			<div class="metric-card"><div class="metric-icon metric-blue"><i class="fa-solid fa-layer-group"></i></div><div><span>Categories</span><strong><asp:Literal ID="litTotalCategories" runat="server" /></strong></div><small>Active collections</small></div>
			<div class="metric-card"><div class="metric-icon metric-orange"><i class="fa-solid fa-triangle-exclamation"></i></div><div><span>Low stock</span><strong><asp:Literal ID="litLowStock" runat="server" /></strong></div><small>10 units or less</small></div>
			<div class="metric-card"><div class="metric-icon metric-green"><i class="fa-solid fa-boxes-stacked"></i></div><div><span>Total stock</span><strong><asp:Literal ID="litTotalStock" runat="server" /></strong></div><small>Units available</small></div>
		</div>
		<div class="catalogue-card">
			<div class="catalogue-toolbar"><div><h2>All products</h2><span class="result-count" id="resultCount">Showing products from the database</span></div><div class="toolbar-actions"><label class="search-box"><i class="fa-solid fa-magnifying-glass"></i><input type="search" id="productSearch" placeholder="Search products" aria-label="Search products" /></label><select class="filter-select" id="categoryFilter" aria-label="Filter by category"><option value="all">All categories</option><asp:Repeater ID="rptCategoryFilter" runat="server"><ItemTemplate><option value="<%# GetFilterValue(Eval("CategoryName")) %>"><%# Eval("CategoryName") %></option></ItemTemplate></asp:Repeater></select><button type="button" class="icon-button" title="More filters" aria-label="More filters"><i class="fa-solid fa-sliders"></i></button></div></div>
			<div class="table-wrap"><table class="products-table"><thead><tr><th>Product</th><th>Category</th><th>Price</th><th>Stock</th><th class="actions-heading">Action</th></tr></thead><tbody id="productsBody">
				<asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand"><ItemTemplate>
					<tr data-category="<%# GetFilterValue(Eval("CategoryName")) %>" data-name="<%# Eval("ProductName") %>"><td><div class="product-cell"><div class="product-thumb"><%# GetProductImage(Eval("ImageUrl"), Eval("ProductName")) %></div><div><strong><%# Eval("ProductName") %></strong><span><%# Eval("CategoryName") %> collection</span></div></div></td><td><%# Eval("CategoryName") %></td><td class="price"><%# FormatPrice(Eval("Price")) %></td><td><%# Eval("StockQuantity") %> units</td><td class="product-actions"><asp:LinkButton ID="btnEditProduct" runat="server" CommandName="edit_product" CommandArgument='<%# Eval("ProductId") %>' CssClass="action-button edit-button" CausesValidation="false"><i class="fa-solid fa-pen"></i><span>Edit</span></asp:LinkButton><asp:LinkButton ID="btnDeleteProduct" runat="server" CommandName="delete_product" CommandArgument='<%# Eval("ProductId") %>' CssClass="action-button delete-button" CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this product?');"><i class="fa-solid fa-trash"></i><span>Delete</span></asp:LinkButton></td></tr>
				</ItemTemplate><FooterTemplate></FooterTemplate></asp:Repeater>
			</tbody></table><div class="empty-state" id="emptyState" hidden><i class="fa-solid fa-box-open"></i><strong>No products found</strong><span>Try another search or category.</span></div></div>
			<div class="catalogue-footer"><span>Showing all products stored in the catalogue</span></div>
		</div>
	</section>
	<div class="panel-backdrop" id="panelBackdrop" hidden></div><aside class="product-panel" id="productPanel" aria-hidden="true">
		<div class="panel-header"><div><span class="eyebrow">New entry</span><h2>Add product</h2></div><button type="button" class="close-button" id="closeProductPanel" aria-label="Close panel"><i class="fa-solid fa-xmark"></i></button></div><p class="panel-intro">Add a new item to your store catalogue.</p>
		<asp:HiddenField ID="hfProductId" runat="server" />
		<div class="form-grid"><label class="field full-field"><span>Product name</span><asp:TextBox ID="txtProductName" runat="server" placeholder="e.g. Tailored cotton blazer" MaxLength="150" /></label><label class="field"><span>Category</span><asp:DropDownList ID="ddlProductCategory" runat="server" CssClass="category-dropdown"><asp:ListItem Text="Select category" Value="" /></asp:DropDownList></label><label class="field"><span>Price</span><asp:TextBox ID="txtProductPrice" runat="server" placeholder="Rs. 0.00" /></label><label class="field"><span>Stock quantity</span><asp:TextBox ID="txtProductStock" runat="server" TextMode="Number" placeholder="0" /></label><label class="field full-field"><span>Description</span><asp:TextBox ID="txtProductDescription" runat="server" TextMode="MultiLine" Rows="4" placeholder="Tell customers about this product..." /></label><label class="upload-field full-field" id="productUploadArea"><img id="productImagePreview" class="product-image-preview" alt="Product image preview" hidden="hidden" /><i class="fa-solid fa-cloud-arrow-up"></i><strong>Drop product image here</strong><span>PNG, JPG up to 5MB</span><asp:FileUpload ID="fuProductImage" ClientIDMode="Static" runat="server" /></label></div>
		<asp:Label ID="lblProductMessage" ClientIDMode="Static" runat="server" CssClass="category-message" />
		<div class="panel-footer"><button type="button" class="secondary-button" id="cancelProduct">Cancel</button><asp:Button ID="btnSaveProduct" runat="server" CssClass="primary-button" Text="Save product" OnClick="btnSaveProduct_Click" /></div>
	</aside>
	<aside class="category-panel" id="categoryPanel" aria-hidden="true">
		<div class="panel-header"><div><span class="eyebrow">Catalogue setup</span><h2>Add category</h2></div><button type="button" class="close-button" id="closeCategoryPanel" aria-label="Close category panel"><i class="fa-solid fa-xmark"></i></button></div><p class="panel-intro">Create a category to keep your product library organised.</p>
		<div class="form-grid"><label class="field full-field"><span>Category name</span><asp:TextBox ID="txtCategoryName" runat="server" placeholder="e.g. New arrivals" MaxLength="100" /></label><label class="field full-field"><span>Description <em>Optional</em></span><asp:TextBox ID="txtCategoryDescription" runat="server" TextMode="MultiLine" Rows="4" placeholder="A short description for this collection..." /></label></div>
		<asp:Label ID="lblCategoryMessage" ClientIDMode="Static" runat="server" CssClass="category-message" />
		<div class="panel-footer"><button type="button" class="secondary-button" id="cancelCategory">Cancel</button><asp:Button ID="btnSaveCategory" runat="server" CssClass="primary-button" Text="Save category" OnClick="btnSaveCategory_Click" /></div>
	</aside>
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="PageScripts" runat="server"><script src="js/manage_products.js"></script></asp:Content>
