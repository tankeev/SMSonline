<%@ Page Title="SIS Change E-Mail" Language="VB" MasterPageFile="Profile.Master"
    AutoEventWireup="false" CodeFile="ChangeEMail.aspx.vb" Inherits="Account_ChangePassword" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table width="680">
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Use the form below to change your password. (min 8 characters)"></asp:Label>
                        <br />
                        <br />
                        <br />
                        &nbsp;<table width="420">
                            <tr>
                                <td height="28" width="120">
                                    <asp:Label ID="Label3" runat="server" Text="Current E-Mail:" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCurrentEmail" runat="server" Enabled="False" Width="96%"></asp:TextBox>
                                </td>
                                <td width="35">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Label ID="Label2" runat="server" Text="New E-Mail:" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxEMail" runat="server" Width="96%"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;&nbsp;
                                    <asp:RequiredFieldValidator ID="valRequireEmail" runat="server" ControlToValidate="TextBoxEMail"
                                        SetFocusOnError="true" Display="Dynamic" ErrorMessage="Email address is required."
                                        ToolTip="Email address is required." ValidationGroup="ChangeEmail" Text="*" />
                                    <asp:RegularExpressionValidator runat="server" ID="valEmailPattern" Display="Dynamic"
                                        SetFocusOnError="true" ValidationGroup="ChangeEmail" ControlToValidate="TextBoxEMail"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="The e-mail address you specified is not well-formed."
                                        Text="*" />
                                </td>
                            </tr>
                            <tr>
                                <td height="32">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="ButtonUpdate" runat="server" Text="Change E-Mail" Width="99%" ValidationGroup="ChangeEmail" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="28">
                                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="ChangeEmail"
                                        Font-Bold="True" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Profile/Images/email.png" Width="200px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
