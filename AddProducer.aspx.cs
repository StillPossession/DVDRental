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
public partial class AddProducer : System.Web.UI.Page
{
    // setting connection to sql server management
    SqlConnection sqlCon = new SqlConnection(@"Data Source=INDRA\SQLEXPRESS;Initial Catalog=RopeydvdDb;Integrated Security=True;");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            btnactorDelete.Enabled = false;
            FillGridViewActor();
        }


    }

    protected void btnactorclear_Click(object sender, EventArgs e)
    {
        Clear();
    }
    //to clear the textbox
    public void Clear()
    {
        tBproducer_id.Text = "";
        tBproducer_fname.Text = "";
        BtnactorSave.Text = "Save";
        LblSuccessMessageActors.Text = LblErrorMessageActors.Text = "";

        btnactorDelete.Enabled = false;
            BtnactorSave.Enabled = true;
        }
    //to save the data
    protected void BtnactorSave_Click(object sender, EventArgs e)
    {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("ProducersCreate", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@producer_id", (tBproducer_id.Text == "" ? 0 : Convert.ToInt32(tBproducer_id.Text)));
            sqlCmd.Parameters.AddWithValue("@producer_full_name", tBproducer_fname.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            //to prevent the clear id before if condition
            string newid = tBproducer_id.Text;
            Clear();
            LblSuccessMessageActors.Text = "Saved Successfully";
            FillGridViewActor();


        }
        //to update the data
        protected void BtnactorUpdate_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("ProducersUpdate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@producer_id", (tBproducer_id.Text == "" ? 0 : Convert.ToInt32(tBproducer_id.Text)));
            sqlCmd.Parameters.AddWithValue("@producer_full_name", tBproducer_fname.Text.Trim());
        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBproducer_id.Text;
        Clear();       
        LblSuccessMessageActors.Text = "Updated Successfully";
        FillGridViewActor();
        BtnactorSave.Enabled = true;

        }
    //to view the data in gridview
    void FillGridViewActor()
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("ProducersViewAll", sqlCon);
        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dtbl = new DataTable();
        sqlDa.Fill(dtbl);
        sqlCon.Close();
        GVactors.DataSource = dtbl;
        GVactors.DataBind();
    }
    //clicking event on view button by id
    protected void LinkButtonViewActor_Onclick(object sender, EventArgs e)
    {
        int producer_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("ProducersViewById", sqlCon);
        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlDa.SelectCommand.Parameters.AddWithValue("@producer_id", producer_id); //adding parameters from sql server
        DataTable dtbl = new DataTable();
        sqlDa.Fill(dtbl);
        sqlCon.Close();
        tBproducer_id.Text = producer_id.ToString();
        tBproducer_fname.Text = dtbl.Rows[0]["producer_full_name"].ToString();
        BtnactorSave.Enabled = false;
        btnactorDelete.Enabled = true;

        }
    //delete btn event
    protected void btnactorDelete_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("ProducersDeleteById", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@producer_id", Convert.ToInt32(tBproducer_id.Text));
        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        Clear();
        FillGridViewActor();
            BtnactorSave.Enabled = true;
            LblSuccessMessageActors.Text = "Deleted Successfully";


    }
}
}