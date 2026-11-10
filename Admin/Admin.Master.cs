using System;
using System.Web.UI;

namespace TrendOra.Admin
{
    public partial class AdminMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Helper: returns "active" CSS class for current page nav item
        protected string GetActiveClass(string pageName)
        {
            string currentPage = System.IO.Path.GetFileNameWithoutExtension(Request.PhysicalPath);
            return currentPage.Equals(pageName, StringComparison.OrdinalIgnoreCase) ? "active" : "";
        }
    }
}
