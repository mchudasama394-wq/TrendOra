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

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            string userId = Convert.ToString(Session["UserID"]);
            if (string.IsNullOrWhiteSpace(userId))
            {
                Response.Redirect("../Login.aspx");
                return;
            }

            using (SqlConnection connection = new SqlConnection(s))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    DataTable cartItems = new DataTable();
                    using (SqlCommand cartCommand = new SqlCommand(
                        "SELECT c.Cart_Prod_Id, c.Quantity, p.ProductName, p.Price " +
                        "FROM cart_tbl c WITH (UPDLOCK, HOLDLOCK) " +
                        "INNER JOIN Products p ON c.Cart_Prod_Id = p.ProductId " +
                        "WHERE c.Cart_User_Id = @userId", connection, transaction))
                    {
                        cartCommand.Parameters.Add("@userId", SqlDbType.NVarChar, 150).Value = userId;
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cartCommand))
                        {
                            adapter.Fill(cartItems);
                        }
                    }

                    if (cartItems.Rows.Count == 0)
                    {
                        transaction.Rollback();
                        lblCartMessage.Text = "Your cart is empty.";
                        return;
                    }

                    decimal grandTotal = 0;
                    foreach (DataRow item in cartItems.Rows)
                    {
                        grandTotal += Convert.ToDecimal(item["Price"]) * Convert.ToInt32(item["Quantity"]);
                    }

                    int orderId;
                    using (SqlCommand orderCommand = new SqlCommand(
                        "INSERT INTO order_tbl (user_id, user_name, order_date, order_total_amount, order_payment_method, order_status) " +
                        "VALUES (@userId, @userName, GETDATE(), @total, @paymentMethod, @status); " +
                        "SELECT CAST(SCOPE_IDENTITY() AS int);", connection, transaction))
                    {
                        orderCommand.Parameters.Add("@userId", SqlDbType.NVarChar, 150).Value = userId;
                        orderCommand.Parameters.Add("@userName", SqlDbType.NVarChar, 150).Value =
                            Convert.ToString(Session["UserName"]) ?? string.Empty;
                        orderCommand.Parameters.Add("@total", SqlDbType.Decimal).Value = grandTotal;
                        orderCommand.Parameters["@total"].Precision = 18;
                        orderCommand.Parameters["@total"].Scale = 2;
                        orderCommand.Parameters.Add("@paymentMethod", SqlDbType.NVarChar, 50).Value = "Cash on Delivery";
                        orderCommand.Parameters.Add("@status", SqlDbType.NVarChar, 30).Value = "Pending";
                        orderId = Convert.ToInt32(orderCommand.ExecuteScalar());
                    }

                    foreach (DataRow item in cartItems.Rows)
                    {
                        int quantity = Convert.ToInt32(item["Quantity"]);
                        decimal unitPrice = Convert.ToDecimal(item["Price"]);

                        using (SqlCommand itemCommand = new SqlCommand(
                            "INSERT INTO order_item_tbl (Order_id, prod_id, product_name, quantity, unit_price, line_total) " +
                            "VALUES (@orderId, @productId, @productName, @quantity, @unitPrice, @lineTotal)", connection, transaction))
                        {
                            itemCommand.Parameters.Add("@orderId", SqlDbType.Int).Value = orderId;
                            itemCommand.Parameters.Add("@productId", SqlDbType.Int).Value = Convert.ToInt32(item["Cart_Prod_Id"]);
                            itemCommand.Parameters.Add("@productName", SqlDbType.NVarChar, 200).Value = Convert.ToString(item["ProductName"]);
                            itemCommand.Parameters.Add("@quantity", SqlDbType.Int).Value = quantity;
                            itemCommand.Parameters.Add("@unitPrice", SqlDbType.Decimal).Value = unitPrice;
                            itemCommand.Parameters["@unitPrice"].Precision = 18;
                            itemCommand.Parameters["@unitPrice"].Scale = 2;
                            itemCommand.Parameters.Add("@lineTotal", SqlDbType.Decimal).Value = unitPrice * quantity;
                            itemCommand.Parameters["@lineTotal"].Precision = 18;
                            itemCommand.Parameters["@lineTotal"].Scale = 2;
                            itemCommand.ExecuteNonQuery();
                        }
                    }

                    using (SqlCommand clearCartCommand = new SqlCommand(
                        "DELETE FROM cart_tbl WHERE Cart_User_Id = @userId", connection, transaction))
                    {
                        clearCartCommand.Parameters.Add("@userId", SqlDbType.NVarChar, 150).Value = userId;
                        clearCartCommand.ExecuteNonQuery();
                    }

                    transaction.Commit();
                    Response.Redirect("OrderDetails.aspx?id=" + orderId, false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }
        }
    }
}
