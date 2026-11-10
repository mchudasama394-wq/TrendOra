using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrendOra.Admin
{
	public partial class ManageProducts : Page
	{
		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter da;
		DataSet ds;
		string fnm, nm;
		string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

		void getCon()
		{
			con = new SqlConnection(s);
			con.Open();
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				fillcategories();
			}

			fillproducts();
		}

		void fillcategories()
		{
			getCon();
			da = new SqlDataAdapter("SELECT CategoryId, CategoryName FROM Categories WHERE IsActive = 1 ORDER BY CategoryName", con);
			ds = new DataSet();
			da.Fill(ds);

			ddlProductCategory.DataSource = ds;
			ddlProductCategory.DataTextField = "CategoryName";
			ddlProductCategory.DataValueField = "CategoryId";
			ddlProductCategory.DataBind();
			ddlProductCategory.Items.Insert(0, new ListItem("Select category", ""));

			rptCategoryFilter.DataSource = ds;
			rptCategoryFilter.DataBind();

			con.Close();
		}

		void fillproducts()
		{
			getCon();
			da = new SqlDataAdapter("SELECT p.ProductId, p.ProductName, p.Price, p.StockQuantity, p.ImageUrl, ISNULL(c.CategoryName, 'Uncategorised') AS CategoryName FROM Products p LEFT JOIN Categories c ON c.CategoryId = p.CategoryId ORDER BY p.ProductName", con);
			ds = new DataSet();
			da.Fill(ds);
			rptProducts.DataSource = ds;
			rptProducts.DataBind();

			litTotalProducts.Text = ds.Tables[0].Rows.Count.ToString();

			int lowStock = 0;
			int totalStock = 0;
			for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
			{
				int qty = 0;
				if (ds.Tables[0].Rows[i]["StockQuantity"] != DBNull.Value)
				{
					qty = Convert.ToInt32(ds.Tables[0].Rows[i]["StockQuantity"]);
				}

				if (qty <= 10)
				{
					lowStock++;
				}

				totalStock += qty;
			}

			litLowStock.Text = lowStock.ToString();
			litTotalStock.Text = totalStock.ToString();

			cmd = new SqlCommand("SELECT COUNT(*) FROM Categories WHERE IsActive = 1", con);
			litTotalCategories.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString("00", CultureInfo.InvariantCulture);

			con.Close();
		}

		protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			int productId = Convert.ToInt32(e.CommandArgument);

			if (e.CommandName == "delete_product")
			{
				getCon();
				cmd = new SqlCommand("DELETE FROM Products WHERE ProductId = '" + productId + "'", con);
				cmd.ExecuteNonQuery();
				con.Close();
				fillproducts();
				return;
			}

			if (e.CommandName == "edit_product")
			{
				getCon();
				cmd = new SqlCommand("SELECT ProductId, ProductName, CategoryId, Price, StockQuantity, Description FROM Products WHERE ProductId = '" + productId + "'", con);
				SqlDataReader reader = cmd.ExecuteReader();
				if (reader.Read())
				{
					hfProductId.Value = reader["ProductId"].ToString();
					txtProductName.Text = reader["ProductName"].ToString();
					ddlProductCategory.SelectedValue = reader["CategoryId"].ToString();
					txtProductPrice.Text = reader["Price"].ToString();
					txtProductStock.Text = reader["StockQuantity"].ToString();
					txtProductDescription.Text = reader["Description"].ToString();
				}
				reader.Close();
				con.Close();
				ClientScript.RegisterStartupScript(GetType(), "openEditProduct", "document.addEventListener('DOMContentLoaded',function(){document.getElementById('productPanel').classList.add('open');document.getElementById('productPanel').setAttribute('aria-hidden','false');document.getElementById('panelBackdrop').hidden=false;});", true);
			}
		}

		protected string GetFilterValue(object categoryName)
		{
			if (categoryName == null || categoryName == DBNull.Value)
			{
				return "";
			}

			return categoryName.ToString().Trim().ToLower().Replace(" ", "-");
		}

		protected string FormatPrice(object price)
		{
			decimal value = 0;
			if (price != null && price != DBNull.Value)
			{
				decimal.TryParse(price.ToString(), out value);
			}

			return "Rs. " + value.ToString("#,##0.##", CultureInfo.InvariantCulture);
		}

		protected string GetStockClass(object stock)
		{
			int quantity = 0;
			if (stock != null && stock != DBNull.Value)
			{
				quantity = Convert.ToInt32(stock);
			}

			if (quantity <= 10)
			{
				return "low";
			}

			return "active";
		}

		protected string GetStockStatus(object stock)
		{
			int quantity = 0;
			if (stock != null && stock != DBNull.Value)
			{
				quantity = Convert.ToInt32(stock);
			}

			if (quantity <= 10)
			{
				return "Low stock";
			}

			return "Active";
		}

		protected string GetProductImage(object imageUrl, object productName)
		{
			if (imageUrl == null || imageUrl == DBNull.Value || imageUrl.ToString().Trim() == "")
			{
				return HttpUtility.HtmlEncode(GetInitials(productName));
			}

			string url = ResolveUrl("~/" + imageUrl.ToString().TrimStart('~', '/'));
			return "<img src=\"" + HttpUtility.HtmlAttributeEncode(url) + "\" alt=\"" + HttpUtility.HtmlAttributeEncode(productName == null ? "Product" : productName.ToString()) + "\" />";
		}

		string GetInitials(object productName)
		{
			string name = productName == null ? "" : productName.ToString().Trim();
			if (name == "")
			{
				return "P";
			}

			string[] words = name.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
			if (words.Length == 1)
			{
				if (words[0].Length >= 2)
				{
					return words[0].Substring(0, 2).ToUpper();
				}

				return words[0].ToUpper();
			}

			return (words[0][0].ToString() + words[1][0].ToString()).ToUpper();
		}

		protected void btnSaveProduct_Click(object sender, EventArgs e)
		{
			lblCategoryMessage.Text = "";
			string productName = txtProductName.Text.Trim();
			string price = txtProductPrice.Text.Trim();
			string stock = txtProductStock.Text.Trim();
			string description = txtProductDescription.Text.Trim();
			string categoryId = ddlProductCategory.SelectedValue;

			if (productName == "" || categoryId == "" || price == "" || stock == "")
			{
				ShowProductMessage("Please fill all required product fields.", false);
				return;
			}

			if (hfProductId.Value == "" && !fuProductImage.HasFile)
			{
				ShowProductMessage("Please select a product image.", false);
				return;
			}

			string imageUrl = "";
			if (fuProductImage.HasFile)
			{
				string extension = Path.GetExtension(fuProductImage.FileName).ToLower();
				if (extension != ".jpg" && extension != ".jpeg" && extension != ".png" && extension != ".webp")
				{
					ShowProductMessage("Only JPG, PNG or WEBP images are allowed.", false);
					return;
				}

				if (fuProductImage.PostedFile.ContentLength > 5 * 1024 * 1024)
				{
					ShowProductMessage("Image size must be 5 MB or less.", false);
					return;
				}

				getCon();
				fnm = Guid.NewGuid().ToString("N") + extension;
				nm = Server.MapPath("~/images/product_images/");
				Directory.CreateDirectory(nm);
				fuProductImage.SaveAs(Path.Combine(nm, fnm));
				imageUrl = "images/product_images/" + fnm;
				con.Close();
			}

			getCon();
			if (hfProductId.Value == "")
			{
				cmd = new SqlCommand("INSERT INTO Products (ProductName, CategoryId, Price, StockQuantity, Description, ImageUrl) VALUES ('" + productName.Replace("'", "''") + "', '" + categoryId + "', '" + price + "', '" + stock + "', '" + description.Replace("'", "''") + "', '" + imageUrl + "')", con);
			}
			else if (imageUrl == "")
			{
				cmd = new SqlCommand("UPDATE Products SET ProductName = '" + productName.Replace("'", "''") + "', CategoryId = '" + categoryId + "', Price = '" + price + "', StockQuantity = '" + stock + "', Description = '" + description.Replace("'", "''") + "' WHERE ProductId = '" + hfProductId.Value + "'", con);
			}
			else
			{
				cmd = new SqlCommand("UPDATE Products SET ProductName = '" + productName.Replace("'", "''") + "', CategoryId = '" + categoryId + "', Price = '" + price + "', StockQuantity = '" + stock + "', Description = '" + description.Replace("'", "''") + "', ImageUrl = '" + imageUrl + "' WHERE ProductId = '" + hfProductId.Value + "'", con);
			}
			cmd.ExecuteNonQuery();
			con.Close();

			txtProductName.Text = "";
			txtProductPrice.Text = "";
			txtProductStock.Text = "";
			txtProductDescription.Text = "";
			ddlProductCategory.SelectedIndex = 0;
			hfProductId.Value = "";
			ShowProductMessage("Product added successfully.", true);
		}

		protected void btnSaveCategory_Click(object sender, EventArgs e)
		{
			lblProductMessage.Text = "";
			string categoryName = txtCategoryName.Text.Trim();
			string description = txtCategoryDescription.Text.Trim();

			if (categoryName == "")
			{
				ShowCategoryMessage("Please enter a category name.", false);
				return;
			}

			getCon();
			cmd = new SqlCommand("INSERT INTO Categories (CategoryName, Description) VALUES ('" + categoryName.Replace("'", "''") + "', '" + description.Replace("'", "''") + "')", con);
			cmd.ExecuteNonQuery();
			con.Close();

			txtCategoryName.Text = "";
			txtCategoryDescription.Text = "";
			fillcategories();
			ShowCategoryMessage("Category added successfully.", true);
		}

		private void ShowCategoryMessage(string message, bool success)
		{
			lblCategoryMessage.Text = message;
			lblCategoryMessage.CssClass = success ? "category-message success" : "category-message error";
		}

		private void ShowProductMessage(string message, bool success)
		{
			lblProductMessage.Text = message;
			lblProductMessage.CssClass = success ? "category-message success" : "category-message error";
		}
	}
}
