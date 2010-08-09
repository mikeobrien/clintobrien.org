using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.ServerVariables["HTTP_HOST"] == "clintobrien.org")
            Response.Redirect("http://www.clintobrien.org");

        XDocument tabConfig = XDocument.Load(Server.MapPath("Tabs.xml"));
        var tabs = from tab in tabConfig.Element("tabs").Elements("tab")
               select new
               {
                   Name = tab.Attribute("name").Value,
                   Url = tab.Attribute("url").Value,
                   Selected = (Request.Path.EndsWith(tab.Attribute("url").Value, StringComparison.OrdinalIgnoreCase))
               };
        Tabs.DataSource = tabs;
        Tabs.DataBind();
    }
}
