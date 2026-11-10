using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Trendora.Visitor
{
    public partial class VisitorMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected string GetCartCount()
        {
            if (Session["UserID"] == null)
                return "0";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString))
            using (SqlCommand command = new SqlCommand("SELECT ISNULL(SUM(Quantity), 0) FROM cart_tbl WHERE Cart_User_Id = '" + Session["UserID"] + "'", connection))
            {
                connection.Open();
                return Convert.ToInt32(command.ExecuteScalar()).ToString();
            }
        }

    }
}