using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class LoginForm : System.Web.UI.Page

    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserNumber"] != null)
            {
                Response.Redirect("Default.aspx", false);
            }
        }

        

        protected void Btn_login_click(object sender, EventArgs e)
        {
            string sql = $@"SELECT * FROM Users WHERE UserName = '{tB_username.Text.Trim()}' AND UserPassword='{tB_password.Text.Trim()}'";


            string[] userInfo = dh.loginUser(sql);

            if (userInfo != null)
            {
                Session["UserNumber"] = userInfo[0];
                Session["UserName"] = userInfo[1];
                Session["User_Role"] = userInfo[2];
                Session["UserPassword"] = userInfo[3];

                Response.Redirect("Default.aspx", false);
            }
            else
            {
                error_msg.Text = "Username and Password doesnot match";
            }
        }
    }
}