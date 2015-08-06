<%@ Page Title="SIS Asessments By Students" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="AssessmentsByStudents.aspx.vb"
    Inherits="Assessments_ByStudents" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc2" %>
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
                            <asp:Label ID="Label36" runat="server" Font-Bold="True" ForeColor="Red" Text="School Levels"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" ForeColor="Red" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridViewRow">
                            <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="7"
                                Width="95%">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Student List" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxStudents" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceListBoxStudents"
                                DataTextField="StudentName" DataValueField="StudentID" Height="250px" Width="95%">
                            </asp:ListBox>
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
                    ASSESSMENTS BY STUDENTS</h2>
                <br />
                <table width="675" class="content-table">
                    <tr>
                        <td height="50">
                            <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" ForeColor="Red"
                                Font-Size="Medium"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonExcel" runat="server" ImageUrl="Images/export_excel.png" />
                        </td>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonWord" runat="server" ImageUrl="Images/export_word.png" />
                        </td>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonPDF" runat="server" ImageUrl="Images/export_pdf.png" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceGridViewAssessments" Font-Names="Arial" Font-Size="9pt"
                    PageSize="18" Width="675px">
                    <Columns>
                        <asp:BoundField DataField="CourseCategory" HeaderText="Course">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AssessmentType" HeaderText="Type">
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Assessment" HeaderText="Assessment">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" Width="300px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Score" HeaderText="Score">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="55px" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#CC0000"
                                Text="Sorry No Assessments Found!"></asp:Label>
                            <br />
                            <br />
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
                <asp:SqlDataSource ID="SqlDataSourceListBoxStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGridViewAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseCategory, AssessmentType, Assessment, Date, AssessmentMark AS Score FROM vw_AssessmentsByStudents WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (IsAcademic = 1) ORDER BY CourseCategory, AssessmentType">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc2:WebMessageBox ID="WebMessageBoxStudents" runat="server" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageButtonExcel" />
            <asp:PostBackTrigger ControlID="ImageButtonWord" />
            <asp:PostBackTrigger ControlID="ImageButtonPDF" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
