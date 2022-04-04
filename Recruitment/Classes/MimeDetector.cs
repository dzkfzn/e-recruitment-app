using MimeDetective;
using System.Web;
using Winista.Mime;

namespace New_SIA.Classes
{
    public class MimeDetector
    {
        public static string getMimeType(string basepath, HttpPostedFile file)
        {
            try
            {
                byte[] document = new byte[file.ContentLength];
                file.InputStream.Read(document, 0, file.ContentLength);
                FileType fileType = document.GetFileType();
                if (fileType.Mime.Equals("application/octet-stream"))
                {
                    Winista.Mime.MimeTypes g_MimeTypes = new Winista.Mime.MimeTypes(basepath + "mime-types.xml");
                    sbyte[] fileData = SupportUtil.ToSByteArray(document);
                    MimeType oMimeType = g_MimeTypes.GetMimeType(fileData);
                    return oMimeType.Name;
                }
                else
                    return fileType.Mime;
            }
            catch { return "unknown/unknown"; }
        }
    }
}