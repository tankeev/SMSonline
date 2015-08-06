<%@ Page Title="SIS Clubs - Activities" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="ClubsActivitiesStudents.aspx.vb" Inherits="_Default" %>

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
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkHome" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/Default.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Clubs &amp; Activities Home"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkSettings" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesSettings.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Clubs &amp; Activities Settings"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkStudents" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesStudents.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Clubs &amp; Activities Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkEvaluation" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesEvaluation.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Clubs &amp; Activities Evaluation"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    CLUBS &amp; ACTIVITIES</h2>
                <br />
                <table width="675" style="border: 1px solid #333333">
                    <tr>
                        <td height="28" bgcolor="#FF9966" width="200">
                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Select Academic Semester"
                                ForeColor="Maroon"></asp:Label>
                        </td>
                        <td bgcolor="#FF9966" height="28">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="28" bgcolor="#CCCCCC" colspan="2">
                            <asp:DropDownList ID="DropDownListAcademicSemesters" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAcademicSemesters" DataTextField="AcademicSemester"
                                DataValueField="AcademicSemesterID" Width="98%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" bgcolor="#FF9966">
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Select Club &amp; Activity"
                                ForeColor="Maroon"></asp:Label>
                        </td>
                        <td bgcolor="#FF9966" height="28">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="28" bgcolor="#CCCCCC" colspan="2">
                            <asp:DropDownList ID="DropDownListClubsActivities" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceDropDownListClubsActivities" DataTextField="ClubActivityName"
                                DataValueField="ClubActivityID" Width="98%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" bgcolor="#FF9966">
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Select School Section"
                                ForeColor="Maroon"></asp:Label>
                        </td>
                        <td bgcolor="#FF9966" height="28">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#CCCCCC" colspan="2">
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceRadioButtonListSections" DataTextField="SectionCatalog"
                                DataValueField="SectionCatalogID" RepeatColumns="9" Width="100%">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" bgcolor="#FF9966">
                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Select Students" ForeColor="Maroon"></asp:Label>
                        </td>
                        <td bgcolor="#FF9966" height="28">
                            <asp:CheckBox ID="CheckBoxCheckAll" runat="server" AutoPostBack="True" Font-Bold="True"
                                ForeColor="Maroon" Text="Check All!" />
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#CCCCCC" colspan="2">
                            <asp:CheckBoxList ID="CheckBoxListStudents" runat="server" DataSourceID="SqlDataSourceCheckBoxListStudents"
                                DataTextField="StudentName" DataValueField="StudentID" RepeatColumns="3" Width="100%"
                                Font-Size="7pt">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" colspan="2" bgcolor="#CCCCCC">
                            <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update All" Width="98%" />
                            <asp:ConfirmButtonExtender ID="ButtonUpdateAll_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are you sure?" Enabled="True" TargetControlID="ButtonUpdateAll">
                            </asp:ConfirmButtonExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" bgcolor="#CCCCCC" colspan="2">
                            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicSemesterID, AcademicYear + N' ' + AcademicSemester AS AcademicSemester FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListClubsActivities" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_ClubsActivitiesStudents WHERE (ClubActivityStudentID = @ClubActivityStudentID)"
                    InsertCommand="INSERT INTO tbl_ClubsActivitiesStudents(ClubActivityID, AcademicSemesterID, StudentID) VALUES (@ClubActivityID, @AcademicSemesterID, @StudentID)"
                    SelectCommand="SELECT ClubActivityID, ClubActivityName FROM tbl_ClubsActivities WHERE (SchoolCode = @SchoolCode) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY ClubActivityName">
                    <DeleteParameters>
                        <asp:Parameter Name="ClubActivityStudentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ClubActivityID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                        <asp:Parameter Name="StudentID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRadioButtonListSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCheckBoxListStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CurrentSectionID, SchoolCode, [Continue] FROM tbl_Students WHERE ([Continue] = 1) AND (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceClubsActivitiesStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, ClubActivityStudentID FROM tbl_ClubsActivitiesStudents WHERE (ClubActivityID = @ClubActivityID)"
                    InsertCommand="IF NOT EXISTS 

(
SELECT StudentID, ClubActivityStudentID FROM tbl_ClubsActivitiesStudents WHERE (ClubActivityID = @ClubActivityID) AND (StudentID=@StudentID)

)

INSERT INTO tbl_ClubsActivitiesStudents(ClubActivityID, StudentID) VALUES (@ClubActivityID, @StudentID)"
                    DeleteCommand="DELETE FROM tbl_ClubsActivitiesStudents WHERE (ClubActivityID = @ClubActivityID) AND (StudentID = @StudentID)">
                    <DeleteParameters>
                        <asp:Parameter Name="ClubActivityID" />
                        <asp:Parameter Name="StudentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ClubActivityID" />
                        <asp:Parameter Name="StudentID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListClubsActivities" Name="ClubActivityID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
