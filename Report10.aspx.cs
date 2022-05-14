using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVDs
{
    public partial class Report10 : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadTable();
                String selectedDvdStockId = Request.QueryString["selectedDvdStockId"];
                dvdstockId.Text = selectedDvdStockId;
                if (dvdstockId.Text != "")
                {
                    string sql2 = $@"DELETE FROM dvd_stock WHERE dvd_stock_id ='{dvdstockId.Text}';";
                    dh.saveData(sql2);
                    loadTable();
                }
            }

        }

        protected void loadTable()
        {



            string sql1 = $@"select dvd_stock_id, dvd_copy_no from dvd_stock 
                        where Cast(date_added as datetime) < DATEADD(DAY, -365, GETDATE()) 
                        and is_loaned = '0';";


            GVactors.DataSource = dh.getTable(sql1);
            GVactors.DataBind();
            //String selectedDvdStockId = Request.QueryString["selectedDvdStockId"];

            //dvdstockId.Text = selectedDvdStockId;

            //string sql2 = $@"DELETE FROM dvd_stock WHERE dvd_stock_id ='{dvdstockId.Text}';";
            //dh.saveData(sql2);

        }

        protected void btnAllStockDelete_Click(object sender, EventArgs e)
        {
            string sql3 = $@" DELETE FROM dvd_stock WHERE Cast(date_added as datetime) < DATEADD(DAY, -365, GETDATE()) and is_loaned = '0';";
            dh.saveData(sql3);
            loadTable();
        }
    }
}