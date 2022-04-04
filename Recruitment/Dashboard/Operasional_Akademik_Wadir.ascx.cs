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
    public partial class Operasional_Akademik_Wadir : System.Web.UI.UserControl
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
            Session["valueAWadir"] = "KOSONG";
            Session["valueBWadir"] = "KOSONG";
            Session["valueCWadir"] = "KOSONG";
            Session["valueDWadir"] = "KOSONG";
            Session["valueEWadir"] = "KOSONG";
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
            int[,] jumlahPertemuanWadir = new int[ddKonsentrasiKetercapaian.Items.Count - 1, 3];
            int[,] jumlahMateriWadir = new int[ddKonsentrasiKetercapaian.Items.Count - 1, 3];
            int tempIndex = 0;

            dt = lib.CallProcedure("sia_getDataDashboard", new string[] { "Ketercapaian", Server.HtmlEncode(txtCariKetercapaian.Value.Trim()), "", ddUrutKetercapaian.SelectedValue, ddTahunAjaranKetercapaian.SelectedValue, ddSemesterKetercapaian.SelectedValue, ddKonsentrasiKetercapaian.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
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
            if (!Session["valueCWadir"].ToString().Equals("KOSONG") && !Session["valueDWadir"].ToString().Equals("KOSONG") && !Session["valueEWadir"].ToString().Equals("KOSONG"))
                renderGraphicKehadiranMahasiswaWadir();
        }

        protected void loadDataKehadiranMahasiswa()
        {
            int[,] jumlahTingkat1Wadir = new int[ddKonsentrasiKehadiranMahasiswa.Items.Count - 1, 3];
            int[,] jumlahTingkat2Wadir = new int[ddKonsentrasiKehadiranMahasiswa.Items.Count - 1, 3];
            int[,] jumlahTingkat3Wadir = new int[ddKonsentrasiKehadiranMahasiswa.Items.Count - 1, 3];
            int tempIndex = 0;

            dt = lib.CallProcedure("sia_getDataDashboard", new string[] { "Kehadiran Mahasiswa", Server.HtmlEncode(txtCariKehadiranMahasiswa.Value.Trim()), "", ddUrutKehadiranMahasiswa.SelectedValue, ddTahunAjaranKehadiranMahasiswa.SelectedValue, ddTingkatKehadiranMahasiswa.SelectedValue, ddKonsentrasiKehadiranMahasiswa.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
            gridDataKehadiranMahasiswa.DataSource = dt;
            gridDataKehadiranMahasiswa.DataBind();

            string tempResultTingkat1 = "", tempResultTingkat2 = "", tempResultTingkat3 = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                for (int j = 1; j < ddKonsentrasiKehadiranMahasiswa.Items.Count; j++)
                {
                    if (ddKonsentrasiKehadiranMahasiswa.Items[j].Value.Equals(dt.Rows[i][6].ToString()))
                    {
                        tempIndex = j;
                        break;
                    }
                }
                if (dt.Rows[i][2].ToString().Equals("1"))
                {
                    jumlahTingkat1Wadir[tempIndex - 1, 0] += Convert.ToInt32(dt.Rows[i][5].ToString().Replace(" %", ""));
                    jumlahTingkat1Wadir[tempIndex - 1, 1]++;
                }
                else if (dt.Rows[i][2].ToString().Equals("2"))
                {
                    jumlahTingkat2Wadir[tempIndex - 1, 0] += Convert.ToInt32(dt.Rows[i][5].ToString().Replace(" %", ""));
                    jumlahTingkat2Wadir[tempIndex - 1, 1]++;
                }
                else if (dt.Rows[i][2].ToString().Equals("3"))
                {
                    jumlahTingkat3Wadir[tempIndex - 1, 0] += Convert.ToInt32(dt.Rows[i][5].ToString().Replace(" %", ""));
                    jumlahTingkat3Wadir[tempIndex - 1, 1]++;
                }
            }
            for (int i = 0; i < ddKonsentrasiKehadiranMahasiswa.Items.Count - 1; i++)
            {
                try { jumlahTingkat1Wadir[i, 2] = (int)jumlahTingkat1Wadir[i, 0] / jumlahTingkat1Wadir[i, 1]; } catch { jumlahTingkat1Wadir[i, 2] = 0; }
                try { jumlahTingkat2Wadir[i, 2] = (int)jumlahTingkat2Wadir[i, 0] / jumlahTingkat2Wadir[i, 1]; } catch { jumlahTingkat2Wadir[i, 2] = 0; }
                try { jumlahTingkat3Wadir[i, 2] = (int)jumlahTingkat3Wadir[i, 0] / jumlahTingkat3Wadir[i, 1]; } catch { jumlahTingkat3Wadir[i, 2] = 0; }
                tempResultTingkat1 += jumlahTingkat1Wadir[i, 2].ToString() + ",";
                tempResultTingkat2 += jumlahTingkat2Wadir[i, 2].ToString() + ",";
                tempResultTingkat3 += jumlahTingkat3Wadir[i, 2].ToString() + ",";
            }
            tempResultTingkat1 = "[" + tempResultTingkat1.Substring(0, tempResultTingkat1.Length - 1) + "]";
            tempResultTingkat2 = "[" + tempResultTingkat2.Substring(0, tempResultTingkat2.Length - 1) + "]";
            tempResultTingkat3 = "[" + tempResultTingkat3.Substring(0, tempResultTingkat3.Length - 1) + "]";
            Session["valueCWadir"] = tempResultTingkat1;
            Session["valueDWadir"] = tempResultTingkat2;
            Session["valueEWadir"] = tempResultTingkat3;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKehadiranMahasiswaWadir", "setValueKehadiranMahasiswaWadir(" + tempResultTingkat1 + "," + tempResultTingkat2 + "," + tempResultTingkat3 + "," + Session["valueListKonsentrasi"].ToString() + ");", true);
            if (!Session["valueAWadir"].ToString().Equals("KOSONG") && !Session["valueBWadir"].ToString().Equals("KOSONG"))
                renderGraphicKetercapaianWadir();
        }

        protected void renderGraphicKetercapaianWadir()
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKetercapaianWadir", "setValueKetercapaianWadir(" + Session["valueAWadir"].ToString() + "," + Session["valueBWadir"].ToString() + "," + Session["valueListKonsentrasi"].ToString() + ");", true);
        }

        protected void renderGraphicKehadiranMahasiswaWadir()
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "setValueKehadiranMahasiswaWadir", "setValueKehadiranMahasiswaWadir(" + Session["valueCWadir"].ToString() + "," + Session["valueDWadir"].ToString() + "," + Session["valueEWadir"].ToString() + "," + Session["valueListKonsentrasi"].ToString() + ");", true);
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

            for (int i = 0; i < dt.Rows.Count; i++)
                tempKonsentrasi += "\"" + dt.Rows[i][1].ToString() + "\",";
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
            renderGraphicKetercapaianWadir();
            renderGraphicKehadiranMahasiswaWadir();
        }

        protected void btnDetailKetercapaianHide_Click(object sender, EventArgs e)
        {
            btnDetailKetercapaianShow.Visible = true;
            btnDetailKetercapaianHide.Visible = false;
            divKetercapaian.Visible = false;
            renderGraphicKetercapaianWadir();
            renderGraphicKehadiranMahasiswaWadir();
        }

        protected void btnDetailKehadiranMahasiswaShow_Click(object sender, EventArgs e)
        {
            btnDetailKehadiranMahasiswaShow.Visible = false;
            btnDetailKehadiranMahasiswaHide.Visible = true;
            divKehadiranMahasiswa.Visible = true;
            renderGraphicKetercapaianWadir();
            renderGraphicKehadiranMahasiswaWadir();
        }

        protected void btnDetailKehadiranMahasiswaHide_Click(object sender, EventArgs e)
        {
            btnDetailKehadiranMahasiswaShow.Visible = true;
            btnDetailKehadiranMahasiswaHide.Visible = false;
            divKehadiranMahasiswa.Visible = false;
            renderGraphicKetercapaianWadir();
            renderGraphicKehadiranMahasiswaWadir();
        }

        protected void btnExportKetercapaian_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = new DataTable();
            dtTemp = lib.CallProcedure("sia_getDataDashboard", new string[] { "Report Ketercapaian", Context.User.Identity.Name, Server.HtmlEncode(txtCariKetercapaian.Value.Trim()), ddTahunAjaranKetercapaian.SelectedValue, ddSemesterKetercapaian.SelectedValue, ddKonsentrasiKetercapaian.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
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

        protected void btnExportKehadiranMahasiswa_Click(object sender, EventArgs e)
        {
            DataTable dtTemp = new DataTable();
            dtTemp = lib.CallProcedure("sia_getDataDashboard", new string[] { "Kehadiran Mahasiswa", Server.HtmlEncode(txtCariKehadiranMahasiswa.Value.Trim()), "", ddUrutKehadiranMahasiswa.SelectedValue, ddTahunAjaranKehadiranMahasiswa.SelectedValue, ddTingkatKehadiranMahasiswa.SelectedValue, ddKonsentrasiKehadiranMahasiswa.SelectedValue, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], "0", adAuth.GetDisplayName(Context.User.Identity.Name) });
            using (ExcelPackage pck = new ExcelPackage())
            {
                //MEMBUAT SHEET ALL DATA
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add(ddKonsentrasiKehadiranMahasiswa.SelectedValue.Equals("") ? "ALL" : ddKonsentrasiKehadiranMahasiswa.SelectedItem.Text.Split('(')[1].Split(')')[0]);
                ws.Cells["A4"].LoadFromDataTable(dtTemp, true);
                ws.DeleteColumn(1);
                ws.DeleteColumn(6);
                ws.Cells["A4"].Value = "Prodi";
                ws.Cells["B4"].Value = "Tingkat";
                ws.Cells["C4"].Value = "NIM";
                ws.Cells["D4"].Value = "Nama";
                ws.Cells["E4"].Value = "Prosentase Rata-Rata Kehadiran";

                ws.Cells["A1"].Value = "Rata-Rata Kehadiran" + (ddKonsentrasiKehadiranMahasiswa.SelectedValue.Equals("") ? "" : " " + ddKonsentrasiKehadiranMahasiswa.SelectedItem.Text.Split('(')[1].Split(')')[0]);
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
                Response.AddHeader("content-disposition", "attachment;  filename=Data_Rata_Rata_Kehadiran" + (ddKonsentrasiKehadiranMahasiswa.SelectedValue.Equals("") ? "" : "_" + ddKonsentrasiKehadiranMahasiswa.SelectedItem.Text.Split('(')[1].Split(')')[0]) + ".xlsx");
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