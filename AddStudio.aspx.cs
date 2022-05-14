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
public partial class AddStudio : System.Web.UI.Page
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
            tBStudioId.Text = "";
        tBStudio.Text = "";
        BtnactorSave.Text = "Save";
        LblSuccessMessageActors.Text = LblErrorMessageActors.Text = "";
            BtnactorSave.Enabled = true;
            btnactorDelete.Enabled = false;
    }
    //to save the data
    protected void BtnactorSave_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("StudiosCreate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@studio_id", (tBStudioId.Text == "" ? 0 : Convert.ToInt32(tBStudioId.Text)));
        sqlCmd.Parameters.AddWithValue("@studio", tBStudio.Text.Trim());

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBStudioId.Text;
        Clear();
       
            LblSuccessMessageActors.Text = "Saved Successfully";
       
        FillGridViewActor();

    } 
    //to update the data
    protected void BtnactorUpdate_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("StudiosUpdate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@studio_id", (tBStudioId.Text == "" ? 0 : Convert.ToInt32(tBStudioId.Text)));
        sqlCmd.Parameters.AddWithValue("@studio", tBStudio.Text.Trim());

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBStudioId.Text;
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
        SqlDataAdapter sqlDa = new SqlDataAdapter("StudiosViewAll", sqlCon);
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
        int studio_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("StudiosViewById", sqlCon);
        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlDa.SelectCommand.Parameters.AddWithValue("@studio_id", studio_id); //adding parameters from sql server
        DataTable dtbl = new DataTable();
        sqlDa.Fill(dtbl);
        sqlCon.Close();
        tBStudioId.Text = studio_id.ToString();
        tBStudio.Text = dtbl.Rows[0]["studio"].ToString();
        BtnactorSave.Enabled = false;
        btnactorDelete.Enabled = true;

    }
    //delete btn event
    protected void btnactorDelete_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("StudiosDeleteById", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@studio_id", Convert.ToInt32(tBStudioId.Text));
        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        Clear();
        FillGridViewActor();
            BtnactorSave.Enabled = true;
            LblSuccessMessageActors.Text = "Deleted Successfully";


    }
}
}