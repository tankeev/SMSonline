<%@ Page Title="Setup Course Sections" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="CoursesReset.aspx.vb" Inherits="CoursesAdd" %>

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
                        <asp:Label ID="Label2" runat="server" Text="This Page is used to Remove Students from All Courses Automatically."
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
                    <td height="35">
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td height="35">
                    </td>
                    <td>
                        <asp:GridView ID="GridViewAddedStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceCourseAddedStudents" Width="95%" PageSize="50">
                            <Columns>
                                <asp:TemplateField HeaderText="CSID" SortExpression="CourseSectionID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseSectionID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelCourseSectionID" runat="server" Text='<%# Bind("CourseSectionID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="45px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CourseCatalog" HeaderText="Course " SortExpression="CourseCatalog">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SectionCatalog" HeaderText="Section " SortExpression="SectionCatalog">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td height="50">
                    </td>
                    <td>
                        <asp:Button ID="ButtonRemoveAll" runat="server" Text="Remove All Added Students"
                            Width="95%" />
                        <asp:ConfirmButtonExtender ID="ButtonRemoveAll_ConfirmButtonExtender" runat="server"
                            ConfirmText="Are you sure?" TargetControlID="ButtonRemoveAll">
                        </asp:ConfirmButtonExtender>
                    </td>
                </tr>
                <tr>
                    <td height="50">
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
            <asp:SqlDataSource ID="SqlDataSourceCourseAddedStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                DeleteCommand="DELETE FROM tbl_CourseSectionStudents WHERE (CourseSectionID = @CourseSectionID)"
                SelectCommand="SELECT CourseSectionID, AcademicTermID, SchoolCode, CourseCatalog, SectionCatalog, COUNT(*) AS Total FROM vw_CourseSectionStudents GROUP BY CourseSectionID, SchoolCode, CourseCatalog, SectionCatalog, AcademicTermID HAVING (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY CourseSectionID, CourseCatalog, SectionCatalog">
                <DeleteParameters>
                    <asp:Parameter Name="CourseSectionID" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadioButtonListSchools" Name="SchoolCode" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
