using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TrendOra.Visitor
{
    public partial class ProductDetails : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldatalist();
            }
        }

        void filldatalist()
        {
            int id;
            if (!int.TryParse(Request.QueryString["id"], out id))
            {
                Response.Redirect("Products.aspx");
                return;
            }

            getcon();
            da = new SqlDataAdapter(
                "SELECT p.ProductId, p.ProductName, p.Price, p.Description, p.ImageUrl, " +
                "ISNULL(c.CategoryName, 'Uncategorised') AS CategoryName " +
                "FROM Products p LEFT JOIN Categories c ON c.CategoryId = p.CategoryId " +
                "WHERE p.ProductId = '" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("Products.aspx");
                return;
            }

            DataRow row = ds.Tables[0].Rows[0];
            string productName = row["ProductName"].ToString();
            string imageUrl = row["ImageUrl"].ToString();

            lblProductCategory.Text = row["CategoryName"].ToString();
            lblProductName.Text = productName;
            lblProductPrice.Text = "Rs. " + Convert.ToDecimal(row["Price"]).ToString("#,##0.##");
            lblProductDescription.Text = row["Description"].ToString();
            mainProductStage.ImageUrl = ResolveUrl("~/" + imageUrl.TrimStart('/', '\\'));
            mainProductStage.AlternateText = productName;
            Page.Title = "Trendora - " + productName;
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "loginFirst", "alert('Please login first to add products to your cart.'); window.location='../Login.aspx';", true);
                return;
            }

            int id;
            if (!int.TryParse(Request.QueryString["id"], out id))
            {
                Response.Redirect("Products.aspx");
                return;
            }

            getcon();
            cmd = new SqlCommand("IF OBJECT_ID('cart_tbl', 'U') IS NULL CREATE TABLE cart_tbl (Cart_Id int IDENTITY(1,1) PRIMARY KEY, Cart_User_Id nvarchar(150) NOT NULL, Cart_Prod_Id int NOT NULL, Quantity int NOT NULL, Added_Date datetime NOT NULL, Total decimal(18,2) NULL)", con);
            cmd.ExecuteNonQuery();
            ViewState["pid"] = id;
            cmd = new SqlCommand("INSERT INTO cart_tbl (Cart_User_Id, Cart_Prod_Id, Quantity, Added_Date) VALUES ('" + Session["UserID"] + "', '" + ViewState["pid"] + "', '" + 1 + "', GETDATE())", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(GetType(), "cartAdded", "alert('Product added to cart successfully.');", true);
        }
    }
}