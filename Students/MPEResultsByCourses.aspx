<%@ Page Title="SIS Asessment Settings" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="MPEResultsByCourses.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="230">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label32" runat="server" Text="MP Exams"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:ListBox ID="ListBoxMPExams" runat="server" DataSourceID="SqlDataSourceGeneralTestsStudents"
                                DataTextField="GeneralTestName" DataValueField="GeneralTestID" Height="250px"
                                Width="95%" AutoPostBack="True"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    MP EXAMS COURSE RESULTS</h2>
                <br />
                <asp:GridView ID="GridViewGeneralTestsStudents" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="GeneralTestID" DataSourceID="SqlDataSourceGeneralTestsStudentsReports"
                    Width="100%" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Courses">
                            <ItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td width="25" height="110">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <table style="background-color: #EBEBEB; border: 1px solid #999999">
                                                <tr>
                                                    <td colspan="3" height="25">
                                                        <asp:Label ID="CourseLabel" runat="server" Font-Bold="True" Text='<%# Eval("CourseCategory") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" width="75">
                                                        <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" Text="Correct"></asp:Label>
                                                    </td>
                                                    <td width="75">
                                                        <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="Red" Text="Wrong"></asp:Label>
                                                    </td>
                                                    <td width="75">
                                                        <asp:Label ID="Label26" runat="server" Font-Bold="True" ForeColor="Red" Text="Score"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25">
                                                        <asp:Label ID="Correct" runat="server" Font-Bold="True" Text='<%# Eval("Correct") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Wrong" runat="server" Font-Bold="True" Text='<%# Eval("Wrong") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Score" runat="server" Font-Bold="True" Text='<%# Eval("Score") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="75">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:DataList ID="DataListGeneralTestStudentAnswers" runat="server" DataKeyField="GeneralTestsStudentsAnswerID"
                                                DataSourceID="SqlDataSourceGeneralTestStudentAnswers" OnItemDataBound="Item_DataBound"
                                                RepeatColumns="25" RepeatDirection="Horizontal">
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
                                <br />
                                <asp:HiddenField ID="HiddenFieldGeneralTestID" runat="server" Value='<%# Eval("GeneralTestID") %>' />
                                <asp:SqlDataSource ID="SqlDataSourceGeneralTestStudentAnswers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT GeneralTestsStudentsAnswerID, GeneralTestQuestionNo, QuestionAnswer, StudentAnswer FROM vw_GeneralTestsAnswerKeys WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (CourseCategory = @CourseCategory) ORDER BY GeneralTestQuestionNo">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldGeneralTestID" Name="GeneralTestID" PropertyName="Value" />
                                        <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                                        <asp:ControlParameter ControlID="CourseLabel" Name="CourseCategory" PropertyName="Text" />
                                    </SelectParameters>
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
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Record Found!!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Label ID="LabelCheck" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT GeneralTestID, GeneralTestName FROM vw_GeneralTestsStudents WHERE (StudentID = @StudentID) AND (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestName">
                    <SelectParameters>
                        <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsStudentsReports" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT GeneralTestID, StudentID, GeneralTestScoreID, GeneralTestCodeID, GeneralTestGroupID, Correct, Wrong, NotAnswered, Score, StudentName, CurrentSectionID, SectionCatalog, CourseCatalogID, CourseCategory, SchoolCode, GeneralTestName, GeneralTestDate FROM vw_GeneralTestsScoresCalculated WHERE (StudentID = @StudentID) AND (GeneralTestID = @GeneralTestID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="ListBoxMPExams" Name="GeneralTestID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
