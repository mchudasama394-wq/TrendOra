using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrendOra
{
    public partial class Register : Page
    {
        SqlConnection conn;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        void getcon()
        {
            conn = new SqlConnection(s);
            conn.Open();
        }

        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";       

        }



        protected void btnRegisterSubmit_Click(object sender, EventArgs e)
        {

            string name = txtFullName.Text;
            string email = txtEmail.Text;
            string mobile = txtPhone.Text;
            string gender = Request.Form["gender"];
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;



            if (password != confirmPassword)
            {
                Label1.Text = "Password and confirm password must match.";
                return;
            }

            getcon();

            cmd = new SqlCommand("insert into users (Name, Email, Mobile, Gender, Password, Role) values ('"+name+"','"+email+"','"+mobile+"','"+gender+"','"+password+"','User')", conn);
            cmd.ExecuteNonQuery();

            clear();
            conn.Close();
            Label1.Text = "Your account has been created successfully.";
        }
    }
}