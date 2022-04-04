using System;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Web.Configuration;
using System.Web.UI;

namespace Recruitment
{
    public partial class Page_Register_Pelamar : System.Web.UI.Page
    {
        const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
                Response.Redirect("Default.aspx"); //redirect saat masi login.
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            sendMail mail = new sendMail();
            try
            {
                String email = Server.HtmlEncode(txtEmail.Text.Trim());
                String password = generateRandomPassword(8);
                String id = Guid.NewGuid().ToString();
                if (lib.CallProcedure("rec_checkIsRegistered", new string[] { Server.HtmlEncode(txtEmail.Text.Trim()) }).Rows[0][0].ToString().Equals("N"))
                {
                    if (lib.CallProcedure("sso_createAkun", new string[] { Server.HtmlEncode(txtEmail.Text.Trim()), "ROL11", "APP11", "yosep.setiawan" }).Rows[0][0].ToString().Equals("SUCCESS"))
                    {
                        lib.CallProcedure("rec_createPelamarRegistrasi", new string[] { id, email, password });
                        try
                        {
                            String htmlBody = "";
                            //GENERATE MAIL BODY HERE
                            htmlBody += "Dear Saudara/i " + email + ",<br><br>";
                            htmlBody += "Kami informasikan bahwa Saudara/i telah mendapatkan akses login pada web Recruitment Politeknik Manufaktur Astra dengan rincian sebagai berikut.<br><br>";
                            htmlBody += "Email : <b>" + email + "</b><br>";
                            htmlBody += "Password Sistem Informasi Recruitment (SIR) : <b>" + password + "</b><br><br>";
                            htmlBody += "Saudara/i kini sudah dapat mengakses SIR untuk mengisi formulir lamaran kerja pada website <b><a href='" + WebConfigurationManager.AppSettings["linkSIR"] + "'>" + WebConfigurationManager.AppSettings["linkSIR"] + "</a></b> dengan menggunakan Email dan Password SIR di atas.<br>";
                            htmlBody += "<b>SISFO SIR<br>Politeknik Manufaktur Astra</b><br><br>";
                            htmlBody += "Catatan:<br>Email ini dibuat otomatis oleh sistem, jangan membalas email ini.";
                            //END GENERATE MAIL BODY HERE
                            mail.SendMail(
                                "Pemberian Akses Login Sistem Informasi Recruitment - Politeknik Manufaktur Astra",
                                email,
                                htmlBody
                            );
                        }
                        catch (Exception ex) {
                            showAlertDanger(ex.ToString());
                        }
                        showAlertSuccess("Berhasil! Silahkan cek email anda!");
                    }
                }
                else
                {
                    txtEmail.BackColor = System.Drawing.Color.Tomato;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "showAlert();", true);
                    hideAlert();
                    showAlertDanger("Email sudah terdaftar");
                }
            }
            catch { Response.Redirect("Page_Register_Pelamar.aspx"); }
        }

        static string generateRandomPassword(int length)
        {
            string s = "";
            using (RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider())
            {
                while (s.Length != length)
                {
                    byte[] oneByte = new byte[1];
                    provider.GetBytes(oneByte);
                    char character = (char)oneByte[0];
                    if (valid.Contains(character))
                    {
                        s += character;
                    }
                }
            }
            return s;
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
    }
}