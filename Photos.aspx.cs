using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Photos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] photos = Directory.GetFiles(Server.MapPath("/Photos"), "*.jpg");
        var gallery = from photo in photos
                      where !photo.EndsWith("_Thumb.jpg", StringComparison.OrdinalIgnoreCase)
                      select new
                      {
                          Url = PathToUrl(photo),
                          Description = Path.GetFileNameWithoutExtension(photo),
                          ThumbUrl = PathToUrl(
                            Path.Combine(
                            Path.GetDirectoryName(photo), 
                            Path.GetFileNameWithoutExtension(photo)) + "_Thumb" + 
                            Path.GetExtension(photo))
                      };
        Gallery.DataSource = gallery;
        Gallery.DataBind();
    }

    private string PathToUrl(string path)
    {
        return path.Replace(Request.PhysicalApplicationPath, string.Empty).Replace("\\", "/");
    }
}
