<%@ Page Title="Setup Course Sections" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="CoursesAdd.aspx.vb" Inherits="CoursesAdd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="ContentHeader" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table width="675" style="border: 1px solid #990033; background-color: #FFE6E6">
                <tr>
                    <td valign="top" width="20" height="30">
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="This Page is used to Add Students to Courses Automatically."
                            Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="30" width="20">
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                            Width="95%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="30" width="20">
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonListSchools" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                            Width="95%" RepeatColumns="2">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td height="30" width="20">
                    </td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxListSections" runat="server" DataSourceID="SqlDataSourceSections"
                            DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="95%"
                            RepeatColumns="6">
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td height="50">
                    </td>
                    <td>
                        <asp:Button ID="ButtonUpdateCourseStudents" runat="server" Text="Update Students"
                            Width="95%" />
                    </td>
                </tr>
                <tr>
                    <td height="50">
                    </td>
                    <td>
                        <asp:ListBox ID="ListBoxStatus" runat="server" Height="120px" Width="95%"></asp:ListBox>
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
            <br />
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools where (Show = 1) ORDER BY SchoolName">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT SectionCatalogID, SectionCatalog FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionCatalog">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadioButtonListSchools" Name="SchoolCode" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourseStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StudentID, StudentName FROM vw_CourseSectionStudents ORDER BY StudentName"
                UpdateCommand="UPDATE tbl_CourseSectionStudents SET CourseSectionID = @CourseSectionID, StudentID = @StudentID WHERE (CourseSectionStudentID = @CourseSectionStudentID)"
                DeleteCommand="DELETE FROM tbl_CourseSectionStudents WHERE (CourseSectionStudentID = @CourseSectionStudentID)"
                InsertCommand="IF NOT EXISTS 

(SELECT CourseSectionStudentID FROM tbl_CourseSectionStudents   WHERE CourseSectionID = @CourseSectionID AND StudentID= @StudentID)

INSERT INTO tbl_CourseSectionStudents(CourseSectionID, StudentID) VALUES (@CourseSectionID, @StudentID)">
                <DeleteParameters>
                    <asp:Parameter Name="CourseSectionStudentID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseSectionID" />
                    <asp:Parameter Name="StudentID" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseSectionID" />
                    <asp:Parameter Name="StudentID" />
                    <asp:Parameter Name="CourseSectionStudentID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
