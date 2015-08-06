<%@ Page Title="SIS General Test Settings" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="GeneralTests.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" AutoPostBack="True"
                DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                Width="675px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="GridViewGeneralTestCodes" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="GeneralTestID" DataSourceID="SqlDataSourceGeneralTestsCodes" Width="675px">
                <Columns>
                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="GeneralTestID">
                        <ItemTemplate>
                            <asp:Label ID="LabelGeneralTestID" runat="server" Text='<%# Bind("GeneralTestID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AID" SortExpression="AcademicTermID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAID" runat="server" Text='<%# Bind("AcademicTermID") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Code" SortExpression="GeneralTestCodeID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxCodeID" runat="server" Text='<%# Bind("GeneralTestCodeID") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Code Name" SortExpression="GeneralTestCodeName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxCodeName" runat="server" Text='<%# Bind("GeneralTestCodeName") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group" SortExpression="GeneralTestCodeID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxGroupID" runat="server" Text='<%# Bind("GeneralTestGroupID") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group Name" SortExpression="GeneralTestGroupName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxGroupName" runat="server" Text='<%# Bind("GeneralTestGroupName") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                ImageUrl="~/Setup/Images/delete.gif" Text="Delete" Enabled="False" />
                            <asp:ConfirmButtonExtender ID="ImageButton1_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are you sure?" TargetControlID="ImageButton1">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Setup/Images/warning.png" />
                        <br />
                        <br />
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Italic="False" Text="Sorry! No Data Available!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <HeaderStyle Height="30px" />
                <RowStyle Height="30px" />
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateCodes" runat="server" Text="Update Exam Codes" Width="675px" />
            <br />
            <br />
            <asp:Label ID="LabelStatusCodes" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewGeneralTestsSettings" runat="server" AutoGenerateColumns="False"
                DataKeyNames="GeneralTestID" DataSourceID="SqlDataSourceGeneralTestsSettings"
                Width="675px" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="GeneralTestID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="GeneralTestID">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="GID" SortExpression="GeneralTestGroupID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxGroupID" runat="server" Text='<%# Bind("GeneralTestGroupID") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group Name" SortExpression="GeneralTestGroupName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxGroupName" runat="server" Text='<%# Bind("GeneralTestGroupName") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Test Name" SortExpression="GeneralTestName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxTestName" runat="server" Text='<%# Bind("GeneralTestName") %>'
                                Width="95%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Test Date" SortExpression="GeneralTestDate">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxTestDate" runat="server" Text='<%# Bind("GeneralTestDate", "{0:d}") %>'
                                Width="85%"></asp:TextBox>
                            <asp:CalendarExtender ID="TextBoxTestDate_CalendarExtender" runat="server" TargetControlID="TextBoxTestDate">
                            </asp:CalendarExtender>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Setup/Images/info.png"
                        HeaderText="Select">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Width="45px" HorizontalAlign="Center" />
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
                <RowStyle Height="30px" />
                <SelectedRowStyle BackColor="#FFFFCC" />
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateSettings" runat="server" Text="Update Exam Settings"
                Width="675px" />
            <br />
            <br />
            <asp:Label ID="LabelStatusSettings" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:FormView ID="FormViewGeneralTests" runat="server" DataKeyNames="GeneralTestID"
                DataSourceID="SqlDataSourceGeneralTestsSettings" DefaultMode="Insert" Width="500px">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label4" runat="server" Text="Code ID:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="CIDTextBox" runat="server" MaxLength="50" Text='<%# Bind("GeneralTestCodeID") %>'
                                    Width="220px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label5" runat="server" Text="Code Name:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="CodeNameTextBox" runat="server" MaxLength="50" Text='<%# Bind("GeneralTestCodeName") %>'
                                    Width="220px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label1" runat="server" Text="Group ID:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Text='<%# Bind("GeneralTestGroupID") %>'
                                    Width="220px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label11" runat="server" Text="Group Name:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" Text='<%# Bind("GeneralTestGroupName") %>'
                                    Width="220px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" width="110">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Test Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GeneralTestNameTextBox" runat="server" Text='<%# Bind("GeneralTestName") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label3" runat="server" Text="Test Date:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GeneralTestDateTextBox" runat="server" MaxLength="50" Text='<%# Bind("GeneralTestDate", "{0:d}") %>'
                                    Width="220px"></asp:TextBox>
                                <asp:CalendarExtender ID="GeneralTestDateTextBox_CalendarExtender" runat="server"
                                    TargetControlID="GeneralTestDateTextBox">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Add New Exam"
                                    Width="230px" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <br />
            <asp:GridView ID="GridViewGeneralTestQuestions" runat="server" AutoGenerateColumns="False"
                DataKeyNames="GeneralTestsQuestionID" DataSourceID="SqlDataSourceGeneralTestsQuestions"
                Width="675px" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="GeneralTestsQuestionID" HeaderText="ID" InsertVisible="False"
                        ReadOnly="True" SortExpression="GeneralTestsQuestionID">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Test" SortExpression="GeneralTestID">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListGeneralTests" runat="server" DataSourceID="SqlDataSourceDropDownListGeneralTests"
                                DataTextField="GeneralTestName" DataValueField="GeneralTestID" SelectedValue='<%# Bind("GeneralTestID") %>'
                                Width="95%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDropDownListGeneralTests" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT [GeneralTestID], [GeneralTestName] FROM [tbl_GeneralTests] WHERE ([AcademicTermID] = @AcademicTermID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course" SortExpression="GeneralTestQuestionGroup">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSourceDropDownListSubjects"
                                DataTextField="CourseCatalog" DataValueField="CourseCatalogID" SelectedValue='<%# Bind("CourseCatalogID") %>'
                                Width="95%" AppendDataBoundItems="True">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDropDownListSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT CourseCatalogID, CourseCatalog FROM tbl_CourseCatalog">
                            </asp:SqlDataSource>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No" SortExpression="GeneralTestQuestionNo">
                        <ItemTemplate>
                            <asp:Label ID="LabelQuestionNo" runat="server" Text='<%# Bind("GeneralTestQuestionNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type" SortExpression="GeneralTestQuestionType">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxType" runat="server" Text='<%# Bind("GeneralTestQuestionType") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publish" SortExpression="Publish">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxPublish" runat="server" Checked='<%# Bind("Publish") %>'
                                Text="Publish?" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" Width="75px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer" SortExpression="GeneralTestQuestionAnswer">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListAnswer" runat="server" SelectedValue='<%# Bind("GeneralTestQuestionAnswer") %>'
                                Width="95%">
                                <asp:ListItem Value="A"></asp:ListItem>
                                <asp:ListItem Value="B"></asp:ListItem>
                                <asp:ListItem Value="C"></asp:ListItem>
                                <asp:ListItem Value="D"></asp:ListItem>
                                <asp:ListItem Value="E"></asp:ListItem>
                                <asp:ListItem Value="0"></asp:ListItem>
                            </asp:DropDownList>
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
            <asp:Button ID="ButtonUpdateAnswers" runat="server" Text="Update Exam Questions"
                Width="675px" />
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:FormView ID="FormViewGeneralTestsQuestions" runat="server" DataKeyNames="GeneralTestsQuestionID"
                DataSourceID="SqlDataSourceGeneralTestsQuestions" DefaultMode="Insert" Width="500px">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Question Type:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListCoursesInsert0" runat="server" SelectedValue='<%# Bind("CourseCatalogID") %>'
                                    Width="230px">
                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                    <asp:ListItem Value="1">Multiple Choice</asp:ListItem>
                                    <asp:ListItem Value="2">Essay Question</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Question No: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GeneralTestQuestionNoTextBox" runat="server" Text='<%# Bind("GeneralTestQuestionNo") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label7" runat="server" Text="Correct Answer: " Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GeneralTestQuestionAnswerTextBox" runat="server" Text='<%# Bind("GeneralTestQuestionAnswer") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label9" runat="server" Text="Publish:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Publish") %>' Text="Publish?" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label8" runat="server" Text="Course:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListCoursesInsert" runat="server" DataSourceID="SqlDataSourceDropDownListCoursesInsert"
                                    DataTextField="CourseCatalog" DataValueField="CourseCatalogID" SelectedValue='<%# Bind("CourseCatalogID") %>'
                                    Width="230px">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
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
                    <asp:SqlDataSource ID="SqlDataSourceDropDownListCoursesInsert" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT [CourseCatalogID], [CourseCatalog] FROM [tbl_CourseCatalog] ORDER BY [CourseCatalog]">
                    </asp:SqlDataSource>
                </InsertItemTemplate>
            </asp:FormView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicSemesterID, AcademicYear + N' ' + AcademicSemester + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms  ORDER BY Active DESC, AcademicTerm">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGeneralTestsCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT GeneralTestID, AcademicTermID, GeneralTestCodeID, GeneralTestCodeName, GeneralTestGroupID, GeneralTestGroupName, GeneralTestName, GeneralTestDate FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestID DESC"
                UpdateCommand="UPDATE tbl_GeneralTests SET AcademicTermID = @AcademicTermID, GeneralTestCodeID = @GeneralTestCodeID, GeneralTestCodeName = @GeneralTestCodeName, GeneralTestGroupID = @GeneralTestGroupID, GeneralTestGroupName = @GeneralTestGroupName WHERE (GeneralTestID = @GeneralTestID)"
                DeleteCommand="DELETE FROM tbl_GeneralTests WHERE (GeneralTestID = @GeneralTestID)">
                <DeleteParameters>
                    <asp:Parameter Name="GeneralTestID" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="GeneralTestCodeID" />
                    <asp:Parameter Name="GeneralTestCodeName" />
                    <asp:Parameter Name="GeneralTestGroupID" />
                    <asp:Parameter Name="GeneralTestGroupName" />
                    <asp:Parameter Name="GeneralTestID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGeneralTestsSettings" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT GeneralTestID, AcademicTermID, GeneralTestName, GeneralTestDate, GeneralTestGroupID, GeneralTestGroupName, GeneralTestCodeID, GeneralTestCodeName FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestID DESC"
                UpdateCommand="UPDATE tbl_GeneralTests SET GeneralTestName = @GeneralTestName, GeneralTestDate = @GeneralTestDate, GeneralTestGroupID = @GeneralTestGroupID, GeneralTestGroupName = @GeneralTestGroupName WHERE (GeneralTestID = @GeneralTestID)"
                InsertCommand="INSERT INTO tbl_GeneralTests(GeneralTestName, GeneralTestDate, GeneralTestGroupID, GeneralTestGroupName, AcademicTermID, GeneralTestCodeID, GeneralTestCodeName) VALUES (@GeneralTestName, @GeneralTestDate, @GeneralTestGroupID, @GeneralTestGroupName, @AcademicTermID, @GeneralTestCodeID, @GeneralTestCodeName)">
                <InsertParameters>
                    <asp:Parameter Name="GeneralTestName" />
                    <asp:Parameter Name="GeneralTestDate" />
                    <asp:Parameter Name="GeneralTestGroupID" />
                    <asp:Parameter Name="GeneralTestGroupName" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:Parameter Name="GeneralTestCodeID" />
                    <asp:Parameter Name="GeneralTestCodeName" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="GeneralTestName" />
                    <asp:Parameter Name="GeneralTestDate" />
                    <asp:Parameter Name="GeneralTestGroupID" />
                    <asp:Parameter Name="GeneralTestGroupName" />
                    <asp:Parameter Name="GeneralTestID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGeneralTestsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                DeleteCommand="DELETE FROM tbl_GeneralTestsQuestions WHERE (GeneralTestsQuestionID = @GeneralTestsQuestionID)"
                InsertCommand="INSERT INTO tbl_GeneralTestsQuestions(GeneralTestID, GeneralTestQuestionNo, GeneralTestQuestionAnswer, GeneralTestQuestionType, CourseCatalogID, Publish) VALUES (@GeneralTestID, @GeneralTestQuestionNo, @GeneralTestQuestionAnswer, @GeneralTestQuestionType, @CourseCatalogID, @Publish)"
                SelectCommand="SELECT GeneralTestsQuestionID, GeneralTestID, GeneralTestQuestionNo, GeneralTestQuestionAnswer, CourseCatalogID, Publish, GeneralTestQuestionType FROM tbl_GeneralTestsQuestions WHERE (GeneralTestID = @GeneralTestID)"
                UpdateCommand="UPDATE tbl_GeneralTestsQuestions SET GeneralTestID = @GeneralTestID, GeneralTestQuestionNo = @GeneralTestQuestionNo, GeneralTestQuestionAnswer = @GeneralTestQuestionAnswer, GeneralTestQuestionType = @GeneralTestQuestionType, CourseCatalogID = @CourseCatalogID, Publish = @Publish WHERE (GeneralTestsQuestionID = @GeneralTestQuestionID)">
                <DeleteParameters>
                    <asp:Parameter Name="GeneralTestsQuestionID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="GridViewGeneralTestsSettings" Name="GeneralTestID"
                        PropertyName="SelectedValue" />
                    <asp:Parameter Name="GeneralTestQuestionNo" />
                    <asp:Parameter Name="GeneralTestQuestionAnswer" />
                    <asp:Parameter Name="GeneralTestQuestionType" />
                    <asp:Parameter Name="CourseCatalogID" />
                    <asp:Parameter Name="Publish" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewGeneralTestsSettings" Name="GeneralTestID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridViewGeneralTests" Name="GeneralTestID" PropertyName="SelectedValue" />
                    <asp:Parameter Name="GeneralTestQuestionNo" />
                    <asp:Parameter Name="GeneralTestQuestionAnswer" />
                    <asp:Parameter Name="GeneralTestQuestionType" />
                    <asp:Parameter Name="CourseCatalogID" />
                    <asp:Parameter Name="Publish" />
                    <asp:Parameter Name="GeneralTestQuestionID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
