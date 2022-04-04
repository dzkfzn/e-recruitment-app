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
    public partial class Operasional_Akademik_Admin_SIA : System.Web.UI.UserControl
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();
        string[] listFieldKetercapaian = new string[8] { "mku_semester asc", "mku_semester desc", "mku_nama asc", "mku_nama desc", "capaian_pertemuan asc", "capaian_pertemuan desc", "capaian_materi asc", "capaian_materi desc" };
        string[] listTextFieldKetercapaian = new string[8] { "Semester [↑]", "Semester [↓]", "Mata Kuliah [↑]", "Mata Kuliah [↓]", "% Ketercapaian Pertemuan [↑]", "% Ketercapaian Pertemuan [↓]", "% Ketercapaian Materi [↑]", "% Ketercapaian Materi [↓]" };
        string[] listFieldKehadiranMahasiswa = new string[6] { "mhs_id asc", "mhs_id desc", "mhs_nama asc", "mhs_nama desc", "percent_hadir asc", "percent_hadir desc" };
        string[] listTextFieldKehadiranMahasiswa = new string[6] { "NIM [↑]", "NIM [↓]", "Nama [↑]", "Nama [↓]", "% Rata-Rata Kehadiran [↑]", "% Rata-Rata Kehadiran [↓]" };

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["valueA"] = "KOSONG";
            Session["valueB"] = "KOSONG";
            Session["valueC"] = "KOSONG";
            Session["valueD"] = "KOSONG";
            Session["valueE"] = "KOSONG";
            Session["valueListKonsentrasi"] = "KOSONG";

            ddUrutKetercapaian.Items.Clear();
            for (int i = 0; i < listFieldKetercapaian.Length; i++)
                ddUrutKetercapaian.Items.Add(new ListItem(listTextFieldKetercapaian[i], listFieldKetercapaian[i]));
            ddUrutKehadiranMahasiswa.Items.Clear();
            for (int i = 0; i < listFieldKehadiranMahasiswa.Length; i++)
                ddUrutKehadiranMahasiswa.Items.Add(new ListItem(listTextFieldKehadiranMahasiswa[i], listFieldKehadiranMahasiswa[i]));

            loadListTahunAjaran();
            loadListKonsentrasi();
            loadDataKetercapaian();
            loadDataKehadiranMahasiswa();
            lblDashboardKetercapaian.Text = "Dashboard Pengajaran - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
            lblDashboardKehadiranMahasiswa.Text = "Dashboard Tingkat Kehadiran Mahasiswa - " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm");
        }

        protected void loadDataKetercapaian()
        {
            string tempKonsentrasi;
            try { tempKonsentrasi = lib.CallProcedure("sia_getKonsentrasiByUser", new string[] { adAuth.GetDisplayName(Context.User.Identity.Name) }).Rows[0][0].ToString(); } catch { tempKonsentrasi = ""; }

            int jumlahPertemuan = 0, jumlahMateri = 0;
            int countPertemuan = 0, countMateri = 0;

            dt = lib.CallProcedure("sia_getDataDashboard", new string[] { "Ketercapaian", Server.HtmlEncode(txtCariKetercapaian.Value.Trim()), tempKonsentrasi, ddUrutKetercapaian.SelectedValue, ddTahunAjaranKetercapaian.SelectedValue, ddSemesterKetercapaian.SelectedValue, ddKonsentrasiKetercapaian.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
            gridDataKetercapaian.DataSource = dt;
            gridDataKetercapaian.DataBind();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (!dt.Rows[i][6].ToString().Equals("-"))
                {
                    jumlahPertemuan += Convert.ToInt32(dt.Rows[i][6].ToString().Replace(" %", ""));
                    countPertemuan++;
                }
                if (!dt.Rows[i][7].ToString().Equals("-"))
                {
                    jumlahMateri += Convert.ToInt32(dt.Rows[i][7].ToString().Replace(" %", ""));
                    countMateri++;
                }
            }
            try { Session["valueA"] = ((int)jumlahPertemuan / countPertemuan).ToString(); } catch { Session["valueA"] = "0"; }
            try { Session["valueB"] = ((int)jumlahMateri / countMateri).ToString(); } catch { Session["valueB"] = "0"; }
            try
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKetercapaian", "setValueKetercapaian(" + ((int)jumlahPertemuan / countPertemuan).ToString() + "," + ((int)jumlahMateri / countMateri).ToString() + ");", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKetercapaian", "setValueKetercapaian(" + Session["valueA"].ToString() + "," + Session["valueB"].ToString() + ");", true);
            }
            if (!Session["valueC"].ToString().Equals("KOSONG") && !Session["valueD"].ToString().Equals("KOSONG") && !Session["valueE"].ToString().Equals("KOSONG"))
                renderGraphicKehadiranMahasiswa();
        }

        protected void loadDataKehadiranMahasiswa()
        {
            string tempKonsentrasi;
            try { tempKonsentrasi = lib.CallProcedure("sia_getKonsentrasiByUser", new string[] { adAuth.GetDisplayName(Context.User.Identity.Name) }).Rows[0][0].ToString(); } catch { tempKonsentrasi = ""; }

            int jumlahTingkat1 = 0, jumlahTingkat2 = 0, jumlahTingkat3 = 0;
            int countTingkat1 = 0, countTingkat2 = 0, countTingkat3 = 0;

            dt = lib.CallProcedure("sia_getDataDashboard", new string[] { "Kehadiran Mahasiswa", Server.HtmlEncode(txtCariKehadiranMahasiswa.Value.Trim()), tempKonsentrasi, ddUrutKehadiranMahasiswa.SelectedValue, ddTahunAjaranKehadiranMahasiswa.SelectedValue, ddTingkatKehadiranMahasiswa.SelectedValue, ddKonsentrasiKehadiranMahasiswa.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
            gridDataKehadiranMahasiswa.DataSource = dt;
            gridDataKehadiranMahasiswa.DataBind();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][2].ToString().Equals("1"))
                {
                    jumlahTingkat1 += Convert.ToInt32(dt.Rows[i][5].ToString().Replace(" %", ""));
                    countTingkat1++;
                }
                if (dt.Rows[i][2].ToString().Equals("2"))
                {
                    jumlahTingkat2 += Convert.ToInt32(dt.Rows[i][5].ToString().Replace(" %", ""));
                    countTingkat2++;
                }
                if (dt.Rows[i][2].ToString().Equals("3"))
                {
                    jumlahTingkat3 += Convert.ToInt32(dt.Rows[i][5].ToString().Replace(" %", ""));
                    countTingkat3++;
                }
            }
            try { Session["valueC"] = ((int)jumlahTingkat1 / countTingkat1).ToString(); } catch { Session["valueC"] = "0"; }
            try { Session["valueD"] = ((int)jumlahTingkat2 / countTingkat2).ToString(); } catch { Session["valueD"] = "0"; }
            try { Session["valueE"] = ((int)jumlahTingkat3 / countTingkat3).ToString(); } catch { Session["valueE"] = "0"; }
            try
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKehadiranMahasiswa", "setValueKehadiranMahasiswa(" + ((int)jumlahTingkat1 / countTingkat1).ToString() + "," + ((int)jumlahTingkat2 / countTingkat2).ToString() + "," + ((int)jumlahTingkat3 / countTingkat3).ToString() + ");", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKehadiranMahasiswa", "setValueKehadiranMahasiswa(" + Session["valueC"].ToString() + "," + Session["valueD"].ToString() + "," + Session["valueE"].ToString() + ");", true);
            }
            if (!Session["valueA"].ToString().Equals("KOSONG") && !Session["valueB"].ToString().Equals("KOSONG"))
                renderGraphicKetercapaian();
        }

        protected void renderGraphicKetercapaian()
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKetercapaian", "setValueKetercapaian(" + Session["valueA"].ToString() + "," + Session["valueB"].ToString() + ");", true);
        }

        protected void renderGraphicKehadiranMahasiswa()
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKehadiranMahasiswa", "setValueKehadiranMahasiswa(" + Session["valueC"].ToString() + "," + Session["valueD"].ToString() + "," + Session["valueE"].ToString() + ");", true);
        }

        protected void loadListTahunAjaran()
        {
            dt = lib.CallProcedure("sia_getListTahunAjaran", new string[] { });

            ddTahunAjaranKetercapaian.Items.Clear();
            ddTahunAjaranKetercapaian.DataSource = dt;
            ddTahunAjaranKetercapaian.DataTextField = "kak_tahun_ajaran";
            ddTahunAjaranKetercapaian.DataValueField = "kak_tahun_ajaran";
            ddTahunAjaranKetercapaian.DataBind();

            ddTahunAjaranKehadiranMahasiswa.Items.Clear();
            ddTahunAjaranKehadiranMahasiswa.DataSource = dt;
            ddTahunAjaranKehadiranMahasiswa.DataTextField = "kak_tahun_ajaran";
            ddTahunAjaranKehadiranMahasiswa.DataValueField = "kak_tahun_ajaran";
            ddTahunAjaranKehadiranMahasiswa.DataBind();

            try
            {
                dt = lib.CallProcedure("sia_getActiveTahunAkademikByTanggal", new string[] { });
                ddTahunAjaranKetercapaian.SelectedValue = dt.Rows[0][0].ToString();
                ddTahunAjaranKehadiranMahasiswa.SelectedValue = dt.Rows[0][0].ToString();
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

            ddKonsentrasiKehadiranMahasiswa.Items.Clear();
            ddKonsentrasiKehadiranMahasiswa.DataSource = dt;
            ddKonsentrasiKehadiranMahasiswa.DataTextField = "kon_nama";
            ddKonsentrasiKehadiranMahasiswa.DataValueField = "kon_id";
            ddKonsentrasiKehadiranMahasiswa.DataBind();
            ddKonsentrasiKehadiranMahasiswa.Items.Insert(0, new ListItem("-- Semua --", ""));

            if (((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0].Equals("ROL22"))
            {
                divKonsentrasiKetercapaian.Visible = false;
                divKonsentrasiKehadiranMahasiswa.Visible = false;
            }

            for (int i = 0; i < dt.Rows.Count; i++)
                tempKonsentrasi += "\"" + dt.Rows[i][1].ToString().Split('(')[1].Split(')')[0] + "\",";
            tempKonsentrasi = "[" + tempKonsentrasi.Substring(0, tempKonsentrasi.Length - 1) + "]";
            Session["valueListKonsentrasi"] = tempKonsentrasi;
        }

        protected void linkCariKetercapaian_Click(object sender, EventArgs e)
        {
            loadDataKetercapaian();
        }

        protected void linkCariKehadiranMahasiswa_Click(object sender, EventArgs e)
        {
            loadDataKehadiranMahasiswa();
        }

        protected void gridDataKetercapaian_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataKetercapaian.PageIndex = e.NewPageIndex;
            loadDataKetercapaian();
        }

        protected void gridDataKehadiranMahasiswa_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataKehadiranMahasiswa.PageIndex = e.NewPageIndex;
            loadDataKehadiranMahasiswa();
        }

        protected void btnDetailKetercapaianShow_Click(object sender, EventArgs e)
        {
            btnDetailKetercapaianShow.Visible = false;
            btnDetailKetercapaianHide.Visible = true;
            divKetercapaian.Visible = true;
            renderGraphicKetercapaian();
            renderGraphicKehadiranMahasiswa();
        }

        protected void btnDetailKetercapaianHide_Click(object sender, EventArgs e)
        {
            btnDetailKetercapaianShow.Visible = true;
            btnDetailKetercapaianHide.Visible = false;
            divKetercapaian.Visible = false;
            renderGraphicKetercapaian();
            renderGraphicKehadiranMahasiswa();
        }

        protected void btnDetailKehadiranMahasiswaShow_Click(object sender, EventArgs e)
        {
            btnDetailKehadiranMahasiswaShow.Visible = false;
            btnDetailKehadiranMahasiswaHide.Visible = true;
            divKehadiranMahasiswa.Visible = true;
            renderGraphicKetercapaian();
            renderGraphicKehadiranMahasiswa();
        }

        protected void btnDetailKehadiranMahasiswaHide_Click(object sender, EventArgs e)
        {
            btnDetailKehadiranMahasiswaShow.Visible = true;
            btnDetailKehadiranMahasiswaHide.Visible = false;
            divKehadiranMahasiswa.Visible = false;
            renderGraphicKetercapaian();
            renderGraphicKehadiranMahasiswa();
        }

        protected void btnExportKetercapaian_Click(object sender, EventArgs e)
        {
            string tempKonsentrasi;
            try { tempKonsentrasi = lib.CallProcedure("sia_getKonsentrasiByUser", new string[] { adAuth.GetDisplayName(Context.User.Identity.Name) }).Rows[0][0].ToString(); } catch { tempKonsentrasi = ""; }
            DataTable dtTemp = new DataTable();
            dtTemp = lib.CallProcedure("sia_getDataDashboard", new string[] { "Report Ketercapaian", Context.User.Identity.Name, Server.HtmlEncode(txtCariKetercapaian.Value.Trim()), ddTahunAjaranKetercapaian.SelectedValue, ddSemesterKetercapaian.SelectedValue, ddKonsentrasiKetercapaian.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
            using (ExcelPackage pck = new ExcelPackage())
            {
                //MEMBUAT SHEET ALL DATA
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add(tempKonsentrasi.Equals("") ? (ddKonsentrasiKetercapaian.SelectedValue.Equals("") ? "ALL" : ddKonsentrasiKetercapaian.SelectedItem.Text.Split('(')[1].Split(')')[0]) : dtTemp.Rows[0][0].ToString().Trim());
                ws.Cells["A4"].LoadFromDataTable(dtTemp, true);
                ws.Cells["A4"].Value = "Prodi";
                ws.Cells["B4"].Value = "Semester";
                ws.Cells["C4"].Value = "Mata Kuliah";
                ws.Cells["D4"].Value = "Dosen 1";
                ws.Cells["E4"].Value = "Dosen 2";
                ws.Cells["F4"].Value = "Prosentase Ketercapaian Pertemuan";
                ws.Cells["G4"].Value = "Prosentase Ketercapaian Materi";

                ws.Cells["A1"].Value = "Ketercapaian Pertemuan dan Materi" + (tempKonsentrasi.Equals("") ? (ddKonsentrasiKetercapaian.SelectedValue.Equals("") ? "" : " " + ddKonsentrasiKetercapaian.SelectedItem.Text.Split('(')[1].Split(')')[0]) : " " + dtTemp.Rows[0][0].ToString().Trim());
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
                Response.AddHeader("content-disposition", "attachment;  filename=Data_Ketercapaian_Pertemuan_dan_Materi" + (tempKonsentrasi.Equals("") ? (ddKonsentrasiKetercapaian.SelectedValue.Equals("") ? "" : "_" + ddKonsentrasiKetercapaian.SelectedItem.Text.Split('(')[1].Split(')')[0]) : "_" + dtTemp.Rows[0][0].ToString().Replace(" ", "")) + ".xlsx");
                Response.BinaryWrite(pck.GetAsByteArray());
            }
        }

        protected void btnExportKehadiranMahasiswa_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = new DataTable();
            string tempKonsentrasi;
            try { tempKonsentrasi = lib.CallProcedure("sia_getKonsentrasiByUser", new string[] { adAuth.GetDisplayName(Context.User.Identity.Name) }).Rows[0][0].ToString(); } catch { tempKonsentrasi = ""; }
            dtTemp = lib.CallProcedure("sia_getDataDashboard", new string[] { "Kehadiran Mahasiswa", Server.HtmlEncode(txtCariKehadiranMahasiswa.Value.Trim()), tempKonsentrasi, ddUrutKehadiranMahasiswa.SelectedValue, ddTahunAjaranKehadiranMahasiswa.SelectedValue, ddTingkatKehadiranMahasiswa.SelectedValue, ddKonsentrasiKehadiranMahasiswa.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
            using (ExcelPackage pck = new ExcelPackage())
            {
                //MEMBUAT SHEET ALL DATA
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add(tempKonsentrasi.Equals("") ? (ddKonsentrasiKehadiranMahasiswa.SelectedValue.Equals("") ? "ALL" : ddKonsentrasiKehadiranMahasiswa.SelectedItem.Text.Split('(')[1].Split(')')[0]) : dtTemp.Rows[0][1].ToString().Trim());
                ws.Cells["A4"].LoadFromDataTable(dtTemp, true);
                ws.DeleteColumn(1);
                ws.DeleteColumn(6);
                ws.Cells["A4"].Value = "Prodi";
                ws.Cells["B4"].Value = "Tingkat";
                ws.Cells["C4"].Value = "NIM";
                ws.Cells["D4"].Value = "Nama";
                ws.Cells["E4"].Value = "Prosentase Rata-Rata Kehadiran";

                ws.Cells["A1"].Value = "Rata-Rata Kehadiran" + (tempKonsentrasi.Equals("") ? (ddKonsentrasiKehadiranMahasiswa.SelectedValue.Equals("") ? "" : " " + ddKonsentrasiKehadiranMahasiswa.SelectedItem.Text.Split('(')[1].Split(')')[0]) : " " + dtTemp.Rows[0][1].ToString().Trim());
                ws.Cells["A1"].Style.Font.Bold = true;
                ws.Cells["A1:E1"].Merge = true;
                ws.Cells["A2"].Value = "(Terakhir diperbarui pada " + checkHari(DateTime.Now.DayOfWeek.ToString()) + ", " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + " | " + DateTime.Now.ToString("HH.mm") + ")";
                ws.Cells["A2"].Style.Font.Bold = true;
                ws.Cells["A2:E2"].Merge = true;

                ws.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Column(3).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Column(5).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                using (ExcelRange rng = ws.Cells["A4:E4"])
                {
                    rng.Style.Font.Bold = true;
                    rng.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                }

                for (int j = 1; j <= 5; j++)
                    ws.Column(j).AutoFit();

                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=Data_Rata_Rata_Kehadiran" + (tempKonsentrasi.Equals("") ? (ddKonsentrasiKehadiranMahasiswa.SelectedValue.Equals("") ? "" : "_" + ddKonsentrasiKehadiranMahasiswa.SelectedItem.Text.Split('(')[1].Split(')')[0]) : "_" + dtTemp.Rows[0][1].ToString().Trim()) + ".xlsx");
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