using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

namespace TrendOra.Buyer
{
    public partial class OrderDetails : Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
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
                fillOrder();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillOrder()
        {
            int orderId;
            if (!int.TryParse(Request.QueryString["id"], out orderId))
            {
                Response.Redirect("MyAccount.aspx");
                return;
            }

            DataTable order = new DataTable();
            using (SqlConnection connection = new SqlConnection(s))
            using (SqlCommand command = new SqlCommand(
                "SELECT Order_id, order_date, order_total_amount, order_payment_method, order_status " +
                "FROM order_tbl WHERE Order_id = @orderId AND user_id = @userId", connection))
            {
                command.Parameters.Add("@orderId", SqlDbType.Int).Value = orderId;
                command.Parameters.Add("@userId", SqlDbType.NVarChar, 150).Value = Convert.ToString(Session["UserID"]);
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    adapter.Fill(order);
                }
            }

            if (order.Rows.Count == 0)
            {
                Response.Redirect("MyAccount.aspx");
                return;
            }

            DataRow orderRow = order.Rows[0];
            lblOrderId.Text = orderRow["Order_id"].ToString();
            lblOrderSummary.Text = "Placed " + Convert.ToDateTime(orderRow["order_date"]).ToString("dd MMM yyyy, hh:mm tt") +
                " | Total: Rs. " + Convert.ToDecimal(orderRow["order_total_amount"]).ToString("N2") +
                " | Payment: " + orderRow["order_payment_method"] +
                " | Status: " + orderRow["order_status"];

            DataTable items = new DataTable();
            using (SqlConnection connection = new SqlConnection(s))
            using (SqlCommand command = new SqlCommand(
                "SELECT product_name, quantity, unit_price, line_total FROM order_item_tbl WHERE Order_id = @orderId ORDER BY Order_item_id", connection))
            {
                command.Parameters.Add("@orderId", SqlDbType.Int).Value = orderId;
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    adapter.Fill(items);
                }
            }

            GridViewItems.DataSource = items;
            GridViewItems.DataBind();
        }

        protected void btnDownloadBill_Click(object sender, EventArgs e)
        {
            int orderId;
            if (!int.TryParse(Request.QueryString["id"], out orderId))
            {
                Response.Redirect("MyAccount.aspx");
                return;
            }

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
    }
}