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
public partial class AddMember : System.Web.UI.Page
{

DataHandler dh = new DataHandler();
// setting connection to sql server management
SqlConnection sqlCon = new SqlConnection(@"Data Source=INDRA\SQLEXPRESS;Initial Catalog=RopeydvdDb;Integrated Security=True;");
protected void Page_Load(object sender, EventArgs e)
{
    // string dbConnectionString = ConfigurationManager.ConnectionStrings["DataBaseConnectionString"].ConnectionString;

    // var queryString = "SELECT * FROM actors"; //this returns all records from the actors.
    //var dbConnection = new SqlConnection(dbConnectionString);
    //  var dataAdapter = new SqlDataAdapter(queryString, dbConnection);

    //  var commandBuilder = new SqlCommandBuilder(dataAdapter);
    //  var ds = new DataSet();
    //  dataAdapter.Fill(ds);

    //   GVactors.DataSource = ds.Tables[0];
    //   GVactors.DataBind();



    if (!IsPostBack)
    {
        btnactorDelete.Enabled = false;
        DropdownListMemCategory();
        FillGridViewActor();
    }







}

   
void DropdownListMemCategory()
{

    SqlCommand sqlcomm = new SqlCommand();
    sqlcomm.Connection = sqlCon;
    sqlcomm.CommandType = CommandType.StoredProcedure;
    sqlcomm.CommandText = "DDLmembershipCategory";
    sqlCon.Open();
    DDlmemCategoryF.DataSource = sqlcomm.ExecuteReader();
    DDlmemCategoryF.DataTextField = "Mem_Cat_Title";
    DDlmemCategoryF.DataValueField = "Mem_Cat_Id";
    DDlmemCategoryF.DataBind();
    sqlCon.Close();
    DDlmemCategoryF.Items.Insert(0, new ListItem("Select Category"));


}
       


    protected void btnactorclear_Click(object sender, EventArgs e)
{
    Clear();
}
//to clear the textbox
public void Clear()
{
    tBMembersId.Text = "";
    tBMemberFirstName.Text = tBLastName.Text = tBMem_Contact.Text = tBmem_Age.Text = tBMemAddress.Text = "";
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
    SqlCommand sqlCmd = new SqlCommand("MembersCreate", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@member_id", (tBMembersId.Text == "" ? 0 : Convert.ToInt32(tBMembersId.Text)));
    sqlCmd.Parameters.AddWithValue("@member_first_name", tBMemberFirstName.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@member_last_name", tBLastName.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@member_address", tBMemAddress.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@member_contact", tBMem_Contact.Text.Trim()); 
    sqlCmd.Parameters.AddWithValue("@member_age", (tBmem_Age.Text == "" ? 0 : Convert.ToInt32(tBmem_Age.Text))); 
    //int selectedMemId = int.Parse(DDlmemCategoryF.SelectedItem.Value.Trim());
    sqlCmd.Parameters.AddWithValue("@membership_category", DDlmemCategoryF.SelectedItem.Value.Trim());
    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    //to prevent the clear id before if condition
    string newid = tBMembersId.Text;
    Clear();
              
        LblSuccessMessageActors.Text = "Saved Successfully";
              
    FillGridViewActor();

}
//to update the data
protected void BtnactorUpdate_Click(object sender, EventArgs e)
{
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlCommand sqlCmd = new SqlCommand("MembersUpdate", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@member_id", (tBMembersId.Text == "" ? 0 : Convert.ToInt32(tBMembersId.Text)));
    sqlCmd.Parameters.AddWithValue("@member_first_name", tBMemberFirstName.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@member_last_name", tBLastName.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@member_address", tBMemAddress.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@member_contact", tBMem_Contact.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@member_age", tBmem_Age.Text.Trim());
    sqlCmd.Parameters.AddWithValue("@membership_category", DDlmemCategoryF.SelectedItem.Value.Trim());

    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    //to prevent the clear id before if condition
    string newid = tBMembersId.Text;
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
    SqlDataAdapter sqlDa = new SqlDataAdapter("MembersViewAll", sqlCon);
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
    int member_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlDataAdapter sqlDa = new SqlDataAdapter("MembersViewById", sqlCon);
    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
    sqlDa.SelectCommand.Parameters.AddWithValue("@member_id", member_id); //adding parameters from sql server
    DataTable dtbl = new DataTable();
    sqlDa.Fill(dtbl);
    sqlCon.Close();
    tBMembersId.Text = member_id.ToString();
    tBMemberFirstName.Text = dtbl.Rows[0]["member_first_name"].ToString();
    tBLastName.Text = dtbl.Rows[0]["member_last_name"].ToString();
    tBMemAddress.Text = dtbl.Rows[0]["member_address"].ToString();
    tBMem_Contact.Text = dtbl.Rows[0]["member_contact"].ToString();
    tBmem_Age.Text = dtbl.Rows[0]["member_age"].ToString();
    DDlmemCategoryF.SelectedItem.Value = dtbl.Rows[0]["membership_category"].ToString();

    BtnactorSave.Enabled = false;
    btnactorDelete.Enabled = true;

}
//delete btn event
protected void btnactorDelete_Click(object sender, EventArgs e)
{
    if (sqlCon.State == ConnectionState.Closed)
        sqlCon.Open();
    SqlCommand sqlCmd = new SqlCommand("MembersDeleteById", sqlCon);
    sqlCmd.CommandType = CommandType.StoredProcedure;
    sqlCmd.Parameters.AddWithValue("@member_id", Convert.ToInt32(tBMembersId.Text));
    sqlCmd.ExecuteNonQuery();
    sqlCon.Close();
    Clear();
    FillGridViewActor();
BtnactorSave.Enabled = true;
LblSuccessMessageActors.Text = "Deleted Successfully";


}
}
}