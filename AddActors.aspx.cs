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
public partial class AddActors : System.Web.UI.Page
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
tBactor_id.Text = tBactor_fname.Text = tBactor_lname.Text = "";
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
    SqlCommand sqlCmd = new SqlCommand("ActorsCreate", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@actor_id", (tBactor_id.Text == "" ? 0 : Convert.ToInt32(tBactor_id.Text)));
    sqlCmd.Parameters.AddWithValue("@actor_first_name", tBactor_fname.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@actor_last_name", tBactor_lname.Text.Trim());
    //sqlCmd.Parameters.AddWithValue("@actor_gender", DDLactor_gender.SelectedItem.Value.Trim());
    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    //to prevent the clear id before if condition
    string actor_id2 = tBactor_id.Text;
    Clear();
    LblSuccessMessageActors.Text = "Saved Successfully";
    FillGridViewActor();

} 
        
//to update the data
protected void BtnactorUpdate_Click(object sender, EventArgs e)
{
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlCommand sqlCmd = new SqlCommand("ActorsUpdate", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@actor_id", (tBactor_id.Text == "" ? 0 : Convert.ToInt32(tBactor_id.Text)));
    sqlCmd.Parameters.AddWithValue("@actor_first_name", tBactor_fname.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@actor_last_name", tBactor_lname.Text.Trim());
    //sqlCmd.Parameters.AddWithValue("@actor_gender", DDLactor_gender.SelectedItem.Value.Trim());
    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    //to prevent the clear id before if condition
    string actor_id2 = tBactor_id.Text;
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
SqlDataAdapter sqlDa = new SqlDataAdapter("ActorsViewAll", sqlCon);
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
int actor_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
if (sqlCon.State == ConnectionState.Closed)
    sqlCon.Open();
SqlDataAdapter sqlDa = new SqlDataAdapter("ActorsViewById", sqlCon);
sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
sqlDa.SelectCommand.Parameters.AddWithValue("@actor_id", actor_id); //adding parameters from sql server
DataTable dtbl = new DataTable();
sqlDa.Fill(dtbl);
sqlCon.Close();
tBactor_id.Text = actor_id.ToString();
tBactor_fname.Text = dtbl.Rows[0]["actor_first_name"].ToString();
tBactor_lname.Text = dtbl.Rows[0]["actor_last_name"].ToString();
        // DDLactor_gender.SelectedItem.Value = dtbl.Rows[0]["actor_gender"].ToString();   
BtnactorSave.Enabled = false;
btnactorDelete.Enabled = true;

}
//delete btn event
protected void btnactorDelete_Click(object sender, EventArgs e)
{
if (sqlCon.State == ConnectionState.Closed)
    sqlCon.Open();
SqlCommand sqlCmd = new SqlCommand("ActorsDeleteById", sqlCon);
sqlCmd.CommandType = CommandType.StoredProcedure;
sqlCmd.Parameters.AddWithValue("@actor_id", Convert.ToInt32(tBactor_id.Text));
sqlCmd.ExecuteNonQuery();
sqlCon.Close();
Clear();
FillGridViewActor();
 BtnactorSave.Enabled = true;
 LblSuccessMessageActors.Text = "Deleted Successfully";


}









}
}