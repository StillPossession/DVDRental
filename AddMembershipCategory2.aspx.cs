using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class AddMembershipCategory2 : System.Web.UI.Page
    {
        // setting connection to sql server management
        SqlConnection sqlCon = new SqlConnection(@"Data Source=INDRA\SQLEXPRESS;Initial Catalog=RopeydvdDb;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                FillGridViewActor();
            }


        }

        //to view the data in gridview
        void FillGridViewActor()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("MembershipCatViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GVactors.DataSource = dtbl;
            GVactors.DataBind();
        }

    } 
}