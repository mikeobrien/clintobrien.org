<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="Photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Repeater ID="Gallery" runat="server" EnableViewState="false">
    <ItemTemplate>
    <span>
    <a style="text-decoration:none" href='<%# Eval("Url") %>'>
    <img border="0" alt='<%# Eval("Description") %>' src='<%# Eval("ThumbUrl") %>' />
    </a></span>
    </ItemTemplate>
    </asp:Repeater>
</asp:Content>

