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
public partial class Managers : System.Web.UI.Page
{
DataHandler dh = new DataHandler();
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

    dh.ClearTextBoxes(Page);
    LblUserId.Text = "";
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
    SqlCommand sqlCmd = new SqlCommand("ManagerCreate", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@UserNumber", (tBUserId.Text == "" ? 0 : Convert.ToInt32(tBUserId.Text)));
    sqlCmd.Parameters.AddWithValue("@UserName", tBuserName.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@UserPassword", tBpassword.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@User_Role", '2');
    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    //to prevent the clear id before if condition
    string actor_id2 = LblUserId.Text;
    Clear();
    if (actor_id2 == "")
        LblSuccessMessageActors.Text = "Saved Successfully";
    else
        LblSuccessMessageActors.Text = "Updated Successfully";
    FillGridViewActor();

}
        
//to Update the data
protected void BtnactorUpdate_Click(object sender, EventArgs e)
{
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlCommand sqlCmd = new SqlCommand("ManagerUpdate", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@UserNumber", (tBUserId.Text == "" ? 0 : Convert.ToInt32(tBUserId.Text)));
    sqlCmd.Parameters.AddWithValue("@UserName", tBuserName.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@UserPassword", tBpassword.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@User_Role", '2');
    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    //to prevent the clear id before if condition
    string actor_id2 = LblUserId.Text;
    Clear();
        
        LblSuccessMessageActors.Text = "Updated Successfully";
        BtnactorSave.Enabled = true;
        FillGridViewActor();

}
//to view the data in gridview
void FillGridViewActor()
{
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlDataAdapter sqlDa = new SqlDataAdapter("ManagerViewAll", sqlCon);
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
    int user_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlDataAdapter sqlDa = new SqlDataAdapter("ManagerViewById", sqlCon);
    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
    sqlDa.SelectCommand.Parameters.AddWithValue("@UserNumber", user_id); //adding parameters from sql server
    DataTable dtbl = new DataTable();
    sqlDa.Fill(dtbl);
    sqlCon.Close();
    tBUserId.Text = user_id.ToString();
    tBuserName.Text = dtbl.Rows[0]["UserName"].ToString();
    tBpassword.Text = dtbl.Rows[0]["UserPassword"].ToString();

    BtnactorSave.Enabled = false;
    btnactorDelete.Enabled = true;

}
//delete btn event
protected void btnactorDelete_Click(object sender, EventArgs e)
{
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlCommand sqlCmd = new SqlCommand("ManagerDeleteById", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@UserNumber", Convert.ToInt32(tBUserId.Text));
    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    Clear();
    FillGridViewActor();
    LblSuccessMessageActors.Text = "Deleted Successfully";
        BtnactorSave.Enabled = true;


    }
}
}