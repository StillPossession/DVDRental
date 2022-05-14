using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
public partial class AllMovies : System.Web.UI.Page
{
    DataHandler dh = new DataHandler();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) loadTable();
    }
    protected void loadTable()
    {

        string sql1 = $@"select m.movie_id, m.movie_name, pr.producer_full_name, std.studio, m.release_date, CASE 
                            WHEN m.is_age_restricted = 1 THEN 'Yes'
                            ELSE 'No'
                        END AS 'is_age_restricted',
                        actors= STUFF((
                            SELECT ', ' + act.actor_first_name + ' '+ act.actor_last_name AS fullname_actor 
                            FROM movie_cast AS mcs
	                        INNER JOIN actors as act on mcs.cast_member = act.actor_id
	                        where mcs.movie = mc.movie order by act.actor_first_name ASC
                            FOR XML PATH, TYPE).value(N'.[1]', N'varchar(max)'), 1, 2, ''),
	                    COUNT(ds.dvd_copy_no) as 'no_of_copies'
                        from movies m
                            
                        left join movie_cast mc on mc.movie = m.movie_id
                        left join actors act on act.actor_id = mc.cast_member
                        left join producers pr on pr.producer_id = m.producer
                        left join studios std on std.studio_id = m.studio
                        left join dvd_stock ds on m.movie_id = ds.dvd_movie_id
                      
                        group by m.movie_id, m.movie_name, pr.producer_full_name, std.studio, m.release_date, m.is_age_restricted, mc.movie
                        order by m.release_date ASC;";

        GVactors.DataSource = dh.getTable(sql1);
        GVactors.DataBind();
    }
    protected void GVactors_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVactors.EditIndex = e.NewEditIndex;
        loadTable();
        GVactors.EditRowStyle.BackColor = System.Drawing.Color.Orange;
    }

    protected void GVactors_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVactors.EditIndex = -1;
        loadTable();
    }
    protected void GVactors_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label movieID = GVactors.Rows[e.RowIndex].FindControl("Movie_id") as Label;
        string deleteQuery1 = "delete from movie_cast where movie=" + movieID.Text;
        string deleteQuery2 = "delete from movies where movie_id=" + movieID.Text;
        string deleteQuery3 = "delete from dvd_stock where dvd_movie_id=" + movieID.Text;

        dh.saveData(deleteQuery1);
        dh.saveData(deleteQuery2);
        dh.saveData(deleteQuery3);

        loadTable();

        Label2.Visible = true;
        Label2.Text = dh.response;

        GVactors.EditIndex = -1;
    }
    protected void search_Table(string actors_Name)
    {
        //to filter to get available dvd and all dvd
        if (FilterToDvdShelves.Checked)
        {
            if (actors_Name != "")
            {
                Label2.Visible = true;
                ShowCopies.Visible = true;
                SearchBtn.Visible = false;
                CancelBtn.Visible = true;
                labellastname.Visible = false;
                Label2.Text = "Showing results for: '" + actors_Name + "'";

                // string sql1 = @"select distinct m.movie_name, m.movie_id from movies as m inner join dvd_stock as ds on m.movie_id = ds.dvd_movie_id inner join[movie_cast] as c on ds.dvd_movie_id = c.movie inner join[actors] as act on c.cast_member = act.actor_id where act.actor_last_name LIKE '%" + actors_Name + "%';";
                string sql1 = $@"select m.movie_id, m.movie_name, pr.producer_full_name, std.studio, m.release_date, CASE 
                            WHEN m.is_age_restricted = 1 THEN 'Yes'
                            ELSE 'No'
                        END AS 'is_age_restricted',
                        actors= STUFF((
                            SELECT ', ' + act.actor_first_name + ' '+ act.actor_last_name AS fullname_actor 
                            FROM movie_cast AS mcs
	                        INNER JOIN actors as act on mcs.cast_member = act.actor_id
	                        where mcs.movie = mc.movie order by act.actor_first_name ASC
                            FOR XML PATH, TYPE).value(N'.[1]', N'varchar(max)'), 1, 2, ''),
	                    COUNT(ds.dvd_copy_no) as 'no_of_copies'
                        from movies m
                        
                        left join movie_cast mc on mc.movie = m.movie_id
                        left join actors act on act.actor_id = mc.cast_member
                        left join producers pr on pr.producer_id = m.producer
                        left join studios std on std.studio_id = m.studio
                        left join dvd_stock ds on m.movie_id = ds.dvd_movie_id
                        WHERE (act.actor_last_name LIKE '%{actors_Name}%') and ds.is_loaned = 'False'
                        group by m.movie_id, m.movie_name, pr.producer_full_name, std.studio, m.release_date, m.is_age_restricted, mc.movie
                        order by m.release_date DESC;";
                GVactors.DataSource = dh.getTable(sql1);
                GVactors.DataBind();
            }
            else
            {
                Label2.Visible = false;
                loadTable();
            }
        }
        else
        {
            if (actors_Name != "")
            {
                Label2.Visible = true;
                ShowCopies.Visible = true;
                SearchBtn.Visible = false;
                CancelBtn.Visible = true;
                labellastname.Visible = false;
                Label2.Text = "Showing results for: '" + actors_Name + "'";

                // string sql1 = @"select distinct m.movie_name, m.movie_id from movies as m inner join dvd_stock as ds on m.movie_id = ds.dvd_movie_id inner join[movie_cast] as c on ds.dvd_movie_id = c.movie inner join[actors] as act on c.cast_member = act.actor_id where act.actor_last_name LIKE '%" + actors_Name + "%';";
                string sql1 = $@"select m.movie_id, m.movie_name, pr.producer_full_name, std.studio, m.release_date, CASE 
                            WHEN m.is_age_restricted = 1 THEN 'Yes'
                            ELSE 'No'
                        END AS 'is_age_restricted',
                        actors= STUFF((
                            SELECT ', ' + act.actor_first_name + ' '+ act.actor_last_name AS fullname_actor 
                            FROM movie_cast AS mcs
	                        INNER JOIN actors as act on mcs.cast_member = act.actor_id
	                        where mcs.movie = mc.movie order by act.actor_first_name ASC
                            FOR XML PATH, TYPE).value(N'.[1]', N'varchar(max)'), 1, 2, ''),
	                    COUNT(ds.dvd_copy_no) as 'no_of_copies'
                        from movies m
                        
                        left join movie_cast mc on mc.movie = m.movie_id
                        left join actors act on act.actor_id = mc.cast_member
                        left join producers pr on pr.producer_id = m.producer
                        left join studios std on std.studio_id = m.studio
                        left join dvd_stock ds on m.movie_id = ds.dvd_movie_id
                        WHERE (act.actor_last_name LIKE '%{actors_Name}%')
                        group by m.movie_id, m.movie_name, pr.producer_full_name, std.studio, m.release_date, m.is_age_restricted, mc.movie
                        order by m.release_date DESC;";
                GVactors.DataSource = dh.getTable(sql1);
                GVactors.DataBind();
            }
            else
            {
                Label2.Visible = false;
                loadTable();
            }
        }


    }
    protected void SearchBox_TextChanged(object sender, EventArgs e)
    {
        search_Table(SearchBox.Text);
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        search_Table(SearchBox.Text);
    }

    protected void ShowCopies_CheckedChanged(object sender, EventArgs e)
    {
        if (ShowCopies.Checked)
        {
            GVactors.Columns[7].Visible = true;
        }
        else
        {
            GVactors.Columns[7].Visible = false;
        }
    }

    protected void CancelBtn_Click(object sender, EventArgs e)
    {
        SearchBtn.Visible = true;
        CancelBtn.Visible = false;
        ShowCopies.Visible = false;
        ShowCopies.Checked = false;
        labellastname.Visible = true;
        Label2.Visible = false;
        GVactors.Columns[7].Visible = false;
        dh.ClearTextBoxes(Page);
        loadTable();
    }




}
}