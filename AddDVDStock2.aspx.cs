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
    public partial class AddDVDStock2 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        // setting connection to sql server management
        SqlConnection sqlCon = new SqlConnection(@"Data Source=INDRA\SQLEXPRESS;Initial Catalog=RopeydvdDb;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                FillGridViewActor();
            }
        }

        void FillGridViewActor()
        {

            string sql1 = "select m.movie_id, m.movie_name, m.is_age_restricted, dvd_stock_id, dvd_copy_no, is_loaned, dvd_price, date_added from dvd_stock left join movies m on m.movie_id = dvd_stock.dvd_movie_id";
            GVactors.DataSource = dh.getTable(sql1);
            GVactors.DataBind();


        }

    }
}