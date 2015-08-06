<%@ Page Title="SIS General Test Scores" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AssessmentsMPExams.aspx.vb" Inherits="General_Test_Scores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessmentsStaff" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessmentsStaff ID="MenuAssessmentsMPExams" runat="server" />
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkMarksinTable" runat="server" ImageUrl="~/Staff/Images/menu_view.png"
                                NavigateUrl="~/Staff/AssessmentsStudentMarks.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label143" runat="server" Text="Marks in Table View"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkMarksinSheet" runat="server" ImageUrl="~/Staff/Images/menu_view.png"
                                NavigateUrl="~/Staff/AssessmentsStudentMarksAll.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label142" runat="server" Text="Marks in Sheet View"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label30" runat="server" Text="Mitra Pasiad Exams"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" height="28">
                            <asp:DropDownList ID="DropDownListGeneralTests" runat="server" DataSourceID="SqlDataSourceGeneralTests"
                                DataTextField="GeneralTestName" DataValueField="GeneralTestID" TabIndex="7" Width="95%">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label34" runat="server" Text="Courses"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListCourses" runat="server" Width="95%" Font-Size="X-Small"
                                RepeatColumns="2" RepeatDirection="Horizontal">
                                <asp:ListItem Value="31">Physics</asp:ListItem>
                                <asp:ListItem Value="33">Biology</asp:ListItem>
                                <asp:ListItem Value="30">Mathematics</asp:ListItem>
                                <asp:ListItem Value="32">Chemistry</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label35" runat="server" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                Font-Size="X-Small">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonShow" runat="server" Text="Show Results" Width="95%" />
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
                    MPE RESULTS</h2>
                <br />
                <asp:Label ID="LabelCheck0" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Small">MP Exam Results (Multiple Choice (70%) &amp; Free Response (30%))</asp:Label>
                <br />
                <br />
                <asp:Panel ID="PanelEmpty" runat="server" BorderColor="#999999" BorderStyle="Solid"
                    BorderWidth="1px" HorizontalAlign="Center" Width="680px">
                    <br />
                    <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Staff/Images/no-data.png" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label51" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#CC0000"
                        Text="Please Select a School Section from the Menu Left!"></asp:Label>
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                <br />
                <asp:DataList ID="DataListStudents" runat="server" Width="680px" BorderColor="#666666"
                    BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSourceStudents">
                    <AlternatingItemStyle BackColor="#E6E6E6" />
                    <HeaderTemplate>
                        <table width="100%">
                            <tr>
                                <td height="28" width="25">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td align="center" width="100">
                                    <asp:Label ID="LabelHeader" runat="server" Font-Bold="True" Text="MC Scores" ForeColor="Maroon"></asp:Label>
                                </td>
                                <td align="center" width="100">
                                    <asp:Label ID="LabelHeader0" runat="server" Font-Bold="True" ForeColor="Maroon">ES Scores</asp:Label>
                                </td>
                                <td align="center" width="100">
                                    <asp:Label ID="LabelHeader1" runat="server" Font-Bold="True" ForeColor="Maroon">TOTAL</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="center" width="100">
                                    <asp:Label ID="Label36" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="(70%) / max: 100"></asp:Label>
                                </td>
                                <td align="center" width="100">
                                    <asp:Label ID="Label37" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="(100%) / max: 30"></asp:Label>
                                </td>
                                <td align="center" width="100">
                                    <asp:Label ID="Label38" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="(100%) / max: 100"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" />
                    <ItemTemplate>
                        <table width="100%">
                            <tr>
                                <td height="20" width="25">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/arrow.gif" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" Text='<%# Eval("StudentName") %>'></asp:Label>
                                </td>
                                <td align="center" width="100">
                                    <asp:FormView ID="FormViewMCScore" runat="server">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelMCScore" runat="server" Font-Bold="True" Text='<%# Eval("Score") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:FormView>
                                </td>
                                <td align="center" width="100">
                                    <asp:FormView ID="FormViewESScore" runat="server">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelESScore" runat="server" Font-Bold="True" Text='<%# Eval("TotalScore") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:FormView>
                                </td>
                                <td align="center" width="100">
                                    <asp:Label ID="LabelTotalScore" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                        <asp:SqlDataSource ID="SqlDataSourceGeneralTestsMCScores" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT tbl_GeneralTestsScores.Score FROM tbl_GeneralTestsScores RIGHT OUTER JOIN tbl_CourseCatalog ON tbl_GeneralTestsScores.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID WHERE (tbl_GeneralTestsScores.StudentID = @StudentID) AND (tbl_GeneralTestsScores.GeneralTestID = @GeneralTestID) AND (tbl_CourseCatalog.CourseCategoryID = @CourseCategoryID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                <asp:Parameter Name="GeneralTestID" Type="Int32" DefaultValue="0" />
                                <asp:Parameter Name="CourseCategoryID" Type="Int32" DefaultValue="0" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceGeneralTestsESScoresPhyMat" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT SUM(Score) AS TotalScore FROM tbl_GeneralTestsQuestionsES WHERE (StudentID = @StudentID) AND (GeneralTestID = @GeneralTestID) AND (GeneralTestQuestionNo IN (21, 22, 23, 24, 25))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                <asp:Parameter Name="GeneralTestID" Type="Int32" DefaultValue="0" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceGeneralTestsESScoresBioChm" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT SUM(Score) AS TotalScore FROM tbl_GeneralTestsQuestionsES WHERE (StudentID = @StudentID) AND (GeneralTestID = @GeneralTestID) AND (GeneralTestQuestionNo IN (46, 47, 48, 49, 50))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                <asp:Parameter Name="GeneralTestID" Type="Int32" DefaultValue="0" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <asp:Label ID="LabelCheck" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND ([Continue] = 1) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGeneralTests" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT GeneralTestID, GeneralTestName FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestGroupName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
