using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
public partial class AddMovies : System.Web.UI.Page
{
    // setting connection to sql server management
    SqlConnection sqlCon = new SqlConnection(@"Data Source=INDRA\SQLEXPRESS;Initial Catalog=RopeydvdDb;Integrated Security=True;");
    DataHandler dh = new DataHandler();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ListviewCastMember();
            DropdownListProducer();
            DropdownListStudio();


        }

    }

    void ListviewCastMember()
    {
        SqlCommand sqlcomm = new SqlCommand();
        sqlcomm.Connection = sqlCon;
        sqlcomm.CommandType = CommandType.StoredProcedure;
        sqlcomm.CommandText = "listViewCastMemBProc";
        sqlCon.Open();
        LBCastMemb.DataSource = sqlcomm.ExecuteReader();
        LBCastMemb.DataTextField = "fullname_actor";
        LBCastMemb.DataValueField = "actor_id";
        LBCastMemb.DataBind();
        sqlCon.Close();




    }

    void DropdownListProducer()
    {

        SqlCommand sqlcomm = new SqlCommand();
        sqlcomm.Connection = sqlCon;
        sqlcomm.CommandType = CommandType.StoredProcedure;
        sqlcomm.CommandText = "DDLProducer";
        sqlCon.Open();
        dDLProducer.DataSource = sqlcomm.ExecuteReader();
        dDLProducer.DataTextField = "producer_full_name";
        dDLProducer.DataValueField = "producer_id";
        dDLProducer.DataBind();
        sqlCon.Close();
        dDLProducer.Items.Insert(0, new ListItem("Select Producer"));


    }

    void DropdownListStudio()
    {
        SqlCommand sqlcomm = new SqlCommand();
        sqlcomm.Connection = sqlCon;
        sqlcomm.CommandType = CommandType.StoredProcedure;
        sqlcomm.CommandText = "DDLStudio";
        sqlCon.Open();
        dDlstudio.DataSource = sqlcomm.ExecuteReader();
        dDlstudio.DataTextField = "studio";
        dDlstudio.DataValueField = "studio_id";
        dDlstudio.DataBind();
        sqlCon.Close();
        dDlstudio.Items.Insert(0, new ListItem("Select Studio"));

    }

    //to save the data
    protected void BtnactorSave_Click(object sender, EventArgs e)
    {
        if (tBreleaseDate.Text != "")
        {
            CultureInfo info = new CultureInfo("en-Us");
            DateTime dateTime = DateTime.Parse(tBreleaseDate.Text, info);
            Labeldatefrompicker.Text = dateTime.ToString("yyyy/MM/dd");

            string sql = $@"INSERT INTO movies (movie_id,movie_name,producer,studio,release_date,is_age_restricted) OUTPUT INSERTED.movie_id
            values ('{tBmovie_id.Text.Trim()}', '{tBmovie_name.Text.Trim()}', '{dDLProducer.Text.Trim()}', '{dDlstudio.Text.Trim()}', '{Labeldatefrompicker.Text.Trim()}', {(cBis_agerestricted.Checked ? 1 : 0)})";
            dh.saveData(sql);

            Label1.Visible = false;

            int movieId = dh.identity;
            Label1.Text = movieId.ToString(); // dh.response;
                try
                {
                    if (movieId != 0)
                    {
                        // Label1.Text = movieId.ToString() + "...";
                        foreach (ListItem item in LBCastMemb.Items)
                        {
                            Label1.Text += item.Value.Trim();
                            if (item.Selected)
                            {
                                string sql1 = $@"INSERT INTO movie_cast values ({movieId}, '{item.Value.Trim()}')";
                                dh.saveData(sql1);

                                // Label1.Text = sql1; // dh.response;
                                LblSuccessMessageActors.Text = "Saved Successfully";
                            }
                            else
                            {
                                //Label1.Text += item.Text + "Not"; // dh.response;
                                LblSuccessMessageActors.Text = "Saved Successfully";
                            }
                        }
                    }
                }catch (Exception ex)
                {
                    LblSuccessMessageActors.Text = "Saved unSuccessfully";
                }
                


            }

        dh.ClearTextBoxes(Page);

    }





    //to clear the textbox
    public void Clear()
    {
        tBmovie_id.Text = "";
        tBmovie_name.Text = tBreleaseDate.Text = "";
        BtnactorSave.Text = "Save";
        LblSuccessMessageActors.Text = LblErrorMessageActors.Text = "";


    }



    protected void btnactorclear_Click(object sender, EventArgs e)
    {
        Clear();
    }
}
}