using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnUpdatePw_Click(object sender, EventArgs e)
        {

            if (tBNewPW.Text == tBreNewPW.Text)
            {
                string up = Session["UserPassword"].ToString();
                if (up == tBPassword.Text)
                {
                    string a = Session["UserNumber"].ToString();
                    string sql2 = $@"UPDATE users SET UserPassword = '{tBNewPW.Text}' where userNumber = '{a}';";
                    dh.saveData(sql2);
                    Session.Abandon();
                    Session.Clear();
                    Response.Cookies.Clear();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    LblErrorMessageActors.Text = "Rewrite your Old Password correctly";
                }

            }
            else
            {
                LblErrorMessageActors.Text = "Rewrite your New Password Correctly";
                LblSuccessMessageActors.Text = "";
            }




        }
    }
}