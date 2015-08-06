<%@ Page Title="SIS Student Answers" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="GeneralTestsStudentsAnswers.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownListSections"
                DataTextField="SectionCatalog" DataValueField="CurrentSectionID" Width="675px">
                <asp:ListItem Value="">Select A School to Filter!</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="GridViewStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="StudentID" DataSourceID="SqlDataSourceGridviewStudents" Width="675px">
                <Columns>
                    <asp:BoundField DataField="SchoolName" HeaderText="School Name" SortExpression="SchoolName">
                        <ItemStyle Width="250px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                        <ItemStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Setup/Images/info.png" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:CommandField>
                </Columns>
                <SelectedRowStyle BackColor="#FFFF99" />
            </asp:GridView>
            <br />
            <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="Selected MP Exam"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownListMPExams" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceMPExams"
                DataTextField="GeneralTestName" DataValueField="GeneralTestID" Width="675px">
            </asp:DropDownList>
            <br />
            <br />
            <table style="border: 1px solid #993333; background-color: #E4B1B1;" width="675">
                <tr>
                    <td width="300" height="30">
                        <asp:DropDownList ID="DropDownListMPExamsHeader" runat="server" DataSourceID="SqlDataSourceMPExams"
                            DataTextField="GeneralTestName" DataValueField="GeneralTestID" Width="250px">
                        </asp:DropDownList>
                    </td>
                    <td width="180">
                        <asp:Button ID="ButtonOK" runat="server" Text="Change TextBoxes" Width="150px" />
                    </td>
                    <td>
                        <asp:Button ID="ButtonDataSync" runat="server" Text="Data Sync" Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:CheckBox ID="CheckBoxCheckAll" runat="server" AutoPostBack="True" Text="Check All" />
                    </td>
                    <td>
                        <asp:Button ID="ButtonChange" runat="server" OnClick="ButtonChange_Click" Text="Save TextBoxes"
                            Width="150px" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <br />
            <div style='overflow: auto; height: 250px;'>
                <br />
                <asp:GridView ID="GridViewGeneralTestQuestions" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="GeneralTestsStudentsAnswerID" DataSourceID="SqlDataSourceGeneralTestsQuestions"
                    Width="675px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxCheck" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="GeneralTestsStudentsAnswerID" HeaderText="GTSAID" InsertVisible="False"
                            ReadOnly="True" SortExpression="GeneralTestsStudentsAnswerID">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="TID" SortExpression="GeneralTestID">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxGeneralTestID" runat="server" Text='<%# Bind("GeneralTestID") %>'
                                    Width="25px"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="40px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test Name" SortExpression="GeneralTestName">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("GeneralTestName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="GeneralTestDate" DataFormatString="{0:D}" HeaderText="Test Date"
                            SortExpression="GeneralTestDate" />
                        <asp:TemplateField HeaderText="Question" SortExpression="GeneralTestQuestionNo">
                            <ItemTemplate>
                                <asp:Label ID="LabelQuestionNo" runat="server" Text='<%# Bind("GeneralTestQuestionNo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Answer" SortExpression="GeneralTestQuestionAnswer">
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
            </div>
            <asp:Button ID="ButtonUpdateAnswers" runat="server" Text="Update Answers" Width="675px" />
            <br />
            <br />
            <table width="675">
                <tr>
                    <td width="50%">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" Text="Insert Student Answer"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" Text="Upload Excel File"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FormView ID="FormViewGeneralTestsQuestions" runat="server" DataKeyNames="GeneralTestsQuestionID"
                            DataSourceID="SqlDataSourceGeneralTestsQuestions" DefaultMode="Insert" Width="100%">
                            <InsertItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td height="30" width="110">
                                            <asp:Label ID="Label5" runat="server" Text="General Test ID:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="GeneralTestIDTextBox" runat="server" Text='<%# Bind("GeneralTestID") %>'
                                                Width="220px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Label ID="Label6" runat="server" Text="Question No: "></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="GeneralTestQuestionNoTextBox" runat="server" Text='<%# Bind("GeneralTestQuestionNo") %>'
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
                    </td>
                    <td>
                        <table width="100%">
                            <tr>
                                <td height="30" width="30">
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUploadStaffData" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td height="30">
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rbHDR" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True" Text="Yes" Value="Yes">

                                        </asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td height="30">
                                </td>
                                <td>
                                    <asp:Button ID="ButtonUpload" runat="server" OnClick="btnUpload_Click" Text="Upload"
                                        ValidationGroup="UploadExcel" Width="90%" />
                                </td>
                            </tr>
                            <tr>
                                <td height="30">
                                </td>
                                <td>
                                    <asp:Button ID="ButtonAdd" runat="server" Text="Add Results to SIS" Width="90%" />
                                </td>
                            </tr>
                            <tr>
                                <td height="90">
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <div style='overflow: auto; width: 100%;'>
                <br />
                <asp:GridView ID="GridViewStudentAnswers" runat="server" Width="675px">
                    <Columns>
                        <asp:TemplateField HeaderText="Check">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxCheck" runat="server" Checked="True" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="40px" />
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
            </div>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT SchoolCode, CurrentSectionID, SectionCatalog FROM vw_GeneralTestsStudents WHERE (SchoolCode = @SchoolCode) ORDER BY SectionCatalog">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListGeneralTests" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT GeneralTestID, GeneralTestName FROM tbl_GeneralTests" UpdateCommand="UPDATE tbl_GeneralTestsStudentsAnswers SET GeneralTestID = @GeneralTestID WHERE (GeneralTestsStudentsAnswerID = @GeneralTestsStudentsAnswerID) UPDATE tbl_GeneralTestsStudentsAnswersTemp SET GeneralTestID = @GeneralTestID WHERE (GeneralTestsStudentsAnswerID = @GeneralTestsStudentsAnswerID)">
                <UpdateParameters>
                    <asp:Parameter Name="GeneralTestID" />
                    <asp:Parameter Name="GeneralTestsStudentsAnswerID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGeneralTestsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                InsertCommand="INSERT INTO tbl_GeneralTestsStudentsAnswers(GeneralTestID, GeneralTestQuestionNo, StudentID, StudentAnswer) VALUES (@GeneralTestID, @GeneralTestQuestionNo, @StudentID, @StudentAnswer)"
                SelectCommand="SELECT tbl_GeneralTestsStudentsAnswers.GeneralTestsStudentsAnswerID, tbl_GeneralTestsStudentsAnswers.GeneralTestID, tbl_GeneralTestsStudentsAnswers.GeneralTestQuestionNo, tbl_GeneralTestsStudentsAnswers.StudentID, tbl_GeneralTestsStudentsAnswers.StudentAnswer, tbl_GeneralTests.GeneralTestName, tbl_GeneralTests.GeneralTestDate FROM tbl_GeneralTestsStudentsAnswers INNER JOIN tbl_GeneralTests ON tbl_GeneralTestsStudentsAnswers.GeneralTestID = tbl_GeneralTests.GeneralTestID WHERE (tbl_GeneralTestsStudentsAnswers.StudentID = @StudentID) AND (tbl_GeneralTestsStudentsAnswers.GeneralTestID = @GeneralTestID) ORDER BY tbl_GeneralTestsStudentsAnswers.GeneralTestQuestionNo"
                UpdateCommand="UPDATE tbl_GeneralTestsStudentsAnswers SET StudentAnswer = @StudentAnswer WHERE (GeneralTestsStudentsAnswerID = @GeneralTestsStudentsAnswerID)"
                DeleteCommand="DELETE FROM tbl_GeneralTestsStudentsAnswers WHERE (GeneralTestsStudentsAnswerID = @GeneralTestsStudentsAnswerID)">
                <DeleteParameters>
                    <asp:Parameter Name="GeneralTestsStudentsAnswerID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="GeneralTestID" />
                    <asp:Parameter Name="GeneralTestQuestionNo" />
                    <asp:Parameter Name="StudentID" />
                    <asp:Parameter Name="StudentAnswer" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewStudents" Name="StudentID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListMPExams" Name="GeneralTestID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentAnswer" />
                    <asp:Parameter Name="GeneralTestsStudentsAnswerID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StudentName, SchoolName, StudentID, CurrentSectionID, SectionCatalog, SchoolCode FROM vw_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceMPExams" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT [GeneralTestName], [GeneralTestID] FROM [tbl_GeneralTests] WHERE ([AcademicTermID] = @AcademicTermID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ButtonUpload" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
