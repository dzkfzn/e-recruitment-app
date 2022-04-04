using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Recruitment
{
    public partial class Page_Logout : System.Web.UI.Page
    {
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            lib.CallProcedure("all_deleteSession", new string[] { "ALL", Context.User.Identity.Name });
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

            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AddHeader("Expires", "0");

            Response.Redirect("Page_Login_Pelamar.aspx");
        }
    }
}