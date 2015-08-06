<%@ Page Title="Change Password" Language="VB" MasterPageFile="Profile.Master" AutoEventWireup="false"
    CodeFile="ChangePassword.aspx.vb" Inherits="Account_ChangePassword" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <br />
            <table width="680">
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/"
                            EnableViewState="false" Font-Bold="True" RenderOuterTable="False" SuccessPageUrl="ChangePasswordSuccess.aspx">
                            <ChangePasswordTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Use the form below to change your password. (min 8 characters)"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <table width="100%">
                                    <tr>
                                        <td height="30" width="160">
                                            <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword"
                                                Font-Bold="True">Old Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="CurrentPasswordRequired0" runat="server" ControlToValidate="CurrentPassword"
                                                ErrorMessage="Password is required." ToolTip="Old Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword"
                                                Font-Bold="True">New Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="NewPasswordRequired0" runat="server" ControlToValidate="NewPassword"
                                                ErrorMessage="New Password is required." ToolTip="New Password is required."
                                                ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server"
                                                ControlToValidate="NewPassword" Enabled="False" ErrorMessage="Invalid Character!"
                                                Font-Bold="True" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9.]|-|\s)+$"
                                                ValidationGroup="Login">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword"
                                                Font-Bold="True">Confirm New Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                                Display="Dynamic" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required."
                                                ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                                ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                                                ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                        </td>
                                        <td>
                                            <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancel" />
                                            <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                                                Text="Change Password" ValidationGroup="ChangeUserPasswordValidationGroup" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" Font-Bold="True"
                                    ValidationGroup="ChangeUserPasswordValidationGroup" />
                            </ChangePasswordTemplate>
                        </asp:ChangePassword>
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Profile/Images/lock.png" Width="200px" />
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
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
