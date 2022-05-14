using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report8 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {



            string sql4 = $@"select m.member_id, m.member_first_name + ' ' + m.member_last_name as member_name, mc.mem_cat_title, 
                        (select count(l.member_num) from loans as l where m.member_id = l.member_num and l.date_returned = '0') as total_loans, 
                        mc.max_dvd_loans,
                        CASE WHEN 
                        (select count(l.member_num) from loans as l where m.member_id = l.member_num and l.date_returned = '0') = mc.max_dvd_loans 
                        THEN 'Reached Maximum DVD'
                        ELSE 'Loan Available'
                        END AS 'Review' from members as m
                        inner join membership_category as mc on m.membership_category = mc.mem_cat_id 
                        order by m.member_first_name ASC;";


            GVactors.DataSource = dh.getTable(sql4);
            GVactors.DataBind();


        }




        protected void GVactors_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            // To check condition on integer value
            if (Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "total_loans")) == Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "max_dvd_loans")))
            {
                e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
            }
        }
    }
}