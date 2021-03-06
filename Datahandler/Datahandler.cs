using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public class DataHandler
    {

        string strcon = ConfigurationManager.ConnectionStrings["RopeyDVDConnectionString"].ConnectionString;
        public string response { get; set; }

        public int identity { get; set; }

        public string[] loginUser(string sql)
        {
            string[] userInfo = new string[4];
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(sql, con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    response = "User Found";

                    while (dr.Read())
                    {
                        userInfo[0] = dr.GetValue(0).ToString();
                        userInfo[1] = dr.GetValue(1).ToString();
                        userInfo[2] = dr.GetValue(2).ToString();
                        userInfo[3] = dr.GetValue(3).ToString();

                    }

                    dr.Close();

                    con.Close();

                    return userInfo;

                }
                else
                {
                    response = sql;
                    dr.Close();
                    con.Close();
                    return null;
                }

                //dr.Close();

                //cmd.ExecuteNonQuery();

                // con.Close();


            }
            catch (Exception ex)
            {
                response = ex.Message;
                return null;
            }
        }

        public DataTable getTable(string sql)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["RopeyDVDConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand(sql);
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                DataTable dt = new DataTable();
                sda.Fill(dt);
                response = "Success";
                return dt;
            }
            catch (Exception ex)
            {
                response = ex.Message;
                return null;
            }
        }

        public void saveData(string sql)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(sql, con);

                //cmd.ExecuteNonQuery();

                identity = (Int32)cmd.ExecuteScalar();
               // int identity = (int)cmd.ExecuteScalar();

                //int i = 0;
                //object identity = cmd.ExecuteScalar();
                //if (identity != null)
                //i = (int)identity;


                con.Close();

                response = "Success";

            }
            catch (Exception ex)
            {
                identity = 0;
                //response = ex.Message;
            }
        }

        

        public void ClearTextBoxes(Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox t = ctrl as TextBox;

                    if (t != null)
                    {
                        t.Text = String.Empty;
                    }
                }
                else
                {
                    if (ctrl.Controls.Count > 0)
                    {
                        ClearTextBoxes(ctrl);
                    }
                }
            }
        }
    }
}