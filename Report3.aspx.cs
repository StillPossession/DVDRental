using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report3 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {

            string sql1 = $@"select m.movie_name, l.copy_num from loans as l 
                                 inner join dvd_Stock as ds on l.copy_num=ds.dvd_copy_no 
                                 inner join [movies] as m on ds.dvd_movie_id = m.movie_id
                                where l.date_out >= convert(datetime, DATEADD(DAY, -31, '2000-02-28')) and 
                                l.date_out < convert(datetime,'2030-03-30');";

            GVactors.DataSource = dh.getTable(sql1);
            GVactors.DataBind();
        }



        protected void search_Table(string members_LName)
        {
            if (members_LName != "")
            {
                SearchBtn.Visible = false;
                CancelBtn.Visible = true;

                string sql1 = $@"select m.movie_name, l.copy_num from loans as l inner join dvd_Stock as ds on l.copy_num=ds.dvd_copy_no inner join [movies] as m on ds.dvd_movie_id = m.movie_id inner join[members] as mem on l.member_num = mem.member_id
                                where (l.date_out >= convert(datetime, DATEADD(DAY, -31, '2000-02-28')) and l.date_out < convert(datetime,'2030-03-30')) and mem.member_last_name LIKE '%{members_LName}%' ;";

                GVactors.DataSource = dh.getTable(sql1);
                GVactors.DataBind();

            }
            else
            {
                loadTable();
            }

        }


        protected void SearchBox_TextChanged(object sender, EventArgs e)
        {
            search_Table(SearchBox.Text);
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            search_Table(SearchBox.Text);
        }



        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            SearchBtn.Visible = true;
            CancelBtn.Visible = false;
            dh.ClearTextBoxes(Page);
            loadTable();
        }
    }
}