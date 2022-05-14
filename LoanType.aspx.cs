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
public partial class LoanType : System.Web.UI.Page
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
        tBloan_id.Text = "";
        tBloan_type.Text = "";
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
        SqlCommand sqlCmd = new SqlCommand("LoanTypesCreate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@loan_type_id", (tBloan_id.Text == "" ? 0 : Convert.ToInt32(tBloan_id.Text)));
        sqlCmd.Parameters.AddWithValue("@loan_type", tBloan_type.Text.Trim());

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBloan_id.Text;
        Clear();
       
            LblSuccessMessageActors.Text = "Saved Successfully";
        
        FillGridViewActor();

    }
        
    //to Update the data
    protected void BtnactorUpdate_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("LoanTypesUpdate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@loan_type_id", (tBloan_id.Text == "" ? 0 : Convert.ToInt32(tBloan_id.Text)));
        sqlCmd.Parameters.AddWithValue("@loan_type", tBloan_type.Text.Trim());

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBloan_id.Text;
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
        SqlDataAdapter sqlDa = new SqlDataAdapter("LoanTypesViewAll", sqlCon);
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
        int LoanType_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("LoanTypesViewById", sqlCon);
        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlDa.SelectCommand.Parameters.AddWithValue("@loan_type_id", LoanType_id); //adding parameters from sql server
        DataTable dtbl = new DataTable();
        sqlDa.Fill(dtbl);
        sqlCon.Close();
        tBloan_id.Text = LoanType_id.ToString();
        tBloan_type.Text = dtbl.Rows[0]["loan_type"].ToString();
        BtnactorSave.Enabled = false;
        btnactorDelete.Enabled = true;

    }
    //delete btn event
    protected void btnactorDelete_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("LoanTypesDeleteById", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@loan_type_id", Convert.ToInt32(tBloan_id.Text));
        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        Clear();
        FillGridViewActor();
            BtnactorSave.Enabled = true;
            LblSuccessMessageActors.Text = "Deleted Successfully";


    }
}
}