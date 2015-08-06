<%@ Page Title="SIS Class Students" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ClassesStudents.aspx.vb"
    Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                        <td height="50" width="50">
                            <asp:HyperLink ID="HyperLinkUsersSearch" runat="server" ImageUrl="~/Staff/Images/menu_search.png"
                                NavigateUrl="~/Staff/UsersSearch.aspx"></asp:HyperLink>
                            <asp:HoverMenuExtender ID="HyperLinkUsersSearch_HoverMenuExtender" runat="server"
                                OffsetX="0" OffsetY="0" PopDelay="50" PopupControlID="PanelInfoUsersSearch" PopupPosition="Right"
                                TargetControlID="HyperLinkUsersSearch">
                            </asp:HoverMenuExtender>
                        </td>
                        <td width="50">
                            <asp:HyperLink ID="HyperLinkStudents" runat="server" ImageUrl="~/Staff/Images/menu_students.png"
                                NavigateUrl="~/Staff/Students.aspx"></asp:HyperLink>
                            <asp:HoverMenuExtender ID="HyperLinkStudents_HoverMenuExtender" runat="server" OffsetX="0"
                                OffsetY="0" PopDelay="50" PopupControlID="PanelInfoStudents" PopupPosition="Right"
                                TargetControlID="HyperLinkStudents">
                            </asp:HoverMenuExtender>
                        </td>
                        <td width="50">
                            <asp:HyperLink ID="HyperLinkParents" runat="server" ImageUrl="~/Staff/Images/menu_parents.png"
                                NavigateUrl="~/Staff/Parents.aspx"></asp:HyperLink>
                            <asp:HoverMenuExtender ID="HyperLinkParents_HoverMenuExtender" runat="server" OffsetX="0"
                                OffsetY="0" PopDelay="50" PopupControlID="PanelInfoParents" PopupPosition="Right"
                                TargetControlID="HyperLinkParents">
                            </asp:HoverMenuExtender>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLinkList" runat="server" ImageUrl="~/Staff/Images/menu_list.png"
                                NavigateUrl="~/Staff/ClassesStudents.aspx"></asp:HyperLink>
                            <asp:HoverMenuExtender ID="HyperLinkList_HoverMenuExtender" runat="server" OffsetX="0"
                                OffsetY="0" PopDelay="50" PopupControlID="PanelInfoList" PopupPosition="Right"
                                TargetControlID="HyperLinkList">
                            </asp:HoverMenuExtender>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                RepeatColumns="4">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" width="150">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <div id="divPanels">
                    <asp:Panel ID="PanelInfoUsersSearch" runat="server" CssClass="MenuToolTip" Width="240">
                        <asp:Label ID="Label1" runat="server" Text="Search Users" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label131" runat="server" Text="Click here to Search a User."></asp:Label>
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                    <asp:Panel ID="PanelInfoStudents" runat="server" Width="240" CssClass="MenuToolTip">
                        <asp:Label ID="Label2" runat="server" Text="Students Details" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Click here to see Student Details."></asp:Label>
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                    <asp:Panel ID="PanelInfoParents" runat="server" Width="240" CssClass="MenuToolTip">
                        <asp:Label ID="Label4" runat="server" Text="Parent Details" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Click here to see Parent Details."></asp:Label>
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                    <asp:Panel ID="PanelInfoList" runat="server" CssClass="MenuToolTip" Width="240">
                        <asp:Label ID="Label6" runat="server" Text="Classroom Lists" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                </div>
            </div>
            <div class="content-right">
                <h2>
                    STUDENT LIST</h2>
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="LabelSchool" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonExcel" runat="server" ImageUrl="~/Staff/Images/export_excel.png" />
                        </td>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonWord" runat="server" ImageUrl="~/Staff/Images/export_word.png" />
                        </td>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonPDF" runat="server" ImageUrl="~/Staff/Images/export_pdf.png" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    DataSourceID="SqlDataSourceStudents" Width="670px">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="NISN">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SchoolNo" HeaderText="School No">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" Width="90px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Gender" HeaderText="Gender">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="60px" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" Width="350px" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="../StaffSD/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Student Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelTotal" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
            </div>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools  WHERE (Show = 1) ORDER BY SchoolName">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.StudentName, tbl_Students.Gender, aspnet_Users.UserName, tbl_Students.CurrentSectionID, tbl_Students.SchoolNo, tbl_SectionCatalog.SectionCatalog FROM tbl_Students INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_Students.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID) AND (tbl_Students.[Continue] = 1) ORDER BY tbl_Students.StudentName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageButtonExcel" />
            <asp:PostBackTrigger ControlID="ImageButtonWord" />
            <asp:PostBackTrigger ControlID="ImageButtonPDF" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
