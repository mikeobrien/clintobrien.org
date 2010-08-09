using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;

public partial class GuestBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) RefeshPosts();
    }

    protected void PostButton_Click(object sender, EventArgs e)
    {
        PostPanel.Visible = false;
        PreviewPanel.Visible = true;

        PreviewNameLabel.Text = string.Format(
            "{0} from {1} ({2})",
            EscapeEntities(NameTextBox.Text),
            EscapeEntities(LocationTextBox.Text),
            EscapeEntities(RelationTextBox.Text));
        PreviewDateLabel.Text = DateTime.Now.ToString("dddd MMMM, d, yyyy h:mm tt");
        PreviewCommentsLabel.Text = EscapeEntities(CommentsTextBox.Text).Replace("\r\n", "<br/>");
    }

    protected void EditPostButton_Click(object sender, EventArgs e)
    {
        PostPanel.Visible = true;
        PreviewPanel.Visible = false;
    }

    protected void CancelPostButton_Click(object sender, EventArgs e)
    {
        NameTextBox.Text = string.Empty;
        LocationTextBox.Text = string.Empty;
        RelationTextBox.Text = string.Empty;
        CommentsTextBox.Text = string.Empty;
        MainPanel.Visible = true;
        PostPanel.Visible = false;
        PreviewPanel.Visible = false;
    }

    protected void ConfirmPostButton_Click(object sender, EventArgs e)
    {
        MainPanel.Visible = true;
        PreviewPanel.Visible = false;

        WritePost(
            NameTextBox.Text,
            LocationTextBox.Text,
            RelationTextBox.Text,
            CommentsTextBox.Text);

        NameTextBox.Text = string.Empty;
        LocationTextBox.Text = string.Empty;
        RelationTextBox.Text = string.Empty;
        CommentsTextBox.Text = string.Empty;

        RefeshPosts();
    }

    protected void CommentsButton_Click(object sender, EventArgs e)
    {
        MainPanel.Visible = false;
        PostPanel.Visible = true;
    }

    private void RefeshPosts()
    {
        List<Post> posts = new List<Post>();
        string[] files = Directory.GetFiles(Server.MapPath("/GuestBook"), "*.xml");

        foreach (string file in files)
        {
            try
            {
                XDocument post = XDocument.Load(file);
                posts.Add(
                    new Post()
                    {
                        SortKey = file,
                        Timestamp = post.Element("post").Element("timestamp").Value,
                        Name = post.Element("post").Element("name").Value,
                        Location = post.Element("post").Element("location").Value,
                        Relation = post.Element("post").Element("relation").Value,
                        Comments = post.Element("post").Element("comments").Value,
                    });
            }
            catch { }
        }
        posts.Sort((p1, p2) => string.Compare(p1.SortKey, p2.SortKey)); 
        Entries.DataSource = posts;
        Entries.DataBind();
    }

    private void WritePost(string name, string location, string relation, string comments)
    {
        XDocument post = new XDocument();
        post.Add(
            new XElement(
                "post",
                new XElement("timestamp", DateTime.Now.ToString("dddd MMMM, d, yyyy h:mm tt")),
                new XElement("name", EscapeEntities(name)),
                new XElement("location", EscapeEntities(location)),
                new XElement("relation", EscapeEntities(relation)),
                new XElement("comments", EscapeEntities(comments))
            ));
        post.Save(Path.Combine(Server.MapPath("/GuestBook"),
            DateTime.Now.ToString("yyyy-MM-dd_hh_mm_ss_FFFF")) + ".xml");
    }

    private string EscapeEntities(string value)
    {
        return value.Replace(">", "&gt;").Replace("<", "&lt;").Replace("&", "&amp;");
    }

    private class Post
    {
        public string SortKey { get; set; }
        public string Timestamp { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Relation { get; set; }
        public string Comments { get; set; }
    }
}
