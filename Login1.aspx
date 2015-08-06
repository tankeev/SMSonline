<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login1.aspx.vb" Inherits="Login"  %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School Management System</title>
    <link href="Styles/Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formLogin" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="login">
        <h1>LOGIN FORM
        </h1>
        <table width="100%">
            <tr>
                <td valign="top">
                    <asp:Login ID="LoginForm" runat="server" Width="100%" 
                        DestinationPageUrl="~/Default.aspx">
                        <LayoutTemplate>
                            <asp:Label ID="Label1" runat="server" Font-Size="X-Small" ForeColor="Red" Text="For Login Problems, Please Send E-Mail to info @ mitrapasiad.com"></asp:Label>
                            <p>
                                <asp:TextBox ID="UserName" runat="server" placeholder="Username" Height="34px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login"
                                    Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername" runat="server"
                                    ControlToValidate="UserName" ErrorMessage="Invalid Character!" Font-Bold="True"
                                    ForeColor="Red" ValidationExpression="^([a-zA-Z0-9.]|-|\s)+$" ValidationGroup="Login">*</asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Password"
                                    Height="34px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login"
                                    Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server"
                                    ControlToValidate="Password" ErrorMessage="Invalid Character!" Font-Bold="True"
                                    ForeColor="Red" ValidationExpression="^([a-zA-Z0-9.]|-|\s)+$" ValidationGroup="Login"
                                    Enabled="False">*</asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <recaptcha:RecaptchaControl ID="RECAPTCHA" runat="server" Theme="white" PublicKey="6Lfq_vwSAAAAAFwadHKPUVtaJpWMfvbjU43qBaxl"
                                    PrivateKey="6Lfq_vwSAAAAACZN23n3D58d0yrgbB_kvdtCaib9" />
                                <asp:CustomValidator ID="CustomValidatorRECAPTCHA" runat="server" ErrorMessage="reCAPTCHA wrong."
                                    EnableClientScript="false" Enabled="true" ValidationGroup="Login" Visible="False"></asp:CustomValidator>
                            </p>
                            <p>
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login"
                                    OnClick="LoginButton_Click" />
                            </p>
                            <p>
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </p>
                            <asp:ValidationSummary ID="ValidationSummary" runat="server" Font-Size="Small" ForeColor="Red"
                                ValidationGroup="Login" />
                        </LayoutTemplate>
                    </asp:Login>
                    <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
