<%@ Page Title="SMS Comments" Language="VB" MasterPageFile="~/Site.Master" EnableEventValidation="false"
    AutoEventWireup="false" CodeFile="ReportCardsComments.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCards" TagPrefix="uc2" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc2:MenuReportCards ID="MenuReportCards" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label150" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Semester"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:GridView ID="GridViewAcademicSemesters" runat="server" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                DataKeyNames="AcademicSemesterID,AcademicTermID" DataSourceID="SqlDataSourceAcademicSemesters"
                                ShowHeader="False" Width="95%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Staff/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Academic Terms">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelAT" runat="server" Font-Size="XX-Small" Text='<%# Bind("AcademicTerm") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle Height="25px" />
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label149" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Report Type"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="56">
                            <asp:RadioButtonList ID="RadioButtonListReportTypes" runat="server" AutoPostBack="True"
                                Width="95%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                <asp:ListItem Value="1">Midterm Report Card</asp:ListItem>
                                <asp:ListItem Selected="True" Value="2">Final Report Card</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" Text="Select Course Sections"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="250">
                            <div style='overflow: auto; height: 100%;'>
                                <asp:GridView ID="GridViewCourseSections" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="SectionCatalogID,CourseCatalogID" DataSourceID="SqlDataSourceSectionsCourses"
                                    ShowHeader="False" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid"
                                    BorderWidth="1px">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                    ImageUrl="~/Staff/Images/radiobutton.png" Text="Select" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CourseSection" HeaderText="Course Section" ReadOnly="True"
                                            SortExpression="CourseSection" />
                                    </Columns>
                                    <RowStyle Height="22px" />
                                    <SelectedRowStyle BackColor="#FFFF66" />
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
                <div id="divPanels">
                    <asp:Panel ID="PanelInfoAssessmentsByStudents" runat="server" CssClass="MenuToolTip"
                        Style="display: none;" Width="240">
                        <asp:Label ID="Label1" runat="server" Text="Assessments By Students" ForeColor="Red"
                            Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label131" runat="server" Text="Click here to see Assessments Grouped By Students"></asp:Label>
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                    <asp:Panel ID="PanelInfoAssessmentsByCourses" runat="server" CssClass="MenuToolTip"
                        Style="display: none;" Width="240">
                        <asp:Label ID="Label2" runat="server" Text="Assessments By Courses" ForeColor="Red"
                            Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Click here to see Assessments Grouped By Courses"></asp:Label>
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                    <asp:Panel ID="PanelInfoAssessmentsChecklist" runat="server" CssClass="MenuToolTip"
                        Style="display: none;" Width="240">
                        <asp:Label ID="Label4" runat="server" Text="Assessments Checklist" ForeColor="Red"
                            Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Click here to update your Assessments."></asp:Label>
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                    <asp:Panel ID="PanelInfoAssessmentsStudentMarks" runat="server" CssClass="MenuToolTip"
                        Style="display: none;" Width="240">
                        <asp:Label ID="Label6" runat="server" Text="Assessments Marks" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Click here to update Assessments Marks."></asp:Label>
                        <img class="callout" src="images/callout.gif" />
                    </asp:Panel>
                </div>
            </div>
            <div class="content-right">
                <h2>
                    REPORT COMMENTS</h2>
                <br />
                <asp:GridView ID="GridViewComments" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="StudentID" DataSourceID="SqlDataSourceStudents" PageSize="8" ShowHeader="False"
                    Width="675px">
                    <Columns>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <ItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" Text='<%# Bind("StudentName") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:UpdatePanel ID="UpdatePanelComments" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:FormView ID="FormViewReportComments" runat="server" DataKeyNames="CommentID"
                                                        DataSourceID="SqlDataSourceReportComments" Width="100%" OnItemInserting="FormViewReportComments_ItemInserting">
                                                        <EditItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:TextBox ID="CommentTextBox" runat="server" Height="60px" Text='<%# Bind("Comment") %>'
                                                                            TextMode="MultiLine" Width="95%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="180">
                                                                        <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update Comment"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </EditItemTemplate>
                                                        <EmptyDataTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td valign="top" colspan="2">
                                                                        <asp:Label ID="CommentLabel" runat="server" Text="Sorry, No Comment Found!" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="180">
                                                                        <asp:Button ID="ButtonNew" runat="server" CommandName="New" Text="New Comment" Width="90%" />
                                                                    </td>
                                                                    <td valign="top">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </EmptyDataTemplate>
                                                        <InsertItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:TextBox ID="CommentTextBox0" runat="server" Height="60px" Text='<%# Bind("Comment") %>'
                                                                            TextMode="MultiLine" Width="95%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="180">
                                                                        <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Insert Comment"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel0" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td valign="top" colspan="2">
                                                                        <asp:Label ID="CommentLabel0" runat="server" Text='<%# Bind("Comment") %>' Width="95%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="180">
                                                                        <asp:Button ID="ButtonEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                                            Text="Edit Comment" Width="90%" />
                                                                    </td>
                                                                    <td valign="top">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:FormView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                <asp:SqlDataSource ID="SqlDataSourceReportComments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    DeleteCommand="DELETE FROM tbl_ReportComments WHERE (CommentID = @CommentID)"
                                    SelectCommand="SELECT CommentID, Comment, ReportTypeID, CourseCatalogID FROM tbl_ReportComments WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID) AND (ReportTypeID = @ReportTypeID) AND (CourseCatalogID = @CourseCatalogID)"
                                    InsertCommand="UPDATE tbl_ReportComments SET Comment = @Comment WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID) AND (ReportTypeID = @ReportTypeID) AND (CourseCatalogID = @CourseCatalogID)

IF @@ROWCOUNT=0

INSERT INTO tbl_ReportComments(AcademicTermID, AcademicSemesterID, ReportTypeID, StudentID, Comment, WrittenBy, CourseCatalogID, CourseSectionID) VALUES (@AcademicTermID, @AcademicSemesterID, @ReportTypeID, @StudentID, @Comment, @WrittenBy, @CourseCatalogID, @CourseSectionID)"
                                    UpdateCommand="UPDATE tbl_ReportComments SET Comment = @Comment WHERE (CommentID = @CommentID)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="CommentID" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="RadioButtonListReportTypes" Name="ReportTypeID"
                                            PropertyName="SelectedValue" />
                                        <asp:Parameter Name="CourseCatalogID" Type="Int32" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Comment" />
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="RadioButtonListReportTypes" Name="ReportTypeID"
                                            PropertyName="SelectedValue" />
                                        <asp:Parameter Name="CourseCatalogID" />
                                        <asp:Parameter Name="AcademicTermID" />
                                        <asp:SessionParameter Name="WrittenBy" SessionField="UserID" />
                                        <asp:Parameter Name="CourseSectionID" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Comment" />
                                        <asp:Parameter Name="CommentID" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red">Please Select a School Section to See Student List!</asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicSemesterID, AcademicTermID, AcademicYear + N' ' + AcademicSemester AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicYear + N' ' + AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSectionsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT CourseCatalogID, SectionCatalogID, SectionCatalog + N' ' + CourseCategory AS CourseSection, CourseCategory FROM vw_CourseSections WHERE (StaffID = @StaffID) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY CourseSection">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="GridViewCourseSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc1:WebMessageBox ID="WebMessageBoxComments" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
