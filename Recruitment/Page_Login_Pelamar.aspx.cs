using System;
using New_SSO.Classes;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Linq;

namespace Recruitment
{
    public partial class Page_Login_Pelamar : System.Web.UI.Page
    {
        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt, dtRec = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
                Response.Redirect("Default.aspx"); //redirect saat masi login.
            if (!IsPostBack)
                SetCaptchaText();

            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AddHeader("Expires", "0");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Session["Captcha"].ToString() != txtCaptcha.Text.Trim())
            {
                txtCaptcha.BackColor = System.Drawing.Color.Tomato;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "showAlertCaptcha();", true);
                SetCaptchaText();
                imgCaptcha.ImageUrl = "Captcha.ashx";
            }
            else
            {
                try
                {
                    bool isAuthenticated, isAuthenticated2 = false;
                    //if (true == adAuth.IsAuthenticated(Server.HtmlEncode(txtUsername.Text.Trim()), txtPassword.Text.Trim()))
                    {
                        dtRec = lib.CallProcedure("rec_getAuthentication", new String[] { Server.HtmlEncode(txtUsername.Text.Trim()), Server.HtmlEncode(txtPassword.Text.Trim()) });
                        isAuthenticated2 = (dtRec.Rows.Count != 0 ? true : false);
                        if (isAuthenticated2)
                        {
                            dt = lib.CallProcedure("sso_getAuthentication", new String[] { Server.HtmlEncode(txtUsername.Text.Trim()), Server.HtmlEncode(txtPassword.Text.Trim()) });
                            isAuthenticated = (dt.Rows.Count != 0 ? true : false);
                        }
                        else
                        {
                            isAuthenticated = false;
                        }
                    }
                    if (isAuthenticated)
                    {
                        string kode = lib.CallProcedure("rec_getKodePelamar", new string[] { Server.HtmlEncode(txtUsername.Text.Trim()), Server.HtmlEncode(txtPassword.Text.Trim()) }).Rows[0][0].ToString();
                        //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, Server.HtmlEncode(txtUsername.Text.Trim()), DateTime.Now, DateTime.Now.AddHours(12), true, dt.Rows[0][0].ToString(), FormsAuthentication.FormsCookiePath);
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, Server.HtmlEncode(txtUsername.Text.Trim()), DateTime.Now, DateTime.Now.AddHours(12), true, dt.Rows[0][0].ToString() + "@" + kode, FormsAuthentication.FormsCookiePath);
                        string encTicket = FormsAuthentication.Encrypt(ticket);
                        var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
                        Response.Cookies.Add(cookie);
                        lib.CallProcedure("all_createLoginRecord", new string[] { Server.HtmlEncode(txtUsername.Text.Trim()), "ROL11", GetIPAddress(), Request.UserAgent, "ROL11" });
                        lib.CallProcedure("all_createSession", new string[] { Server.HtmlEncode(txtUsername.Text.Trim()), GetIPAddress(), Request.UserAgent });
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        txtUsername.BackColor = System.Drawing.Color.Tomato;
                        txtPassword.BackColor = System.Drawing.Color.Tomato;
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "showAlert();", true);
                        SetCaptchaText();
                        imgCaptcha.ImageUrl = "Captcha.ashx";
                    }
                }
                catch
                {
                    txtUsername.BackColor = System.Drawing.Color.Tomato;
                    txtPassword.BackColor = System.Drawing.Color.Tomato;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "showAlert();", true);
                    SetCaptchaText();
                    imgCaptcha.ImageUrl = "Captcha.ashx";
                }
            }
        }

        protected string GetIPAddress()
        {
            string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(ip))
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            else
                ip = ip.Split(',').First().Trim();

            return ip;
        }

        private void SetCaptchaText()
        {
            Random oRandom = new Random();
            int iNumber = oRandom.Next(100000, 999999);
            Session["Captcha"] = iNumber.ToString();
        }

        protected void btnReloadCaptcha_Click(object sender, EventArgs e)
        {
            Response.Redirect("Page_Login_Pelamar.aspx");
        }
    }
}