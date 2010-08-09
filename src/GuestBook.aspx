<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GuestBook.aspx.cs" Inherits="GuestBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Panel ID="MainPanel" runat="server">
        <div style="text-align:right">
        <asp:Button ID="CommentsTopButton" runat="server" Text="Leave Comments" 
            onclick="CommentsButton_Click" /></div><br />
            
        <asp:Repeater ID="Entries" runat="server" EnableViewState="false">
        <ItemTemplate>
        <center>
        <table cellspacing="0" width="460" cellpadding="3" style="border-width:2px;border-style:solid;border-color:#EBE1C4">
        <tr><td style="background-color:#EBE1C4;color:#4F151C;font-weight:bold;">
            <%# string.Format("{0} from {1} ({2})", Eval("Name"), Eval("Location"), Eval("Relation")) %></td></tr>
                    <tr><td style="background-color:#EBE1C4;color:#4F151C">
            <span style="font-size:8pt;font-style:italic;"><%# Eval("Timestamp") %></span></td></tr>
            <tr><td>
                <div style="width:460px;word-break: normal;overflow:hidden;"><%# ((string)Eval("Comments")).Replace("\r\n", "<br/>").Replace("\r", "<br/>").Replace("\n", "<br/>")%>
                </div></td></tr>
        </table></center><br />        
        </ItemTemplate>
        </asp:Repeater>
        
        <div style="text-align:right">
        <asp:Button ID="CommentsBottomButton" runat="server" Text="Leave Comments" 
            onclick="CommentsButton_Click" /></div>
    </asp:Panel>
    
    <asp:Panel ID="PostPanel" runat="server" Visible="false">
        <center>
        <table cellspacing="0" cellpadding="3" style="border-width:2px;border-style:solid;border-color:#EBE1C4">
        <tr><td colspan="2" style="background-color:#EBE1C4;color:#4F151C"><b>Leave a comment:</b></td></tr>
        <tr><td style="background-color:#F7F4E9">Name</td><td style="background-color:#F7F4E9"><asp:TextBox ID="NameTextBox" runat="server" Width="340"></asp:TextBox></td></tr>
        <tr><td>Location</td><td><asp:TextBox ID="LocationTextBox" Width="340" runat="server"></asp:TextBox></td></tr>
        <tr><td style="background-color:#F7F4E9">Company/Relation</td><td style="background-color:#F7F4E9"><asp:TextBox ID="RelationTextBox" Width="340" runat="server"></asp:TextBox></td></tr>
        <tr><td colspan="2"><asp:TextBox ID="CommentsTextBox" runat="server" Width="460" Height="150" TextMode="MultiLine"></asp:TextBox></td></tr>
        <tr><td colspan="2" style="text-align:right">
                <asp:Button ID="CancelEditButton" runat="server" Text="Cancel" 
                        onclick="CancelPostButton_Click" />
            <asp:Button ID="PostButton" runat="server" Text="Post" width="100" 
                onclick="PostButton_Click"/></td></tr>
        </table>
        </center>
    </asp:Panel>
    
    <asp:Panel ID="PreviewPanel" runat="server" Visible="false">
        Please review your post:<br /><br />
        <center>
        <table cellspacing="0" width="460" cellpadding="3" style="border-width:2px;border-style:solid;border-color:#EBE1C4">
        <tr><td style="background-color:#EBE1C4;color:#4F151C">
            <asp:Label ID="PreviewNameLabel" runat="server" Text="" Font-Bold="true"></asp:Label></td></tr>
                    <tr><td style="background-color:#EBE1C4;color:#4F151C">
            <span style="font-size:8pt;font-style:italic;"><asp:Literal ID="PreviewDateLabel" runat="server" Text=""></asp:Literal></span></td></tr>
            <tr><td>
                <div style="width:460px;word-break: normal;overflow:hidden;"><asp:Literal ID="PreviewCommentsLabel" runat="server" Text=""></asp:Literal>
                </div></td></tr>
        </table></center>
        <br />
        <asp:Button ID="CancelPostButton" runat="server" Text="Cancel" 
                        onclick="CancelPostButton_Click" />
                <asp:Button ID="EditPostButton" runat="server" Text="Edit Post" 
                    onclick="EditPostButton_Click" />
                        <asp:Button ID="ConfirmPostButton" 
                        runat="server" Text="Confirm Post" width="100" 
                        onclick="ConfirmPostButton_Click" />
    </asp:Panel>
    
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate><table></HeaderTemplate>
    <ItemTemplate><td></td></ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>

</asp:Content>

