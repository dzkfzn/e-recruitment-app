using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_SIA.Dashboard
{
    public partial class Dashboard_Dosen_SPDA : System.Web.UI.UserControl
    {
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmps", "<script type='text/javascript'>var data = []</script>", false);
            lblDashboardDosen.Text = "Jabatan Akademik - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
            lblDashboardDosen2.Text = "Gelar Akademik - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
            loadData();
        }

        string json1;
        public string Data1 { get { return json1; } }
        string json2 = "";
        public string Data2 { get { return json2; } }
        protected void loadData()
        {
            DataTable dt = lib.CallProcedure("sia_getDataSPDADosen", new string[] { });
            gridData.DataSource = dt;
            gridData.DataBind();
            json1 = "";
            for (int i = 0; i < gridData.Rows.Count; i++)
            {
                int n = 0;
                for (int j = 1; j < dt.Columns.Count; j++)
                {
                    n += Convert.ToInt32(gridData.Rows[i].Cells[j].Text);
                    gridData.Rows[i].Cells[j].HorizontalAlign = HorizontalAlign.Right;
                }
                json1 += ",['" + gridData.Rows[i].Cells[0].Text + "', " + n + "]";
            }
            json1 = "[" + json1.Substring(1) + "]";

            //dt = lib.CallProcedure("sia_getDataSPDADosen2", new string[] { });
            //gridData2.DataSource = dt;
            //gridData2.DataBind();
            //json2 = "";
            //for (int i = 1; i < dt.Columns.Count; i++)
            //{
            //    string json3 = "";
            //    json2 += ",[{ nama : '" + dt.Columns[i].ColumnName + "', data : [";
            //    for (int j = 0; j < gridData2.Rows.Count; j++)
            //    {
            //        json3 += ",['" + gridData2.Rows[j].Cells[0].Text + "', " + gridData2.Rows[j].Cells[i].Text + "]";
            //    }
            //    json2 += json3.Substring(1) + "]}]";
            //}
            //json2 = "[" + json2.Substring(1) + "]";

            //for (int i = 0; i < gridData2.Rows.Count; i++)
            //{
            //    for (int j = 1; j < dt.Columns.Count; j++)
            //    {
            //        gridData2.Rows[i].Cells[j].HorizontalAlign = HorizontalAlign.Right;
            //    }
            //}
        }

        protected void gridData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridData.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected string checkHari(string hari)
        {
            switch (hari)
            {
                case "Sunday": return "Minggu";
                case "Monday": return "Senin";
                case "Tuesday": return "Selasa";
                case "Wednesday": return "Rabu";
                case "Thursday": return "Kamis";
                case "Friday": return "Jumat";
                case "Saturday": return "Sabtu";
                default: return hari;
            }
        }

        protected string checkTanggal(string hari)
        {
            string temp = hari.Split(' ')[1];
            switch (temp)
            {
                case "Jan": temp = "Januari"; break;
                case "Feb": temp = "Februari"; break;
                case "Mar": temp = "Maret"; break;
                case "Apr": temp = "April"; break;
                case "May": temp = "Mei"; break;
                case "Jun": temp = "Juni"; break;
                case "Jul": temp = "Juli"; break;
                case "Aug": temp = "Agustus"; break;
                case "Sep": temp = "September"; break;
                case "Oct": temp = "Oktober"; break;
                case "Nov": temp = "November"; break;
                case "Dec": temp = "Desember"; break;
                default: temp = ""; break;
            }
            return Convert.ToInt16(hari.Split(' ')[0]).ToString() + " " + temp + " " + hari.Split(' ')[2];
        }

        protected void gridData2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridData2.PageIndex = e.NewPageIndex;
            loadData();
        }
    }
}