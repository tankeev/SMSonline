<%@ Page Title="SIS Add Course Section Students" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="CoursesAdd.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    COURSES</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label25" runat="server" Text="Please Select a Section" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                Width="95%" AutoPostBack="True">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label82" runat="server" Text="Select a Course Please" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCourses"
                                DataTextField="CourseCategory" DataValueField="CourseSectionID" Height="250px"
                                Width="95%"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    INFORMATION</h2>
                <br />
                <asp:Panel ID="PanelStudents" runat="server">
                    <table width="675">
                        <tr>
                            <td valign="top" width="20">
                            </td>
                            <td valign="top">
                                <asp:CheckBoxList ID="CheckBoxListStudents" runat="server" DataSourceID="SqlDataSourceStudents"
                                    DataTextField="StudentName" DataValueField="StudentID" Width="95%" RepeatColumns="2">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" width="20">
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBoxCheckAll" runat="server" AutoPostBack="True" Font-Bold="True"
                                    ForeColor="Red" Text="Check All Students" />
                            </td>
                        </tr>
                        <tr>
                            <td height="50">
                            </td>
                            <td>
                                <asp:Button ID="ButtonUpdateCourseStudents" runat="server" Text="Update Students"
                                    Width="240px" />
                                <asp:ConfirmButtonExtender ID="ButtonUpdateCourseStudents_ConfirmButtonExtender"
                                    runat="server" ConfirmText="Checked Students will be Updated, unchecked students will be Removed! Are you sure?"
                                    Enabled="True" TargetControlID="ButtonUpdateCourseStudents">
                                </asp:ConfirmButtonExtender>
                            </td>
                        </tr>
                        <tr>
                            <td height="35">
                            </td>
                            <td>
                                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Panel ID="PanelEmpty" runat="server">
                    <div align="center">
                        <br />
                        <img alt="" src="Images/no_results.jpg" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" ForeColor="Red" Text="Please Select a Section and a Course from the List!"
                            Font-Size="Medium"></asp:Label>
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, CourseCategory FROM vw_Courses WHERE (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode) AND (IsAcademic = 1)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, Gender, UserName, SectionCatalogID FROM vw_AcademicTermsStudents WHERE (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourseStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CourseSectionStudentID FROM vw_CourseSectionStudents WHERE (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (CourseSectionID = @CourseSectionID) AND (AcademicTermID = @AcademicTermID) ORDER BY StudentName"
                    DeleteCommand="DELETE FROM tbl_CourseSectionStudents WHERE (CourseSectionID = @CourseSectionID) AND (StudentID = @StudentID)"
                    InsertCommand="IF NOT EXISTS 

(SELECT CourseSectionStudentID FROM tbl_CourseSectionStudents   WHERE CourseSectionID = @CourseSectionID AND StudentID= @StudentID)

INSERT INTO tbl_CourseSectionStudents(CourseSectionID, StudentID) VALUES (@CourseSectionID, @StudentID)">
                    <DeleteParameters>
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="StudentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="StudentID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
