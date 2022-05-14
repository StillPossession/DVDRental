using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report12 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {



            string sql4 = $@" select mem.member_id, mem.member_first_name, mem.member_last_name,  
                    mem.member_address from members as mem
                    inner join loans as l on mem.member_id = l.member_num 
					Except 
					select mem.member_id, mem.member_first_name, mem.member_last_name,  
                    mem.member_address from loans as l
                     inner join members as mem on l.member_num = mem.member_id 
					where l.date_out  >= DATEADD(DAY, -31, GETDATE());";


            GVactors.DataSource = dh.getTable(sql4);
            GVactors.DataBind();


        }

        protected void GVactors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label Label1 = e.Row.FindControl("member_id") as Label;
                var a = Label1.Text; //member id from grideview
                //adding dateout value to gridview
                string sql1 = $@"select  max(l.date_out) as last_date_out from loans as l 
                                inner join members as mem on mem.member_id = l.member_num
                                where (Cast(l.date_out as datetime) < DATEADD(DAY, -31, GETDATE())) and mem.member_id = '{a}';";

                ((GridView)e.Row.FindControl("GVdateout")).DataSource = dh.getTable(sql1);
                ((GridView)e.Row.FindControl("GVdateout")).DataBind();

                //to get last date out from sql1
                dateoutnew.DataSource = dh.getTable(sql1);
                dateoutnew.DataTextField = "last_date_out";
                dateoutnew.DataValueField = "last_date_out";
                dateoutnew.DataBind();

                Label2.Text = dateoutnew.SelectedValue.ToString().Trim();


                //adding no of days from last loan value to gridview
                string sql2 = $@"select distinct DATEDIFF(day, date_out,GETDATE()) as 'noofdayssinceLastLoan'  from loans 
                                 where date_out = '{Label2.Text}';";

                ((GridView)e.Row.FindControl("GVNoofDays")).DataSource = dh.getTable(sql2);
                ((GridView)e.Row.FindControl("GVNoofDays")).DataBind();


                //adding movie name value to gridview from last loaneded by a member 
                string sql3 = $@"select  m.movie_name  from movies as m
                                inner join loans as l on l.movie = m.movie_id 
                                where (Cast(l.date_out as datetime) < DATEADD(DAY, -31, GETDATE())) 
                                and date_out = '{Label2.Text}'  
                                and l.member_num = '{a}'; ";

                ((GridView)e.Row.FindControl("GVMovieName")).DataSource = dh.getTable(sql3);
                ((GridView)e.Row.FindControl("GVMovieName")).DataBind();

            }
        }
    }
}