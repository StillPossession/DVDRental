using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report7 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadTable();
                updatequery();


            }

        }

        protected void loadTable()
        {

            string sql1 = $@"select l.copy_num, m.movie_name, l.date_due from loans as l left join movies as m on m.movie_id = l.movie where l.date_returned = '0';";

            GVactors.DataSource = dh.getTable(sql1);
            GVactors.DataBind();
            //fetching row data
            String movieName = Request.QueryString["movieName"];
            String copyNum = Request.QueryString["copyNum"];
            String dateDue = Request.QueryString["dateDue"];

            Label2.Text = movieName;
            Label3.Text = copyNum;
            Label4.Text = dateDue;

            DateTime dtval = DateTime.Today;
            labelCurrentdate.Text = dtval.ToString("yyyy/MM/dd");


        }

        protected void updatequery()
        {
            string sql2 = $@"UPDATE loans SET date_returned = '{labelCurrentdate.Text}' WHERE copy_num = {Label3.Text};";
            dh.saveData(sql2);

            string sql3 = $@"UPDATE dvd_stock SET is_loaned = 0 WHERE dvd_copy_no = {Label3.Text};";
            dh.saveData(sql3);
            latefees();
            loadTable();
        }
       
        protected void latefees()
        {
            if(Label4.Text != "")
            {
                String penalty = "5";
                double noofdays = 0;
            
               // DateTime dt = DateTime.Parse(cdate);
               // DateTime d1 = dt;
          
                DateTime d1 = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd"));
                CultureInfo info = new CultureInfo("en-Us");
                DateTime dateTime = DateTime.Parse(Label4.Text, info);
                DateTime d2 = dateTime;

                if (d1 > d2)
                {
                    TimeSpan t = d1 - d2;
                    noofdays = t.TotalDays;
                    noOfDays.Text = noofdays.ToString();
                    Labeltotalnooflatedays.Text = "Total Late Days: " + "" + noOfDays.Text + "" + "Days";
                    Labeltotalnooflatedays.Visible = true;
                }
                else
                {
                    noOfDays.Text = "0";
                }

                LabelTotalPenalty.Text ="Total Late Fees: " + "" + "Rs" + "" + Convert.ToString(Convert.ToDouble(noofdays) * Convert.ToDouble(penalty));
                LabelTotalPenalty.Visible = true;
               
            }
            




        }

        protected void search_Table(string CopyNo)
        {
            if (CopyNo != "")
            {

                SearchBtn.Visible = false;
                CancelBtn.Visible = true;

                string sql1 = $@"select l.copy_num, m.movie_name, l.date_due from loans as l left join movies as m on m.movie_id = l.movie where (l.date_returned = '0') and l.copy_num LIKE '%{CopyNo}%' ;";
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