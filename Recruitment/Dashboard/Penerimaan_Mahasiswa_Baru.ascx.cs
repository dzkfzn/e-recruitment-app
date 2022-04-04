using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;
using System.Web.Configuration;
using System.IO;
using System.Net;
using System.Text;
using System.Web.UI.WebControls;

namespace New_SIA.Dashboard
{
    public partial class Penerimaan_Mahasiswa_Baru : System.Web.UI.UserControl
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        static PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadListKonsentrasiPMB();
        }

        protected void loadListKonsentrasiPMB()
        {
            titleDBPMB1.InnerText += " - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
            titleDBPMB2.InnerText += " - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
            GetDataDashboardPMB("stp_getListProgramStudi", new string[] { }, nextLoadListKonsentrasiPMB);
        }

        protected void nextLoadListKonsentrasiPMB(DataTable dtTempStatic)
        {
            ddKonsentrasi.Items.Clear();
            ddKonsentrasi.DataSource = dtTempStatic;
            ddKonsentrasi.DataTextField = "nama_prodi";
            ddKonsentrasi.DataValueField = "id_prodi";
            ddKonsentrasi.DataBind();
            if (ddKonsentrasi.Items.Count > 1)
                ddKonsentrasi.Items.Insert(0, new ListItem("-- Semua --", ""));
        }

        protected static void GetDataDashboardPMB(string sp, string[] param, Action<DataTable> func = null)
        {
            DataTable dtTempStatic = new DataTable();
            string apilocation = WebConfigurationManager.AppSettings["linkAPIPMB"] + lib.Encrypt(sp + (param.Length > 0 ? "#" : "") + string.Join("#", param), WebConfigurationManager.AppSettings["keyAPIPMB"]);
            WebRequest myReq = WebRequest.Create(apilocation);
            myReq.Method = "GET";
            myReq.ContentType = "application/json; charset=UTF-8";

            WebResponse wr = myReq.GetResponse();
            Stream receiveStream = wr.GetResponseStream();
            StreamReader reader = new StreamReader(receiveStream, Encoding.UTF8);
            dtTempStatic = new DataTable();
            string json = reader.ReadToEnd().Replace("\\\"", "").Replace("\"[{", "").Replace("}]\"", "");
            string[] column = json.Replace("},{", "~").Split('~')[0].Split(',');
            for (int i = 0; i < column.Length; i++)
                dtTempStatic.Columns.Add(column[i].Split(':')[0]);

            string[] json2 = json.Replace("},{", "~").Split('~');
            for (int i = 0; i < json2.Length; i++)
            {
                dtTempStatic.Rows.Add(dtTempStatic.NewRow());
                string[] json3 = json2[i].Split(',');
                for (int j = 0; j < json3.Length; j++)
                    dtTempStatic.Rows[i][j] = json3[j].Split(':')[1];
            }

            func(dtTempStatic);
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