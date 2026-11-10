using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrendOra.Buyer
{
    public partial class Cart : Page
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
            if (Session["UserID"] == null)
            {
                Response.Redirect("../Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillCart();
            }
        }

        void fillCart()
        {
            getcon();
            cmd = new SqlCommand(
                "SELECT c.Cart_Id, c.Cart_Prod_Id, c.Quantity, c.Added_Date, " +
                "p.ImageUrl, p.ProductId, p.ProductName, p.Price, " +
                "(c.Quantity * p.Price) AS Total " +
                "FROM cart_tbl c INNER JOIN Products p ON c.Cart_Prod_Id = p.ProductId " +
                "WHERE c.Cart_User_Id = '" + Session["UserID"] + "'", con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            decimal grandTotal = 0;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                grandTotal += Convert.ToDecimal(dr["Total"]);
            }

            lblGrandTotal.Text = "Grand Total: Rs. " + grandTotal.ToString("0.00");
            con.Close();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillCart();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillCart();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int cartId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];
            DropDownList ddl = (DropDownList)row.FindControl("drpqnt");
            int qty = Convert.ToInt32(ddl.SelectedValue);

            getcon();
            cmd = new SqlCommand(
                "UPDATE cart_tbl SET Quantity='" + qty +
                "', Total=" + qty + " * (SELECT Price FROM Products " +
                "WHERE ProductId = cart_tbl.Cart_Prod_Id) " +
                "WHERE Cart_Id='" + cartId +
                "' AND Cart_User_Id='" + Session["UserID"] + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            fillCart();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cartId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            getcon();
            cmd = new SqlCommand(
                "DELETE FROM cart_tbl WHERE Cart_Id='" + cartId +
                "' AND Cart_User_Id='" + Session["UserID"] + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            fillCart();
        }
    }
}
