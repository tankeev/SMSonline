<%@ Page Title="SIS Confirm Uploads" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="GeneralTestsUploads.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table width="675" style="border: 1px solid #666666; background-color: #FFB0B0">
                <tr>
                    <td height="28" width="120">
                        <asp:Label ID="Label81" runat="server" Text="Select MP Exam" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListMPExams" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceMPExams"
                            DataTextField="GeneralTestName" DataValueField="GeneralTestID" Width="95%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="28">
                        <asp:CheckBox ID="CheckBoxAll" runat="server" AutoPostBack="True" ForeColor="Red"
                            Text="Check All" />
                    </td>
                    <td>
                        <asp:Button ID="ButtonDelete" runat="server" Text="Delete Selected Students" Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td height="28">
                    </td>
                    <td>
                        <asp:Button ID="ButtonUpdate" runat="server" Text="Update Listed Students" Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td height="28">
                    </td>
                    <td>
                        <asp:Button ID="ButtonBatchCopy" runat="server" Text="Batch Copy Student Data" Width="200px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="GeneralTestsStudentsAnswerID" DataSourceID="SqlDataSourceGridviewUploads"
                Width="675px" PageSize="25">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxCheck" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Table ID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelTableID" runat="server" Text='<%# Bind("GeneralTestsStudentsAnswerID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Test ID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelTestID" runat="server" Text='<%# Bind("GeneralTestID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="StudentID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="StaffName" HeaderText="Added By">
                        <ItemStyle Width="180px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                    <asp:TemplateField HeaderText="No" SortExpression="GeneralTestQuestionNo">
                        <ItemTemplate>
                            <asp:Label ID="LabelQuestionNo" runat="server" Text='<%# Bind("GeneralTestQuestionNo") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxStudentAnswer" runat="server" Width="25px" Text='<%# Bind("StudentAnswer") %>'></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Confirmed" HeaderText="Confirmed" SortExpression="Confirmed">
                        <ItemStyle Width="50px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceMPExams" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT [GeneralTestName], [GeneralTestID] FROM [tbl_GeneralTests] WHERE ([AcademicTermID] = @AcademicTermID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewUploads" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT GeneralTestsStudentsAnswerID, GeneralTestID, SchoolCode, GeneralTestQuestionNo, StudentID, StudentAnswer, StudentName, StaffName, StaffID, Confirmed, AcademicTermID FROM vw_GeneralTestsStudentsAnswersTemp WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode = @SchoolCode) AND (Confirmed = 0) ORDER BY StudentName, GeneralTestQuestionNo"
                DeleteCommand="DELETE FROM tbl_GeneralTestsStudentsAnswersTemp WHERE (GeneralTestsStudentsAnswerID = @GeneralTestsStudentsAnswerID)"
                InsertCommand="IF EXISTS 

(
SELECT GeneralTestsStudentsAnswerID FROM  tbl_GeneralTestsStudentsAnswers
WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (GeneralTestQuestionNo=@GeneralTestQuestionNo)) 

UPDATE tbl_GeneralTestsStudentsAnswers SET StudentAnswer = @StudentAnswer 
WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (GeneralTestQuestionNo = @GeneralTestQuestionNo) 

ELSE

INSERT INTO tbl_GeneralTestsStudentsAnswers (GeneralTestID, GeneralTestQuestionNo, StudentID, StudentAnswer) VALUES (@GeneralTestID, @GeneralTestQuestionNo, @StudentID, @StudentAnswer)

" UpdateCommand="UPDATE tbl_GeneralTestsStudentsAnswersTemp SET StudentAnswer = @StudentAnswer WHERE (GeneralTestsStudentsAnswerID = @GeneralTestsStudentsAnswerID)">
                <DeleteParameters>
                    <asp:Parameter Name="GeneralTestsStudentsAnswerID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="GeneralTestID" />
                    <asp:Parameter Name="StudentID" />
                    <asp:Parameter Name="GeneralTestQuestionNo" />
                    <asp:Parameter Name="StudentAnswer" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListMPExams" Name="GeneralTestID" PropertyName="SelectedValue"
                        Type="String" />
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentAnswer" />
                    <asp:Parameter Name="GeneralTestsStudentsAnswerID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBatchCopy" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT GeneralTestsStudentsAnswerID, GeneralTestID, SchoolCode, GeneralTestQuestionNo, StudentID, StudentAnswer, StudentName, StaffName, StaffID, Confirmed FROM vw_GeneralTestsStudentsAnswersTemp WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode = @SchoolCode)"
                UpdateCommand="UPDATE tbl_GeneralTestsStudentsAnswersTemp SET Confirmed = @Confirmed WHERE (GeneralTestsStudentsAnswerID = @GeneralTestsStudentsAnswerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListMPExams" Name="GeneralTestID" PropertyName="SelectedValue"
                        Type="String" />
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Confirmed" />
                    <asp:Parameter Name="GeneralTestsStudentsAnswerID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
