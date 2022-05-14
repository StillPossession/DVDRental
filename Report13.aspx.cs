using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report13 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {



            string sql1 = $@"select dvd_copy_no, m.movie_name  from dvd_stock as ds
                        inner join movies as m on ds.dvd_movie_id = m.movie_id
                        Except
                        select ds.dvd_copy_no, m.movie_name from loans as l 
                        inner join dvd_stock as ds on l.copy_num =ds.dvd_copy_no 
                        inner join movies as m on ds.dvd_movie_id = m.movie_id
                        where l.date_out  >= DATEADD(DAY, -31, GETDATE());";


            GVactors.DataSource = dh.getTable(sql1);
            GVactors.DataBind();


        }
    }
}