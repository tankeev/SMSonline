<%@ Page Title="SIS Staff Assessments" Language="VB" MasterPageFile="~/Site.Master"
    ValidateRequest="false" AutoEventWireup="false" CodeFile="AssignmentsArchive.aspx.vb"
    Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssignments.ascx" TagName="MenuAssignments" TagPrefix="uc1" %>
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
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU
                </h2>
                <br />
                <uc1:MenuAssignments ID="MenuAssignments" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonAssignStudents" runat="server" ImageUrl="~/Staff/Images/menu_assignments_assign.png" />
                        </td>
                        <td>
                            <asp:Label ID="Labdel1" runat="server" Text="Assign Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label34" runat="server" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="7"
                                Width="95%">
                                <asp:ListItem Value="">Select Section</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label28" runat="server" Text="Given Assignments:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxAssignments" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAssignments"
                                DataTextField="AssignmentDetails" DataValueField="AssignmentID" Height="250px"
                                Width="95%"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                        </td>
                    </tr>
                </table>
                <asp:ModalPopupExtender ID="MPAssignStudents" runat="server" PopupControlID="PanelStudents"
                    TargetControlID="ImageButtonAssignStudents" BackgroundCssClass="modalBackground"
                    CancelControlID="ButtonCloseStudents">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelStudents" runat="server" CssClass="modalPopup" Width="230px"
                    Style="display: none;">
                    <table width="100%">
                        <tr>
                            <td height="30">
                                <asp:Button ID="ButtonCloseStudents" runat="server" Text="Close" Width="95%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:DropDownList ID="DropDownListAssignments" runat="server" AutoPostBack="True"
                                    DataSourceID="SqlDataSourceDropDownListAssignments" DataTextField="AssignmentDetails"
                                    DataValueField="AssignmentID" TabIndex="7" Width="95%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Red" Text="Assign Selected Assignment to:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:DropDownList ID="DropDownListSectionsAssign" runat="server" AutoPostBack="True"
                                    DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                    TabIndex="7" Width="95%">
                                    <asp:ListItem Value="">Select Section</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <div style="overflow: scroll; height: 200px; white-space: nowrap; width: 220px">
                                    <asp:CheckBoxList ID="CheckBoxListStudents" runat="server" DataSourceID="SqlDataSourceStudents"
                                        DataTextField="StudentName" DataValueField="StudentID" Font-Size="XX-Small" Width="95%">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="35">
                                <asp:CheckBox ID="CheckBoxCheckAll" runat="server" AutoPostBack="True" Font-Bold="True"
                                    ForeColor="Red" OnCheckedChanged="CheckBoxCheckAll_CheckedChanged" Text="Check / UnCheck All Students" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="ButtonUpdateStudents" runat="server" OnClick="ButtonUpdateStudents_Click"
                                    Text="Assign Students" Width="95%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="LabelStatusStudents" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ASSIGNMENTS ARCHIVE</h2>
                <br />
                <asp:GridView ID="GridViewAssignmentsStudentsProgress" runat="server" AutoGenerateColumns="False"
                    Width="680px" DataKeyNames="AssignmentID" DataSourceID="SqlDataSourceAssignmentsStudentsProgress">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="javascript:expandcollapse('div<%# Eval("StudentID") %>', 'one');">
                                    <img id="imgdiv<%# Eval("StudentID") %>" alt="Click to show/hide Orders for Customer <%# Eval("StudentID") %>"
                                        border="0" src="Images/plus.gif" />
                                </a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
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
                                        <div id="div<%# Eval("StudentID") %>" style="display: none; position: relative; overflow: auto;">
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
                                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/No_Data_Icon.png" />
                                                                <br />
                                                                <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="X-Small" Text="No Data!"></asp:Label>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                                    </td>
                                                    <td valign="top">
                                                        <asp:GridView ID="GridViewSA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssignmentsStudentsProgressSA"
                                                            OnRowDataBound="GridViewSA_RowData_Bound" Width="100%">
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
                                                                <asp:TemplateField HeaderText="???">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImageButtonEdit" runat="server" ImageUrl="~/Staff/Images/edit.png" />
                                                                        <asp:ModalPopupExtender ID="MPEShortAnswer" runat="server" PopupControlID="PanelShortAnswer"
                                                                            TargetControlID="ImageButtonEdit" CancelControlID="ButtonCloseAssignments" BackgroundCssClass="modalBackground">
                                                                        </asp:ModalPopupExtender>
                                                                        <asp:Panel ID="PanelShortAnswer" runat="server" CssClass="modalPopup">
                                                                            <table width="250">
                                                                                <tr>
                                                                                    <td height="25">
                                                                                        <asp:Button ID="ButtonCloseAssignments" runat="server" Text="Close" Width="99%" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:FormView ID="FormViewSACheck" runat="server" DataKeyNames="AssignmentsUserID"
                                                                                            DataSourceID="SqlDataSourceSA" DefaultMode="Edit" OnItemUpdated="FormViewSAItemUpdated"
                                                                                            Width="240px">
                                                                                            <EditItemTemplate>
                                                                                                <asp:Label ID="Label30" runat="server" Text="Student Response:" Font-Bold="True"></asp:Label>
                                                                                                <br />
                                                                                                <br />
                                                                                                <asp:TextBox ID="StudentResponseTextBox" runat="server" Text='<%# Bind("UserResponse") %>'
                                                                                                    Height="50px" TextMode="MultiLine" Width="96%" />
                                                                                                <br />
                                                                                                <br />
                                                                                                <asp:Label ID="Label31" runat="server" Text="Answer:"></asp:Label>
                                                                                                <br />
                                                                                                <br />
                                                                                                <asp:TextBox ID="AnswerTextBox" runat="server" Text='<%# Bind("Answer") %>' Height="50px"
                                                                                                    TextMode="MultiLine" Width="96%" />
                                                                                                <br />
                                                                                                <br />
                                                                                                <asp:CheckBox ID="isRightCheckBox" runat="server" Checked='<%# Bind("isRight") %>'
                                                                                                    Font-Bold="True" ForeColor="Red" Text="Is the Answer Correct?" />
                                                                                                <br />
                                                                                                <br />
                                                                                                <asp:Button ID="ButtonCloseAssignments" runat="server" CommandName="Update" Text="Update"
                                                                                                    Width="99%" />
                                                                                            </EditItemTemplate>
                                                                                        </asp:FormView>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="30">
                                                                                        <asp:Label ID="LabelStatusAssignments" runat="server" ForeColor="Red"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <br />
                                                                        </asp:Panel>
                                                                        <asp:HiddenField ID="HiddenFieldAssignmentsUserID" runat="server" Value='<%# Eval("AssignmentsUserID") %>' />
                                                                        <asp:SqlDataSource ID="SqlDataSourceSA" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                            SelectCommand="SELECT AssignmentsUserID, UserResponse, Answer, isRight FROM vw_AssignmentsResponsesSACheck WHERE (AssignmentsUserID = @AssignmentsUserID)"
                                                                            UpdateCommand="UPDATE tbl_AssignmentsResponsesSA SET isRight = @isRight WHERE (AssignmentsUserID = @AssignmentsUserID)">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="HiddenFieldAssignmentsUserID" Name="AssignmentsUserID"
                                                                                    PropertyName="Value" />
                                                                            </SelectParameters>
                                                                            <UpdateParameters>
                                                                                <asp:Parameter Name="isRight" />
                                                                                <asp:Parameter Name="AssignmentsUserID" />
                                                                            </UpdateParameters>
                                                                        </asp:SqlDataSource>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
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
                                            <br />
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
                                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT AssignmentID, UserID AS StudentID, QuestionNo, Status, QuestionPoint FROM vw_AssignmentsResponsesTF WHERE (AssignmentID = @AssignmentID) AND (UserID = @StudentID) ORDER BY QuestionNo">
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
                            <img alt="" src="Images/no-data.png" />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="25px" />
                    <SelectedRowStyle BackColor="#FFFFCC" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelTotal" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT AssignmentID, AssignmentDetails FROM tbl_Assignments WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (StaffID = @StaffID)"
                    InsertCommand="INSERT INTO tbl_Assignments(AssignmentDetails, StaffID, DateAdded, DateDeadline) VALUES (@AssignmentDetails, @StaffID, @DateAdded, @DateDeadline)"
                    DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AssignmentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentDetails" />
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="DateAdded" />
                        <asp:Parameter Name="DateDeadline" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)"
                    InsertCommand="INSERT INTO tbl_Assignments(AssignmentDetails, StaffID, DateAdded, DateDeadline) VALUES (@AssignmentDetails, @StaffID, @DateAdded, @DateDeadline)"
                    SelectCommand="SELECT DISTINCT tbl_Assignments.AssignmentID, tbl_Assignments.AssignmentDetails, tbl_Assignments.StaffID, tbl_Assignments.DateAdded, tbl_Assignments.DateDeadline, tbl_Students.CurrentSectionID FROM tbl_Assignments INNER JOIN tbl_AssignmentsStudents ON tbl_Assignments.AssignmentID = tbl_AssignmentsStudents.AssignmentID INNER JOIN tbl_Students ON tbl_AssignmentsStudents.StudentID = tbl_Students.StudentID WHERE (tbl_Assignments.AcademicTermID = @AcademicTermID) AND (tbl_Assignments.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AssignmentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentDetails" />
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="DateAdded" />
                        <asp:Parameter Name="DateDeadline" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsStudentsProgress" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_AssignmentsStudents.StudentID, tbl_AssignmentsStudents.AssignmentID, tbl_Students.StudentName, tbl_Assignments.AssignmentDetails, tbl_Students.CurrentSectionID FROM tbl_AssignmentsStudents INNER JOIN tbl_Students ON tbl_AssignmentsStudents.StudentID = tbl_Students.StudentID INNER JOIN tbl_Assignments ON tbl_AssignmentsStudents.AssignmentID = tbl_Assignments.AssignmentID WHERE (tbl_AssignmentsStudents.AssignmentID = @AssignmentID) AND (tbl_Students.CurrentSectionID = @CurrentSectionID) ORDER BY tbl_Students.StudentName"
                    InsertCommand="INSERT INTO tbl_AssignmentsStudents(AssignmentID, StudentID) VALUES (@AssignmentID, @StudentID)"
                    DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AssignmentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentID" />
                        <asp:Parameter Name="StudentID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxAssignments" Name="AssignmentID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSectionsAssign" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)"
                    InsertCommand="IF NOT EXISTS (
SELECT        AssignmentsStudentID
FROM            tbl_AssignmentsStudents
WHERE        (AssignmentID = @AssignmentID) AND  (StudentID= @StudentID)
)

INSERT INTO tbl_AssignmentsStudents(AssignmentID, StudentID) VALUES (@AssignmentID, @StudentID)
" SelectCommand="SELECT tbl_AssignmentsStudents.StudentID, tbl_Students.StudentName, tbl_AssignmentsStudents.AssignmentID FROM tbl_AssignmentsStudents INNER JOIN tbl_Students ON tbl_AssignmentsStudents.StudentID = tbl_Students.StudentID WHERE (tbl_AssignmentsStudents.AssignmentID = @AssignmentID) ORDER BY tbl_Students.StudentName">
                    <DeleteParameters>
                        <asp:Parameter Name="AssignmentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentID" />
                        <asp:Parameter Name="StudentID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAssignments" Name="AssignmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
