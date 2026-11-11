using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

namespace TrendOra.Admin
{
    public partial class ManageOrders : Page
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
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("../Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            DataTable orders = new DataTable();
            using (SqlConnection connection = new SqlConnection(s))
            using (SqlCommand command = new SqlCommand(
                "SELECT Order_id, user_id, user_name, order_date, order_total_amount, order_payment_method, order_status " +
                "FROM order_tbl ORDER BY order_date DESC, Order_id DESC", connection))
            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
            {
                adapter.Fill(orders);
            }

            GridViewOrders.DataSource = orders;
            GridViewOrders.DataBind();
        }

        protected void btnDownloadAllOrdersReport_Click(object sender, EventArgs e)
        {
            DownloadAllOrdersReport();
        }

        protected void GridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewOrders.Rows[rowIndex];
                DropDownList statusList = (DropDownList)row.FindControl("ddlOrderStatus");
                string status = statusList.SelectedValue;
                if (!IsValidStatus(status))
                {
                    lblMessage.Text = "Please select a valid order status.";
                    return;
                }

                int orderId = Convert.ToInt32(GridViewOrders.DataKeys[rowIndex].Value);
                using (SqlConnection connection = new SqlConnection(s))
                using (SqlCommand command = new SqlCommand(
                    "UPDATE order_tbl SET order_status = @status WHERE Order_id = @orderId", connection))
                {
                    command.Parameters.Add("@status", SqlDbType.NVarChar, 30).Value = status;
                    command.Parameters.Add("@orderId", SqlDbType.Int).Value = orderId;
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                lblMessage.Text = "Order status updated.";
                fillgrid();
                return;
            }

            if (e.CommandName == "DownloadBill")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);
                DownloadOrderBill(orderId);
            }
        }

        void DownloadAllOrdersReport()
        {
            getcon();
            da = new SqlDataAdapter(
                "SELECT ot.Order_id, ot.user_id, ot.user_name, ot.order_date, ot.order_total_amount, ot.order_payment_method, ot.order_status, " +
                "oi.product_name, oi.quantity, oi.unit_price, oi.line_total " +
                "FROM order_tbl ot LEFT JOIN order_item_tbl oi ON ot.Order_id = oi.Order_id " +
                "ORDER BY ot.order_date DESC, ot.Order_id DESC, oi.Order_item_id",
                con);

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
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "All_Orders_Report");
            con.Close();
        }

        void DownloadOrderBill(int orderId)
        {
            getcon();
            da = new SqlDataAdapter(
                "SELECT ot.Order_id, ot.user_id, ot.user_name, ot.order_date, ot.order_total_amount, ot.order_payment_method, ot.order_status, " +
                "oi.product_name, oi.quantity, oi.unit_price, oi.line_total " +
                "FROM order_tbl ot INNER JOIN order_item_tbl oi ON ot.Order_id = oi.Order_id " +
                "WHERE ot.Order_id = @orderId ORDER BY oi.Order_item_id",
                con);
            da.SelectCommand.Parameters.Add("@orderId", SqlDbType.Int).Value = orderId;

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

        bool IsValidStatus(string status)
        {
            return status == "Pending" || status == "Processing" || status == "Shipped" ||
                status == "Delivered" || status == "Cancelled";
        }
    }
}