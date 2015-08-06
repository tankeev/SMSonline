<%@ Page Title="SIS Announcements" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Board.aspx.vb" Inherits="RoleManager" ValidateRequest="false" UICulture="en-US" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddAnnouncement" runat="server" ImageUrl="~/Administrators/Images/editor.png"
                                NavigateUrl="~/Administrators/BoardAdd.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="Add Announcement"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ANNOUNCEMENTS</h2>
                <br />
                <asp:GridView ID="GridViewAnnouncements" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="AnnouncementID" DataSourceID="SqlDataSourceGridViewAnnouncements"
                    Width="675px">
                    <Columns>
                        <asp:TemplateField HeaderText="S" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Select" ImageUrl="~/Administrators/Images/Item.png" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="AnnouncementID" HeaderText="ID" InsertVisible="False"
                            ReadOnly="True" SortExpression="AnnouncementID">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:TemplateField HeaderText="P">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxPublish" runat="server" Checked='<%# Bind("Publish") %>'
                                    AutoPostBack="True" OnCheckedChanged="CheckBoxPublish_CheckedChanged" />
                                <asp:HiddenField ID="HiddenFieldPublishAnnouncementID" runat="server" Value='<%# Eval("AnnouncementID") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="E">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonSelect" runat="server" ImageUrl="~/Administrators/Images/edit.png"
                                    ToolTip="Select" />
                                <asp:HiddenField ID="HiddenFieldEditAnnouncementID" runat="server" Value='<%# Eval("AnnouncementID") %>' />
                                <asp:ModalPopupExtender ID="MPEditAnnouncement" runat="server" PopupControlID="PanelEditAnnouncement"
                                    TargetControlID="ImageButtonSelect" BackgroundCssClass="modalBackground" CancelControlID="ButtonClose"
                                    DynamicServicePath="" Enabled="True">
                                </asp:ModalPopupExtender>
                                <asp:Panel ID="PanelEditAnnouncement" runat="server" CssClass="modalPopup" Width="580px"
                                    HorizontalAlign="Left" Style="display: none;">
                                    <asp:ImageButton ID="ButtonClose" runat="server" ImageUrl="~/Administrators/Images/Message_Error.png"
                                        CssClass="CloseButton" />
                                    <table>
                                        <tr>
                                            <td width="15">
                                            </td>
                                            <td width="550">
                                                <asp:FormView ID="FormViewAnnouncements" runat="server" DataKeyNames="AnnouncementID"
                                                    DataSourceID="SqlDataSourceFormViewAnnouncements" DefaultMode="Edit" Width="545px"
                                                    OnItemUpdated="FormViewAnnouncements_ItemUpdated">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Announcement Title"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <asp:TextBox ID="TextBoxTitle" runat="server" BackColor="White" Text='<%# Bind("Title") %>'
                                                            Width="535px"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Announcement Details"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <FTB:FreeTextBox ID="FreeTextBox" runat="server" ButtonHeight="20" DownLevelRows="10"
                                                            EnableToolbars="True" Height="350px" RenderMode="Rich" SupportFolder="/FreeTextBox/"
                                                            Text='<%# Bind("Message") %>' Width="535px">
                                                        </FTB:FreeTextBox>
                                                        <br />
                                                        <asp:Button ID="ButtonUpdate" runat="server" Text="Update Changes" Width="535px"
                                                            CommandName="Update" />
                                                    </EditItemTemplate>
                                                    <EmptyDataTemplate>
                                                        <div align="center">
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <img alt="" src="images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                                            <br />
                                                            <br />
                                                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                                                            <br />
                                                            <br />
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:FormView>
                                                <asp:SqlDataSource ID="SqlDataSourceFormViewAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                    SelectCommand="SELECT AnnouncementID, Title, Message, Date, Publish, [Order], AddedBy FROM tbl_Announcements WHERE (AnnouncementID = @AnnouncementID)"
                                                    UpdateCommand="UPDATE tbl_Announcements SET Title = @Title, Message = @Message WHERE (AnnouncementID = @AnnouncementID)">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="HiddenFieldEditAnnouncementID" Name="AnnouncementID"
                                                            PropertyName="Value" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="Title" />
                                                        <asp:Parameter Name="Message" />
                                                        <asp:ControlParameter ControlID="HiddenFieldEditAnnouncementID" Name="AnnouncementID"
                                                            PropertyName="Value" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td width="10">
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="R">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonRoles" runat="server" ImageUrl="~/Administrators/Images/menu_assessments_teachers.png"
                                    ToolTip="Roles" Width="20px" />
                                <asp:ModalPopupExtender ID="MPEditRoles" runat="server" PopupControlID="PanelEditRoles"
                                    TargetControlID="ImageButtonRoles" BackgroundCssClass="modalBackground" CancelControlID="ButtonCloseRoles"
                                    DynamicServicePath="" Enabled="True">
                                </asp:ModalPopupExtender>
                                <asp:Panel ID="PanelEditRoles" runat="server" CssClass="modalPopup" Width="580px"
                                    HorizontalAlign="Left" Style="display: none;">
                                    <asp:ImageButton ID="ButtonCloseRoles" runat="server" ImageUrl="~/Administrators/Images/Message_Error.png"
                                        CssClass="CloseButton" />
                                    <table>
                                        <tr>
                                            <td height="28" width="10">
                                            </td>
                                            <td height="28" width="230">
                                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="This Announcement is for:"></asp:Label>
                                            </td>
                                            <td width="300">
                                                <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="This Announcement is for:"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                            </td>
                                            <td valign="top">
                                                <asp:CheckBoxList ID="CheckBoxListRoles" runat="server" DataSourceID="SqlDataSourceRoles"
                                                    DataTextField="RoleName" DataValueField="RoleId" Font-Bold="True" ForeColor="#990000"
                                                    RepeatColumns="2">
                                                </asp:CheckBoxList>
                                            </td>
                                            <td valign="top">
                                                <asp:CheckBoxList ID="CheckBoxListSchools" runat="server" DataSourceID="SqlDataSourceSchoolCodes"
                                                    DataTextField="SchoolName" DataValueField="SchoolCode" Font-Bold="True" ForeColor="#990000">
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                            </td>
                                            <td colspan="2" valign="top">
                                                <asp:Button ID="ButtonUpdateRoles" runat="server" Height="25px" Text="Update Modules &amp; Roles"
                                                    Width="510px" OnClick="ButtonUpdateRoles_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:HiddenField ID="HiddenFieldRolesAnnouncementID" runat="server" Value='<%# Eval("AnnouncementID") %>' />
                                    <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                        SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAnnouncementsRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                        DeleteCommand="DELETE FROM tbl_AnnouncementsRoles WHERE (AnnouncementID = @AnnouncementID) AND (RoleID = @RoleID)"
                                        InsertCommand="INSERT INTO tbl_AnnouncementsRoles(AnnouncementID, RoleID) VALUES (@AnnouncementID, @RoleID)"
                                        SelectCommand="SELECT tbl_AnnouncementsRoles.RoleID, aspnet_Roles.RoleName FROM tbl_AnnouncementsRoles INNER JOIN aspnet_Roles ON tbl_AnnouncementsRoles.RoleID = aspnet_Roles.RoleId WHERE (tbl_AnnouncementsRoles.AnnouncementID = @AnnouncementID)"
                                        UpdateCommand="IF NOT EXISTS 
(
SELECT AnnouncementID, RoleID FROM tbl_AnnouncementsRoles WHERE (AnnouncementID = @AnnouncementID) AND (RoleID = @RoleID)
)

INSERT INTO tbl_AnnouncementsRoles (AnnouncementID, RoleID) VALUES (@AnnouncementID,@RoleID)">
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GridViewAnnouncements" Name="AnnouncementID" PropertyName="SelectedValue" />
                                            <asp:Parameter Name="RoleID" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="GridViewAnnouncements" Name="AnnouncementID" PropertyName="SelectedValue" />
                                            <asp:Parameter Name="RoleID" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldRolesAnnouncementID" Name="AnnouncementID"
                                                PropertyName="Value" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldRolesAnnouncementID" Name="AnnouncementID"
                                                PropertyName="Value" />
                                            <asp:Parameter Name="RoleID" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                        SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (Show = 1) ORDER BY SchoolName">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAnnouncementsSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                        DeleteCommand="DELETE FROM tbl_AnnouncementsSchools WHERE (AnnouncementID = @AnnouncementID) AND (SchoolCode = @SchoolCode)"
                                        InsertCommand="INSERT INTO tbl_AnnouncementsSchools(AnnouncementID, SchoolCode) VALUES (@AnnouncementID, @SchoolCode)"
                                        SelectCommand="SELECT SchoolCode, AnnouncementID FROM tbl_AnnouncementsSchools WHERE (AnnouncementID = @AnnouncementID)"
                                        UpdateCommand="IF NOT EXISTS 
(
SELECT AnnouncementID, SchoolCode  FROM tbl_AnnouncementsSchools WHERE (AnnouncementID = @AnnouncementID) AND (SchoolCode  = @SchoolCode )
)

INSERT INTO tbl_AnnouncementsSchools (AnnouncementID, SchoolCode ) VALUES (@AnnouncementID,@SchoolCode )">
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GridViewAnnouncements" Name="AnnouncementID" PropertyName="SelectedValue" />
                                            <asp:Parameter Name="SchoolCode" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="GridViewAnnouncements" Name="AnnouncementID" PropertyName="SelectedValue" />
                                            <asp:Parameter Name="SchoolCode" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldRolesAnnouncementID" Name="AnnouncementID"
                                                PropertyName="Value" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="GridViewAnnouncements" Name="AnnouncementID" PropertyName="SelectedValue" />
                                            <asp:Parameter Name="SchoolCode" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="D">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/Delete_bin.gif"
                                    ToolTip="Delete" />
                                <asp:ConfirmButtonExtender ID="ImageButtonDelete_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure?" Enabled="True" TargetControlID="ImageButtonDelete">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <SelectedRowStyle BackColor="#FFFF99" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatusAnnouncement" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceGridViewAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AnnouncementID, Title, Publish FROM tbl_Announcements ORDER BY Date DESC"
                    UpdateCommand="UPDATE tbl_Announcements SET Publish = @Publish, [Order] = @Order WHERE (AnnouncementID = @AnnouncementID)"
                    DeleteCommand="DELETE FROM tbl_Announcements WHERE (AnnouncementID = @AnnouncementID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AnnouncementID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Publish" />
                        <asp:Parameter Name="Order" />
                        <asp:Parameter Name="AnnouncementID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
