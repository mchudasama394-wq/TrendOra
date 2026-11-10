using System;
using System.Web.UI;

namespace TrendOra
{
	public partial class Logout : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Session.Clear();
			Session.Abandon();
			Response.Redirect("Visitor/VisitorDefault.aspx", false);
			Context.ApplicationInstance.CompleteRequest();
		}
	}
}