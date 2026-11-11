using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TrendOra.Buyer
{
    public partial class MyAccount : Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillProfile();
                fillOrders();
            }
        }

        void fillProfile()
        {
            string name = Convert.ToString(Session["UserName"]);
            string email = Convert.ToString(Session["UserID"]);
            if (string.IsNullOrWhiteSpace(name))
            {
                name = string.IsNullOrWhiteSpace(email) ? "Customer" : email;
            }

            litCustomerName.Text = Server.HtmlEncode(name);
            litWelcomeName.Text = Server.HtmlEncode(name);
            litCustomerEmail.Text = Server.HtmlEncode(email);
            litAvatarInitial.Text = Server.HtmlEncode(name.Substring(0, 1).ToUpperInvariant());
        }

        void fillOrders()
        {
            using (SqlConnection connection = new SqlConnection(s))
            {
                connection.Open();
                using (SqlCommand summaryCommand = new SqlCommand(
                    "SELECT COUNT(*) AS TotalOrders, " +
                    "ISNULL(SUM(CASE WHEN order_status IN ('Pending', 'Processing', 'Shipped') THEN 1 ELSE 0 END), 0) AS ActiveOrders, " +
                    "ISNULL(SUM(CASE WHEN order_status = 'Delivered' THEN 1 ELSE 0 END), 0) AS DeliveredOrders, " +
                    "ISNULL(SUM(CASE WHEN order_status <> 'Cancelled' THEN order_total_amount ELSE 0 END), 0) AS TotalSpent " +
                    "FROM order_tbl WHERE user_id = @userId", connection))
                {
                    summaryCommand.Parameters.Add("@userId", SqlDbType.NVarChar, 150).Value = Convert.ToString(Session["UserID"]);
                    using (SqlDataReader reader = summaryCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            litTotalOrders.Text = Convert.ToInt32(reader["TotalOrders"]).ToString();
                            litActiveOrders.Text = Convert.ToInt32(reader["ActiveOrders"]).ToString();
                            litDeliveredOrders.Text = Convert.ToInt32(reader["DeliveredOrders"]).ToString();
                            litTotalSpent.Text = "Rs. " + Convert.ToDecimal(reader["TotalSpent"]).ToString("N2");
                        }
                    }
                }

                DataTable orders = new DataTable();
                using (SqlCommand command = new SqlCommand(
                    "SELECT TOP 8 Order_id, order_date, order_total_amount, order_status " +
                    "FROM order_tbl WHERE user_id = @userId ORDER BY order_date DESC, Order_id DESC", connection))
                {
                    command.Parameters.Add("@userId", SqlDbType.NVarChar, 150).Value = Convert.ToString(Session["UserID"]);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(orders);
                    }
                }

                GridViewOrders.DataSource = orders;
                GridViewOrders.DataBind();
            }
        }

        protected string GetStatusClass(object status)
        {
            switch (Convert.ToString(status))
            {
                case "Processing":
                    return "status-processing";
                case "Shipped":
                    return "status-shipped";
                case "Delivered":
                    return "status-delivered";
                case "Cancelled":
                    return "status-cancelled";
                default:
                    return string.Empty;
            }
        }
    }
}