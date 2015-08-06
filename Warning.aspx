<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Warning.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SIS Login Form</title>
    <link rel="stylesheet" href="Styles/Login.css" />
</head>
<body>
    <form id="form1" runat="server">
    <section class="container">
    <div class="login">
      <h1> &nbsp;</h1>  
        <table width="100%">
            <tr>
                <td valign="top" align="center">
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/No_Data_Icon.png" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text="You Have No Permission to View This Section!" Font-Size="Medium"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <br />
</div>
    <div class="login-help">
      
          &nbsp;</div> 
  </section>
    </form>
</body>
</html>
