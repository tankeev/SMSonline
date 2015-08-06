<%@ Page Title="Setup Asessments" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    CodeFile="Assessments.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table class="content-table" width="675">
                <tr>
                    <td height="30" width="120">
                        <asp:Label ID="LabelWeekNo3" runat="server" Font-Bold="True" Text="Select Course:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownListCourses"
                            DataTextField="CourseCategory" DataValueField="CourseCategoryID" TabIndex="7"
                            Width="200px">
                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                DataKeyNames="AssessmentID" DataSourceID="SqlDataSourceAssessments" ShowFooter="True"
                Width="675px" AllowPaging="True">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" style="width: 16px; height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AID" SortExpression="AssessmentID">
                        <ItemTemplate>
                            <asp:Label ID="LabelID" runat="server" Font-Bold="True" ForeColor="#CC0000" Text='<%# Bind("AssessmentID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section / Course / Assessment Type">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text=" / "></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("CourseCatalog") %>'></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text=" / "></asp:Label>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Assessments" SortExpression="Assessment">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAssessment" runat="server" Text='<%# Bind("Assessment") %>'
                                Width="90%" ValidationGroup="Update"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="L">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxIsLocked" runat="server" Checked='<%# Bind("IsLocked") %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" HeaderText="S">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif"
                                ToolTip="Update!" ValidationGroup="Update" />
                            <br />
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="D">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/delete.gif"
                                ToolTip="Delete!" OnClientClick="return confirm('Are you sure you want to delete this Assessment?')" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Administrators/Images/info.png"
                        ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <RowStyle Height="30px" />
                <SelectedRowStyle BackColor="#FFFFCC" />
            </asp:GridView>
            <br />
            <table width="675" style="border: 1px solid #990033; background-color: #FFDFEF">
                <tr>
                    <td height="28" width="20">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td width="120">
                        <asp:Label ID="LabelWeekNo1" runat="server" Text="Course Sections:"></asp:Label>
                    </td>
                    <td width="300">
                        <asp:DropDownList ID="DropDownListCourseSections" runat="server" DataSourceID="SqlDataSourceCourseSections"
                            DataTextField="CourseSection" DataValueField="CourseSectionID" Width="230px"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td align="center" rowspan="5" valign="top">
                    </td>
                </tr>
                <tr>
                    <td width="20">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td width="120">
                        <asp:Label ID="LabelWeekNo0" runat="server" Text="Assessment Type:"></asp:Label>
                    </td>
                    <td width="250">
                        <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceAssessmentTypes"
                            DataTextField="AssessmentType" DataValueField="CourseSectionAssessmentTypeID"
                            Width="230px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="28" width="20">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td width="120">
                        <asp:Label ID="LabelWeekNo" runat="server" Text="Assessment:"></asp:Label>
                    </td>
                    <td width="250">
                        <asp:TextBox ID="TextBoxAssessment" runat="server" Width="220px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td height="28">
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="ButtonAddAssessment" runat="server" Text="Add Assessment" ValidationGroup="AddWeek"
                            Width="95%" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                    </td>
                    <td colspan="2">
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridViewAssessmentQuestions" runat="server" AutoGenerateColumns="False"
                DataKeyNames="AssessmentsQuestionID" DataSourceID="SqlDataSourceGridviewAssessmentQuestions"
                Width="675px" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="AID" SortExpression="AssessmentID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAID" runat="server" Text='<%# Bind("AssessmentID") %>' Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Assessment" SortExpression="Assessment">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Assessment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No" SortExpression="AssessmentQuestionNo">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxNo" runat="server" Text='<%# Bind("AssessmentQuestionNo") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer" SortExpression="AssessmentQuestionAnswer">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAnswer" runat="server" Text='<%# Bind("AssessmentQuestionAnswer") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publish" SortExpression="Publish">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxPublish" runat="server" Checked='<%# Bind("Publish") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateAnswers" runat="server" Text="Update Changes" Width="675px" />
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceDropDownListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseCategoryID, CourseCategory FROM tbl_CourseCategories ORDER BY CourseCategory">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SectionCatalog, CourseCatalog, Description, AssessmentID, Assessment, IsLocked FROM vw_Assessments WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (CourseCategoryID = @CourseCategoryID) ORDER BY SectionCatalog, CourseCatalog, Description"
                UpdateCommand="UPDATE tbl_Assessments SET Assessment = @Assessment, IsLocked = @IsLocked WHERE (AssessmentID = @AssessmentID)"
                DeleteCommand="DELETE FROM tbl_Assessments WHERE (AssessmentID = @AssessmentID)"
                
                InsertCommand="INSERT INTO tbl_Assessments (CourseSectionAssessmentTypeID, Assessment, Date, IsLocked) VALUES (@CourseSectionAssessmentTypeID,@Assessment,@Date, 0) SET @LastAddedID = SCOPE_IDENTITY();">
                <DeleteParameters>
                    <asp:Parameter Name="AssessmentID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                    <asp:Parameter Name="Assessment" />
                    <asp:Parameter Name="Date" />
                    <asp:Parameter Name="LastAddedID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListCourses" Name="CourseCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Assessment" />
                    <asp:Parameter Name="IsLocked" />
                    <asp:Parameter Name="AssessmentID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseSectionAssessmentTypeID, SectionCategory + N' ' + CourseCategory + N' ' + AssessmentType AS AssessmentType FROM vw_CourseSectionAssessmentTypes">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseSectionID, SectionCatalog + N' ' + CourseCategory AS CourseSection FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (CourseCategoryID = @CourseCategoryID) ORDER BY CourseSection">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListCourses" Name="CourseCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourseSectionsAssessmentTypes" runat="server"
                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT CourseSectionAssessmentTypeID, SectionCatalog + N' ' + CourseCategory + N' ' + AssessmentType AS AssessmentType FROM vw_CourseSectionAssessmentTypes ORDER BY SectionCatalog + N' ' + CourseCategory + N' ' + AssessmentType">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseSectionAssessmentTypeID, AssessmentType FROM vw_CourseSectionAssessmentTypes WHERE (SchoolCode = @SchoolCode) AND (CourseSectionID = @CourseSectionID) ORDER BY AssessmentType">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListCourseSections" Name="CourseSectionID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewAssessmentQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_AssessmentsQuestions.AssessmentsQuestionID, tbl_AssessmentsQuestions.AssessmentID, tbl_AssessmentsQuestions.AssessmentQuestionNo, tbl_AssessmentsQuestions.AssessmentQuestionAnswer, tbl_AssessmentsQuestions.Publish, tbl_Assessments.Assessment, tbl_Assessments.Date FROM tbl_AssessmentsQuestions INNER JOIN tbl_Assessments ON tbl_AssessmentsQuestions.AssessmentID = tbl_Assessments.AssessmentID WHERE (tbl_AssessmentsQuestions.AssessmentID = @AssessmentID)"
                UpdateCommand="UPDATE tbl_AssessmentsQuestions SET AssessmentID = @AssessmentID, AssessmentQuestionNo = @AssessmentQuestionNo, AssessmentQuestionAnswer = @AssessmentQuestionAnswer, Publish = @Publish WHERE (AssessmentsQuestionID = @AssessmentsQuestionID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AssessmentID" />
                    <asp:Parameter Name="AssessmentQuestionNo" />
                    <asp:Parameter Name="AssessmentQuestionAnswer" />
                    <asp:Parameter Name="Publish" />
                    <asp:Parameter Name="AssessmentsQuestionID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourseSectionStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT [StudentID], [CourseSectionID] FROM [vw_CourseSectionStudents]"
                InsertCommand="INSERT INTO tbl_AssessmentMarks(AssessmentID, StudentID, AssessmentMark) VALUES (@AssessmentID, @StudentID, @AssessmentMark)">
                <InsertParameters>
                    <asp:Parameter Name="AssessmentID" />
                    <asp:Parameter Name="StudentID" />
                    <asp:Parameter Name="AssessmentMark" />
                </InsertParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
