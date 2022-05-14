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
public partial class AddMembershipCategory : System.Web.UI.Page
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
        tBCategoryId.Text = "";
        tBCategoryName.Text = tBmaxDvds.Text = "";
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
        SqlCommand sqlCmd = new SqlCommand("MembershipCatCreate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@mem_cat_id", (tBCategoryId.Text == "" ? 0 : Convert.ToInt32(tBCategoryId.Text)));
        sqlCmd.Parameters.AddWithValue("@mem_cat_title", tBCategoryName.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@max_dvd_loans", tBmaxDvds.Text.Trim());

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBCategoryId.Text;
        Clear();
       
            LblSuccessMessageActors.Text = "Saved Successfully";
       
        FillGridViewActor();

    }
    //to update the data
    protected void BtnactorUpdate_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("MembershipCatUpdate", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@mem_cat_id", (tBCategoryId.Text == "" ? 0 : Convert.ToInt32(tBCategoryId.Text)));
        sqlCmd.Parameters.AddWithValue("@mem_cat_title", tBCategoryName.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@max_dvd_loans", tBmaxDvds.Text.Trim());

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        //to prevent the clear id before if condition
        string newid = tBCategoryId.Text;
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
        SqlDataAdapter sqlDa = new SqlDataAdapter("MembershipCatViewAll", sqlCon);
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
        int MemCat_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("MembershipCatViewById", sqlCon);
        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlDa.SelectCommand.Parameters.AddWithValue("@mem_cat_id", MemCat_id); //adding parameters from sql server
        DataTable dtbl = new DataTable();
        sqlDa.Fill(dtbl);
        sqlCon.Close();
        tBCategoryId.Text = MemCat_id.ToString();
        tBCategoryName.Text = dtbl.Rows[0]["mem_cat_title"].ToString();
        tBmaxDvds.Text = dtbl.Rows[0]["max_dvd_loans"].ToString();
        BtnactorSave.Enabled = false;
        btnactorDelete.Enabled = true;

    }
    //delete btn event
    protected void btnactorDelete_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("MembershipCatDeleteById", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@mem_cat_id", Convert.ToInt32(tBCategoryId.Text));
        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        Clear();
        FillGridViewActor();
        LblSuccessMessageActors.Text = "Deleted Successfully";
            BtnactorSave.Enabled = true;


        }
}
}