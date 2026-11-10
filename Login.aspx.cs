using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace TrendOra
{
    public partial class Login : Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string email    = txtEmail.Text;
            string password = txtPassword.Text;

            SqlConnection conn = new SqlConnection(s);
            conn.Open();

            SqlCommand cmd = new SqlCommand("select * from users where Email='" + email + "' and Password='" + password + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["UserID"]   = dr["Email"].ToString();
                Session["UserName"] = dr["Name"].ToString();

               
                string role = "User";
                role = dr["Role"].ToString();

                Session["Role"] = role;
                conn.Close();

                if (role == "Admin")
                    Response.Redirect("Admin/Dashboard.aspx");
                else
                    Response.Redirect("Visitor/VisitorDefault.aspx");
            }
            else
            {
                conn.Close();
                lblMessage.Text    = "Invalid email or password!";
                lblMessage.Visible = true;
            }
        }
    }
}
