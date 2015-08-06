<%@ Page Title="SIS Staff Assessments" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="AssignmentsArchive.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
        function expandcollapse(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == "none") {
                div.style.display = "block";
                if (row == 'alt') {
                    img.src = "Images/minus.gif";
                }
                else {
                    img.src = "Images/minus.gif";
                }
                img.alt = "Close to view other Students";
            }
            else {
                div.style.display = "none";
                if (row == 'alt') {
                    img.src = "Images/plus.gif";
                }
                else {
                    img.src = "Images/plus.gif";
                }
                img.alt = "Expand to show Assessments";
            }
        } 
    </script>
    <style type="text/css">
        .contentclass
        {
            margin: 1em;
            border-collapse: collapse;
        }
        .headerclass
        {
            padding: .3em;
            border: 1px #ccc solid;
            background: #fc9;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            CLASSES</h2>
        <br />
        <table class="content-table" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Students/AssignmentsChecklist.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Assignments Checklist"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="content-table" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Staff/AssignmentsArchive.aspx" Enabled="False">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="Assignments Archive" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="content-right">
        <h2>
            INFORMATION</h2>
        <br />
        <asp:GridView ID="GridViewAssignmentsStudentsProgress" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyNames="AssignmentID" DataSourceID="SqlDataSourceAssignmentsStudentsProgress">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="javascript:expandcollapse('div<%# Eval("AssignmentID") %>', 'one');">
                            <img id="imgdiv<%# Eval("AssignmentID") %>" alt="Click to show/hide Orders for Customer <%# Eval("AssignmentID") %>"
                                border="0" src="../Staff/Images/plus.gif" />
                        </a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                </asp:TemplateField>
                <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                    <ItemStyle Width="220px" />
                </asp:BoundField>
                <asp:BoundField DataField="AssignmentDetails" HeaderText="Assignment Details" SortExpression="AssignmentDetails" />
                <asp:TemplateField HeaderText="Score">
                    <ItemTemplate>
                        <asp:Label ID="LabelScore" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="StudentName">
                    <ItemTemplate>
                        <tr>
                            <td colspan="100%">
                                <div id="div<%# Eval("AssignmentID") %>" style="display: none; position: relative;
                                    overflow: auto;">
                                    <br />
                                    <table width="100%">
                                        <tr>
                                            <td width="35">
                                                &nbsp;
                                            </td>
                                            <td width="120">
                                                <asp:Label ID="LabelStudentName0" runat="server" Font-Bold="True" Text="Multiple Choice"
                                                    ForeColor="Red"></asp:Label>
                                            </td>
                                            <td width="120">
                                                <asp:Label ID="LabelStudentName1" runat="server" Font-Bold="True" ForeColor="Red"
                                                    Text="True False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStudentName2" runat="server" Font-Bold="True" ForeColor="Red"
                                                    Text="Short Answer"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                &nbsp;
                                            </td>
                                            <td valign="top">
                                                <asp:GridView ID="GridViewMC" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssignmentsStudentsProgressMC">
                                                    <Columns>
                                                        <asp:BoundField DataField="QuestionNo" HeaderText="No" SortExpression="QuestionNo">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle HorizontalAlign="Left" Width="70px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="Point" SortExpression="QuestionPoint">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LabelMCPoint" runat="server" Text='<%# Bind("QuestionPoint") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataRowStyle HorizontalAlign="Center" Width="100px" />
                                                    <EmptyDataTemplate>
                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/No_Data_Icon.png" />
                                                        <br />
                                                        <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="X-Small" Text="No Data!"></asp:Label>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </td>
                                            <td valign="top">
                                                <asp:GridView ID="GridViewTF" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssignmentsStudentsProgressTF"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="QuestionNo" HeaderText="No" SortExpression="QuestionNo">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle Width="70px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="Point" SortExpression="QuestionPoint">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LabelTFPoint" runat="server" Text='<%# Bind("QuestionPoint") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataRowStyle HorizontalAlign="Center" Width="100px" />
                                                    <EmptyDataTemplate>
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Staff/Images/No_Data_Icon.png" />
                                                        <br />
                                                        <asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Size="X-Small" Text="No Data!"></asp:Label>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </td>
                                            <td valign="top">
                                                <asp:GridView ID="GridViewSA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssignmentsStudentsProgressSA"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="QuestionNo" HeaderText="No" SortExpression="QuestionNo">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle HorizontalAlign="Left" Width="70px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="Point" SortExpression="QuestionPoint">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LabelSAPoint" runat="server" Text='<%# Bind("QuestionPoint") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataRowStyle HorizontalAlign="Center" Width="100px" />
                                                    <EmptyDataTemplate>
                                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/No_Data_Icon.png" />
                                                        <br />
                                                        <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="X-Small" Text="No Data!"></asp:Label>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                &nbsp;
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStudentName3" runat="server" Font-Bold="True" ForeColor="Red"
                                                    Text="Score:"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStudentName4" runat="server" Font-Bold="True" ForeColor="Red"
                                                    Text="Score:"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStudentName5" runat="server" Font-Bold="True" ForeColor="Red"
                                                    Text="Score:"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td height="30">
                                                <asp:Label ID="LabelMCTotal" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelTFTotal" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelSATotal" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                    <asp:HiddenField ID="HiddenFieldAssignmentID" runat="server" Value='<%# Eval("AssignmentID") %>' />
                                    <asp:SqlDataSource ID="SqlDataSourceAssignmentsStudentsProgressMC" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT AssignmentID, UserID AS StudentID, QuestionNo, QuestionPoint, Status FROM vw_AssignmentsResponsesMC WHERE (AssignmentID = @AssignmentID) AND (UserID = @StudentID) ORDER BY QuestionNo">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentID" PropertyName="Value" />
                                            <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAssignmentsStudentsProgressTF" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)"
                                        InsertCommand="IF NOT EXISTS (
SELECT        AssignmentsStudentID
FROM            tbl_AssignmentsStudents
WHERE        (AssignmentID = @AssignmentID) AND  (StudentID= @StudentID)
)

INSERT INTO tbl_AssignmentsStudents(AssignmentID, StudentID) VALUES (@AssignmentID, @StudentID)" SelectCommand="SELECT AssignmentID, UserID AS StudentID, QuestionNo, Status, QuestionPoint FROM vw_AssignmentsResponsesTF WHERE (AssignmentID = @AssignmentID) AND (UserID = @StudentID) ORDER BY QuestionNo">
                                        <DeleteParameters>
                                            <asp:Parameter Name="AssignmentID" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="AssignmentID" />
                                            <asp:Parameter Name="StudentID" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentID" PropertyName="Value" />
                                            <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAssignmentsStudentsProgressSA" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT AssignmentsUserID, AssignmentID, UserID AS StudentID, QuestionNo, Status, QuestionPoint FROM vw_AssignmentsResponsesSA WHERE (AssignmentID = @AssignmentID) AND (UserID = @StudentID) ORDER BY QuestionNo">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentID" PropertyName="Value" />
                                            <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <br />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" Width="35px" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div align="center">
                    <br />
                    <img alt="" src="../Staff/Images/no-data.png" />
                </div>
            </EmptyDataTemplate>
            <RowStyle Height="25px" />
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
        <br />
        <br />
        <asp:Panel ID="PanelQuiz" runat="server" Visible="False">
            <br />
            <asp:Label ID="Label40" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="You have completed 0 %."></asp:Label>
        </asp:Panel>
        <br />
        <br />
        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceAssignmentsStudentsProgress" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT tbl_AssignmentsStudents.StudentID, tbl_AssignmentsStudents.AssignmentID, tbl_Students.StudentName, tbl_Assignments.AssignmentDetails, tbl_Students.CurrentSectionID FROM tbl_AssignmentsStudents INNER JOIN tbl_Students ON tbl_AssignmentsStudents.StudentID = tbl_Students.StudentID INNER JOIN tbl_Assignments ON tbl_AssignmentsStudents.AssignmentID = tbl_Assignments.AssignmentID WHERE (tbl_AssignmentsStudents.StudentID = @StudentID) ORDER BY tbl_Students.StudentName">
            <SelectParameters>
                <asp:SessionParameter Name="StudentID" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
