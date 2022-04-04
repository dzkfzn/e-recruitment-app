using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace New_SIA.Dashboard
{
    public partial class Operasional_Akademik_Dosen : System.Web.UI.UserControl
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();
        string varJumlah;
        public string Jumlah { get { return varJumlah; } }
        string[] varM = new string[100];
        public string[] Matkul { get { return varM; } }
        string[] varK = new string[100];
        public string[] DosK { get { return varK; } }
        string[] varKM = new string[100];
        public string[] DosKM { get { return varKM; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            dashboardDosen.Visible = true;
            rowDashboardDosen.Visible = true;
            string tahun = "";
            string semester = "";
            try { tahun = lib.CallProcedure("sia_getActiveTahunAkademikByTanggal", new string[] { }).Rows[0][0].ToString(); } catch { }
            try { semester = lib.CallProcedure("sia_getActiveTahunAkademikByTanggal", new string[] { }).Rows[0][1].ToString(); } catch { }
            loadDashboardDosen(tahun, semester, Context.User.Identity.Name);
            lbDashboardDosen.Text = "Dashboard Dosen - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
        }

        public void loadDashboardDosen(string tahun, string semester, string username)
        {
            try
            {
                dt = lib.CallProcedure("sia_getDataDashboardDosen", new string[] { tahun, semester, username });
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    varM[i] = dt.Rows[i][1].ToString();
                    varK[i] = dt.Rows[i][2].ToString();
                    varKM[i] = dt.Rows[i][3].ToString();
                }
                varJumlah = dt.Rows.Count.ToString();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "renderDashboardDosen", "renderDashboardDosen();", true);
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