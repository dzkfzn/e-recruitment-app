using System;
using New_SSO.Classes;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web;
using System.Linq;

namespace Recruitment
{
    public partial class Login_Rec : System.Web.UI.MasterPage
    {

        LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (lib.CallProcedure("all_checkSession", new string[] { Context.User.Identity.Name, GetIPAddress(), Request.UserAgent }).Rows[0][0].ToString().Equals("OK"))
                {
                    /*Konfigurasi LDAP Server Polman Astra*/
                    //DateTime tempDate = new DateTime(adAuth.GetLastPasswordChanged(Context.User.Identity.Name));
                    //if (tempDate.AddYears(1600) < Convert.ToDateTime("2018-03-20"))
                    //{
                    //    divWarning.Visible = true;
                    //    btnCancelChange.Visible = false;
                    //    btnCloseModal.Visible = false;
                    //    literalTanggal.Text = checkTanggal(tempDate.AddYears(1600).ToString("dd MMM yyyy"));
                    //    Page.ClientScript.RegisterStartupScript(this.GetType(), "showModalKey", "showModalKey()", true);
                    //}
                    //else
                    //{
                    //countNotifikasi.Text = lib.CallProcedure("all_getCountNotifikasi", new string[] { Context.User.Identity.Name, "APP" }).Rows[0][0].ToString();
                    username1.InnerHtml = adAuth.GetDisplayName(Context.User.Identity.Name);
                    username2.InnerHtml = adAuth.GetDisplayName(Context.User.Identity.Name);
                    generateMenu("ROL11", "APP11");
                    //}
                    /*End Konfigurasi*/
                }
                else
                {
                    lib.CallProcedure("all_deleteSession", new string[] { "SPECIFIC", Context.User.Identity.Name, GetIPAddress(), Request.UserAgent });
                    Session.Abandon();
                    FormsAuthentication.SignOut();
                    Response.Redirect("Page_Login.aspx");
                }
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
            }
        }

        protected void linkConfirmChange_Click(object sender, EventArgs e)
        {
            hideAlert();
            try
            {
                if (changeNewPassword.Text.Trim().Equals(changeConfirmPassword.Text.Trim()))
                {
                    string success = "FAILED";
                    if (adAuth.IsAuthenticated(Context.User.Identity.Name, changeOldPassword.Text.Trim()))
                        success = adAuth.SetPassword(Context.User.Identity.Name, changeNewPassword.Text.Trim());
                    if (success.Equals("SUCCESS"))
                    {
                        Session["success"] = "Kata sandi berhasil diubah";
                        Response.Redirect(Request.RawUrl);
                    }
                    else if (success.Equals("FAILED"))
                        showAlertDanger("Error:<br>- Kata sandi lama Anda salah");
                    else
                        showAlertDanger("Error:<br>- " + success);
                }
                else
                    showAlertDanger("Error:<br>- Password baru dan konfirmasi tidak sama");
            }
            catch
            {
                showAlertDanger("Error:<br>- Pengubahan password gagal. Mohon hubungi MIS!");
            }
        }

        protected void generateMenu(string role, string application)
        {
            string tempMenuContent = "";
            string tempMenuActive = "";
            bool isParent = false;
            bool isShow = false;
            dt = lib.CallProcedure("all_getListMenu", new string[] { Context.User.Identity.Name, role, application });
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][1].ToString().Equals("#"))
                {
                    if (isParent)
                        tempMenuContent += "</div>";
                    tempMenuActive = dt.Rows[i][0].ToString();
                    tempMenuContent += "<a href='#menu" + i.ToString() + "' role='tab' class='list-group-item list-group-item-action' data-toggle='collapse' data-parent='#accordion' aria-expanded='true' aria-controls='menu" + i.ToString() + "' style='border-radius: 0px; border: none;'><i class='fa fa-chevron-down fa-lg fa-pull-left'></i>" + dt.Rows[i][0].ToString() + "</a><div id='menu" + i.ToString() + "' class='collapse " + (Page.Title.Split(new string[] { " - " }, StringSplitOptions.None)[0].Equals(tempMenuActive) && !isShow ? "show" : "") + "' role='tabpanel'>";
                    if (Page.Title.Split(new string[] { " - " }, StringSplitOptions.None)[0].Equals(tempMenuActive))
                        isShow = true;
                    isParent = true;
                }
                else
                    tempMenuContent += "<a href='" + dt.Rows[i][1].ToString() + ".aspx' class='list-group-item list-group-item-action " + ((tempMenuActive + dt.Rows[i][0].ToString()).Equals(Page.Title.Replace(" - ", "")) ? "polman-menu-active" : "") + "' style='border-radius: 0px; border: none; padding-left: 47px; display: inherit;'>" + (dt.Rows[i][2].ToString().Equals("") ? "" : "<b>–&nbsp;&nbsp;</b>") + "" + dt.Rows[i][0].ToString() + " </a>";
            }
            tempMenuContent += "</div>";
            menuContent.Text = tempMenuContent;
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