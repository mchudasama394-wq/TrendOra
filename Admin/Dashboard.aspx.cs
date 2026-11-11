using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

namespace TrendOra.Admin
{
    public partial class Dashboard : Page
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
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnDownloadAllOrdersReport_Click(object sender, EventArgs e)
        {
            DownloadAllOrdersReport();
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
    }
}
