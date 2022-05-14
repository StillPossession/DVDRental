using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report11 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {

            string sql1 = $@"SELECT count(*) as TotalCopies, date_out FROM loans where date_returned = '0' group by date_out order by date_out DESC;";

            GVactors.DataSource = dh.getTable(sql1);
            GVactors.DataBind();
        }
    }
}