<%@ Page Title="Setup Manage Users Status" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="ManageUserPasswords.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Use the following section to check whether a User is Locked Out or Not."
                Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <table class="content-table" width="675">
                <tr>
                    <td height="30" colspan="4">
                        <asp:Label ID="LabelUnlockInfo" runat="server" Font-Bold="True" ForeColor="#FF3300">Change User Status Locked / Unlocked</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="35" width="120">
                        <asp:Label ID="LabelInfoLoginName" runat="server" Font-Bold="True" Text="Login Name:"></asp:Label>
                    </td>
                    <td width="200">
                        <asp:TextBox ID="TextBoxLockedUser" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td width="170">
                        <asp:Button ID="ButtonCheckStatus" runat="server" Text="Check Status" Width="95%" />
                    </td>
                    <td>
                        <asp:Button ID="ButtonUnlockUser" runat="server" Text=" Unlock User" Width="95%" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelStatusUser" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red" Text="Use the following section to change User Passwords. Be sure User is not Locked Out."></asp:Label>
            <br />
            <br />
            <table class="content-table" width="675">
                <tr>
                    <td colspan="4" height="30">
                        <asp:Label ID="LabelPasswordInfo" runat="server" Font-Bold="True" ForeColor="#FF3300">Change User Password</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="30" width="120">
                        <asp:Label ID="LabelPasswordLoginName" runat="server" Font-Bold="True" Text="Login Name:"></asp:Label>
                    </td>
                    <td width="200">
                        <asp:TextBox ID="TextBoxPasswordUser" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td width="170">
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td height="35">
                        <asp:Label ID="LabelNewPassword" runat="server" Font-Bold="True" Text="New Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPassword" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="ButtonChangePassword" runat="server" Text="Change Password" Width="95%" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelStatusPassword" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Use the following section to update Profile SchoolCode"></asp:Label>
            <br />
            <br />
            <table class="content-table" width="675">
                <tr>
                    <td colspan="4" height="30">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#FF3300">Update Profile School Code</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="30" width="120">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Login Name:"></asp:Label>
                    </td>
                    <td width="200">
                        <asp:TextBox ID="TextBoxProfileUser" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td width="170">
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td height="35">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="School Profile"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" DataSourceID="SqlDataSourceSchoolCodesMaster"
                            DataTextField="SchoolName" DataValueField="SchoolCode" TabIndex="7" Width="190px">
                            <asp:ListItem Value="">Select School</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="ButtonProfile" runat="server" Text="Update Profile" Width="95%" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelStatusSchoolCode" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools ORDER BY SchoolName">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
