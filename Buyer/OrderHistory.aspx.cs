using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using CrystalDecisions.Web.Design;

namespace TrendOra.Buyer
{
    public partial class OrderHistory : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        private ReportDocument cr = new ReportDocument();
        static string Crypath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillOrders();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillOrders()
        {
            DataTable orders = new DataTable();
            using (SqlConnection connection = new SqlConnection(s))
            using (SqlCommand command = new SqlCommand(
                "SELECT Order_id, order_date, order_total_amount, order_status " +
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

        protected void GridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "DownloadBill")
            {
                return;
            }

            int orderId = Convert.ToInt32(e.CommandArgument);
            DownloadOrderBill(orderId);
        }

        void DownloadOrderBill(int orderId)
        {
            getcon();
            da = new SqlDataAdapter(
                "SELECT ot.Order_id, ot.user_id, ot.user_name, ot.order_date, ot.order_total_amount, ot.order_payment_method, ot.order_status, " +
                "oi.product_name, oi.quantity, oi.unit_price, oi.line_total " +
                "FROM order_tbl ot INNER JOIN order_item_tbl oi ON ot.Order_id = oi.Order_id " +
                "WHERE ot.Order_id = @orderId AND ot.user_id = @userId ORDER BY oi.Order_item_id",
                con);
            da.SelectCommand.Parameters.Add("@orderId", SqlDbType.Int).Value = orderId;
            da.SelectCommand.Parameters.Add("@userId", SqlDbType.NVarChar, 150).Value = Convert.ToString(Session["UserID"]);

            ds = new DataSet();
            da.Fill(ds);

            string sPath = Server.MapPath("~/data.xml");
            ds.WriteXmlSchema(sPath);

            string path = Server.MapPath("~/product.rpt");
            if (!System.IO.File.Exists(path))
            {
                Response.Clear();
                Response.ContentType = "text/plain";
                Response.Write("Crystal report template missing. Please add product.rpt to the project root.");
                Response.End();
                return;
            }

            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer viewer = new CrystalReportViewer();
            viewer.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Order_Bill_" + orderId);
            con.Close();
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