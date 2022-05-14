using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Loans : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            String movie = Request.QueryString["movieid"];
            String copy = Request.QueryString["copyno"];
            String isAgeRestricted = Request.QueryString["isAgeRestricted"];
            if (movie == null && copy == null)
            {
                Response.Redirect("AddDVDStock.aspx");
            }

            Label1Loan.Text = movie;
            Label2Loan.Text = copy;
            Label3Loan.Text = isAgeRestricted;
            string sql1 = @"select CAST(m.member_id AS varchar(10)) +'|'+ CAST(m.member_age AS varchar(10)) + '|' + CAST(mc.max_dvd_loans AS varchar(10))  AS ValField,
                            m.member_first_name + ' ' + m.member_last_name AS member_full_name from members m
                            inner join membership_category as mc on m.membership_category = mc.mem_cat_id
                            group by m.member_id,m.member_age,mc.max_dvd_loans,m.member_first_name,m.member_last_name;";



            string sql2 = @"select * from loan_types;";




            DDLMemberName.DataSource = dh.getTable(sql1);
            DDLMemberName.DataTextField = "member_full_name";
            DDLMemberName.DataValueField = "ValField";
            DDLMemberName.DataBind();


            DDLLoanType.DataSource = dh.getTable(sql2);
            DDLLoanType.DataTextField = "loan_type";
            DDLLoanType.DataValueField = "loan_type_id";
            DDLLoanType.DataBind();



        }



        protected void BtnactorSave_Click(object sender, EventArgs e)
        {

            string[] values = DDLMemberName.SelectedValue.Split('|');
            LabelMemberID.Text = (values[0]);
            LabelMemberAge.Text = (values[1]);
            LabelMemberMaxDvd.Text = (values[2]);
            //Label_totaldvdofmembersOnLoan.Text = (values[3]);

            string sql3 = $@"select COUNT(*) as 'TotalCopies' from loans where member_num LIKE '%{LabelMemberID.Text}%' and date_returned = '0';";

            DDLmemberAgeFetched.DataSource = dh.getTable(sql3);
            DDLmemberAgeFetched.DataTextField = "TotalCopies";
            DDLmemberAgeFetched.DataValueField = "TotalCopies";
            DDLmemberAgeFetched.DataBind();
            Label_totaldvdofmembersOnLoan.Text = DDLmemberAgeFetched.SelectedValue.ToString().Trim();

            int x = 0;
            int y = 0;
            int z1 = 0;

            Int32.TryParse(LabelMemberAge.Text, out x);
            Int32.TryParse(LabelMemberMaxDvd.Text, out y);
            Int32.TryParse(Label_totaldvdofmembersOnLoan.Text, out z1);
            int z = z1 + 1;
            DateTime dtval = DateTime.Today;
            labelCurrentdateLoan.Text = dtval.ToString("yyyy/MM/dd");
            String newDate = DDLLoanType.SelectedItem.Text;

            if ((Label3Loan.Text == "True") && (x >= 18) && (y >= z))
            {
                //run
                if (newDate == "Day")
                {
                    DateTime formatteddays = dtval.AddDays(1);

                    labeldate.Text = formatteddays.ToString("yyyy/MM/dd");


                    string sql = $@"INSERT INTO loans(loan_id,member_num, movie, copy_num, loan_type, date_out, date_due, date_returned, duration, total_charge)
                        values ('{tBLoanId.Text.Trim()}','{LabelMemberID.Text.Trim()}', '{Label1Loan.Text.Trim()}', '{Label2Loan.Text.Trim()}', '{DDLLoanType.SelectedItem.Value.Trim()}',
                        '{labelCurrentdateLoan.Text.Trim()}','{labeldate.Text.Trim()}', '{0}', '{1}', '{50}');";

                    dh.saveData(sql);

                    string sql2 = $@"UPDATE dvd_stock SET is_loaned = 1 WHERE dvd_movie_id = {Label1Loan.Text} and dvd_copy_no = {Label2Loan.Text};";

                    dh.saveData(sql2);
                    LblSuccessMessageActors.Text = "Successfully Loan Added";
                    calculateTotalCharge.Text = "Total Charge is: Rs 50";
                    dh.ClearTextBoxes(Page);
                    BtnactorSave.Visible = false;
                    BtnactorCancel.Visible = true;


                }
                else if (newDate == "Week")
                {
                    DateTime formatteddays = dtval.AddDays(7);
                    labeldate.Text = formatteddays.ToString("yyyy/MM/dd");

                    string sql = $@"INSERT INTO loans(loan_id,member_num, movie, copy_num, loan_type, date_out, date_due, date_returned, duration, total_charge)
                        values ('{tBLoanId.Text.Trim()}','{LabelMemberID.Text.Trim()}', '{Label1Loan.Text.Trim()}', '{Label2Loan.Text.Trim()}', '{DDLLoanType.SelectedItem.Value.Trim()}',
                        '{labelCurrentdateLoan.Text.Trim()}','{labeldate.Text.Trim()}', '{0}', '{7}', '{350}');";

                    dh.saveData(sql);

                    string sql2 = $@"UPDATE dvd_stock SET is_loaned = 1 WHERE dvd_movie_id = {Label1Loan.Text} and dvd_copy_no = {Label2Loan.Text};";

                    dh.saveData(sql2);
                    LblSuccessMessageActors.Text = "Successfully Loan Added";
                    calculateTotalCharge.Text = "Total Charge is: Rs 350";
                    dh.ClearTextBoxes(Page);
                    BtnactorSave.Visible = false;
                    BtnactorCancel.Visible = true;

                }


            }
            else if ((Label3Loan.Text == "True") && (x >= 18) && (y < z))
            {
                //Print DVD Maxed
                LblDVDMaxErrorMessage.Text = "Sorry Your DVD on loan has reached to Maximum";
                BtnactorSave.Visible = false;
                BtnactorCancel.Visible = true;

            }
            else if ((Label3Loan.Text == "True") && (x < 18) && (y < z))
            {
                //Print Age Restricted And Dvd Maxed
                LblAgeRestrictedErrorMessage.Text = "Sorry Your Age is Restricted";
                LblDVDMaxErrorMessage.Text = "Sorry Your DVD on loan has reached to Maximum";
                BtnactorSave.Visible = false;
                BtnactorCancel.Visible = true;

            }
            else if ((Label3Loan.Text == "True") && (x < 18) && (y >= z))
            {
                //print age restricted
                LblAgeRestrictedErrorMessage.Text = "Sorry Your Age is Restricted";
                BtnactorSave.Visible = false;
                BtnactorCancel.Visible = true;
            }
            else if ((Label3Loan.Text == "False") && (x >= 18) && (y >= z))
            {
                //Run
                if (newDate == "Day")
                {
                    DateTime formatteddays = dtval.AddDays(1);

                    labeldate.Text = formatteddays.ToString("yyyy/MM/dd");


                    string sql = $@"INSERT INTO loans(loan_id,member_num, movie, copy_num, loan_type, date_out, date_due, date_returned, duration, total_charge)
                        values ('{tBLoanId.Text.Trim()}','{LabelMemberID.Text.Trim()}', '{Label1Loan.Text.Trim()}', '{Label2Loan.Text.Trim()}', '{DDLLoanType.SelectedItem.Value.Trim()}',
                        '{labelCurrentdateLoan.Text.Trim()}','{labeldate.Text.Trim()}', '{0}', '{1}', '{50}');";

                    dh.saveData(sql);

                    string sql2 = $@"UPDATE dvd_stock SET is_loaned = 1 WHERE dvd_movie_id = {Label1Loan.Text} and dvd_copy_no = {Label2Loan.Text};";

                    dh.saveData(sql2);
                    LblSuccessMessageActors.Text = "Successfully Loan Added";
                    calculateTotalCharge.Text = "Total Charge is: Rs 50";
                    dh.ClearTextBoxes(Page);
                    BtnactorSave.Visible = false;
                    BtnactorCancel.Visible = true;


                }
                else if (newDate == "Week")
                {
                    DateTime formatteddays = dtval.AddDays(7);
                    labeldate.Text = formatteddays.ToString("yyyy/MM/dd");

                    string sql = $@"INSERT INTO loans(loan_id,member_num, movie, copy_num, loan_type, date_out, date_due, date_returned, duration, total_charge)
                        values ('{tBLoanId.Text.Trim()}','{LabelMemberID.Text.Trim()}', '{Label1Loan.Text.Trim()}', '{Label2Loan.Text.Trim()}', '{DDLLoanType.SelectedItem.Value.Trim()}',
                        '{labelCurrentdateLoan.Text.Trim()}','{labeldate.Text.Trim()}', '{0}', '{7}', '{350}');";

                    dh.saveData(sql);

                    string sql2 = $@"UPDATE dvd_stock SET is_loaned = 1 WHERE dvd_movie_id = {Label1Loan.Text} and dvd_copy_no = {Label2Loan.Text};";

                    dh.saveData(sql2);
                    LblSuccessMessageActors.Text = "Successfully Loan Added";
                    calculateTotalCharge.Text = "Total Charge is: Rs 350";
                    dh.ClearTextBoxes(Page);
                    BtnactorSave.Visible = false;
                    BtnactorCancel.Visible = true;

                }
            }
            else if ((Label3Loan.Text == "False") && (x >= 18) && (y < z))
            {
                //print Dvd Max
                LblDVDMaxErrorMessage.Text = "Sorry Your DVD on loan has reached to Maximum";
                BtnactorSave.Visible = false;
                BtnactorCancel.Visible = true;
            }
            else if ((Label3Loan.Text == "False") && (x < 18) && (y < z))
            {
                //print dvd max
                LblDVDMaxErrorMessage.Text = "Sorry Your DVD on loan has reached to Maximum";
                BtnactorSave.Visible = false;
                BtnactorCancel.Visible = true;
            }
            else if ((Label3Loan.Text == "False") && (x < 18) && (y >= z))
            {
                //run
                if (newDate == "Day")
                {
                    DateTime formatteddays = dtval.AddDays(1);

                    labeldate.Text = formatteddays.ToString("yyyy/MM/dd");


                    string sql = $@"INSERT INTO loans(loan_id,member_num, movie, copy_num, loan_type, date_out, date_due, date_returned, duration, total_charge)
                        values ('{tBLoanId.Text.Trim()}','{LabelMemberID.Text.Trim()}', '{Label1Loan.Text.Trim()}', '{Label2Loan.Text.Trim()}', '{DDLLoanType.SelectedItem.Value.Trim()}',
                        '{labelCurrentdateLoan.Text.Trim()}','{labeldate.Text.Trim()}', '{0}', '{1}', '{50}');";

                    dh.saveData(sql);

                    string sql2 = $@"UPDATE dvd_stock SET is_loaned = 1 WHERE dvd_movie_id = {Label1Loan.Text} and dvd_copy_no = {Label2Loan.Text};";

                    dh.saveData(sql2);
                    LblSuccessMessageActors.Text = "Successfully Loan Added";
                    calculateTotalCharge.Text = "Total Charge is: Rs 50";
                    dh.ClearTextBoxes(Page);
                    BtnactorSave.Visible = false;
                    BtnactorCancel.Visible = true;


                }
                else if (newDate == "Week")
                {
                    DateTime formatteddays = dtval.AddDays(7);
                    labeldate.Text = formatteddays.ToString("yyyy/MM/dd");

                    string sql = $@"INSERT INTO loans(loan_id,member_num, movie, copy_num, loan_type, date_out, date_due, date_returned, duration, total_charge)
                        values ('{tBLoanId.Text.Trim()}','{LabelMemberID.Text.Trim()}', '{Label1Loan.Text.Trim()}', '{Label2Loan.Text.Trim()}', '{DDLLoanType.SelectedItem.Value.Trim()}',
                        '{labelCurrentdateLoan.Text.Trim()}','{labeldate.Text.Trim()}', '{0}', '{7}', '{350}');";

                    dh.saveData(sql);

                    string sql2 = $@"UPDATE dvd_stock SET is_loaned = 1 WHERE dvd_movie_id = {Label1Loan.Text} and dvd_copy_no = {Label2Loan.Text};";

                    dh.saveData(sql2);
                    LblSuccessMessageActors.Text = "Successfully Loan Added";
                    calculateTotalCharge.Text = "Total Charge is: Rs 350";
                    dh.ClearTextBoxes(Page);
                    BtnactorSave.Visible = false;
                    BtnactorCancel.Visible = true;

                }
            }

        }



        protected void BtnactorCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDVDStock.aspx");
        }
    }
}