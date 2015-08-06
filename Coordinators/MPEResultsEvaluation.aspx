<%@ Page Title="SIS General Test Scores" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="MPEResultsEvaluation.aspx.vb" Inherits="General_Test_Scores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuMPExams.ascx" TagName="MenuMPExams" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            MENU</h2>
        <br />
        <uc1:MenuMPExams ID="MenuMPExams1" runat="server" />
        <br />
        <table class="content-table" width="240">
            <tr>
                <td height="30">
                    <asp:Label ID="Label35" runat="server" Text="School Sections"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                        DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                        Font-Size="X-Small">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Label ID="Label30" runat="server" Text="Mitra Pasiad Exams"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:DropDownList ID="DropDownListGeneralTests" runat="server" DataSourceID="SqlDataSourceDropDownListGeneralTests"
                        DataTextField="GeneralTestName" DataValueField="GeneralTestID" TabIndex="7" Width="95%">
                        <asp:ListItem Value="">Not Selected!</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Label ID="Label34" runat="server" Text="Courses"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:RadioButtonList ID="RadioButtonListCourses" runat="server" AutoPostBack="True"
                        Width="95%">
                        <asp:ListItem Value="31">Physics</asp:ListItem>
                        <asp:ListItem Value="33">Biology</asp:ListItem>
                        <asp:ListItem Value="30">Mathematics</asp:ListItem>
                        <asp:ListItem Value="32">Chemistry</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="content-right">
        <h2>
            MPE RESULTS BY SCORES</h2>
        <br />
        <asp:Label ID="LabelTopicStatus1" runat="server" Font-Bold="False" Font-Size="XX-Small"
            ForeColor="Red">Step 1-a: Select a Mitra Pasiad Exam and a Course from the menu on the left.</asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 1-b: When you select a MP Exam that includes Essay Questions, Student Names will be listed together with TextBoxes.</asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 1-c: Please input your score and use update button. If you want to update your score, simply submit again.</asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridViewGeneralTestsStudents" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSourceGeneralTestsStudents" ShowHeader="False" Width="680px"
            AllowPaging="True" PageSize="5">
            <Columns>
                <asp:TemplateField HeaderText="Student " SortExpression="StudentID">
                    <ItemTemplate>
                        <table width="100%">
                            <tr>
                                <td height="28" width="25">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/arrow.gif" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" ForeColor="Red"
                                        Text='<%# Eval("StudentName") %>'></asp:Label>
                                </td>
                                <td width="300">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    
                                </td>
                                <td>
                                    <asp:Label ID="LabelStudentName1" runat="server" Font-Bold="True" ForeColor="Black"
                                        Text="Insert / Update Scores:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LabelStudentName0" runat="server" Font-Bold="True" ForeColor="Black"
                                        Text="Current Scores:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td valign="top">
                                    <asp:DataList ID="DataListGeneralTestsQuestions" runat="server" DataKeyField="GeneralTestsQuestionID"
                                        DataSourceID="SqlDataSourceGeneralTestsQuestions" RepeatDirection="Horizontal"
                                        Width="300px" RepeatColumns="5">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td height="25" width="45">
                                                        <asp:Label ID="LabelNo" runat="server" Font-Bold="True" Text="No: "></asp:Label>
                                                        <asp:Label ID="LabelQuestionNo" runat="server" Font-Bold="True" Text='<%# Eval("GeneralTestQuestionNo") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxScore" runat="server" MaxLength="1" Width="20px"></asp:TextBox>
                                                        <asp:RangeValidator ID="RangeValidatorEssay" runat="server" ControlToValidate="TextBoxScore"
                                                            ErrorMessage="Attention: Maximum Score is 6!" Font-Bold="True" ForeColor="Red"
                                                            MaximumValue="6" MinimumValue="0" Type="Integer" ValidationGroup='<%# "Essay_" & Container.ItemIndex.ToString %>'>*</asp:RangeValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEssay" runat="server" ControlToValidate="TextBoxScore"
                                                            ErrorMessage="Please Write a Score between 0-6" Font-Bold="True" ForeColor="Red"
                                                            ValidationGroup='<%# "Essay_" & Container.ItemIndex.ToString %>' Enabled="False">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <br />
                                    <asp:Label ID="LabelNoEssay" runat="server" Font-Bold="True" ForeColor="Red" Text="Sorry, No Essay Questions Found!"
                                        Visible="False"></asp:Label>
                                </td>
                                <td valign="top">
                                    <asp:DataList ID="DataListGeneralTestsQuestionsSE" runat="server" DataKeyField="GeneralTestQuestionTypeID"
                                        DataSourceID="SqlDataSourceGeneralTestsQuestionsSE" RepeatDirection="Horizontal"
                                        RepeatColumns="5">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td height="25" width="45">
                                                        <asp:Label ID="LabelNo" runat="server" Font-Bold="True" Text="No: "></asp:Label>
                                                        <asp:Label ID="LabelQuestionNo" runat="server" Font-Bold="True" Text='<%# Eval("GeneralTestQuestionNo") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label33" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Score") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <br />
                                    <asp:Label ID="LabelNoScores" runat="server" Font-Bold="True" ForeColor="Red" Text="Sorry, No Scores Added Yet!"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td height="35">
                                    
                                </td>
                                <td>
                                    <asp:Button ID="ButtonUpdateScores" runat="server" OnClick="ButtonUpdateScores_Click"
                                        Text="Update These Scores Only" ValidationGroup='<%# "Essay_" & Container.DataItemIndex.ToString %>' />
                                </td>
                                <td>
                                    <asp:ValidationSummary ID="ValidationSummaryEssay" runat="server" ValidationGroup='<%# "Essay_" & Container.DataItemIndex.ToString %>'
                                        Font-Bold="True" ForeColor="Red" />
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                        <asp:SqlDataSource ID="SqlDataSourceGeneralTestsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT tbl_GeneralTestsQuestions.GeneralTestsQuestionID, tbl_GeneralTestsQuestions.GeneralTestQuestionNo, tbl_GeneralTestsQuestions.GeneralTestID, tbl_GeneralTestsQuestions.GeneralTestQuestionType, tbl_GeneralTestsQuestions.Publish, tbl_CourseCategories.CourseCategoryID FROM tbl_GeneralTestsQuestions INNER JOIN tbl_CourseCatalog ON tbl_GeneralTestsQuestions.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID INNER JOIN tbl_CourseCategories ON tbl_CourseCatalog.CourseCategoryID = tbl_CourseCategories.CourseCategoryID WHERE (tbl_GeneralTestsQuestions.GeneralTestID = @GeneralTestID) AND (tbl_GeneralTestsQuestions.Publish = 1) AND (tbl_GeneralTestsQuestions.GeneralTestQuestionType = 2) AND (tbl_CourseCategories.CourseCategoryID = @CourseCategoryID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListGeneralTests" Name="GeneralTestID" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:ControlParameter ControlID="RadioButtonListCourses" Name="CourseCategoryID"
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceGeneralTestsQuestionsSE" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            InsertCommand="UPDATE tbl_GeneralTestsQuestionsES SET Score = @Score, AddedBy = @AddedBy WHERE (GeneralTestID = @GeneralTestID) AND (GeneralTestQuestionNo = @GeneralTestQuestionNo) AND (StudentID = @StudentID)

IF @@ROWCOUNT = 0 

INSERT INTO tbl_GeneralTestsQuestionsES(GeneralTestID, GeneralTestQuestionNo, StudentID, Score, AddedBy) VALUES (@GeneralTestID, @GeneralTestQuestionNo, @StudentID, @Score, @AddedBy)"
                            SelectCommand="SELECT tbl_GeneralTestsQuestionsES.GeneralTestQuestionTypeID, tbl_GeneralTestsQuestionsES.GeneralTestQuestionNo, tbl_GeneralTestsQuestionsES.Score, tbl_CourseCategories.CourseCategoryID FROM tbl_CourseCatalog INNER JOIN tbl_GeneralTestsQuestions ON tbl_CourseCatalog.CourseCatalogID = tbl_GeneralTestsQuestions.CourseCatalogID INNER JOIN tbl_CourseCategories ON tbl_CourseCatalog.CourseCategoryID = tbl_CourseCategories.CourseCategoryID INNER JOIN tbl_GeneralTestsQuestionsES ON tbl_GeneralTestsQuestions.GeneralTestID = tbl_GeneralTestsQuestionsES.GeneralTestID AND tbl_GeneralTestsQuestions.GeneralTestQuestionNo = tbl_GeneralTestsQuestionsES.GeneralTestQuestionNo WHERE (tbl_GeneralTestsQuestionsES.GeneralTestID = @GeneralTestID) AND (tbl_GeneralTestsQuestionsES.StudentID = @StudentID) AND (tbl_CourseCategories.CourseCategoryID = @CourseCategoryID)">
                            <InsertParameters>
                                <asp:Parameter Name="Score" />
                                <asp:Parameter Name="AddedBy" />
                                <asp:Parameter Name="GeneralTestID" />
                                <asp:Parameter Name="GeneralTestQuestionNo" />
                                <asp:Parameter Name="StudentID" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListGeneralTests" Name="GeneralTestID" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                <asp:ControlParameter ControlID="RadioButtonListCourses" Name="CourseCategoryID"
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentID") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div align="center">
                    <br />
                    <img alt="" src="../Coordinators/Images/no-data.png" />
                    <br />
                    <br />
                    <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                        Text="Please Select an Exam from the List to see Records!"></asp:Label>
                    <br />
                    <br />
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:Label ID="LabelCheck" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceDropDownListGeneralTests" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT GeneralTestID, GeneralTestName FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestGroupName">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceGeneralTestsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT StudentID, StudentName FROM vw_GeneralTestsStudents WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListGeneralTests" Name="GeneralTestID" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
