<%@ Page Title="SIS Staff Assessments" Language="VB" MasterPageFile="~/Site.Master"
    ValidateRequest="false" AutoEventWireup="false" CodeFile="StaffAssignmentsArchive.aspx.vb"
    Inherits="NewUserAccount" %>

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
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>

    <div id="right_wrap">
        <div id="right_content">
            <h2>
                INFORMATION</h2>
            <br />
            <div id="divChild">
                                                                                                 

                <asp:GridView ID="GridViewAssignmentsTeachersProgress" runat="server" AutoGenerateColumns="False"
                    Width="100%" DataKeyNames="AssignmentID" DataSourceID="SqlDataSourceAssignmentsTeachersProgress">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="javascript:expandcollapse('div<%# Eval("TeacherID") %>', 'one');">
                                    <img id="imgdiv<%# Eval("TeacherID") %>" alt="Click to show/hide Orders for Customer <%# Eval("TeacherID") %>"
                                        border="0" src="Images/plus.gif" />
                                </a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StaffName" HeaderText="Teacher Name" SortExpression="StaffName" />
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
                                        <div id="div<%# Eval("TeacherID") %>" style="display: none; position: relative; overflow: auto;">
                                            <br />
                                                                                       <table width="100%">
                                                <tr>
                                                    <td width="35">
                                                        
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
                                                        
                                                    </td>
                                                    <td valign="top">
                                                        <asp:GridView ID="GridViewMC" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssignmentsTeachersProgressMC">
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
                                                        <asp:GridView ID="GridViewTF" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssignmentsTeachersProgressTF"
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
                                                        <asp:GridView ID="GridViewSA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssignmentsTeachersProgressSA"
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
                                                                                                <asp:Label ID="Label30" runat="server" Text="Teacher Response:" 
                                                                                                    Font-Bold="True"></asp:Label>
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
                                                                        <asp:HiddenField ID="HiddenFieldAssignmentsUserID" runat="server" 
                                                                            Value='<%# Eval("AssignmentsUserID") %>' />
                                                                        <asp:SqlDataSource ID="SqlDataSourceSA" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                            SelectCommand="SELECT UserResponse, Answer, isRight, AssignmentsUserID FROM vw_AssignmentsResponsesSACheck WHERE (AssignmentsUserID = @AssignmentsTeacherID)"
                                                                            
                                                                            UpdateCommand="UPDATE tbl_AssignmentsResponsesSA SET isRight = @isRight WHERE (AssignmentsUserID = @AssignmentsUserID)">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="HiddenFieldAssignmentsUserID" Name="AssignmentsTeacherID"
                                                                                    PropertyName="Value" Type="Int32" />
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
                                            <asp:HiddenField ID="HiddenFieldTeacherID" runat="server" Value='<%# Eval("TeacherID") %>' />
                                            <asp:HiddenField ID="HiddenFieldAssignmentID" runat="server" Value='<%# Eval("AssignmentID") %>' />
                                            <asp:SqlDataSource ID="SqlDataSourceAssignmentsTeachersProgressMC" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT AssignmentID, UserID AS TeacherID, QuestionNo, QuestionPoint, Status FROM vw_AssignmentsResponsesMC WHERE (AssignmentID = @AssignmentID) ORDER BY QuestionNo">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentID" PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataSourceAssignmentsTeachersProgressTF" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT AssignmentID, UserID AS TeacherID, QuestionNo, Status, QuestionPoint FROM vw_AssignmentsResponsesTF WHERE (AssignmentID = @AssignmentID) ORDER BY QuestionNo">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentID" PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataSourceAssignmentsTeachersProgressSA" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT AssignmentsUserID, AssignmentID, UserID AS TeacherID, QuestionNo, Status, QuestionPoint FROM vw_AssignmentsResponsesSA WHERE (AssignmentID = @AssignmentID) ORDER BY QuestionNo">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentID" PropertyName="Value" />
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
            </div>
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT tbl_Assignments.AssignmentID, tbl_Assignments.AssignmentDetails FROM tbl_Assignments INNER JOIN aspnet_Roles ON tbl_Assignments.RoleID = aspnet_Roles.RoleId WHERE (tbl_Assignments.AcademicTermID = @AcademicTermID) AND (tbl_Assignments.StaffID = @StaffID) AND (aspnet_Roles.RoleName = N'Staff') ORDER BY tbl_Assignments.AssignmentDetails">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Assignments.AssignmentID, tbl_Assignments.AssignmentDetails FROM tbl_Assignments INNER JOIN aspnet_Roles ON tbl_Assignments.RoleID = aspnet_Roles.RoleId WHERE (tbl_Assignments.AcademicTermID = @AcademicTermID) AND (tbl_Assignments.StaffID = @StaffID) AND (aspnet_Roles.RoleName = N'Staff')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssignmentsTeachersProgress" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Assignments.AssignmentDetails, tbl_AssignmentsTeachers.AssignmentID, tbl_AssignmentsTeachers.TeacherID, tbl_Staff.StaffName FROM tbl_Assignments INNER JOIN tbl_AssignmentsTeachers ON tbl_Assignments.AssignmentID = tbl_AssignmentsTeachers.AssignmentID INNER JOIN tbl_Staff ON tbl_AssignmentsTeachers.TeacherID = tbl_Staff.StaffID WHERE (tbl_AssignmentsTeachers.AssignmentID = @AssignmentID)"
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
                    <asp:ControlParameter ControlID="ListBoxAssignments" Name="AssignmentID" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStaffCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT TOP (100) PERCENT tbl_CourseCatalog.CourseCategory FROM tbl_CourseSections INNER JOIN tbl_CourseCatalog ON tbl_CourseSections.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID WHERE (tbl_CourseSections.AcademicTermID = @AcademicTermID) AND (tbl_CourseSections.StaffID = @StaffID) AND (tbl_CourseCatalog.CourseCategory &lt;&gt; N'Guidance') ORDER BY tbl_CourseCatalog.CourseCategory">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT tbl_Staff.StaffID, tbl_Staff.StaffName, tbl_CourseCatalog.CourseCategory FROM tbl_Staff INNER JOIN tbl_CourseSections ON tbl_Staff.StaffID = tbl_CourseSections.StaffID INNER JOIN tbl_CourseCatalog ON tbl_CourseSections.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID WHERE (tbl_CourseCatalog.CourseCategory = @CourseCategory) ORDER BY tbl_Staff.StaffName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListStaffCourses" Name="CourseCategory"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssignmentsTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)"
                InsertCommand="IF NOT EXISTS (
SELECT        AssignmentsTeacherID
FROM            tbl_AssignmentsTeachers
WHERE        (AssignmentID = @AssignmentID) AND  (TeacherID= @StaffID)
)

INSERT INTO tbl_AssignmentsTeachers(AssignmentID, TeacherID) VALUES (@AssignmentID, @StaffID)"
                SelectCommand="SELECT tbl_Staff.StaffID, tbl_Staff.StaffName FROM tbl_AssignmentsTeachers INNER JOIN tbl_Staff ON tbl_AssignmentsTeachers.TeacherID = tbl_Staff.StaffID WHERE (tbl_AssignmentsTeachers.AssignmentID = @AssignmentID)">
                <DeleteParameters>
                    <asp:Parameter Name="AssignmentID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AssignmentID" />
                    <asp:Parameter Name="StaffID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAssignments" Name="AssignmentID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="sidebar" id="sidebar">
        <h2>
            ASSIGNMENT
        </h2>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/Default.aspx">Add New</asp:HyperLink>
                </td>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="Department Home"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/StaffAssignmentsChecklist.aspx">Add New</asp:HyperLink>
                </td>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" Text="Assignments Checklist"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/StaffAssignmentsArchive.aspx" Enabled="False">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="Assignments Archive" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td height="35">
                    <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" Width="95%" DataSourceID="SqlDataSourceAcademicTerms"
                        DataTextField="AcademicTerm" DataValueField="AcademicTermID" Enabled="False">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="35">
                    <asp:Button ID="ButtonAssignTeachers" runat="server" Text="Assign Teachers" Width="95%" />
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Label ID="Label28" runat="server" Text="Given Assignments:" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:ListBox ID="ListBoxAssignments" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAssignments"
                        DataTextField="AssignmentDetails" DataValueField="AssignmentID" Height="180px"
                        Width="95%"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td height="25">
                    
                </td>
            </tr>
        </table>
        <br />
        <asp:ModalPopupExtender ID="MPAssignStudents" runat="server" PopupControlID="PanelStudents"
            TargetControlID="ButtonAssignTeachers" BackgroundCssClass="modalBackground" CancelControlID="ButtonCloseStudents">
        </asp:ModalPopupExtender>
        <asp:Panel ID="PanelStudents" runat="server" CssClass="modalPopup" Width="230px">
            <table width="100%">
                <tr>
                    <td height="30">
                        <asp:Button ID="ButtonCloseStudents" runat="server" Text="Close" Width="95%" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:DropDownList ID="DropDownListStaffCourses" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceStaffCourses" DataTextField="CourseCategory" DataValueField="CourseCategory"
                            Width="95%">
                        </asp:DropDownList>
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
                        <div style="overflow: scroll; height: 200px; white-space: nowrap; width: 220px">
                            <asp:CheckBoxList ID="CheckBoxListTeachers" runat="server" DataSourceID="SqlDataSourceTeachers"
                                DataTextField="StaffName" DataValueField="StaffID" Font-Size="XX-Small" Width="95%">
                            </asp:CheckBoxList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="ButtonUpdateTeachers" runat="server" Text="Assign Teachers" Width="95%" />
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
    <div class="clear">
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
