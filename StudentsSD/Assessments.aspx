<%@ Page Title="SIS Asessments By Courses" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Assessments.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    ASSESSMENTS</h2>
                <br />
                <table class="content-table" width="230">
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal0" runat="server">Given Courses</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceListBoxCourses"
                                DataTextField="CourseCatalog" DataValueField="CourseSectionID" Height="300px"
                                Width="95%"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    STUDENTS</h2>
                <br />
                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Assessments"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessments" Width="680px" DataKeyNames="AssessmentID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="ImageItem0" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CourseCategory" HeaderText="Course " SortExpression="CourseCategory">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Assessment" HeaderText="Assessment" SortExpression="Assessment" />
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Staff/Images/info.png" ShowSelectButton="True">
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                            <br />
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                            <br />
                        </asp:Panel>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                    <SelectedRowStyle BackColor="#FFFF99" />
                </asp:GridView>
                <br />
                <table width="680">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label30" runat="server" Font-Bold="True" ForeColor="#333333" Text="Please Use this button to see the results:"></asp:Label>
                        </td>
                        <td align="center" width="35">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="Red" Text="Assessment Marks"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessmentsMarks" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="ImageItem" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score" SortExpression="Score">
                            <ItemTemplate>
                                <asp:Label ID="LabelScore" runat="server" ForeColor="Red" Text='<%# Bind("Score") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                            <br />
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                            <br />
                        </asp:Panel>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceListBoxCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT CourseCatalog, CourseSectionID, AcademicTermID FROM vw_CourseSectionStudents WHERE (StudentID = @StudentID) AND (AcademicTermID = @AcademicTermID) AND (IsAcademic = 1) ORDER BY CourseCatalog">
                    <SelectParameters>
                        <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentID, CourseCategory, AssessmentType, Assessment, Date FROM vw_AssessmentsByStudents WHERE (CourseSectionID = @CourseSectionID) AND (StudentID = @StudentID) ORDER BY CourseCategory, AssessmentType">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_GeneralTests WHERE (GeneralTestID = @GeneralTestID)"
                    InsertCommand="INSERT INTO tbl_GeneralTests(GeneralTestID, TestName, TestDate) VALUES (@GeneralTestID, @TestName, @TestDate)"
                    SelectCommand="SELECT StudentName, AssessmentMark AS Score FROM vw_AssessmentMarks WHERE (AssessmentID = @AssessmentID) AND (StudentID = @StudentID) ORDER BY StudentName"
                    UpdateCommand="UPDATE tbl_GeneralTests SET TestName = @TestName, TestDate = @TestDate WHERE (GeneralTestID = @GeneralTestID)">
                    <DeleteParameters>
                        <asp:Parameter Name="GeneralTestID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="GeneralTestID" />
                        <asp:Parameter Name="TestName" />
                        <asp:Parameter Name="TestDate" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TestName" />
                        <asp:Parameter Name="TestDate" />
                        <asp:Parameter Name="GeneralTestID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
