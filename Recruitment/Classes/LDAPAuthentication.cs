using System;
using System.DirectoryServices;
using System.Configuration;

namespace New_SIA.Classes
{
    public class LDAPAuthentication
    {
        PolmanAstraLibrary.PolmanAstraLibrary lib = new PolmanAstraLibrary.PolmanAstraLibrary(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        private string _path;
        string adPath = "LDAP://10.5.0.63/DC=polman,DC=astra,DC=ac,DC=id";

        public LDAPAuthentication()
        {
            _path = adPath;
        }

        public bool IsAuthenticated(string username, string password)
        {
            DirectoryEntry entry = new DirectoryEntry(_path, "polman\\" + username, password);
            try
            {
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();
                if (null == result)
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public String GetMail(string username)
        {
            DirectoryEntry entry = new DirectoryEntry(_path, "polman\\ssomanager", "TrexoRusqwe2@#G,");
            try
            {
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("mail");
                SearchResult result = search.FindOne();
                if (null == result)
                {
                    return "";
                }
                try
                {
                    return (String)result.Properties["mail"][0];
                }
                catch
                {
                    return "";
                }
            }
            catch
            {
                return "";
            }
        }

        public String GetDisplayName(string username)
        {
            DirectoryEntry entry = new DirectoryEntry(_path, "polman\\ssomanager", "TrexoRusqwe2@#G,");
            try
            {
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("displayName");
                SearchResult result = search.FindOne();
                if (null == result)
                {
                    return "";
                }
                try
                {
                    return (String)result.Properties["displayName"][0];
                }
                catch
                {
                    return username;
                }
            }
            catch
            {
                return username;
            }
        }

        public string SetPassword(string username, string newpassword)
        {
            DirectoryEntry entry = new DirectoryEntry(_path, "polman\\administrator", "HockerBestattung$354;");
            try
            {
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                SearchResult result = search.FindOne();
                if (null == result)
                {
                    return "FAILED";
                }
                try
                {
                    entry = result.GetDirectoryEntry();
                    entry.Invoke("SetPassword", new object[] { newpassword });
                    entry.Properties["LockOutTime"].Value = 0;
                    entry.Close();
                    return "SUCCESS";
                }
                catch
                {
                    return "Error:<br>- Pengubahan Password Gagal. Mohon Hubungi MIS!";
                }
            }
            catch
            {
                return "Error:<br>- Pengubahan Password Gagal. Mohon Hubungi MIS!";
            }
        }

        public string CreateUserMahasiswa(string nim, string nama, string konsentrasi, string tahunajaran)
        {
            using (DirectoryEntry entry = new DirectoryEntry(_path, "polman\\administrator", "HockerBestattung$354;"))
            {
                try
                {
                    try
                    {
                        //MEMBUAT OU
                        DirectoryEntry ou = entry.Children.Add("OU=" + tahunajaran + ",OU=" + konsentrasi + ",OU=Mahasiswa", "OrganizationalUnit");
                        ou.CommitChanges();
                    }
                    catch { }

                    //MEMBUAT USER
                    int NORMAL_ACCOUNT = 0x200;
                    DirectoryEntry user = entry.Children.Add("CN=" + nim + ",OU=" + tahunajaran + ",OU=" + konsentrasi + ",OU=Mahasiswa", "user");
                    user.Properties["sAMAccountName"].Value = nim;
                    user.Properties["displayName"].Value = nama;
                    user.Properties["userAccountControl"].Value = NORMAL_ACCOUNT;
                    user.CommitChanges();
                    return "SUCCESS";
                }
                catch
                {
                    return "Error:<br>- Pembuatan Mahasiswa Gagal. Mohon Hubungi MIS!";
                }
            }
        }
    }
}