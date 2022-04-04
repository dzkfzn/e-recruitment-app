using System;
//using PolmanAstra_SIA.Classes;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.Configuration;
using System.Web.UI;
using System.Web;
using System.Linq;
//using PolmanAstra_SIA.Classes;

namespace New_SIA
{
    public partial class Site : System.Web.UI.MasterPage
    {
        //LDAPAuthentication adAuth = new LDAPAuthentication();
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Context.User.Identity.IsAuthenticated)
                    Response.Redirect("Page_Login_Pelamar.aspx");
                else
                {
                    if (lib.CallProcedure("all_checkSession", new string[] { Context.User.Identity.Name, GetIPAddress(), Request.UserAgent }).Rows[0][0].ToString().Equals("OK"))
                    {
                        string tempLastLogin = "", tempRoleDesc = "";
                        try { tempRoleDesc = " (" + lib.CallProcedure("all_getDeskripsiRole", new string[] { ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0] }).Rows[0][0].ToString() + ")"; } catch { tempRoleDesc = ""; }
                        try { tempLastLogin = lib.CallProcedure("all_getLastLogin", new string[] { Context.User.Identity.Name, "APP11" }).Rows[1][0].ToString(); } catch { tempLastLogin = "<br><br>XXXLogin terakhir: " + checkTanggal(DateTime.Now.ToString("dd MMM yyyy")) + ", " + DateTime.Now.ToString("hh:mm") + " WIB"; }
                        countNotifikasi.Text = lib.CallProcedure("all_getCountNotifikasi", new string[] { Context.User.Identity.Name, "APP11" }).Rows[0][0].ToString();
                        //username1.InnerHtml = adAuth.GetDisplayName(Context.User.Identity.Name) + tempRoleDesc;
                        //username2.InnerHtml = adAuth.GetDisplayName(Context.User.Identity.Name) + tempRoleDesc;
                        username1.InnerHtml = Context.User.Identity.Name + tempRoleDesc;
                        username2.InnerHtml = Context.User.Identity.Name + tempRoleDesc;
                        lastlogin.InnerHtml = tempLastLogin.Contains("XXX") ? tempLastLogin.Replace("XXX", "") : "<br><br>Login terakhir: " + checkTanggal(Convert.ToDateTime(tempLastLogin.Substring(0, 10)).ToString("dd MMM yyyy")) + ", " + tempLastLogin.Substring(11, 5) + " WIB";
                        generateMenu(((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[0], ((FormsIdentity)Context.User.Identity).Ticket.UserData.Split('@')[1]);
                        try
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "changeState", "changestate('" + Session["menuState"].ToString() + "');", true);
                        }
                        catch
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "changeState", "changestate('open');", true);
                        }
                        lib.CallProcedure("all_createMenuRecord", new string[] { Context.User.Identity.Name, Page.Title, Request.Url.ToString().Split('/')[Request.Url.ToString().Split('/').Length - 1], "APP11" });
                        generateMostMenu(Context.User.Identity.Name, "APP11");
                    }
                    else
                    {
                        lib.CallProcedure("all_deleteSession", new string[] { "SPECIFIC", Context.User.Identity.Name, GetIPAddress(), Request.UserAgent });
                        Session.Abandon();
                        FormsAuthentication.SignOut();

                        try
                        {
                            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                            {
                                var myCookie = new HttpCookie(FormsAuthentication.FormsCookieName);
                                myCookie.Expires = DateTime.Now.AddDays(-1d);
                                Response.Cookies.Add(myCookie);
                            }
                        }
                        catch { }
                        Response.Redirect("Page_Login_Pelamar.aspx");

                    }
                }
            }
            catch
            {
                Response.Redirect("Page_Login_Pelamar.aspx");
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
                    tempMenuContent += "<a href='" + dt.Rows[i][1].ToString() + ".aspx' class='list-group-item list-group-item-action " + ((tempMenuActive + dt.Rows[i][0].ToString()).Equals(Page.Title.Replace(" - ", "")) ? "polman-menu-active" : "") + "' style='border-radius: 0px; border: none; padding-left: " + (dt.Rows[i][0].ToString().Equals("Dashboard") ? "22" : "47") + "px; display: inherit;'>" + (dt.Rows[i][2].ToString().Equals("") ? "" : "<b>–&nbsp;&nbsp;</b>") + "" + (dt.Rows[i][0].ToString().Equals("Dashboard") ? "<i class='fa fa-home fa-lg fa-pull-left'></i>Dashboard" : dt.Rows[i][0].ToString()) + " </a>";
            }
            tempMenuContent += "</div>";
            menuContent.Text = tempMenuContent;
        }

        protected void generateMostMenu(string user, string application)
        {
            dt = lib.CallProcedure("all_getMostAccessMenu", new string[] { user, application });
            if (dt.Rows.Count != 0)
            {
                string tempMostMenu = "<h5>";
                for (int i = 0; i < dt.Rows.Count; i++)
                    tempMostMenu += "<span class='badge badge-info' style='margin-bottom: 10px;'><a style='color: white; text-decoration: none;' href='" + dt.Rows[i][1].ToString() + "'><i class='fa fa-angle-down' aria-hidden='true'></i>&nbsp;" + dt.Rows[i][0].ToString().Split('-')[1].Trim() + "</a></span>&nbsp;";
                mostmenu.Text = tempMostMenu + "</h5>";
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

        protected string GetIPAddress()
        {
            string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(ip))
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            else
                ip = ip.Split(',').First().Trim();

            return ip;
        }
    }
}