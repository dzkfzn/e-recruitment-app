using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;

namespace New_SIA.Dashboard
{
    public partial class Praktik_Kerja_Industri : System.Web.UI.UserControl
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

        protected void Page_Load(object sender, EventArgs e)
        {
            lblTitlePraktikKerjaIndustri.Text = "Dashboard Praktik Kerja Industri - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
            loadData();
        }

        private void loadData()
        {
            string tahunakademik = "";
            try { tahunakademik = lib.CallProcedure("sia_getActiveTahunAkademikByTanggal", new string[] { }).Rows[0][0].ToString(); } catch { }

            try
            {
                dt = lib.CallProcedure("sia_getRekapitulasiIndustriSum", new string[] { tahunakademik });
                string temp1 = "categories: [";
                string temp2 = "data: [";
                string temp3 = "data: [";

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    temp1 += "'" + dt.Rows[i][1].ToString() + "',";
                    temp2 += dt.Rows[i][4].ToString() + ",";
                    temp3 += (Convert.ToInt32(dt.Rows[i][3].ToString()) - Convert.ToInt32(dt.Rows[i][4].ToString())).ToString() + ",";
                }

                temp1 = temp1.Substring(0, temp1.Length - 1);
                temp2 = temp2.Substring(0, temp2.Length - 1);
                temp3 = temp3.Substring(0, temp3.Length - 1);
                temp1 += "]";
                temp2 += "]";
                temp3 += "]";

                variabel1 = temp1;
                variabel2 = temp2;
                variabel3 = temp3;

                gridDataPrakerin.DataSource = dt;
                gridDataPrakerin.DataBind();
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