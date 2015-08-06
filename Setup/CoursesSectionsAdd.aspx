<%@ Page Title="Setup Course Sections" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="CoursesSectionsAdd.aspx.vb" Inherits="Courses_Sections" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table width="675" style="background-color: #F0F0F0; border: 1px solid #CCCCCC">
                <tr>
                    <td height="30" width="20">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td width="100">
                        <asp:Label ID="LabelWeekNo2" runat="server" Text="Category:"></asp:Label>
                    </td>
                    <td width="270">
                        <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSourceDropDownListCourses"
                            DataTextField="CourseCategory" DataValueField="CourseCategoryID" Width="95%"
                            AutoPostBack="True" TabIndex="7">
                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="center" rowspan="5" valign="top">
                        <asp:Image ID="ImageAcademicTerms" runat="server" ImageUrl="~/Administrators/Images/AcademicsTerms.png" />
                    </td>
                </tr>
                <tr>
                    <td height="30" width="20">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td width="100">
                        <asp:Label ID="LabelWeekNo" runat="server" Text="Course:"></asp:Label>
                    </td>
                    <td width="270">
                        <asp:DropDownList ID="DropDownListAddCourse" runat="server" DataSourceID="SqlDataSourceDropDownListAddCourse"
                            DataTextField="CourseCatalog" DataValueField="CourseCatalogID" Width="95%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="32">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td>
                        <asp:Label ID="LabelWeekNo1" runat="server" Text="Staff:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListAddStaff" runat="server" DataSourceID="SqlDataSourceDropDownListAddStaff"
                            DataTextField="StaffName" DataValueField="StaffID" Width="95%">
                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="200" valign="top">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td valign="top">
                        <asp:Label ID="LabelWeekNo0" runat="server" Text="Section:"></asp:Label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="CheckBoxListAddSections" runat="server" DataSourceID="SqlDataSourceDropDownListAddSections"
                            DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4">
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td height="28">
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="ButtonAddCourseSection" runat="server" CommandName="Insert" Text="Add Course Section"
                            ValidationGroup="AddWeek" Width="95%" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceGridviewCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseSectionID, CourseCatalogID, SectionCatalogID, AcademicTermID, SchoolCode, StaffID FROM tbl_CourseSections"
                DeleteCommand="DELETE FROM tbl_CourseSections WHERE (CourseSectionID = @CourseSectionID)"
                InsertCommand="UPDATE tbl_CourseSections SET StaffID = @StaffID WHERE (CourseCatalogID = @CourseCatalogID) AND (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode)

IF @@ROWCOUNT = 0 

INSERT INTO tbl_CourseSections (AcademicTermID, StaffID, CourseCatalogID, SectionCatalogID, SchoolCode) VALUES (@AcademicTermID,@StaffID,@CourseCatalogID,@SectionCatalogID,@SchoolCode)">
                <DeleteParameters>
                    <asp:Parameter Name="CourseSectionID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StaffID" />
                    <asp:Parameter Name="CourseCatalogID" />
                    <asp:Parameter Name="SectionCatalogID" />
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="SchoolCode" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseCategoryID, CourseCategory FROM tbl_CourseCategories ORDER BY CourseCategory">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListAddCourse" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_CourseCatalog.CourseCatalogID, tbl_CourseCatalog.CourseCatalog FROM tbl_CourseCatalog INNER JOIN tbl_CourseCategories ON tbl_CourseCatalog.CourseCategoryID = tbl_CourseCategories.CourseCategoryID WHERE (tbl_CourseCatalog.CourseCategoryID = @CourseCategoryID) ORDER BY tbl_CourseCatalog.CourseCatalog">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListCourses" Name="CourseCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListAddStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListAddSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
