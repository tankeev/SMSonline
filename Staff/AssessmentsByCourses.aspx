<%@ Page Title="SIS Asessments By Courses" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="AssessmentsByCourses.aspx.vb"
    Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="UCWebMessageBox" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessments ID="MenuAssessments" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label137" runat="server" Font-Bold="True" ForeColor="Red" Text="Select School Level"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:RadioButtonList ID="RadioButtonListLevels" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal" Width="95%">
                                <asp:ListItem Value="SD">SD</asp:ListItem>
                                <asp:ListItem Value="SMP">SMP</asp:ListItem>
                                <asp:ListItem Selected="True" Value="SMA">SMA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label136" runat="server" Font-Bold="True" ForeColor="Red" Text="Select School Section"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="7"
                                Width="95%">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label135" runat="server" Font-Bold="True" Text="Select Section Course"
                                ForeColor="Red"></asp:Label>
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
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENTS BY COURSES</h2>
                <br />
                <table class="content-table" width="675">
                    <tr>
                        <td align="left" height="50">
                            <asp:Label ID="Label133" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="Given Assessments"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" ForeColor="#333333" Text="Please Use this button to see the results:"></asp:Label>
                        </td>
                        <td align="center" width="35">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="AssessmentID" DataSourceID="SqlDataSourceAssessments" Font-Names="Arial"
                    Width="675px" Font-Size="9pt">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="ImageItem" runat="server" ImageUrl="~/Staff/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="AssessmentType" HeaderText="Type" SortExpression="AssessmentType">
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
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Staff/Images/warning.png" />
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
                <table width="675" class="content-table">
                    <tr>
                        <td height="50">
                            <asp:Label ID="Label132" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="Assessments Marks"></asp:Label>
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
                <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessmentsMarks" Font-Names="Arial" Width="675px"
                    Font-Size="9pt">
                    <Columns>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name">
                            <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StaffName" HeaderText="Teacher Name">
                            <ItemStyle Width="265px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Excused">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxExcused" runat="server" Checked='<%# Bind("Excused") %>'
                                    Enabled="False" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Score" HeaderText="Score">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty0" runat="server" HorizontalAlign="Center">
                            <br />
                            <asp:Image ID="ImageEmpty0" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label31" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                            <br />
                        </asp:Panel>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = @SectionSchool) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListLevels" Name="SectionSchool" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, SectionCatalogID, SchoolCode, IsAcademic, CourseSectionID, CourseCategory FROM vw_Courses WHERE (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode) AND (IsAcademic = @IsAcademic) ORDER BY CourseCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:Parameter DefaultValue="1" Name="IsAcademic" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, AssessmentID, Assessment, CourseCategory, AssessmentType, Date FROM vw_AssessmentsByCourses WHERE (CourseSectionID = @CourseSectionID) ORDER BY CourseCategory, AssessmentType, Assessment"
                    UpdateCommand="UPDATE tbl_Assessments SET Assessment = @Assessment WHERE (AssessmentID = @AssessmentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Assessment" />
                        <asp:Parameter Name="AssessmentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, AssessmentMark AS Score, Assessment, StaffName, Excused FROM vw_AssessmentMarks WHERE (AssessmentID = @AssessmentID) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc2:UCWebMessageBox ID="WebMessageBoxCourses" runat="server" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageButtonExcel" />
            <asp:PostBackTrigger ControlID="ImageButtonWord" />
            <asp:PostBackTrigger ControlID="ImageButtonPDF" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
