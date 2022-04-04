using New_SIA.Classes;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web;
using System.Reflection;

namespace Recruitment
{
    public partial class Page_Formulir_Pelamar : System.Web.UI.Page
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();
        private static string pel_id;
        private static string url_image;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                pel_id = ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[2];
            }
            catch { Response.Redirect("Page_Logout.aspx"); }

            hideAlert();
            try
            {
                if (Session["success"] != null)
                    showAlertSuccess(Session["success"].ToString());
            }
            catch { }
            finally
            {
                Session["success"] = null;
            }

            showFinale();
            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AddHeader("Expires", "0");
        }

        protected void showFinale()
        {

            if (lib.CallProcedure("rec_checkIsFinal", new string[] { pel_id }).Rows[0][0].ToString().Equals("Y"))
            {
                panelLand.Visible = false;
                hidePanel(true, true, true, true, true, true, true, true);
                loadPanelSatuData(pel_id);
                loadPanelDuaData(pel_id);
                loadPanelTigaData(pel_id);
                loadPanelEmpatData(pel_id);
                loadPanelLimaData(pel_id);
                loadPanelEnamData(pel_id);
                loadPanelTujuhData(pel_id);
                showAlertSuccess("Formulir anda berhasil dikirimkan!");
                makeAllControlsDisable(Form);
                hideAllButtons();
                hideKolomAksi(false);
            }

        }

        private void hideKolomAksi(Boolean isVisible)
        {
            try
            {
                gridDataPendidikanFormal.Columns[8].Visible = isVisible;
                gridDataPendidikanNonFormal.Columns[5].Visible = isVisible;
                gridDataBahasa.Columns[4].Visible = isVisible;
                gridDataKeluargaSendiri.Columns[7].Visible = isVisible;
                gridDataKeluargaOrtu.Columns[7].Visible = isVisible;
                gridDataRiwayatPekerjaan.Columns[8].Visible = isVisible;
                gridDataMinatPekerjaan.Columns[2].Visible = isVisible;
                gridDataRiwayatAtasan.Columns[5].Visible = isVisible;
                gridDataKenalanPerusahaan.Columns[6].Visible = isVisible;
                gridDataKeluargaHubungi.Columns[4].Visible = isVisible;
                gridDataRefrensiPerusahaan.Columns[6].Visible = isVisible;
                gridDataRiwayatOrganisasi.Columns[5].Visible = isVisible;
                gridDataRiwayatPsikotes.Columns[4].Visible = isVisible;
                gridDataRiwayatPenyakit.Columns[4].Visible = isVisible;
            }
            catch { }


        }

        protected void updateDataPanelSatu(String url)
        {
            lib.CallProcedure("rec_editPelamar1Identitas", new string[] {
                pel_id,
                txtNamaLengkap.Text.Trim().ToUpper(),
                txtTempatLahir.Text.Trim().ToUpper(),
                txtTglLahir.Text.Trim(),
                txtNoKTP.Text.Trim(),
                txtNoRek.Text.Trim(),
                txtNamaBank.Text.Trim().ToUpper(),
                txtNamaPenerimRek.Text.Trim().ToUpper(),
                txtNoNPWP.Text.Trim(),
                txtAlamatSkrg.Text.Trim().ToUpper(),
                txtAlamatOrtu.Text.Trim().ToUpper(),
                txtTelpOrtu.Text.Trim(),
                txtTelpSkrg.Text.Trim(),
                txtNoHP.Text.Trim(),
                txtEmail.Text.Trim().ToUpper(),
                ddlUkuranBaju.SelectedValue.ToString(),
                txtUkuranSepatu.Text.Trim(),
                url,
                ddlAgama.SelectedValue.ToString().Trim()
            });
        }
        protected void updateDataPanelDua()
        {
            lib.CallProcedure("rec_editPelamar2Pendidikan", new string[] {
                pel_id,
                txtAlasanPilihJurusan.Text.Trim(),
                txtKaryaIlmiah.Text.Trim()
            });
        }
        protected void updateDataPanelTiga()
        {
            lib.CallProcedure("rec_editPelamar3LingkunganKeluarga", new string[] {
                pel_id,
                rbStatusPernikahan.SelectedValue.ToString().Trim(),
                txtStatusTgl.Text.Trim()
            });
        }
        protected void updateDataPanelEmpat()
        {
            lib.CallProcedure("rec_editPelamar4RiwayatPekerjaan", new string[] {
                pel_id,
                txtMasalahCaraAtasi.Text.Trim(),
                rbMelakukanPerubahan.SelectedValue.ToString().Trim(),
                txtMelakukanPerubahanKet.Text.Trim(),
                txtMendorongKemajuan.Text.Trim(),
                txtHadapiSoalKerja.Text.Trim()
            });
        }
        protected void updateDataPanelLima()
        {
            string lingkungan_kerja;
            if (rbLingkunganKerjaSenang.SelectedIndex == 3)
                lingkungan_kerja = txtLingkunganKerjaSenang.Text.ToString().Trim();
            else
                lingkungan_kerja = rbLingkunganKerjaSenang.SelectedValue.ToString().Trim();

            string cleanAmount = txtGajiHarapan.Text.ToString().Replace(".", string.Empty);
            lib.CallProcedure("rec_editPelamar5MinatKonsep", new string[] {
                pel_id,
                txtCitaCita.Text.Trim(),
                txtDorongKerja.Text.Trim(),
                txtAlasanKerja.Text.Trim(),
                cleanAmount,
                txtFasilitasHarapan.Text.Trim(),
                txtMulaiKerja.Text.Trim(),
                lingkungan_kerja,
                rbSediaLuarDaerah.SelectedValue.ToString().Trim(),
                txtTipeSenangi.Text.Trim(),
                txtSulitKeputusan.Text.Trim()
            });
        }
        protected void updateDataPanelEnam()
        {
            lib.CallProcedure("rec_editPelamar6AktivitasSosial", new string[] {
                pel_id,
                rbAdaKenalan.SelectedValue.ToString().Trim(),
                txtHobi.Text.Trim(),
                txtIsiWaktuLuang.Text.Trim()
            });

        }
        protected void updateDataPanelTujuh()
        {
            lib.CallProcedure("rec_editPelamar7LainLain", new string[] {
                pel_id,
                txtKekuatan.Text.Trim(),
                txtKelemahan.Text.Trim()
            });
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
            ddlUkuranBaju.SelectedValue = dt.Rows[0][14].ToString();
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

            //load tabel yg ada di panel

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

            //load tabel yg ada di panel
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

            //load tabel yg ada di panel
            loadDataRiwayatPekerjaan();
            loadDataRiwayatAtasan();
            loadDataKenalanPerusahaan();
        }
        protected void loadPanelLimaData(String id)
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
            //load tabel yg ada di panel
            loadDataMinatPekerjaan();
            if (lib.CallProcedure("rec_checkIs3JenisPekerjaan", new string[] { pel_id }).Rows[0][0].ToString().Equals("Y"))
                linkAddMinatPekerjaan.Enabled = false;
            else
                linkAddMinatPekerjaan.Enabled = true;

        }
        protected void loadPanelEnamData(String id)
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
                linkAddKenalanPerusahaan.Visible = false;
                gridDataKenalanPerusahaan.Visible = false;
            }
            else
            {
                linkAddKenalanPerusahaan.Visible = true;
                gridDataKenalanPerusahaan.Visible = true;
            }
            //load tabel yg ada di panel
            loadDataKenalanPerusahaan();
            loadDataKeluargaHubungi();
            loadDataRiwayatOrganisasi();
            loadDataRefrensiPerushaan();
        }
        protected void loadPanelTujuhData(String id)
        {
            dt = lib.CallProcedure("rec_detailPelamar7LainLain", new string[] { id });
            txtKekuatan.Text = dt.Rows[0][0].ToString();
            txtKelemahan.Text = dt.Rows[0][1].ToString();

            loadDataRiwayatPenyakit();
            loadDataRiwayatPsikotes();
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

        protected void hideAllButtons()
        {
            btnFinalTujuhLainLain.Visible = false;
            txtFoto.Visible = false;
            btnNextSatuIdentitas.Visible = false;
            btnNextDuaPendidikan.Visible = false;
            btnNextTigaLingKeluarga.Visible = false;
            btnNextEmpatRiwayatPekerjaan.Visible = false;
            btnNextLimaMinatKonsepPribadi.Visible = false;
            btnNextEnamAktivitasSosial.Visible = false;

            btnPrevDuaPendidikan.Visible = false;
            btnPrevTigaLingKeluarga.Visible = false;
            btnPrevEmpatRiwayatPekerjaan.Visible = false;
            btnPrevLimaMinatKonsepPribadi.Visible = false;
            btnPrevEnamAktivitasSosial.Visible = false;
            btnPrevTujuhLainLain.Visible = false;

            linkAddBahasa.Visible = false;
            linkAddKeluargaHubungi.Visible = false;
            linkAddKeluargaOrtu.Visible = false;
            linkAddKeluargaSendiri.Visible = false;
            linkAddKenalanPerusahaan.Visible = false;
            linkAddMinatPekerjaan.Visible = false;
            linkAddOrganisasi.Visible = false;
            linkAddPenFor.Visible = false;
            linkAddPengalamanKerja.Visible = false;
            linkAddPenNonFor.Visible = false;
            linkAddRefrensiPerusahaan.Visible = false;
            linkAddRiwayatBawahan.Visible = false;
            linkAddRiwPenyakit.Visible = false;
            linkAddRiwPsikotes.Visible = false;

        }

        protected void hideAlert()
        {
            divAlert.Visible = false;
            divSuccess.Visible = false;
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

        protected void clearForm()
        {
            //tku_id.Text = "";
            //tmpId.Text = "";
            //addNama.Text = "";
            //addJenis.SelectedIndex = 0;
        }



        protected void btnNextSatuIdentitas_Click(object sender, EventArgs e)
        {
            //case1: dia upload gambar
            //case2: dia upload tapi gambar default
            if (
                (url_image != "IMG_NoImageHuman.png" && txtFoto.HasFile == true) ||
                (url_image == "IMG_NoImageHuman.png" && txtFoto.HasFile == true))
            {
                if (uploadFoto())
                {
                    hidePanel(false, true, false, false, false, false, false, false);
                    updateDataPanelSatu(url_image);
                    loadPanelDuaData(pel_id);
                }
            }
            //case1 untuk dia udah upload gambar, tapi balik ke halaman 1. 
            //case2: dia ga upload, tapi gambar masi default
            else if ((url_image != "IMG_NoImageHuman.png" && txtFoto.HasFile == false) ||
                (url_image == "IMG_NoImageHuman.png" && txtFoto.HasFile == false))
            {
                hidePanel(false, true, false, false, false, false, false, false);
                updateDataPanelSatu(url_image);
                loadPanelDuaData(pel_id);
            }

        }

        protected void btnNextDuaPendidikan_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, true, false, false, false, false, false);
            updateDataPanelDua();
            loadPanelTigaData(pel_id);

        }

        protected void btnPrevDuaPendidikan_Click(object sender, EventArgs e)
        {
            hidePanel(true, false, false, false, false, false, false, false);
            updateDataPanelDua();
            loadPanelSatuData(pel_id);
        }

        protected void btnNextTigaLingKeluarga_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, false, true, false, false, false, false);
            updateDataPanelTiga();
            loadPanelEmpatData(pel_id);

        }

        protected void btnPrevTigaLingKeluarga_Click(object sender, EventArgs e)
        {
            hidePanel(false, true, false, false, false, false, false, false);
            updateDataPanelTiga();
            loadPanelDuaData(pel_id);
        }

        protected void btnPrevEmpatRiwayatPekerjaan_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, true, false, false, false, false, false);
            updateDataPanelEmpat();
            loadPanelTigaData(pel_id);

        }

        protected void btnNextEmpatRiwayatPekerjaan_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, false, false, true, false, false, false);
            updateDataPanelEmpat();
            loadPanelLimaData(pel_id);
        }

        protected void btnPrevLimaMinatKonsepPribadi_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, false, true, false, false, false, false);
            updateDataPanelLima();
            loadPanelEmpatData(pel_id);

        }

        protected void btnNextLimaMinatKonsepPribadi_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, false, false, false, true, false, false);
            updateDataPanelLima();
            loadPanelEnamData(pel_id);

        }

        protected void btnPrevEnamAktivitasSosial_Click(object sender, EventArgs e)
        {

            hidePanel(false, false, false, false, true, false, false, false);
            updateDataPanelEnam();
            loadPanelLimaData(pel_id);

        }

        protected void btnNextEnamAktivitasSosial_Click(object sender, EventArgs e)
        {

            if (lib.CallProcedure("rec_checkHasDataKeluargaHubungi", new string[] { pel_id }).Rows[0][0].ToString().Equals("N"))
            {
                showAlertDanger("Tambahkan No.Telp teman/keluarga minimal 1 ");
            }
            else
            {
                hidePanel(false, false, false, false, false, false, true, false);
                updateDataPanelEnam();
                loadPanelTujuhData(pel_id);
            }

        }

        protected void btnFinalTujuhLainLain_Click(object sender, EventArgs e)
        {
            updateDataPanelTujuh();
            lib.CallProcedure("rec_editPelamarFinalisasi", new string[] {
                        pel_id
                    });
            showFinale();
            Response.Redirect("Page_Formulir_Pelamar.aspx");
        }

        protected void btnPrevTujuhLainLain_Click(object sender, EventArgs e)
        {
            hidePanel(false, false, false, false, false, true, false, false);
            updateDataPanelTujuh();
            loadPanelEnamData(pel_id);

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

        private Boolean uploadFoto()
        {
            string saveDir = @"\Images\";
            string appPath = Request.PhysicalApplicationPath;
            string tempLinkBerkas = "";
            try
            {
                if (txtFoto.HasFile)
                {
                    string tempExtensi = MimeDetector.getMimeType(appPath + saveDir, txtFoto.PostedFile);

                    if (txtFoto.PostedFile.ContentLength > 5242880)
                        showAlertDanger("Error:<br>- Berkas Foto terlalu besar. Maksumum adalah 2 MB");
                    else if (!Path.GetExtension(txtFoto.FileName).ToLower().Equals(".jpg") && !Path.GetExtension(txtFoto.FileName).ToLower().Equals(".png"))
                        showAlertDanger("Error:<br>- Berkas Foto harus berformat .jpg atau .png");
                    else if (!tempExtensi.Trim().Equals("image/jpeg") && !tempExtensi.Trim().Equals("image/png"))
                        showAlertDanger("Error:<br>- Berkas Foto harus berformat .jpg atau .png");
                    else
                    {
                        url_image = tempLinkBerkas = "IMP_" + lib.Encrypt(txtFoto.FileName + "#" + DateTime.Now.ToString(), "PolmanAstra_SIA") + "." + txtFoto.FileName.Split('.')[txtFoto.FileName.Split('.').Length - 1];
                        txtFoto.SaveAs(appPath + saveDir + tempLinkBerkas);
                        return true;

                    }
                }
                else
                    showAlertDanger("Error:<br>- Mohon pilih berkas terlebih dahulu");

            }
            catch
            {
                showAlertDanger("Error:<br>- Terjadi kesalahan sistem. Mohon hubungi bagian MIS");
            }
            return false;

        }

        protected void gridDataPendidikanFormal_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataPendidikanFormal_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataPendidikanFormal.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteFormalPendidikan", new string[] { id });
                loadDataPendidikanFormal();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelDua();
                hidePanel(false, false, false, false, false, false, false, false);
                panelPendidikanFormal.Visible = true;
                cardHeaderPenFor.Text = "Ubah Pendidikan Formal";
                btnEditPenFor.Visible = true;
                btnAddPenFor.Visible = false;

                dt = lib.CallProcedure("rec_detailFormalPendidikan", new string[] { id });
                fop_id.Text = id;
                addJenjangPenFor.SelectedValue = dt.Rows[0][2].ToString();
                addNamaPenFor.Text = dt.Rows[0][3].ToString();
                addFakultas.Text = dt.Rows[0][4].ToString();
                addJurusanPenFor.Text = dt.Rows[0][5].ToString();
                addProgramStudiPenFor.Text = dt.Rows[0][6].ToString();
                addTempatPenFor.Text = dt.Rows[0][7].ToString();
                addTglAwalPenFor.Text = dt.Rows[0][11].ToString();
                addTglAkhirPenFor.Text = dt.Rows[0][12].ToString();
                addKetPenFor.Text = dt.Rows[0][10].ToString();
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


        protected void gridDataPendidikanNonFormal_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataPendidikanNonFormal_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataPendidikanNonFormal.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteNonFormalPendidikan", new string[] { id });
                loadDataPendidikanNonFormal();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelDua();
                hidePanel(false, false, false, false, false, false, false, false);
                panelPendidikanNonFormal.Visible = true;
                cardHeaderPenNonFor.Text = "Ubah Pendidikan Non Formal";
                btnEditPenNonFor.Visible = true;
                btnAddPenNonFor.Visible = false;

                dt = lib.CallProcedure("rec_detailNonFormalPendidikan", new string[] { id });
                nfp_id.Text = id;
                addNamaPenNonFor.Text = dt.Rows[0][2].ToString();
                addTempatPenNonFor.Text = dt.Rows[0][3].ToString();
                addTglAwalPenNonFor.Text = dt.Rows[0][7].ToString();
                addTglAkhirPenNonFor.Text = dt.Rows[0][8].ToString();
                addKetPenNonFor.Text = dt.Rows[0][6].ToString();
            }
        }

        protected void gridDataBahasa_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataBahasa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataBahasa.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteBahasa", new string[] { id });
                loadDataBahasa();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelDua();
                hidePanel(false, false, false, false, false, false, false, false);
                panelBahasa.Visible = true;
                cardHeaderBahasa.Text = "Ubah Bahasa yang dikuasai";
                btnEditBhs.Visible = true;
                btnAddBhs.Visible = false;

                dt = lib.CallProcedure("rec_detailBahasa", new string[] { id });
                bhs_id.Text = id;
                addBahasaBhs.Text = dt.Rows[0][2].ToString();
                addLisanBhs.SelectedValue = dt.Rows[0][3].ToString();
                addTertulisBhs.SelectedValue = dt.Rows[0][4].ToString();
            }
        }

        protected void gridDataKeluargaSendiri_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataKeluargaSendiri_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataKeluargaSendiri.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteKeluarga", new string[] { id });
                loadDataKeluargaSendiri();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelTiga();
                hidePanel(false, false, false, false, false, false, false, false);
                panelKeluarga.Visible = true;
                cardHeaderKeluarga.Text = "Ubah Keluarga Sendiri";
                btnEditKlg.Visible = true;
                btnAddKlg.Visible = false;
                addHubunganKlg.Items.Add(new ListItem("Istri", "Istri"));
                addHubunganKlg.Items.Add(new ListItem("Suami", "Suami"));

                dt = lib.CallProcedure("rec_detailKeluarga", new string[] { id });
                klg_id.Text = id;
                addHubunganKlg.SelectedValue = dt.Rows[0][2].ToString();
                if (addHubunganKlg.SelectedValue == "Anak")
                {
                    addNoUrutKlg.Text = dt.Rows[0][3].ToString();
                    addNoUrutKlg.Enabled = true;
                }
                jenis_keluarga.Text = dt.Rows[0][4].ToString();
                addNamaKlg.Text = dt.Rows[0][5].ToString();
                addJenisKelKlg.SelectedValue = dt.Rows[0][6].ToString();
                addTempatLahirKlg.Text = dt.Rows[0][7].ToString();
                addTglLahirKlg.Text = dt.Rows[0][11].ToString();
                addPendidikanKlg.Text = dt.Rows[0][9].ToString();
                addPekerjaanKlg.Text = dt.Rows[0][10].ToString();
            }
        }
        protected void gridDataKeluargaOrtu_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataKeluargaOrtu_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataKeluargaOrtu.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteKeluarga", new string[] { id });
                loadDataKeluargaOrtu();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelTiga();
                hidePanel(false, false, false, false, false, false, false, false);
                panelKeluarga.Visible = true;
                cardHeaderKeluarga.Text = "Ubah Keluarga Ortu";
                btnEditKlg.Visible = true;
                btnAddKlg.Visible = false;
                addHubunganKlg.Items.Add(new ListItem("Ayah", "Ayah"));
                addHubunganKlg.Items.Add(new ListItem("Ibu", "Ibu"));

                dt = lib.CallProcedure("rec_detailKeluarga", new string[] { id });
                klg_id.Text = id;
                addHubunganKlg.Text = dt.Rows[0][2].ToString();
                if (addHubunganKlg.Text == "Anak")
                {
                    addNoUrutKlg.Text = dt.Rows[0][3].ToString();
                    addNoUrutKlg.Enabled = true;
                }
                jenis_keluarga.Text = dt.Rows[0][4].ToString();
                addNamaKlg.Text = dt.Rows[0][5].ToString();
                addJenisKelKlg.SelectedValue = dt.Rows[0][6].ToString();
                addTempatLahirKlg.Text = dt.Rows[0][7].ToString();
                addTglLahirKlg.Text = dt.Rows[0][11].ToString();
                addPendidikanKlg.Text = dt.Rows[0][9].ToString();
                addPekerjaanKlg.Text = dt.Rows[0][10].ToString();
            }
        }

        protected void gridDataRiwayatPekerjaan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataRiwayatPekerjaan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataRiwayatPekerjaan.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deletePengalamanKerja", new string[] { id });
                loadDataRiwayatPekerjaan();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelEmpat();
                hidePanel(false, false, false, false, false, false, false, false);
                panelPengalamanKerja.Visible = true;
                cardHeaderPngKer.Text = "Ubah Pengalaman Kerja";
                btnEditPngKer.Visible = true;
                btnAddPngKer.Visible = false;

                dt = lib.CallProcedure("rec_detailPengalamanKerja", new string[] { id });
                pek_id.Text = id;
                addNamaPerPngKer.Text = dt.Rows[0][2].ToString();
                addJabatanPngKer.Text = dt.Rows[0][3].ToString();
                addTglAwalPngKer.Text = dt.Rows[0][10].ToString();
                addTglAkhirPngKer.Text = dt.Rows[0][11].ToString();
                addGajiPngKer.Text = dt.Rows[0][6].ToString();
                addAlasanPindahPngKer.Text = dt.Rows[0][7].ToString();
                addGambaranSingkatPngKer.Text = dt.Rows[0][8].ToString();
                addKesanPerusahaanPngKer.Text = dt.Rows[0][9].ToString();
            }
        }

        protected void gridDataRiwayatAtasan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataRiwayatAtasan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataRiwayatAtasan.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteRiwayatBawahan", new string[] { id });
                loadDataRiwayatAtasan();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelEmpat();
                hidePanel(false, false, false, false, false, false, false, false);
                panelRiwayatBawahan.Visible = true;
                cardHeaderRiwayatBawahan.Text = "Ubah Riwayat Atasan";
                btnEditRiwBawahan.Visible = true;
                btnAddRiwBawahan.Visible = false;

                dt = lib.CallProcedure("rec_detailRiwayatBawahan", new string[] { id });
                rab_id.Text = id;
                addNamaRiwBawahan.Text = dt.Rows[0][2].ToString();
                addJabatanRiwBawahan.Text = dt.Rows[0][3].ToString();
                addPerusahaanRiwBawahan.Text = dt.Rows[0][4].ToString();
                addJumlahBawahanRiwBawahan.Text = dt.Rows[0][5].ToString();
            }
        }

        protected void gridDataKenalanPerusahaan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataKenalanPerusahaan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataKenalanPerusahaan.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteKenalanPerusahaan", new string[] { id });
                loadDataKenalanPerusahaan();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelEnam();
                hidePanel(false, false, false, false, false, false, false, false);
                panelKenalanPerusahaan.Visible = true;
                cardHeaderKenalanPerusahaan.Text = "Ubah Kenalan";
                btnEditKenalanPerusahaan.Visible = true;
                btnAddKenalanPerusahaan.Visible = false;

                dt = lib.CallProcedure("rec_detailKenalanPerusahaan", new string[] { id });
                kpe_id.Text = id;
                addNamaKenalanPerusahaan.Text = dt.Rows[0][2].ToString();
                addPerusahaanKenalanPerusahaan.Text = dt.Rows[0][3].ToString();
                addJabatanKenalanPerusahaan.Text = dt.Rows[0][4].ToString();
                addNoTelpKenalanPerusahaan.Text = dt.Rows[0][5].ToString();
                addHubunganKenalanPerusahaan.Text = dt.Rows[0][6].ToString();


            }
        }

        protected void gridDataKeluargaHubungi_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataKeluargaHubungi_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataKeluargaHubungi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteKeluargaHubungi", new string[] { id });
                loadDataKeluargaHubungi();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelEnam();
                hidePanel(false, false, false, false, false, false, false, false);
                panelKeluargaHubungi.Visible = true;
                cardHeaderKeluargaHubungi.Text = "Ubah data";
                btnEditKeluargaHubungi.Visible = true;
                btnAddKeluargaHubungi.Visible = false;

                dt = lib.CallProcedure("rec_detailKeluargaHubungi", new string[] { id });
                dkh_id.Text = id;
                addNamaKeluargaHubungi.Text = dt.Rows[0][2].ToString();
                addNoTelpKeluargaHubungi.Text = dt.Rows[0][3].ToString();
                addHubunganKeluargaHubungi.Text = dt.Rows[0][4].ToString();
            }
        }

        protected void gridDataRiwayatOrganisasi_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataRiwayatOrganisasi_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataRiwayatOrganisasi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteRiwayatOrganisasi", new string[] { id });
                loadDataRiwayatOrganisasi();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelEnam();
                hidePanel(false, false, false, false, false, false, false, false);
                panelRiwayatOrganisasi.Visible = true;
                cardHeaderRiwOrganisasi.Text = "Ubah Organisasi";
                btnEditRiwOrganisasi.Visible = true;
                btnAddRiwOrganisasi.Visible = false;

                dt = lib.CallProcedure("rec_detailRiwayatOrganisasi", new string[] { id });
                rog_id.Text = id;
                addNamaRiwOrganisasi.Text = dt.Rows[0][2].ToString();
                addTempatRiwOrganisasi.Text = dt.Rows[0][3].ToString();
                addJabatanRiwOrganisasi.Text = dt.Rows[0][4].ToString();
                addTujuanRiwOrganisasi.Text = dt.Rows[0][5].ToString();
            }
        }

        protected void gridDataRiwayatPsikotes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataRiwayatPsikotes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataRiwayatPsikotes.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteRiwayatPsikotes", new string[] { id });
                loadDataRiwayatPsikotes();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelTujuh();
                hidePanel(false, false, false, false, false, false, false, false);
                panelRiwPsikotes.Visible = true;
                cardHeaderRiwPsikotes.Text = "Ubah Riwayat Psikotes";
                btnEditRiwPsikotes.Visible = true;
                btnAddRiwPsikotes.Visible = false;

                dt = lib.CallProcedure("rec_detailRiwayatPsikotes", new string[] { id });
                rps_id.Text = id;
                addWaktuRiwPsikotes.Text = dt.Rows[0][2].ToString();
                addTempatRiwPsikotes.Text = dt.Rows[0][3].ToString();
                addTujuanRiwPsikotes.Text = dt.Rows[0][4].ToString();
            }
        }

        protected void gridDataRiwayatPenyakit_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataRiwayatPenyakit_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataRiwayatPenyakit.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteRiwayatPenyakit", new string[] { id });
                loadDataRiwayatPenyakit();
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelTujuh();
                hidePanel(false, false, false, false, false, false, false, false);
                panelRiwPenyakit.Visible = true;
                cardHeaderRiwPenyakit.Text = "Ubah Riwayat Penyakit";
                btnEditRiwPenyakit.Visible = true;
                btnAddRiwPenyakit.Visible = false;

                dt = lib.CallProcedure("rec_detailRiwayatPenyakit", new string[] { id });
                rpe_id.Text = id;
                addNamaRiwPenyakit.Text = dt.Rows[0][2].ToString();
                addTglAwalRiwPenyakit.Text = dt.Rows[0][6].ToString();
                addTglAkhirRiwPenyakit.Text = dt.Rows[0][7].ToString();
                addAkibatRiwPenyakit.Text = dt.Rows[0][5].ToString();
            }
        }

        protected void btnLand_Click(object sender, EventArgs e)
        {
            panelLand.Visible = false;
            loadPanelSatuData(pel_id);
            hidePanel(true, false, false, false, false, false, false, false);

        }

        protected void btnKembaliPenFor_Click(object sender, EventArgs e)
        {
            panelPendidikanFormal.Visible = false;
            hidePanel(false, true, false, false, false, false, false, false);
            loadPanelDuaData(pel_id);
        }

        protected void btnAddPenFor_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createFormalPendidikan", new string[] {
                pel_id,
                addJenjangPenFor.SelectedValue.ToString().Trim(),
                addNamaPenFor.Text.ToString().Trim(),
                addFakultas.Text.ToString().Trim(),
                addJurusanPenFor.Text.ToString().Trim(),
                addProgramStudiPenFor.Text.ToString().Trim(),
                addTempatPenFor.Text.ToString().Trim(),
                addTglAwalPenFor.Text.ToString().Trim(),
                addTglAkhirPenFor.Text.ToString().Trim(),
                addKetPenFor.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormPenFor();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditPenFor_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editFormalPendidikan", new string[] {
                fop_id.Text,
                addJenjangPenFor.SelectedValue.ToString().Trim(),
                addNamaPenFor.Text.ToString().Trim(),
                addFakultas.Text.ToString().Trim(),
                addJurusanPenFor.Text.ToString().Trim(),
                addProgramStudiPenFor.Text.ToString().Trim(),
                addTempatPenFor.Text.ToString().Trim(),
                addTglAwalPenFor.Text.ToString().Trim(),
                addTglAkhirPenFor.Text.ToString().Trim(),
                addKetPenFor.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormPenFor();
                panelPendidikanFormal.Visible = false;
                hidePanel(false, true, false, false, false, false, false, false);
                loadPanelDuaData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void linkAddPenFor_Click(object sender, EventArgs e)
        {
            updateDataPanelDua();
            hidePanel(false, false, false, false, false, false, false, false);
            panelPendidikanFormal.Visible = true;
            cardHeaderPenFor.Text = "Tambah Pendidikan Formal";
            btnEditPenFor.Visible = false;
            btnAddPenFor.Visible = true;
            clearFormPenFor();
        }

        private void clearFormPenFor()
        {
            addJenjangPenFor.SelectedIndex = 0;
            addNamaPenFor.Text = string.Empty;
            addFakultas.Text = string.Empty;
            addJurusanPenFor.Text = string.Empty;
            addProgramStudiPenFor.Text = string.Empty;
            addTempatPenFor.Text = string.Empty;
            addTglAwalPenFor.Text = string.Empty;
            addTglAkhirPenFor.Text = string.Empty;
            addKetPenFor.Text = string.Empty;
        }

        private void clearFormPenNonFor()
        {
            addNamaPenNonFor.Text = string.Empty;
            addTempatPenNonFor.Text = string.Empty;
            addTglAwalPenNonFor.Text = string.Empty;
            addTglAkhirPenNonFor.Text = string.Empty;
            addKetPenNonFor.Text = string.Empty;
        }
        private void clearFormBhs()
        {
            addBahasaBhs.Text = string.Empty;
            addTertulisBhs.SelectedIndex = 0;
            addLisanBhs.SelectedIndex = 0;

        }

        private void clearFormKeluarga()
        {
            klg_id.Text = string.Empty;
            addHubunganKlg.SelectedIndex = 0;
            addNoUrutKlg.Text = string.Empty;
            addNamaKlg.Text = string.Empty;
            addNoUrutKlg.Enabled = false;
            addJenisKelKlg.SelectedIndex = 0;
            addTempatLahirKlg.Text = string.Empty;
            addTglLahirKlg.Text = string.Empty;
            addPendidikanKlg.Text = string.Empty;
            addPekerjaanKlg.Text = string.Empty;
        }

        private void clearFormPengalamanKerja()
        {
            addNamaPerPngKer.Text = string.Empty;
            addJabatanPngKer.Text = string.Empty;
            addTglAwalPngKer.Text = string.Empty;
            addTglAkhirPngKer.Text = string.Empty;
            addGajiPngKer.Text = string.Empty;
            addAlasanPindahPngKer.Text = string.Empty;
            addGambaranSingkatPngKer.Text = string.Empty;
            addKesanPerusahaanPngKer.Text = string.Empty;
        }

        private void clearFormRiwayatBawahan()
        {
            addNamaRiwBawahan.Text = string.Empty;
            addJabatanRiwBawahan.Text = string.Empty;
            addPerusahaanRiwBawahan.Text = string.Empty;
            addJumlahBawahanRiwBawahan.Text = string.Empty;
        }
        private void clearFormKenalanPerusahaan()
        {
            addNamaKenalanPerusahaan.Text = string.Empty;
            addPerusahaanKenalanPerusahaan.Text = string.Empty;
            addJabatanKenalanPerusahaan.Text = string.Empty;
            addNoTelpKenalanPerusahaan.Text = string.Empty;
            addHubunganKenalanPerusahaan.Text = string.Empty;
        }

        private void clearFormKeluargaHubungi()
        {
            addNamaKeluargaHubungi.Text = string.Empty;
            addNoTelpKeluargaHubungi.Text = string.Empty;
            addHubunganKeluargaHubungi.Text = string.Empty;
        }
        private void clearFormRiwayatOrganisasi()
        {
            addNamaRiwOrganisasi.Text = string.Empty;
            addTempatRiwOrganisasi.Text = string.Empty;
            addJabatanRiwOrganisasi.Text = string.Empty;
            addTujuanRiwOrganisasi.Text = string.Empty;
        }

        private void clearFormRiwayatPsikotes()
        {
            addWaktuRiwPsikotes.Text = string.Empty;
            addTempatRiwPsikotes.Text = string.Empty;
            addTujuanRiwPsikotes.Text = string.Empty;
        }

        private void clearFormRiwayatPenyakit()
        {
            addNamaRiwPenyakit.Text = string.Empty;
            addTglAwalRiwPenyakit.Text = string.Empty;
            addTglAkhirRiwPenyakit.Text = string.Empty;
            addAkibatRiwPenyakit.Text = string.Empty;
        }

        private void clearFormMinatPekerjaan()
        {
            addJenisPekMinatPekerjaan.SelectedIndex = 0;
            addDdlNoUrutMinatPekerjaan.SelectedIndex = 0;
        }

        private void clearFormRefrensiPerusahaan()
        {
            addNamaRefrensiPerusahaan.Text = string.Empty;
            addPerusahaanRefrensiPerusahaan.Text = string.Empty;
            addJabatanRefrensiPerusahaan.Text = string.Empty;
            addNoTelpRefrensiPerusahaan.Text = string.Empty;
            addHubunganRefrensiPerusahaan.Text = string.Empty;
        }
        protected void linkAddPenNonFor_Click(object sender, EventArgs e)
        {
            updateDataPanelDua();
            hidePanel(false, false, false, false, false, false, false, false);
            panelPendidikanNonFormal.Visible = true;
            cardHeaderPenNonFor.Text = "Tambah Pendidikan Non Formal";
            btnEditPenNonFor.Visible = false;
            btnAddPenNonFor.Visible = true;
            clearFormPenNonFor();
        }

        protected void linkAddPengalamanKerja_Click(object sender, EventArgs e)
        {
            updateDataPanelEmpat();
            hidePanel(false, false, false, false, false, false, false, false);
            panelPengalamanKerja.Visible = true;
            cardHeaderPngKer.Text = "Tambah Pengalaman Kerja";
            btnEditPngKer.Visible = false;
            btnAddPngKer.Visible = true;
            clearFormPengalamanKerja();
        }

        protected void linkAddKeluargaOrtu_Click(object sender, EventArgs e)
        {
            updateDataPanelTiga();
            hidePanel(false, false, false, false, false, false, false, false);
            panelKeluarga.Visible = true;
            cardHeaderKeluarga.Text = "Tambah Keluarga Orang Tua";
            btnEditKlg.Visible = false;
            btnAddKlg.Visible = true;
            clearFormKeluarga();
            jenis_keluarga.Text = "Keluarga Ortu";
            reqaddHubunganKlg.Enabled = false;
            addHubunganKlg.Items.Add(new ListItem("Ayah", "Ayah"));
            addHubunganKlg.Items.Add(new ListItem("Ibu", "Ibu"));

        }

        protected void linkAddKeluargaSendiri_Click(object sender, EventArgs e)
        {
            updateDataPanelTiga();
            hidePanel(false, false, false, false, false, false, false, false);
            panelKeluarga.Visible = true;
            cardHeaderKeluarga.Text = "Tambah Keluarga Sendiri";
            btnEditKlg.Visible = false;
            btnAddKlg.Visible = true;
            clearFormKeluarga();
            jenis_keluarga.Text = "Keluarga Sendiri";
            addHubunganKlg.Items.Add(new ListItem("Istri", "Istri"));
            addHubunganKlg.Items.Add(new ListItem("Suami", "Suami"));
        }

        protected void linkAddBahasa_Click(object sender, EventArgs e)
        {
            updateDataPanelDua();
            hidePanel(false, false, false, false, false, false, false, false);
            panelBahasa.Visible = true;
            cardHeaderBahasa.Text = "Tambah Bahasa yang dikuasai";
            btnEditBhs.Visible = false;
            btnAddBhs.Visible = true;
            clearFormBhs();
        }

        protected void linkAddRiwayatBawahan_Click(object sender, EventArgs e)
        {
            updateDataPanelEmpat();
            hidePanel(false, false, false, false, false, false, false, false);
            panelRiwayatBawahan.Visible = true;
            cardHeaderRiwayatBawahan.Text = "Tambah Riwayat Atasan";
            btnEditRiwBawahan.Visible = false;
            btnAddRiwBawahan.Visible = true;
            clearFormRiwayatBawahan();
        }

        protected void linkAddKenalanPerusahaan_Click(object sender, EventArgs e)
        {
            updateDataPanelEnam();
            hidePanel(false, false, false, false, false, false, false, false);
            panelKenalanPerusahaan.Visible = true;
            cardHeaderKenalanPerusahaan.Text = "Tambah Kenalan";
            btnEditKenalanPerusahaan.Visible = false;
            btnAddKenalanPerusahaan.Visible = true;
            clearFormKenalanPerusahaan();
        }


        protected void linkAddKeluargaHubungi_Click(object sender, EventArgs e)
        {
            updateDataPanelEnam();
            hidePanel(false, false, false, false, false, false, false, false);
            panelKeluargaHubungi.Visible = true;
            cardHeaderKeluargaHubungi.Text = "Tambah seseorang yang dapat dihubungi";
            btnEditKeluargaHubungi.Visible = false;
            btnAddKeluargaHubungi.Visible = true;
            clearFormKeluargaHubungi();
        }

        protected void linkAddOrganisasi_Click(object sender, EventArgs e)
        {
            updateDataPanelEnam();
            hidePanel(false, false, false, false, false, false, false, false);
            panelRiwayatOrganisasi.Visible = true;
            cardHeaderRiwOrganisasi.Text = "Tambah Organisasi";
            btnEditRiwOrganisasi.Visible = false;
            btnAddRiwOrganisasi.Visible = true;
            clearFormRiwayatOrganisasi();
        }

        protected void linkAddRiwPenyakit_Click(object sender, EventArgs e)
        {

            updateDataPanelTujuh();
            hidePanel(false, false, false, false, false, false, false, false);
            panelRiwPenyakit.Visible = true;
            cardHeaderRiwPenyakit.Text = "Tambah Riwayat Penyakit";
            btnEditRiwPenyakit.Visible = false;
            btnAddRiwPenyakit.Visible = true;
            clearFormRiwayatPenyakit();
        }

        protected void linkAddRiwPsikotes_Click(object sender, EventArgs e)
        {
            updateDataPanelTujuh();
            hidePanel(false, false, false, false, false, false, false, false);
            panelRiwPsikotes.Visible = true;
            cardHeaderRiwPsikotes.Text = "Tambah Riwayat Psikotes";
            btnEditRiwPsikotes.Visible = false;
            btnAddRiwPsikotes.Visible = true;
            clearFormRiwayatPsikotes();
        }

        protected void btmKembaliPenNonFor_Click(object sender, EventArgs e)
        {
            panelPendidikanNonFormal.Visible = false;
            hidePanel(false, true, false, false, false, false, false, false);
            loadPanelDuaData(pel_id);
        }

        protected void btnAddPenNonFor_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createNonFormalPendidikan", new string[] {
                pel_id,
                addNamaPenNonFor.Text.ToString().Trim(),
                addTempatPenNonFor.Text.ToString().Trim(),
                addTglAwalPenNonFor.Text.ToString().Trim(),
                addTglAkhirPenNonFor.Text.ToString().Trim(),
                addKetPenNonFor.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormPenNonFor();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditPenNonFor_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editNonFormalPendidikan", new string[] {
                nfp_id.Text,
                addNamaPenNonFor.Text.ToString().Trim(),
                addTempatPenNonFor.Text.ToString().Trim(),
                addTglAwalPenNonFor.Text.ToString().Trim(),
                addTglAkhirPenNonFor.Text.ToString().Trim(),
                addKetPenNonFor.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormPenNonFor();
                panelPendidikanNonFormal.Visible = false;
                hidePanel(false, true, false, false, false, false, false, false);
                loadPanelDuaData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliBhs_Click(object sender, EventArgs e)
        {
            panelBahasa.Visible = false;
            hidePanel(false, true, false, false, false, false, false, false);
            loadPanelDuaData(pel_id);
        }

        protected void btnAddBhs_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createBahasa", new string[] {
                pel_id,
                addBahasaBhs.Text.ToString().Trim(),
                addLisanBhs.SelectedValue .ToString().Trim(),
                addTertulisBhs.SelectedValue .ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormBhs();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditBhs_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editBahasa", new string[] {
                bhs_id.Text,
                addBahasaBhs.Text.ToString().Trim(),
                addLisanBhs.SelectedValue .ToString().Trim(),
                addTertulisBhs.SelectedValue .ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormBhs();
                panelBahasa.Visible = false;
                hidePanel(false, true, false, false, false, false, false, false);
                loadPanelDuaData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnAddKlg_Click(object sender, EventArgs e)
        {
            try
            {


                lib.CallProcedure("rec_createKeluarga", new string[] {
                pel_id,
                addHubunganKlg.SelectedValue.ToString().Trim(),
                addNoUrutKlg.Text.ToString().Trim(),
                jenis_keluarga.Text.ToString().Trim(),
                addNamaKlg.Text.ToString().Trim(),
                addJenisKelKlg.SelectedValue.ToString().Trim(),
                addTempatLahirKlg.Text.ToString().Trim(),
                addTglLahirKlg.Text.ToString().Trim(),
                addPendidikanKlg.Text.ToString().Trim(),
                addPekerjaanKlg.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormKeluarga();

            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditKlg_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editKeluarga", new string[] {
                klg_id.Text,
                addHubunganKlg.SelectedValue.ToString().Trim(),
                addNoUrutKlg.Text.ToString().Trim(),
                jenis_keluarga.Text.ToString().Trim(),
                addNamaKlg.Text.ToString().Trim(),
                addJenisKelKlg.SelectedValue.ToString().Trim(),
                addTempatLahirKlg.Text.ToString().Trim(),
                addTglLahirKlg.Text.ToString().Trim(),
                addPendidikanKlg.Text.ToString().Trim(),
                addPekerjaanKlg.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormKeluarga();
                panelKeluarga.Visible = false;
                hidePanel(false, false, true, false, false, false, false, false);
                loadPanelTigaData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void addHubunganKlg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (addHubunganKlg.SelectedValue.ToString().Trim() == "Anak")
                addNoUrutKlg.Enabled = true;
            else
            {
                addNoUrutKlg.Enabled = false;
                addNoUrutKlg.Text = string.Empty;
            }

        }

        protected void btnKembaliKlg_Click(object sender, EventArgs e)
        {
            panelKeluarga.Visible = false;
            hidePanel(false, false, true, false, false, false, false, false);
            loadPanelTigaData(pel_id);
            clearFormKeluarga();
            addHubunganKlg.Items.Remove(addHubunganKlg.Items.FindByValue("Suami"));
            addHubunganKlg.Items.Remove(addHubunganKlg.Items.FindByValue("Istri"));
            addHubunganKlg.Items.Remove(addHubunganKlg.Items.FindByValue("Ayah"));
            addHubunganKlg.Items.Remove(addHubunganKlg.Items.FindByValue("Ibu"));

        }

        protected void btnKembaliPngKer_Click(object sender, EventArgs e)
        {
            panelPengalamanKerja.Visible = false;
            hidePanel(false, false, false, true, false, false, false, false);
            loadPanelEmpatData(pel_id);
        }

        protected void btnAddPngKer_Click(object sender, EventArgs e)
        {
            string cleanAmount = addGajiPngKer.Text.ToString().Replace(".", string.Empty);
            try
            {
                lib.CallProcedure("rec_createPengalamanKerja", new string[] {
                pel_id,
                addNamaPerPngKer.Text.ToString().Trim(),
                addJabatanPngKer.Text.ToString().Trim(),
                addTglAwalPngKer.Text.ToString().Trim(),
                addTglAkhirPngKer.Text.ToString().Trim(),
                cleanAmount,
                addAlasanPindahPngKer.Text.ToString().Trim(),
                addGambaranSingkatPngKer.Text.ToString().Trim(),
                addKesanPerusahaanPngKer.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormPengalamanKerja();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditPngKer_Click(object sender, EventArgs e)
        {
            string cleanAmount = addGajiPngKer.Text.ToString().Replace(".", string.Empty);
            try
            {
                lib.CallProcedure("rec_editPengalamanKerja", new string[] {
                pek_id.Text,
                addNamaPerPngKer.Text.ToString().Trim(),
                addJabatanPngKer.Text.ToString().Trim(),
                addTglAwalPngKer.Text.ToString().Trim(),
                addTglAkhirPngKer.Text.ToString().Trim(),
                cleanAmount,
                addAlasanPindahPngKer.Text.ToString().Trim(),
                addGambaranSingkatPngKer.Text.ToString().Trim(),
                addKesanPerusahaanPngKer.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormPengalamanKerja();
                panelPengalamanKerja.Visible = false;
                hidePanel(false, false, false, true, false, false, false, false);
                loadPanelEmpatData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliRiwBawahan_Click(object sender, EventArgs e)
        {
            panelRiwayatBawahan.Visible = false;
            hidePanel(false, false, false, true, false, false, false, false);
            loadPanelEmpatData(pel_id);
        }

        protected void btnAddRiwBawahan_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createRiwayatBawahan", new string[] {
                pel_id,
                addNamaRiwBawahan.Text.ToString().Trim(),
                addJabatanRiwBawahan.Text.ToString().Trim(),
                addPerusahaanRiwBawahan.Text.ToString().Trim(),
                addJumlahBawahanRiwBawahan.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormRiwayatBawahan();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditRiwBawahan_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editRiwayatBawahan", new string[] {
                rab_id.Text,
                addNamaRiwBawahan.Text.ToString().Trim(),
                addJabatanRiwBawahan.Text.ToString().Trim(),
                addPerusahaanRiwBawahan.Text.ToString().Trim(),
                addJumlahBawahanRiwBawahan.Text.ToString().Trim()
                });

                showAlertSuccess("Data berhasil diubah!");
                clearFormRiwayatBawahan();
                panelRiwayatBawahan.Visible = false;
                hidePanel(false, false, false, true, false, false, false, false);
                loadPanelEmpatData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnAddKenalanPerusahaan_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createKenalanPerusahaan", new string[] {
                pel_id,
                addNamaKenalanPerusahaan.Text.ToString().Trim(),
                addPerusahaanKenalanPerusahaan.Text.ToString().Trim(),
                addJabatanKenalanPerusahaan.Text.ToString().Trim(),
                addNoTelpKenalanPerusahaan.Text.ToString().Trim(),
                addHubunganKenalanPerusahaan.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormKenalanPerusahaan();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditKenalanPerusahaan_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editKenalanPerusahaan", new string[] {
                kpe_id.Text,
                addNamaKenalanPerusahaan.Text.ToString().Trim(),
                addPerusahaanKenalanPerusahaan.Text.ToString().Trim(),
                addJabatanKenalanPerusahaan.Text.ToString().Trim(),
                addNoTelpKenalanPerusahaan.Text.ToString().Trim(),
                addHubunganKenalanPerusahaan.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormKenalanPerusahaan();
                panelKenalanPerusahaan.Visible = false;
                hidePanel(false, false, false, false, false, true, false, false);
                loadPanelEmpatData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliKenalanPerusahaan_Click(object sender, EventArgs e)
        {
            panelKenalanPerusahaan.Visible = false;
            hidePanel(false, false, false, false, false, true, false, false);
            loadPanelEnamData(pel_id);
        }

        protected void btnKembaliKeluargaHubungi_Click(object sender, EventArgs e)
        {
            panelKeluargaHubungi.Visible = false;
            hidePanel(false, false, false, false, false, true, false, false);
            loadPanelEnamData(pel_id);
        }

        protected void btnAddKeluargaHubungi_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createKeluargaHubungi", new string[] {
                pel_id,
                addNamaKeluargaHubungi.Text.ToString().Trim(),
                addNoTelpKeluargaHubungi.Text.ToString().Trim(),
                addHubunganKeluargaHubungi.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormKeluargaHubungi();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditKeluargaHubungi_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editKeluargaHubungi", new string[] {
                dkh_id.Text,
                addNamaKeluargaHubungi.Text.ToString().Trim(),
                addNoTelpKeluargaHubungi.Text.ToString().Trim(),
                addHubunganKeluargaHubungi.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormKeluargaHubungi();
                panelKeluargaHubungi.Visible = false;
                hidePanel(false, false, false, false, false, true, false, false);
                loadPanelEnamData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliRiwOrganisasi_Click(object sender, EventArgs e)
        {
            panelRiwayatOrganisasi.Visible = false;
            hidePanel(false, false, false, false, false, true, false, false);
            loadPanelEnamData(pel_id);
        }

        protected void btnAddRiwOrganisasi_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createRiwayatOrganisasi", new string[] {
                pel_id,
                addNamaRiwOrganisasi.Text.ToString().Trim(),
                addTempatRiwOrganisasi.Text.ToString().Trim(),
                addJabatanRiwOrganisasi.Text.ToString().Trim(),
                addTujuanRiwOrganisasi.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormRiwayatOrganisasi();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditRiwOrganisasi_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editRiwayatOrganisasi", new string[] {
                rog_id.Text,
                 addNamaRiwOrganisasi.Text.ToString().Trim(),
                addTempatRiwOrganisasi.Text.ToString().Trim(),
                addJabatanRiwOrganisasi.Text.ToString().Trim(),
                addTujuanRiwOrganisasi.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormRiwayatOrganisasi();
                panelRiwayatOrganisasi.Visible = false;
                hidePanel(false, false, false, false, false, true, false, false);
                loadPanelEnamData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliRiwPsikotes_Click(object sender, EventArgs e)
        {
            panelRiwPsikotes.Visible = false;
            hidePanel(false, false, false, false, false, false, true, false);
            loadPanelTujuhData(pel_id);
        }

        protected void btnAddRiwPsikotes_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createRiwayatPsikotes", new string[] {
                pel_id,
                addWaktuRiwPsikotes.Text.ToString().Trim(),
                addTempatRiwPsikotes.Text.ToString().Trim(),
                addTujuanRiwPsikotes.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormRiwayatPsikotes();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditRiwPsikotes_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editRiwayatPsikotes", new string[] {
                rps_id.Text,
                addWaktuRiwPsikotes.Text.ToString().Trim(),
                addTempatRiwPsikotes.Text.ToString().Trim(),
                addTujuanRiwPsikotes.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormRiwayatPsikotes();
                panelRiwPsikotes.Visible = false;
                hidePanel(false, false, false, false, false, false, true, false);
                loadPanelTujuhData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliRiwPenyakit_Click(object sender, EventArgs e)
        {
            panelRiwPenyakit.Visible = false;
            hidePanel(false, false, false, false, false, false, true, false);
            loadPanelTujuhData(pel_id);
        }

        protected void btnAddRiwPenyakit_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createRiwayatPenyakit", new string[] {
                pel_id,
                addNamaRiwPenyakit.Text.ToString().Trim(),
                addTglAwalRiwPenyakit.Text.ToString().Trim(),
                addTglAkhirRiwPenyakit.Text.ToString().Trim(),
                addAkibatRiwPenyakit.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormRiwayatPenyakit();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditRiwPenyakit_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editRiwayatPenyakit", new string[] {
                rpe_id.Text,
                addNamaRiwPenyakit.Text.ToString().Trim(),
                addTglAwalRiwPenyakit.Text.ToString().Trim(),
                addTglAkhirRiwPenyakit.Text.ToString().Trim(),
                addAkibatRiwPenyakit.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormRiwayatPenyakit();
                panelRiwPenyakit.Visible = false;
                hidePanel(false, false, false, false, false, false, true, false);
                loadPanelTujuhData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnAddJenisPekerjaan_Click(object sender, EventArgs e)
        {
            if (lib.CallProcedure("rec_checkIs3JenisPekerjaan", new string[] { pel_id }).Rows[0][0].ToString().Equals("Y"))
            {
                showAlertDanger("Anda sudah menambah 3 Minat Pekerjaan!");
            }
            else
            {
                try
                {
                    lib.CallProcedure("rec_createMinatPekerjaan", new string[] {
                pel_id,
                addJenisPekMinatPekerjaan.SelectedValue.ToString().Trim(),
                addDdlNoUrutMinatPekerjaan.SelectedValue.ToString().Trim()
                });
                    showAlertSuccess("Data berhasil ditambahkan!");
                    clearFormMinatPekerjaan();
                }
                catch
                {
                    showAlertDanger("Data gagal ditambahkan!");

                }
            }


        }

        protected void btnEditJenisPekerjaan_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editMinatPekerjaan", new string[] {
                mpe_id.Text,
                addJenisPekMinatPekerjaan.SelectedValue.ToString().Trim(),
                addDdlNoUrutMinatPekerjaan.SelectedValue.ToString().Trim()

                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormMinatPekerjaan();
                panelMinatPekerjaan.Visible = false;
                hidePanel(false, false, false, false, true, false, false, false);
                loadPanelLimaData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliJenisPekerjaan_Click(object sender, EventArgs e)
        {
            panelMinatPekerjaan.Visible = false;
            hidePanel(false, false, false, false, true, false, false, false);
            loadPanelLimaData(pel_id);
        }

        protected void gridDataMinatPekerjaan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataMinatPekerjaan.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteMinatPekerjaan", new string[] { id });
                loadPanelLimaData(pel_id);
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelDua();
                hidePanel(false, false, false, false, false, false, false, false);
                panelMinatPekerjaan.Visible = true;
                cardHeaderMinatPekerjaan.Text = "Ubah Minat Pekerjaan";
                btnEditMinatPekerjaan.Visible = true;
                btnAddMinatPekerjaan.Visible = false;

                dt = lib.CallProcedure("rec_detailMinatPekerjaan", new string[] { id });
                mpe_id.Text = id;
                addJenisPekMinatPekerjaan.SelectedValue = dt.Rows[0][2].ToString();
                addDdlNoUrutMinatPekerjaan.SelectedValue = dt.Rows[0][3].ToString();

            }
        }

        protected void gridDataMinatPekerjaan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void linkAddMinatPekerjaan_Click(object sender, EventArgs e)
        {
            updateDataPanelLima();
            hidePanel(false, false, false, false, false, false, false, false);
            panelMinatPekerjaan.Visible = true;
            cardHeaderMinatPekerjaan.Text = "Tambah Minat Pekerjaan";
            btnEditMinatPekerjaan.Visible = false;
            btnAddMinatPekerjaan.Visible = true;
            clearFormMinatPekerjaan();
        }

        protected void rbLingkunganKerjaSenang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbLingkunganKerjaSenang.SelectedIndex == 3)
                txtLingkunganKerjaSenang.Visible = true;
            else
            {
                txtLingkunganKerjaSenang.Visible = false;
                txtLingkunganKerjaSenang.Text = string.Empty;
            }

        }

        protected void rbAdaKenalan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbAdaKenalan.SelectedIndex == 1)
            {
                linkAddKenalanPerusahaan.Visible = false;
                gridDataKenalanPerusahaan.Visible = false;
            }
            else
            {
                linkAddKenalanPerusahaan.Visible = true;
                gridDataKenalanPerusahaan.Visible = true;
            }
        }

        protected void linkAddRefrensiPerusahaan_Click(object sender, EventArgs e)
        {
            updateDataPanelEnam();
            hidePanel(false, false, false, false, false, false, false, false);
            panelRefrensiPerusahaan.Visible = true;
            cardHeaderRefrensiPerusahaan.Text = "Tambah Refrensi Perusahaan";
            btnEditRefrensiPerusahaan.Visible = false;
        }

        protected void gridDataRefrensiPerusahaan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridDataRefrensiPerusahaan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = gridDataRefrensiPerusahaan.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            if (e.CommandName == "Hapus")
            {
                lib.CallProcedure("rec_deleteRefrensiPerusahaan", new string[] { id });
                loadPanelEnamData(pel_id);
            }
            else if (e.CommandName == "Ubah")
            {
                updateDataPanelEnam();
                hidePanel(false, false, false, false, false, false, false, false);
                panelRefrensiPerusahaan.Visible = true;
                cardHeaderRefrensiPerusahaan.Text = "Ubah Refrensi Perusahaan";
                btnEditRefrensiPerusahaan.Visible = true;
                btnAddRefrensiPerusahaan.Visible = false;

                dt = lib.CallProcedure("rec_detailRefrensiPerusahaan", new string[] { id });
                rfp_id.Text = id;
                addNamaRefrensiPerusahaan.Text = dt.Rows[0][2].ToString();
                addPerusahaanRefrensiPerusahaan.Text = dt.Rows[0][3].ToString();
                addJabatanRefrensiPerusahaan.Text = dt.Rows[0][4].ToString();
                addNoTelpRefrensiPerusahaan.Text = dt.Rows[0][5].ToString();
                addHubunganRefrensiPerusahaan.Text = dt.Rows[0][6].ToString();
            }
        }

        protected void btnAddRefrensiPerusahaan_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_createRefrensiPerusahaan", new string[] {
                pel_id,
                addNamaRefrensiPerusahaan.Text.ToString().Trim(),
                addPerusahaanRefrensiPerusahaan.Text.ToString().Trim(),
                addJabatanRefrensiPerusahaan.Text.ToString().Trim(),
                addNoTelpRefrensiPerusahaan.Text.ToString().Trim(),
                addHubunganRefrensiPerusahaan.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil ditambahkan!");
                clearFormRefrensiPerusahaan();
            }
            catch
            {
                showAlertDanger("Data gagal ditambahkan!");

            }
        }

        protected void btnEditRefrensiPerusahaan_Click(object sender, EventArgs e)
        {
            try
            {
                lib.CallProcedure("rec_editRefrensiPerusahaan", new string[] {
                rfp_id.Text,
                addNamaRefrensiPerusahaan.Text.ToString().Trim(),
                addPerusahaanRefrensiPerusahaan.Text.ToString().Trim(),
                addJabatanRefrensiPerusahaan.Text.ToString().Trim(),
                addNoTelpRefrensiPerusahaan.Text.ToString().Trim(),
                addHubunganRefrensiPerusahaan.Text.ToString().Trim()
                });
                showAlertSuccess("Data berhasil diubah!");
                clearFormRefrensiPerusahaan();
                panelRefrensiPerusahaan.Visible = false;
                hidePanel(false, false, false, false, false, true, false, false);
                loadPanelEnamData(pel_id);
            }
            catch
            {
                showAlertDanger("Data gagal diubah!");

            }
        }

        protected void btnKembaliRefrensiPerusahaan_Click(object sender, EventArgs e)
        {
            panelRefrensiPerusahaan.Visible = false;
            hidePanel(false, false, false, false, false, true, false, false);
            loadPanelEnamData(pel_id);
        }

        protected void rbMelakukanPerubahan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbMelakukanPerubahan.SelectedIndex == 0)
                txtMelakukanPerubahanKet.Visible = true;
            else
            {
                txtMelakukanPerubahanKet.Visible = false;
                txtMelakukanPerubahanKet.Text = string.Empty;
            }

        }
    }
}