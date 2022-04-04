using OfficeOpenXml;
using OfficeOpenXml.Style;
using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_SIA.Dashboard
{
    public partial class Operasional_Akademik_Admin_Jam_Minus : System.Web.UI.UserControl
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();
        string[] listFieldKetercapaian = new string[8] { "mku_semester asc", "mku_semester desc", "mku_nama asc", "mku_nama desc", "capaian_pertemuan asc", "capaian_pertemuan desc", "capaian_materi asc", "capaian_materi desc" };
        string[] listTextFieldKetercapaian = new string[8] { "Semester [↑]", "Semester [↓]", "Mata Kuliah [↑]", "Mata Kuliah [↓]", "% Ketercapaian Pertemuan [↑]", "% Ketercapaian Pertemuan [↓]", "% Ketercapaian Materi [↑]", "% Ketercapaian Materi [↓]" };

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["valueAWadir"] = "KOSONG";
            Session["valueBWadir"] = "KOSONG";
            Session["valueListKonsentrasi"] = "KOSONG";

            ddUrutKetercapaian.Items.Clear();
            for (int i = 0; i < listFieldKetercapaian.Length; i++)
                ddUrutKetercapaian.Items.Add(new ListItem(listTextFieldKetercapaian[i], listFieldKetercapaian[i]));

            loadListTahunAjaran();
            loadListKonsentrasi();
            loadDataKetercapaian();
            lblDashboardKetercapaian.Text = "Dashboard Pengajaran - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
        }

        protected void loadDataKetercapaian()
        {
            int isUPTJM = lib.CallProcedure("sia_checkUPT", new string[] { Context.User.Identity.Name }).Rows.Count;

            int[,] jumlahPertemuanWadir = new int[ddKonsentrasiKetercapaian.Items.Count - 1, 3];
            int[,] jumlahMateriWadir = new int[ddKonsentrasiKetercapaian.Items.Count - 1, 3];
            int tempIndex = 0;

            dt = lib.CallProcedure("sia_getDataDashboard", new string[] { "Ketercapaian", Server.HtmlEncode(txtCariKetercapaian.Value.Trim()), "", ddUrutKetercapaian.SelectedValue, ddTahunAjaranKetercapaian.SelectedValue, ddSemesterKetercapaian.SelectedValue, ddKonsentrasiKetercapaian.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], isUPTJM.ToString(), adAuth.GetDisplayName(Context.User.Identity.Name) });
            gridDataKetercapaian.DataSource = dt;
            gridDataKetercapaian.DataBind();


            string tempResultPertemuan = "", tempResultMateri = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                for (int j = 1; j < ddKonsentrasiKetercapaian.Items.Count; j++)
                {
                    if (ddKonsentrasiKetercapaian.Items[j].Value.Equals(dt.Rows[i][9].ToString()))
                    {
                        tempIndex = j;
                        break;
                    }
                }
                jumlahPertemuanWadir[tempIndex - 1, 0] += Convert.ToInt32(dt.Rows[i][6].ToString().Replace(" %", ""));
                jumlahPertemuanWadir[tempIndex - 1, 1]++;
                jumlahMateriWadir[tempIndex - 1, 0] += Convert.ToInt32(dt.Rows[i][7].ToString().Replace(" %", ""));
                jumlahMateriWadir[tempIndex - 1, 1]++;
            }
            for (int i = 0; i < ddKonsentrasiKetercapaian.Items.Count - 1; i++)
            {
                try { jumlahPertemuanWadir[i, 2] = (int)jumlahPertemuanWadir[i, 0] / jumlahPertemuanWadir[i, 1]; } catch { jumlahPertemuanWadir[i, 2] = 0; }
                try { jumlahMateriWadir[i, 2] = (int)jumlahMateriWadir[i, 0] / jumlahMateriWadir[i, 1]; } catch { jumlahMateriWadir[i, 2] = 0; }
                tempResultPertemuan += jumlahPertemuanWadir[i, 2].ToString() + ",";
                tempResultMateri += jumlahMateriWadir[i, 2].ToString() + ",";
            }
            tempResultPertemuan = "[" + tempResultPertemuan.Substring(0, tempResultPertemuan.Length - 1) + "]";
            tempResultMateri = "[" + tempResultMateri.Substring(0, tempResultMateri.Length - 1) + "]";
            Session["valueAWadir"] = tempResultPertemuan;
            Session["valueBWadir"] = tempResultMateri;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKetercapaianWadir", "setValueKetercapaianWadir(" + tempResultPertemuan + "," + tempResultMateri + "," + Session["valueListKonsentrasi"].ToString() + ");", true);
        }

        protected void renderGraphicKetercapaianWadir()
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKetercapaianWadir", "setValueKetercapaianWadir(" + Session["valueAWadir"].ToString() + "," + Session["valueBWadir"].ToString() + "," + Session["valueListKonsentrasi"].ToString() + ");", true);
        }

        protected void loadListTahunAjaran()
        {
            dt = lib.CallProcedure("sia_getListTahunAjaran", new string[] { });

            ddTahunAjaranKetercapaian.Items.Clear();
            ddTahunAjaranKetercapaian.DataSource = dt;
            ddTahunAjaranKetercapaian.DataTextField = "kak_tahun_ajaran";
            ddTahunAjaranKetercapaian.DataValueField = "kak_tahun_ajaran";
            ddTahunAjaranKetercapaian.DataBind();

            try
            {
                dt = lib.CallProcedure("sia_getActiveTahunAkademikByTanggal", new string[] { });
                ddTahunAjaranKetercapaian.SelectedValue = dt.Rows[0][0].ToString();
            }
            catch { }
        }

        protected void loadListKonsentrasi()
        {
            string tempKonsentrasi = "";
            dt = lib.CallProcedure("sia_getListKonsentrasi", new string[] { });

            ddKonsentrasiKetercapaian.Items.Clear();
            ddKonsentrasiKetercapaian.DataSource = dt;
            ddKonsentrasiKetercapaian.DataTextField = "kon_nama";
            ddKonsentrasiKetercapaian.DataValueField = "kon_id";
            ddKonsentrasiKetercapaian.DataBind();
            ddKonsentrasiKetercapaian.Items.Insert(0, new ListItem("-- Semua --", ""));

            for (int i = 0; i < dt.Rows.Count; i++)
                tempKonsentrasi += "\"" + dt.Rows[i][1].ToString() + "\",";
            tempKonsentrasi = "[" + tempKonsentrasi.Substring(0, tempKonsentrasi.Length - 1) + "]";
            Session["valueListKonsentrasi"] = tempKonsentrasi;
        }

        protected void linkCariKetercapaian_Click(object sender, EventArgs e)
        {
            loadDataKetercapaian();
        }

        protected void gridDataKetercapaian_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataKetercapaian.PageIndex = e.NewPageIndex;
            loadDataKetercapaian();
        }

        protected void btnDetailKetercapaianShow_Click(object sender, EventArgs e)
        {
            btnDetailKetercapaianShow.Visible = false;
            btnDetailKetercapaianHide.Visible = true;
            divKetercapaian.Visible = true;
            renderGraphicKetercapaianWadir();
        }

        protected void btnDetailKetercapaianHide_Click(object sender, EventArgs e)
        {
            btnDetailKetercapaianShow.Visible = true;
            btnDetailKetercapaianHide.Visible = false;
            divKetercapaian.Visible = false;
            renderGraphicKetercapaianWadir();
        }

        protected void btnExportKetercapaian_Click(object sender, EventArgs e)
        {
            int isUPTJM = lib.CallProcedure("sia_checkUPT", new string[] { Context.User.Identity.Name }).Rows.Count;
            DataTable dtTemp = new DataTable();
            dtTemp = lib.CallProcedure("sia_getDataDashboard", new string[] { "Report Ketercapaian", Context.User.Identity.Name, Server.HtmlEncode(txtCariKetercapaian.Value.Trim()), ddTahunAjaranKetercapaian.SelectedValue, ddSemesterKetercapaian.SelectedValue, ddKonsentrasiKetercapaian.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], isUPTJM.ToString(), adAuth.GetDisplayName(Context.User.Identity.Name) });
            using (ExcelPackage pck = new ExcelPackage())
            {
                //MEMBUAT SHEET ALL DATA
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add(ddKonsentrasiKetercapaian.SelectedValue.Equals("") ? "ALL" : ddKonsentrasiKetercapaian.SelectedItem.Text.Split('(')[1].Split(')')[0]);
                ws.Cells["A4"].LoadFromDataTable(dtTemp, true);
                ws.Cells["A4"].Value = "Prodi";
                ws.Cells["B4"].Value = "Semester";
                ws.Cells["C4"].Value = "Mata Kuliah";
                ws.Cells["D4"].Value = "Dosen 1";
                ws.Cells["E4"].Value = "Dosen 2";
                ws.Cells["F4"].Value = "Prosentase Ketercapaian Pertemuan";
                ws.Cells["G4"].Value = "Prosentase Ketercapaian Materi";

                ws.Cells["A1"].Value = "Ketercapaian Pertemuan dan Materi" + (ddKonsentrasiKetercapaian.SelectedValue.Equals("") ? "" : " " + ddKonsentrasiKetercapaian.SelectedItem.Text.Split('(')[1].Split(')')[0]);
                ws.Cells["A1"].Style.Font.Bold = true;
                ws.Cells["A1:G1"].Merge = true;
                ws.Cells["A2"].Value = "(Terakhir diperbarui pada " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm") + ")";
                ws.Cells["A2"].Style.Font.Bold = true;
                ws.Cells["A2:G2"].Merge = true;

                ws.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Column(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Column(7).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                using (ExcelRange rng = ws.Cells["A4:G4"])
                {
                    rng.Style.Font.Bold = true;
                    rng.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                }

                for (int j = 1; j <= 7; j++)
                    ws.Column(j).AutoFit();

                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=Data_Ketercapaian_Pertemuan_dan_Materi" + (ddKonsentrasiKetercapaian.SelectedValue.Equals("") ? "" : "_" + ddKonsentrasiKetercapaian.SelectedItem.Text.Split('(')[1].Split(')')[0]) + ".xlsx");
                Response.BinaryWrite(pck.GetAsByteArray());
            }
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