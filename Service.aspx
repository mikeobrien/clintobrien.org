﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<h3>Download:</h3><p><table><tr><td><a href=""><img src="images/Sound.jpg" border="0"></a></td>
<td><a href="MemorialService.mp3">Memorial Service (MP3, 28Mb)</a></td></tr></table></p>
<h3>Stream:</h3><p><object type="application/x-shockwave-flash" data="/player/player_mp3_maxi.swf" width="200" height="20">
    <param name="movie" value="/player/player_mp3_maxi.swf" />
    <param name="bgcolor" value="#ffffff" />
    <param name="FlashVars" value="mp3=/MemorialService.mp3&amp;showstop=1&amp;showinfo=1&amp;showvolume=1&amp;showloading=always" />
</object></p>
</asp:Content>

