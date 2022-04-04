using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;

namespace New_SIA.Dashboard
{
    public partial class Dashboard_SKPI : System.Web.UI.UserControl
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();
        string variabel1;
        public string Data1 { get { return variabel1; } }
        string variabel2;
        public string Data2 { get { return variabel2; } }
        string variabel3;
        public string Data3 { get { return variabel3; } }
        string variabel4;
        public string Data4 { get { return variabel4; } }
        string variabel5;
        public string Data5 { get { return variabel5; } }
        string variabel6;
        public string Data6 { get { return variabel6; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblTitleDashboardSKPI.Text = "Dashboard SKPI - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
            loadData();
        }

        private void loadData()
        {
            string tahunakademik = "";
            try { tahunakademik = lib.CallProcedure("sia_getActiveTahunAkademikByTanggal", new string[] { }).Rows[0][0].ToString(); } catch { }

            try
            {
                dt = lib.CallProcedure("sia_getRekapitulasiSKPI", new string[] { tahunakademik });
                string temp1 = "max: ";
                string temp2 = "value: ";
                string temp3 = "data: [";
                string temp4 = "data: [";
                string temp5 = "data: [";
                string temp6 = "data: [";

                int sum1 = 0;
                int sum3 = 0;
                int sum4 = 0;
                int sum5 = 0;

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sum1 += Convert.ToInt32(dt.Rows[i][1].ToString());
                    sum3 += Convert.ToInt32(dt.Rows[i][3].ToString());
                    sum4 += Convert.ToInt32(dt.Rows[i][4].ToString());
                    sum5 += Convert.ToInt32(dt.Rows[i][5].ToString());
                }

                temp1 += (sum1 + 1).ToString();
                temp2 += sum1.ToString();
                temp3 += (sum1 - sum3 - sum4 - sum5).ToString() + "]";
                temp4 += sum3.ToString() + "]";
                temp5 += sum4.ToString() + "]";
                temp6 += sum5.ToString() + "]";

                variabel1 = temp1;
                variabel2 = temp2;
                variabel3 = temp3;
                variabel4 = temp4;
                variabel5 = temp5;
                variabel6 = temp6;

                gridDataSKPI.DataSource = dt;
                gridDataSKPI.DataBind();

                for (int i = 0; i < gridDataSKPI.Rows.Count; i++)
                {
                    if (i == gridDataSKPI.Rows.Count - 1)
                    {
                        gridDataSKPI.Rows[i].Font.Bold = true;
                        gridDataSKPI.Rows[i].Cells[0].Text = "";
                        gridDataSKPI.Rows[i].Cells[2].Text = sum1.ToString();
                        gridDataSKPI.Rows[i].Cells[3].Text = (sum1 - sum3 - sum4 - sum5).ToString();
                        gridDataSKPI.Rows[i].Cells[4].Text = sum3.ToString();
                        gridDataSKPI.Rows[i].Cells[5].Text = sum4.ToString();
                        gridDataSKPI.Rows[i].Cells[6].Text = sum5.ToString();
                    }
                    else
                        gridDataSKPI.Rows[i].Cells[3].Text = (Convert.ToInt32(gridDataSKPI.Rows[i].Cells[2].Text) - Convert.ToInt32(gridDataSKPI.Rows[i].Cells[4].Text) - Convert.ToInt32(gridDataSKPI.Rows[i].Cells[5].Text) - Convert.ToInt32(gridDataSKPI.Rows[i].Cells[6].Text)).ToString();
                }
            }
            catch { }
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
    }
}