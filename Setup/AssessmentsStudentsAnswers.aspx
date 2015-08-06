<%@ Page Title="SIS Asessment Students Answers" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="AssessmentsStudentsAnswers.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table class="content-table" width="98%">
                <tr>
                    <td height="30" width="140">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Select School:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceDropDownSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                            Width="98%">
                            <asp:ListItem Value="">Select A School to Filter!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Select Section:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownListSections"
                            DataTextField="SectionCatalog" DataValueField="CurrentSectionID" Width="98%">
                            <asp:ListItem Value="">Select A School to Filter!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Select Assessment:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListAssessments" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceDropDownListAssessments" DataTextField="Assessment"
                            DataValueField="AssessmentID" Width="98%">
                            <asp:ListItem Value="">Select A School to Filter!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridViewStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="StudentID" DataSourceID="SqlDataSourceGridviewStudents" Width="100%">
                <Columns>
                    <asp:BoundField DataField="SchoolName" HeaderText="School Name" SortExpression="SchoolName">
                        <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SectionCategory" HeaderText="Section" SortExpression="SectionCategory">
                        <ItemStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Setup/Images/info.png" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:GridView ID="GridViewAssessmentsQuestions" runat="server" AutoGenerateColumns="False"
                DataKeyNames="AssessmentsStudentsAnswerID" DataSourceID="SqlDataSourceAssessmentsQuestions"
                Width="100%" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="AssessmentsStudentsAnswerID" HeaderText="GTSAID" InsertVisible="False"
                        ReadOnly="True" SortExpression="AssessmentsStudentsAnswerID">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Test ID" SortExpression="AssessmentID">
                        <ItemTemplate>
                            <asp:Label ID="LabelTestID" runat="server" Text='<%# Eval("AssessmentID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Assessment" HeaderText="Test Name" SortExpression="Assessment" />
                    <asp:BoundField DataField="Date" DataFormatString="{0:D}" HeaderText="Test Date"
                        SortExpression="Date" />
                    <asp:TemplateField HeaderText="Question" SortExpression="AssessmentQuestionNo">
                        <ItemTemplate>
                            <asp:Label ID="LabelQuestionNo" runat="server" Text='<%# Eval("AssessmentQuestionNo") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer" SortExpression="StudentAnswer">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAnswer" runat="server" Text='<%# Bind("StudentAnswer") %>'
                                Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Setup/Images/delete.gif" ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Setup/Images/warning.png" />
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="False" Text="Sorry! No Data Available!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateAnswers" runat="server" Text="Update Answers" Width="100%" />
            <br />
            <br />
            <br />
            <asp:FormView ID="FormViewGeneralTestsQuestions" runat="server" DataKeyNames="AssessmentsStudentsAnswerID"
                DataSourceID="SqlDataSourceAssessmentsQuestions" DefaultMode="Insert" Width="500px">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td height="30" width="110">
                                <asp:Label ID="Label5" runat="server" Text="Assessment ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GeneralTestIDTextBox" runat="server" Width="220px" Text='<%# Bind("AssessmentID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label6" runat="server" Text="Question No: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GeneralTestQuestionNoTextBox" runat="server" Text='<%# Bind("AssessmentQuestionNo") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label7" runat="server" Text="Student Answer: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GeneralTestQuestionAnswerTextBox" runat="server" Text='<%# Bind("StudentAnswer") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Add New Question"
                                    Width="230px" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceDropDownSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools ORDER BY SchoolName">
                <InsertParameters>
                    <asp:Parameter Name="RoleName" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT SchoolCode, CurrentSectionID, SectionCatalog FROM vw_GeneralTestsStudents WHERE (SchoolCode = @SchoolCode) ORDER BY SectionCatalog">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT tbl_AssessmentsStudentsAnswers.AssessmentID, tbl_CourseSectionAssessmentTypes.Description + N' /  ' + tbl_Assessments.Assessment AS Assessment, tbl_CourseSections.SectionCatalogID, tbl_CourseSections.SchoolCode FROM tbl_AssessmentsStudentsAnswers INNER JOIN tbl_Assessments ON tbl_AssessmentsStudentsAnswers.AssessmentID = tbl_Assessments.AssessmentID INNER JOIN tbl_CourseSectionAssessmentTypes ON tbl_Assessments.CourseSectionAssessmentTypeID = tbl_CourseSectionAssessmentTypes.CourseSectionAssessmentTypeID INNER JOIN tbl_CourseSections ON tbl_CourseSectionAssessmentTypes.CourseSectionID = tbl_CourseSections.CourseSectionID WHERE (tbl_CourseSections.SectionCatalogID = @SectionCatalogID) AND (tbl_CourseSections.SchoolCode = @SchoolCode)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListGeneralTests" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT GeneralTestID, GeneralTestName FROM tbl_GeneralTests">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssessmentsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                InsertCommand="INSERT INTO tbl_AssessmentsStudentsAnswers(AssessmentID, AssessmentQuestionNo, StudentID, StudentAnswer) VALUES (@AssessmentID, @AssessmentQuestionNo, @StudentID, @StudentAnswer)"
                SelectCommand="SELECT tbl_AssessmentsStudentsAnswers.AssessmentsStudentsAnswerID, tbl_AssessmentsStudentsAnswers.AssessmentID, tbl_AssessmentsStudentsAnswers.AssessmentQuestionNo, tbl_AssessmentsStudentsAnswers.StudentID, tbl_AssessmentsStudentsAnswers.StudentAnswer, tbl_Assessments.Assessment, tbl_Assessments.Date FROM tbl_Assessments INNER JOIN tbl_AssessmentsStudentsAnswers ON tbl_Assessments.AssessmentID = tbl_AssessmentsStudentsAnswers.AssessmentID WHERE (tbl_AssessmentsStudentsAnswers.StudentID = @StudentID) AND (tbl_AssessmentsStudentsAnswers.AssessmentID = @AssessmentID)"
                UpdateCommand="UPDATE tbl_AssessmentsStudentsAnswers SET StudentAnswer = @StudentAnswer WHERE (AssessmentsStudentsAnswerID = @AssessmentsStudentsAnswerID)"
                DeleteCommand="DELETE FROM tbl_AssessmentsStudentsAnswers WHERE (AssessmentsStudentsAnswerID = @AssessmentsStudentsAnswerID)">
                <DeleteParameters>
                    <asp:Parameter Name="AssessmentsStudentsAnswerID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AssessmentID" />
                    <asp:Parameter Name="AssessmentQuestionNo" />
                    <asp:Parameter Name="StudentID" />
                    <asp:Parameter Name="StudentAnswer" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewStudents" Name="StudentID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentAnswer" />
                    <asp:Parameter Name="AssessmentsStudentsAnswerID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StudentName, SchoolName, StudentID, CurrentSectionID, SectionCategory, SchoolCode FROM vw_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
