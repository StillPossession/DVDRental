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
public partial class AddDVDStock : System.Web.UI.Page
{
    DataHandler dh = new DataHandler();
    // setting connection to sql server management
    SqlConnection sqlCon = new SqlConnection(@"Data Source=INDRA\SQLEXPRESS;Initial Catalog=RopeydvdDb;Integrated Security=True;");
    protected void Page_Load(object sender, EventArgs e)
    {
            
        if (!IsPostBack)
        {

            DropdownListMoviesName();
            FillGridViewActor();
        }
    }

    void DropdownListMoviesName()
    {

        SqlCommand sqlcomm = new SqlCommand();
        sqlcomm.Connection = sqlCon;
        sqlcomm.CommandType = CommandType.StoredProcedure;
        sqlcomm.CommandText = "DDLmoviesToDVDStock";
        sqlCon.Open();
        DDldvd_movie_name.DataSource = sqlcomm.ExecuteReader();
        DDldvd_movie_name.DataTextField = "movie_name";
        DDldvd_movie_name.DataValueField = "movie_id";
        DDldvd_movie_name.DataBind();
        sqlCon.Close();
        DDldvd_movie_name.Items.Insert(0, new ListItem("Select Movies"));


    }

    protected void btnactorclear_Click(object sender, EventArgs e)
    {
        Clear();
    }
    //to clear the textbox
    public void Clear()
    {
        dh.ClearTextBoxes(Page);
            tBDVDStockId.Text = "";
    }
    //to save the data
    protected void BtnactorSave_Click(object sender, EventArgs e)
    {
        DateTime dtval = DateTime.Today;
        tBdate_Added.Text = dtval.ToString("yyyy/MM/dd");
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("DvdStockCreate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@dvd_stock_id", (tBDVDStockId.Text == "" ? 0 : Convert.ToInt32(tBDVDStockId.Text)));
        sqlCmd.Parameters.AddWithValue("@dvd_movie_id", DDldvd_movie_name.SelectedItem.Value.Trim());
        sqlCmd.Parameters.AddWithValue("@dvd_copy_no", tBDVDcopyNumber.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@is_loaned", cBdvd_is_loaned.Checked ? 1 : 0);
        sqlCmd.Parameters.AddWithValue("@dvd_price", tBdvd_price.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@date_added", tBdate_Added.Text.Trim());

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBDVDStockId.Text;
        Clear();
            LblSuccessMessageActors.Text = "Saved Successfully";
       
        FillGridViewActor();


    }
        
    //to Update the data
    //protected void BtnactorUpdate_Click(object sender, EventArgs e)
    //{
    //    DateTime dtval = DateTime.Today;
    //    tBdate_Added.Text = dtval.ToString("yyyy/MM/dd");
    //    if (sqlCon.State == ConnectionState.Closed)
    //        sqlCon.Open();
    //    SqlCommand sqlCmd = new SqlCommand("DvdStockUpdate", sqlCon);
    //    sqlCmd.CommandType = CommandType.StoredProcedure;
    //    sqlCmd.Parameters.AddWithValue("@dvd_stock_id", (tBDVDStockId.Text == "" ? 0 : Convert.ToInt32(tBDVDStockId.Text)));
    //    sqlCmd.Parameters.AddWithValue("@dvd_movie_id", DDldvd_movie_name.SelectedItem.Value.Trim());
    //    sqlCmd.Parameters.AddWithValue("@dvd_copy_no", tBDVDcopyNumber.Text.Trim());
    //    sqlCmd.Parameters.AddWithValue("@is_loaned", cBdvd_is_loaned.Checked ? 1 : 0);
    //    sqlCmd.Parameters.AddWithValue("@dvd_price", tBdvd_price.Text.Trim());
    //    sqlCmd.Parameters.AddWithValue("@date_added", tBdate_Added.Text.Trim());

    //    sqlCmd.ExecuteNonQuery();
    //    sqlCon.Close();
    //    //to prevent the clear id before if condition
    //    string newid = tBDVDStockId.Text;
    //    Clear();
    //    LblSuccessMessageActors.Text = "Updated Successfully";
    //    FillGridViewActor();


    //}
    //to view the data in gridview
    void FillGridViewActor()
    {
            
        string sql1 = "select m.movie_id, m.movie_name, m.is_age_restricted, dvd_stock_id, dvd_copy_no, is_loaned, dvd_price, date_added from dvd_stock left join movies m on m.movie_id = dvd_stock.dvd_movie_id";
        GVactors.DataSource = dh.getTable(sql1);
        GVactors.DataBind();


    }
    //clicking event on view button by id
    protected void LinkButtonViewActor_Onclick(object sender, EventArgs e)
    {


    }
}
}