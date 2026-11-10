
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrendOra.Visitor
{
    public partial class Products : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            filldatalist();
        }

        void filldatalist()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT p.ProductId, p.ProductName, p.Price, p.StockQuantity, p.ImageUrl, " +
                "ISNULL(c.CategoryName, 'Uncategorised') AS CategoryName " +
                "FROM Products p LEFT JOIN Categories c ON c.CategoryId = p.CategoryId " +
                "ORDER BY p.ProductId DESC", con);

            ds = new DataSet();
            da.Fill(ds);
            rptProducts.DataSource = ds;
            rptProducts.DataBind();

            con.Close();
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "add_cart")
            {
                if (Session["UserID"] == null)
                {
                    ClientScript.RegisterStartupScript(
                        GetType(), "loginFirst",
                        "alert('Please login first to add products to your cart.'); window.location='../Login.aspx';",
                        true);
                    return;
                }

                int id = Convert.ToInt32(e.CommandArgument);
                string userId = Session["UserID"].ToString();

                getCon();

                cmd = new SqlCommand(
                    "IF OBJECT_ID('cart_tbl', 'U') IS NULL " +
                    "CREATE TABLE cart_tbl (" +
                    "Cart_Id int IDENTITY(1,1) PRIMARY KEY, " +
                    "Cart_User_Id nvarchar(150) NOT NULL, " +
                    "Cart_Prod_Id int NOT NULL, " +
                    "Quantity int NOT NULL, " +
                    "Added_Date datetime NOT NULL, " +
                    "Total decimal(18,2) NULL)", con);

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand(
                    "IF EXISTS (SELECT 1 FROM cart_tbl " +
                    "WHERE Cart_User_Id = '" + userId + "' " +
                    "AND Cart_Prod_Id = " + id + ") " +

                    "UPDATE cart_tbl SET Quantity = Quantity + 1, " +
                    "Total = (Quantity + 1) * " +
                    "(SELECT Price FROM Products " +
                    "WHERE ProductId = cart_tbl.Cart_Prod_Id) " +
                    "WHERE Cart_User_Id = '" + userId + "' " +
                    "AND Cart_Prod_Id = " + id + " " +

                    "ELSE " +

                    "INSERT INTO cart_tbl " +
                    "(Cart_User_Id, Cart_Prod_Id, Quantity, Added_Date, Total) " +
                    "SELECT '" + userId + "', ProductId, 1, GETDATE(), Price " +
                    "FROM Products WHERE ProductId = " + id, con);

                cmd.ExecuteNonQuery();

                con.Close();

                ClientScript.RegisterStartupScript(
                    GetType(), "cartAdded",
                    "alert('Product added to cart successfully.');", true);
            }
        }
    }
}
