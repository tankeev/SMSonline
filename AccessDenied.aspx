<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccessDenied.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SIS Login Form</title>
    <link href="Styles/AccessDenied.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <div class="AccessDenied">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/access-denied.png" />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Sorry, You are not authorized to see this page!"
            Font-Size="Medium"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="HyperLinkHome" runat="server" NavigateUrl="~/Default.aspx" 
            Font-Bold="True">HOMEPAGE</asp:HyperLink>
    </div>
    </form>
</body>
</html>
