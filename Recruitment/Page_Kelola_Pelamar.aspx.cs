using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web;
using System.Reflection;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace Recruitment
{
    public partial class Page_Kelola_Pelamar : System.Web.UI.Page
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();
        string[] listField = new string[2] { "jku_nama asc", "jku_nama desc" };
        string[] listTextField = new string[2] { "Nama Jenis [↑]", "Nama Jenis [↓]" };
        private static string pel_id;
        private static string url_image;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //try
                //{
                //    if (!((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[1].Equals("APP08") || lib.CallProcedure("all_getMenuByRole", new string[] { Context.User.Identity.Name, ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[1], Request.Path.Split('/')[Request.Path.Split('/').Length - 1].Replace(".aspx", "") }).Rows.Count == 0)
                //        Response.Redirect(WebConfigurationManager.AppSettings["linkSSO"]);
                //}
                //catch { Response.Redirect(WebConfigurationManager.AppSettings["linkSSO"]); }

                //ddUrut.Items.Clear();
                //for (int i = 0; i < listField.Length; i++)
                //    ddUrut.Items.Add(new ListItem(listTextField[i], listField[i]));
            }
            loadData();

            //if (((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0].Equals("ROL22"))
            //    divAdd.Visible = false;
            gridData.Width = Unit.Percentage(100);
            hideAlert();
            try
            {
                if (Session["success"] != null)
                {
                    //showAlertSuccess(Session["success"].ToString());
                    showAlertSuccess1(Session["success"].ToString());
                }
            }
            catch { }
            finally
            {
                Session["success"] = null;
            }

            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AddHeader("Expires", "0");
        }

        protected void showFinale()
        {
            if (lib.CallProcedure("rec_checkIsFinal", new string[] { pel_id }).Rows[0][0].ToString().Equals("Y"))
            {
                hidePanel(true, true, true, true, true, true, true, true);
                loadPanelSatuData(pel_id);
                loadPanelDuaData(pel_id);
                loadPanelTigaData(pel_id);
                loadPanelEmpatData(pel_id);
                loadPanelLimaData(pel_id);
                loadPanelEnamData(pel_id);
                loadPanelTujuhData(pel_id);
                makeAllControlsDisable(Form);
                panelData.Visible = false;
                btnKembali.Enabled = true;
                btnPrintPDF.Enabled = true;
            }
        }
        private void makeAllControlsDisable(System.Web.UI.Control control)
        {
            foreach (System.Web.UI.Control c in control.Controls)
            {
                // Get the Enabled property by reflection.
                Type type = c.GetType();
                PropertyInfo prop = type.GetProperty("Enabled");

                // Set it to False to disable the control.
                if (prop != null)
                {
                    prop.SetValue(c, false, null);
                }

                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    this.makeAllControlsDisable(c);
                }
            }
        }
        private void makeAllControlsEnable(System.Web.UI.Control control)
        {
            foreach (System.Web.UI.Control c in control.Controls)
            {
                // Get the Enabled property by reflection.
                Type type = c.GetType();
                PropertyInfo prop = type.GetProperty("Enabled");

                // Set it to False to disable the control.
                if (prop != null)
                {
                    prop.SetValue(c, true, null);
                }

                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    this.makeAllControlsEnable(c);
                }
            }
        }

        protected void loadDataPendidikanFormal()
        {
            gridDataPendidikanFormal.DataSource = lib.CallProcedure("rec_getListFormalPendidikan", new string[] { pel_id });
            gridDataPendidikanFormal.DataBind();
        }
        protected void loadDataPendidikanNonFormal()
        {
            gridDataPendidikanNonFormal.DataSource = lib.CallProcedure("rec_getListNonFormalPendidikan", new string[] { pel_id });
            gridDataPendidikanNonFormal.DataBind();
        }

        protected void loadDataBahasa()
        {
            gridDataBahasa.DataSource = lib.CallProcedure("rec_getListBahasa", new string[] { pel_id });
            gridDataBahasa.DataBind();
        }

        protected void loadDataMinatPekerjaan()
        {
            gridDataMinatPekerjaan.DataSource = lib.CallProcedure("rec_getListMinatPekerjaan", new string[] { pel_id });
            gridDataMinatPekerjaan.DataBind();
        }

        protected void loadDataKeluargaSendiri()
        {
            gridDataKeluargaSendiri.DataSource = lib.CallProcedure("rec_getListKeluargaSendiri", new string[] { pel_id });
            gridDataKeluargaSendiri.DataBind();
        }

        protected void loadDataKeluargaOrtu()
        {
            gridDataKeluargaOrtu.DataSource = lib.CallProcedure("rec_getListKeluargaOrtu", new string[] { pel_id });
            gridDataKeluargaOrtu.DataBind();
        }
        protected void loadDataRiwayatPekerjaan()
        {
            gridDataRiwayatPekerjaan.DataSource = lib.CallProcedure("rec_getListPengalamanKerja", new string[] { pel_id });
            gridDataRiwayatPekerjaan.DataBind();
        }

        protected void loadDataRiwayatAtasan()
        {
            gridDataRiwayatAtasan.DataSource = lib.CallProcedure("rec_getListRiwayatBawahan", new string[] { pel_id });
            gridDataRiwayatAtasan.DataBind();
        }

        protected void loadDataKenalanPerusahaan()
        {
            gridDataKenalanPerusahaan.DataSource = lib.CallProcedure("rec_getListKenalanPerusahaan", new string[] { pel_id });
            gridDataKenalanPerusahaan.DataBind();
        }

        protected void loadDataKeluargaHubungi()
        {
            gridDataKeluargaHubungi.DataSource = lib.CallProcedure("rec_getListKeluargaHubungi", new string[] { pel_id });
            gridDataKeluargaHubungi.DataBind();
        }


        protected void loadDataRiwayatOrganisasi()
        {
            gridDataRiwayatOrganisasi.DataSource = lib.CallProcedure("rec_getListRiwayatOrganisasi", new string[] { pel_id });
            gridDataRiwayatOrganisasi.DataBind();
        }

        protected void loadDataRiwayatPsikotes()
        {
            gridDataRiwayatPsikotes.DataSource = lib.CallProcedure("rec_getListRiwayatPsikotes", new string[] { pel_id });
            gridDataRiwayatPsikotes.DataBind();
        }

        protected void loadDataRiwayatPenyakit()
        {
            gridDataRiwayatPenyakit.DataSource = lib.CallProcedure("rec_getListRiwayatPenyakit", new string[] { pel_id });
            gridDataRiwayatPenyakit.DataBind();
        }
        protected void loadDataRefrensiPerushaan()
        {
            gridDataRefrensiPerusahaan.DataSource = lib.CallProcedure("rec_getListRefrensiPerusahaan", new string[] { pel_id });
            gridDataRefrensiPerusahaan.DataBind();
        }

        protected void hidePanel(bool panelSatu, bool panelDua, bool panelTiga, bool panelEmpat, bool panelLima, bool panelEnam, bool panelTujuh, bool panelDelapan)
        {
            this.panelSatuIdentitas.Visible = panelSatu;
            this.panelDuaPendidikan.Visible = panelDua;
            this.panelTigaLingKeluarga.Visible = panelTiga;
            this.panelEmpatRiwayatPekerjaan.Visible = panelEmpat;
            this.panelLimaMinatKonsepPribadi.Visible = panelLima;
            this.panelEnamAktivitasSosial.Visible = panelEnam;
            this.panelTujuhLainLain.Visible = panelTujuh;
        }


        protected void loadPanelSatuData(String id)
        {
            string saveDir = @"~/Images/";

            dt = lib.CallProcedure("rec_detailPelamar1Identitas", new string[] { id });

            txtNamaLengkap.Text = dt.Rows[0][0].ToString();
            txtTempatLahir.Text = dt.Rows[0][1].ToString();
            txtTglLahir.Text = dt.Rows[0][2].ToString();
            txtNoKTP.Text = dt.Rows[0][3].ToString();
            txtNoRek.Text = dt.Rows[0][4].ToString();
            txtNamaBank.Text = dt.Rows[0][5].ToString();
            txtNamaPenerimRek.Text = dt.Rows[0][6].ToString();
            txtNoNPWP.Text = dt.Rows[0][7].ToString();
            txtAlamatSkrg.Text = dt.Rows[0][8].ToString();
            txtAlamatOrtu.Text = dt.Rows[0][9].ToString();
            txtTelpOrtu.Text = dt.Rows[0][10].ToString();
            txtTelpSkrg.Text = dt.Rows[0][11].ToString();
            txtNoHP.Text = dt.Rows[0][12].ToString();
            txtEmail.Text = dt.Rows[0][13].ToString();
            txtUkuranBaju.Text = dt.Rows[0][14].ToString();
            txtUkuranSepatu.Text = dt.Rows[0][15].ToString();
            ddlAgama.SelectedValue = dt.Rows[0][16].ToString();
            Avatar.ImageUrl = saveDir + dt.Rows[0][17].ToString();
            url_image = dt.Rows[0][17].ToString();

        }

        protected void loadPanelDuaData(String id)
        {
            dt = lib.CallProcedure("rec_detailPelamar2Pendidikan", new string[] { id });
            txtAlasanPilihJurusan.Text = dt.Rows[0][0].ToString();
            txtKaryaIlmiah.Text = dt.Rows[0][1].ToString();
            loadDataPendidikanFormal();
            loadDataPendidikanNonFormal();
            loadDataBahasa();
        }


        protected void loadPanelTigaData(String id)
        {
            dt = lib.CallProcedure("rec_detailPelamar3LingkunganKeluarga", new string[] { id });
            if (dt.Rows[0][0].ToString() == "Single/Tungangan")
                rbStatusPernikahan.SelectedIndex = 0;
            else if (dt.Rows[0][0].ToString() == "Menikah")
                rbStatusPernikahan.SelectedIndex = 1;
            else if (dt.Rows[0][0].ToString() == "Bercerai")
                rbStatusPernikahan.SelectedIndex = 2;

            txtStatusTgl.Text = dt.Rows[0][1].ToString();
            loadDataKeluargaSendiri();
            loadDataKeluargaOrtu();

        }
        protected void loadPanelEmpatData(String id)
        {
            dt = lib.CallProcedure("rec_detailPelamar4RiwayatPekerjaan", new string[] { id });
            txtMasalahCaraAtasi.Text = dt.Rows[0][0].ToString();

            if (dt.Rows[0][1].ToString() == "Ya")
                rbMelakukanPerubahan.SelectedIndex = 0;
            else if (dt.Rows[0][1].ToString() == "Tidak")
                rbMelakukanPerubahan.SelectedIndex = 1;
            txtMelakukanPerubahanKet.Text = dt.Rows[0][2].ToString();
            txtMendorongKemajuan.Text = dt.Rows[0][3].ToString();
            txtHadapiSoalKerja.Text = dt.Rows[0][4].ToString();

            loadDataRiwayatPekerjaan();
            loadDataRiwayatAtasan();
        }
        protected void loadPanelLimaData(String id)
        {
            try
            {
                dt = lib.CallProcedure("rec_detailPelamar5MinatKonsepPribadi", new string[] { id });
                txtCitaCita.Text = dt.Rows[0][0].ToString();
                txtDorongKerja.Text = dt.Rows[0][1].ToString();
                txtAlasanKerja.Text = dt.Rows[0][2].ToString();
                txtGajiHarapan.Text = string.Format("{0:#,##0}", double.Parse(dt.Rows[0][3].ToString()));
                txtGajiHarapan.Text = txtGajiHarapan.Text.ToString().Replace(",", ".");
                txtFasilitasHarapan.Text = dt.Rows[0][4].ToString();
                txtMulaiKerja.Text = dt.Rows[0][5].ToString();

                if (dt.Rows[0][6].ToString() == "Lapangan")
                    rbLingkunganKerjaSenang.SelectedIndex = 0;
                else if (dt.Rows[0][6].ToString() == "Kantor")
                    rbLingkunganKerjaSenang.SelectedIndex = 1;
                else if (dt.Rows[0][6].ToString() == "Pabrik")
                    rbLingkunganKerjaSenang.SelectedIndex = 2;
                else
                {
                    rbLingkunganKerjaSenang.SelectedIndex = 3;
                    txtLingkunganKerjaSenang.Visible = true;
                    txtLingkunganKerjaSenang.Text = dt.Rows[0][6].ToString();
                }

                if (dt.Rows[0][7].ToString() == "Ya")
                    rbSediaLuarDaerah.SelectedIndex = 0;
                else if (dt.Rows[0][7].ToString() == "Tidak")
                    rbSediaLuarDaerah.SelectedIndex = 1;

                txtTipeSenangi.Text = dt.Rows[0][8].ToString();
                txtSulitKeputusan.Text = dt.Rows[0][9].ToString();
                loadDataMinatPekerjaan();
            }
            catch (Exception ex)
            {
                showAlertDanger(ex.ToString());
            }



        }
        protected void loadPanelEnamData(String id)
        {
            try
            {
                dt = lib.CallProcedure("rec_detailPelamar6AktivitasSosial", new string[] { id });
                if (dt.Rows[0][0].ToString() == "Ya")
                    rbAdaKenalan.SelectedIndex = 0;
                else if (dt.Rows[0][0].ToString() == "Tidak")
                    rbAdaKenalan.SelectedIndex = 1;
                txtHobi.Text = dt.Rows[0][1].ToString();
                txtIsiWaktuLuang.Text = dt.Rows[0][2].ToString();

                if (rbAdaKenalan.SelectedIndex == 1)
                {
                    gridDataKenalanPerusahaan.Visible = false;
                }
                else
                {
                    gridDataKenalanPerusahaan.Visible = true;
                }

                loadDataKenalanPerusahaan();
                loadDataKeluargaHubungi();
                loadDataRiwayatOrganisasi();
                loadDataRefrensiPerushaan();
            }
            catch (Exception ex)
            {
                showAlertDanger(ex.ToString());
            }

        }
        protected void loadPanelTujuhData(String id)
        {
            dt = lib.CallProcedure("rec_detailPelamar7LainLain", new string[] { id });
            txtKekuatan.Text = dt.Rows[0][0].ToString();
            txtKelemahan.Text = dt.Rows[0][1].ToString();

            loadDataRiwayatPenyakit();
            loadDataRiwayatPsikotes();
        }


        protected void loadData()
        {
            gridData.DataSource = lib.CallProcedure("rec_getListPelamarFinal", new string[] { });
            gridData.DataBind();
        }



        protected void gridData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridData.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void gridData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridData.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Detail")
            {
                pel_id = id;
                pelamar_id.Text = id;
                showFinale();
                btnKembali.Visible = true;
                btnPrintPDF.Visible = true;

            }

        }

        protected void showAlertDanger(string message)
        {
            divAlert.Visible = true;
            dangerMessage.Text = message;
        }

        protected void showAlertSuccess(string message)
        {
            divSuccess.Visible = true;
            successMessage.Text = message;
        }

        protected void hideAlert()
        {
            divAlert.Visible = false;
            divSuccess.Visible = false;
        }

        protected void showAlertDanger1(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showAlertDanger", "swal({type: 'error', html: '" + message + "'});", true);
        }

        protected void showAlertSuccess1(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showAlertSuccess", "swal({type: 'success', html: '" + message + "'});", true);
        }

        protected void btnKembali_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, false, false, false, false, false, false);
            panelData.Visible = true;
            makeAllControlsEnable(Form);
            btnKembali.Visible = false;
            btnPrintPDF.Visible = false;
        }

        protected void btnPrintPDF_Click(object sender, EventArgs e)
        {
            Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
            using (ReportDocument reportdocument = new ReportDocument())
            {
                reportdocument.Load(Server.MapPath("Report_Pelamar.rpt"));
                //reportdocument.Load(Server.MapPath("CrystalReport1.rpt"));
                reportdocument.SetDatabaseLogon(WebConfigurationManager.
                    AppSettings["linkUserID"], WebConfigurationManager.
                    AppSettings["linkPassword"], WebConfigurationManager.
                    AppSettings["linkServerName"], WebConfigurationManager.
                    AppSettings["linkDatabaseName"]);

                for (int i = 1; i <= 50; i++)
                {
                    string param = "@p" + i.ToString();
                    reportdocument.SetParameterValue(param, pelamar_id.Text);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[0].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[1].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[2].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[3].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[4].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[5].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[6].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[7].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[8].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[9].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[10].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[11].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[12].Name);
                    reportdocument.SetParameterValue(param, pelamar_id.Text, reportdocument.Subreports[13].Name);
                }
                reportdocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Lamaran" + unixTimestamp.ToString());

            }
        }

    }
}