<%@ Page Title="SIS General Test Results" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="MPEResultsByCourses.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuMPExams.ascx" TagName="MenuMPExams" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuMPExams ID="MenuMPExams" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label33" runat="server" Text="Given Courses"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSourceDropDownListCourses"
                                DataTextField="CourseCategory" DataValueField="CourseCategory" TabIndex="7" Width="95%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label30" runat="server" Text="Mitra Pasiad Exams"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListGeneralTestsGroups" runat="server" DataSourceID="SqlDataSourceDropDownListGeneralTestsGroups"
                                DataTextField="GeneralTestGroupName" DataValueField="GeneralTestGroupID" TabIndex="7"
                                Width="95%">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label34" runat="server" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:CheckBoxList ID="CheckBoxListSections" runat="server" DataSourceID="SqlDataSourceCheckBoxSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Button ID="ButtonFilter" runat="server" Text="Show Scores" Width="98%" />
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
                    MPE RESULTS BY COURSES</h2>
                <br />
                <div id="divChild">
                    <br />
                    <asp:Panel ID="PanelStatus" runat="server" Width="680px">
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select Grades to See Results!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PanelTestScores" runat="server">
                        <table width="500">
                            <tr>
                                <td width="30">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Administrators/Images/info.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label24" runat="server" Text="Use the Button to See Answer Key and Student's Answers"
                                        ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:GridView ID="GridViewGeneralTestsScores" runat="server" AutoGenerateColumns="False"
                            OnRowCommand="GridViewGeneralTestsScores_RowCommand" Width="680px">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/arrow.gif" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                                <asp:BoundField DataField="CourseCategory" HeaderText="Course" SortExpression="CourseCategory" />
                                <asp:BoundField DataField="Correct" HeaderText="Correct" SortExpression="Correct">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Wrong" HeaderText="Wrong" SortExpression="Wrong">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Score" SortExpression="Score">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelScore" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Score") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonShowAnswers" runat="server" CommandName="ShowAnswers"
                                            ImageUrl="~/Administrators/Images/info.png" ToolTip="Show Answers" CommandArgument='<%#  CType(Container,GridViewRow).RowIndex & ";" & Eval("CourseCategory") & ";" & Eval("GeneralTestName") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <tr>
                                            <td colspan="100%">
                                                <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                                <asp:HiddenField ID="HiddenFieldGeneralTestID" runat="server" Value='<%# Eval("GeneralTestID") %>' />
                                                <br />
                                                <asp:Label ID="CourseCategoryLabel" runat="server" Font-Bold="True" Font-Size="X-Small"
                                                    ForeColor="Red" Text=""></asp:Label>
                                                <table>
                                                    <tr>
                                                        <td align="center" width="80">
                                                        </td>
                                                        <td align="center">
                                                            <asp:DataList ID="DataListGeneralTestStudentAnswers" runat="server" DataKeyField="GeneralTestsStudentsAnswerID"
                                                                DataSourceID="SqlDataSourceGeneralTestStudentAnswers" RepeatColumns="25" RepeatDirection="Horizontal"
                                                                OnItemDataBound="Item_DataBound">
                                                                <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td align="center" height="15" width="15">
                                                                                <asp:Label ID="GeneralTestQuestionNoLabel" runat="server" Font-Bold="True" Font-Size="XX-Small"
                                                                                    Text='<%# Eval("GeneralTestQuestionNo") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center" height="15">
                                                                                <asp:Label ID="LabelKey" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# Eval("QuestionAnswer") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center" height="15">
                                                                                <asp:Label ID="LabelAnswer" runat="server" Font-Bold="True" Font-Size="XX-Small"
                                                                                    Text='<%# Eval("StudentAnswer") %>' />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:SqlDataSource ID="SqlDataSourceGeneralTestStudentAnswers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                    SelectCommand="SELECT GeneralTestQuestionNo, QuestionAnswer, StudentAnswer, GeneralTestsStudentsAnswerID, CourseCategory FROM vw_GeneralTestsStudents WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (CourseCategory = @CourseCategory)">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="HiddenFieldGeneralTestID" Name="GeneralTestID" PropertyName="Value" />
                                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                                        <asp:Parameter Name="CourseCategory" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center">
                                    <br />
                                    <img alt="" src="../Staff/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry, No Record Found!"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </asp:Panel>
                    <br />
                    <asp:Label ID="LabelCheck" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceDropDownListGeneralTestsGroups" runat="server"
                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT DISTINCT GeneralTestGroupID, GeneralTestGroupName, AcademicTermID FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestGroupName">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDropDownListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT DISTINCT CourseCategory FROM vw_Courses WHERE (IsAcademic = 1) AND (SchoolCode = @SchoolCode) ORDER BY CourseCategory">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceCheckBoxSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
