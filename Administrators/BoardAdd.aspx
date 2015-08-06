<%@ Page Title="SIS Add New Announcement" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="BoardAdd.aspx.vb" Inherits="RoleManager" ValidateRequest="false" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            MENU</h2>
        <br />
        <table class="content-table" width="240" __designer:mapid="b5c">
            <tr __designer:mapid="b5d">
                <td width="40" __designer:mapid="b5e">
                    <asp:HyperLink ID="HyperLinkAddAnnouncement" runat="server" ImageUrl="~/Administrators/Images/editor.png"
                        NavigateUrl="~/Administrators/Board.aspx"></asp:HyperLink>
                </td>
                <td __designer:mapid="b60">
                    <asp:Label ID="Label23" runat="server" Text="All Announcements"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="content-table" width="240" __designer:mapid="d0e">
            <tr __designer:mapid="d0f">
                <td height="28" __designer:mapid="d10">
                    <asp:Label ID="Label24" runat="server" Text="Announcements"></asp:Label>
                </td>
            </tr>
            <tr __designer:mapid="d12">
                <td height="28" __designer:mapid="d13">
                    <asp:ListBox ID="ListBoxAnnouncements" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceListBoxAnnouncements"
                        DataTextField="Title" DataValueField="AnnouncementID" Height="240px" Width="95%">
                    </asp:ListBox>
                </td>
            </tr>
            <tr __designer:mapid="d15">
                <td height="28" __designer:mapid="d16">
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
    <div class="content-right">
        <h2>
            ANNOUNCEMENTS</h2>
        <br />
        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Announcement Title"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBoxTitle" runat="server" Width="680px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxTitle"
            ErrorMessage="Please Write A Title!" ValidationGroup="Send">*
        </asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Announcement Details"></asp:Label>
        <br />
        <br />
        <FTB:FreeTextBox ID="FreeTextBox" runat="server" Width="680px" SupportFolder="/FreeTextBox/">
        </FTB:FreeTextBox>
        <br />
        <br />
        <table width="680" style="border: 1px solid #999999">
            <tr>
                <td height="25" width="300" bgcolor="#FFFF99">
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="This Announcement is for:"></asp:Label>
                </td>
                <td bgcolor="#FFFF99" height="25" width="300">
                    
                </td>
            </tr>
            <tr>
                <td bgcolor="#FFFF99" height="25" width="300">
                    <asp:CheckBox ID="CheckBoxRoles" runat="server" AutoPostBack="True" Text="Select All Roles" />
                </td>
                <td bgcolor="#FFFF99" height="25" width="300">
                    <asp:CheckBox ID="CheckBoxSchools" runat="server" AutoPostBack="True" Text="Select All Schools" />
                </td>
            </tr>
            <tr>
                <td bgcolor="#E8E8E8" valign="top">
                    <asp:CheckBoxList ID="CheckBoxListRoles" runat="server" Font-Bold="True" ForeColor="#990000"
                        DataSourceID="SqlDataSourceRoles" DataTextField="RoleName" DataValueField="RoleId"
                        RepeatLayout="OrderedList">
                    </asp:CheckBoxList>
                </td>
                <td bgcolor="#E8E8E8" valign="top">
                    <asp:CheckBoxList ID="CheckBoxListSchools" runat="server" DataSourceID="SqlDataSourceSchools"
                        DataTextField="SchoolName" DataValueField="SchoolCode" Font-Bold="True" ForeColor="#990000"
                        RepeatLayout="OrderedList">
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <br />
        <asp:CheckBox ID="CheckBoxAddPublish" runat="server" Font-Bold="True" ForeColor="Red"
            Text="Publish Announcement?" Checked="True" />
        <br />
        <br />
        <asp:Button ID="ButtonSend" runat="server" Text="Submit Announcement" ValidationGroup="Send"
            Height="25px" Width="680px" />
        <br />
        <br />
        <asp:Label ID="LabelAddStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummarySend" runat="server" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="Send" Width="650px" />
        <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            InsertCommand="INSERT INTO tbl_AnnouncementsRoles(AnnouncementID, RoleID) VALUES (@AnnouncementID, @RoleID)"
            SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools">
            <InsertParameters>
                <asp:Parameter Name="AnnouncementID" />
                <asp:Parameter Name="RoleID" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            InsertCommand="INSERT INTO tbl_Announcements (Title, Message, Date, Publish, [Order], AddedBy) VALUES (@Title,@Message,@Date,@Publish, @Order ,@AddedBy) SET @NewID = SCOPE_IDENTITY();"
            SelectCommand="SELECT AnnouncementID, Title, Message, Date, AddedBy FROM tbl_Announcements">
            <InsertParameters>
                <asp:Parameter Name="Title" />
                <asp:Parameter Name="Message" />
                <asp:Parameter Name="Date" />
                <asp:Parameter Name="Publish" />
                <asp:Parameter Name="Order" />
                <asp:SessionParameter Name="AddedBy" SessionField="UserID" />
                <asp:Parameter Name="NewID" Direction="Output" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAnnouncementsRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            InsertCommand="INSERT INTO tbl_AnnouncementsRoles(AnnouncementID, RoleID) VALUES (@AnnouncementID, @RoleID)"
            SelectCommand="SELECT AnnouncementsRolesID, AnnouncementID, RoleID FROM tbl_AnnouncementsRoles">
            <InsertParameters>
                <asp:Parameter Name="AnnouncementID" />
                <asp:Parameter Name="RoleID" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAnnouncementsSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            InsertCommand="INSERT INTO tbl_AnnouncementsSchools(AnnouncementID, SchoolCode) VALUES (@AnnouncementID, @SchoolCode)"
            SelectCommand="SELECT AnnouncementsRolesID, AnnouncementID, SchoolCode FROM tbl_AnnouncementsSchools">
            <InsertParameters>
                <asp:Parameter Name="AnnouncementID" />
                <asp:Parameter Name="SchoolCode" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceListBoxAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT AnnouncementID, Title FROM tbl_Announcements ORDER BY Date DESC"
            UpdateCommand="UPDATE tbl_Announcements SET Publish = @Publish, [Order] = @Order WHERE (AnnouncementID = @AnnouncementID)">
            <UpdateParameters>
                <asp:Parameter Name="Publish" />
                <asp:Parameter Name="Order" />
                <asp:Parameter Name="AnnouncementID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
