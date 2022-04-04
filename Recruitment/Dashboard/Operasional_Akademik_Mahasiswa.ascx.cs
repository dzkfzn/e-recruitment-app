using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;

namespace New_SIA.Dashboard
{
    public partial class Operasional_Akademik_Mahasiswa : System.Web.UI.UserControl
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
        string variabel7;
        public string Data7 { get { return variabel7; } }
        string variabel8;
        public string Data8 { get { return variabel8; } }
        string variabel9;
        public string Data9 { get { return variabel9; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            loadChartIP(Context.User.Identity.Name);
            loadChartKehadiran(Context.User.Identity.Name);
            loadChartJamMinus(Context.User.Identity.Name);
            loadChartPelanggaran(Context.User.Identity.Name);
            dashboardPerformaMahasiswa.Visible = true;
            lblDashboardPerformaMahasiswa.Text = "Dashboard Mahasiswa - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
        }

        public void loadChartIP(string id)
        {
            try
            {
                dt = lib.CallProcedure("sia_getDataPerformaIP", new string[] { id });
                string temp7 = "categories: [";
                string temp8 = "data: [";
                string temp9 = "data: [";

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    temp7 += "'" + dt.Rows[i][0].ToString() + "',";
                    temp8 += dt.Rows[i][1].ToString() + ",";
                    temp9 += dt.Rows[i][2].ToString() + ",";
                }

                temp7 = temp7.Substring(0, temp7.Length - 1);
                temp8 = temp8.Substring(0, temp8.Length - 1);
                temp9 = temp9.Substring(0, temp9.Length - 1);
                temp7 += "]";
                temp8 += "]";
                temp9 += "]";

                variabel7 = temp7;
                variabel8 = temp8;
                variabel9 = temp9;

                gridDataNilai.DataSource = dt;
                gridDataNilai.DataBind();
            }
            catch { }
        }

        public void loadChartKehadiran(string id)
        {
            try
            {
                dt = lib.CallProcedure("sia_getDataPerformaKehadiran", new string[] { id });
                string temp1 = "categories: [";
                string temp2 = "data: [";

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    temp1 += "'" + dt.Rows[i][0].ToString() + "',";
                    temp2 += dt.Rows[i][1].ToString() + ",";
                }

                temp1 = temp1.Substring(0, temp1.Length - 1);
                temp2 = temp2.Substring(0, temp2.Length - 1);
                temp1 += "]";
                temp2 += "]";

                variabel1 = temp1;
                variabel2 = temp2;

                gridDataKehadiran.DataSource = dt;
                gridDataKehadiran.DataBind();

                for (int x = 0; x < gridDataKehadiran.Rows.Count; x++)
                    gridDataKehadiran.Rows[x].Cells[2].Text += " %";
            }
            catch { }
        }

        public void loadChartJamMinus(string id)
        {
            try
            {
                dt = lib.CallProcedure("sia_getDataPerformaJamMinus", new string[] { id });
                string temp3 = "categories: [";
                string temp4 = "data: [";

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    temp3 += "'" + dt.Rows[i][0].ToString() + "',";
                    temp4 += dt.Rows[i][1].ToString() + ",";
                }

                temp3 = temp3.Substring(0, temp3.Length - 1);
                temp4 = temp4.Substring(0, temp4.Length - 1);
                temp3 += "]";
                temp4 += "]";

                variabel3 = temp3;
                variabel4 = temp4;

                gridDataJamMinus.DataSource = dt;
                gridDataJamMinus.DataBind();
            }
            catch { }
        }

        public void loadChartPelanggaran(string id)
        {
            try
            {
                dt = lib.CallProcedure("sia_getDataPerformaPelanggaran", new string[] { id });
                string temp5 = "categories: [";
                string temp6 = "data: [";

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    temp5 += "'" + dt.Rows[i][0].ToString() + "',";
                    temp6 += dt.Rows[i][1].ToString() + ",";
                }

                temp5 = temp5.Substring(0, temp5.Length - 1);
                temp6 = temp6.Substring(0, temp6.Length - 1);
                temp5 += "]";
                temp6 += "]";

                variabel5 = temp5;
                variabel6 = temp6;

                gridDataPelanggaran.DataSource = dt;
                gridDataPelanggaran.DataBind();
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