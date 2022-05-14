using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class LoanHistory : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {

            string sql1 = $@"select l.loan_id, lt.loan_type, m.movie_name, mem.member_first_name + ' ' + mem.member_last_name AS member_full_name, l.copy_num, l.date_out, l.date_due, l.date_returned, l.duration, l.total_charge 
                           from loans as l inner join movies as m on l.movie = m.movie_id inner join [members] as mem on mem.member_id = l.member_num  inner join [loan_types] as lt on lt.loan_type_id = l.loan_type ORDER BY l.date_out DESC;";

            GVactors.DataSource = dh.getTable(sql1);
            GVactors.DataBind();
        }



        protected void search_Table(string members_LName)
        {
            if (members_LName != "")
            {
                SearchBtn.Visible = false;
                CancelBtn.Visible = true;

                string sql1 = $@"select l.loan_id, lt.loan_type, m.movie_name, mem.member_first_name + ' ' + mem.member_last_name AS member_full_name, l.copy_num, l.date_out, l.date_due, l.date_returned, l.duration, l.total_charge 
from loans as l inner join movies as m on l.movie = m.movie_id inner join [members] as mem on mem.member_id = l.member_num  inner join [loan_types] as lt on lt.loan_type_id = l.loan_type where mem.member_last_name LIKE '%{members_LName}%' ORDER BY l.date_out DESC;";

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