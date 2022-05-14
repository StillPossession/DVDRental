using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report5 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { search_Table(SearchBox.Text); }
        }

        // protected void loadTable()
        // {

        //   string sql1 = $@"select  mem.member_full_name, m.movie_name, l.duration, l.date_out, l.date_returned, l.date_due,  CASE 
        //                      WHEN ds.is_loaned = 1 THEN 'on_loan'
        //                      ELSE 'returned'
        //          END AS 'status' from loans as l left join dvd_Stock as ds on l.movie=ds.dvd_movie_id left join [movies] as m on ds.dvd_movie_id = m.movie_id left join[members] as mem on l.member_num = mem.member_id
        //              where (ds.dvd_copy_no = l.copy_num )
        //                 group by mem.member_full_name, m.movie_name, l.duration, l.date_out, l.date_returned, l.date_due, ds.is_loaned;";
        //
        // GVactors.DataSource = dh.getTable(sql1);
        // GVactors.DataBind();
        // }



        protected void search_Table(string CopyNo)
        {
            if (CopyNo != "")
            {

                SearchBtn.Visible = false;
                CancelBtn.Visible = true;



                string sql1 = $@"select Top 1 mem.member_first_name + ' ' + mem.member_last_name AS member_full_name, m.movie_name, l.duration, l.date_out, l.date_returned, l.date_due,  CASE 
                                WHEN ds.is_loaned = 1 THEN 'on_loan'
                                ELSE 'returned'
                            END AS 'status' from loans as l inner join dvd_Stock as ds on l.movie=ds.dvd_movie_id inner join [movies] as m on ds.dvd_movie_id = m.movie_id inner join[members] as mem on l.member_num = mem.member_id
                            where (ds.dvd_copy_no LIKE '%{CopyNo}%' )
                            ORDER BY l.loan_id DESC;";
                GVactors.DataSource = dh.getTable(sql1);
                GVactors.DataBind();



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
            GVactors.DataSource = null;
            GVactors.DataBind();


        }
    }
}