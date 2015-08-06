<%@ Page Title="SIS Attendance Checklist" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceChecklist.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendanceStaff" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        function ValidateCheckBoxList(sender, args) {
            var checkBoxList = document.getElementById("<%=CheckBoxListPeriods.ClientID %>");
            var checkboxes = checkBoxList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isValid = true;
                    break;
                }
            }
            args.IsValid = isValid;
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Calendar ID="CalendarAttendanceDate" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label43" runat="server" Font-Bold="True" Text="Select Periods:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxListPeriods" runat="server" RepeatColumns="4" Width="95%">
                                <asp:ListItem Value="1">P1</asp:ListItem>
                                <asp:ListItem Value="2">P2</asp:ListItem>
                                <asp:ListItem Value="3">P3</asp:ListItem>
                                <asp:ListItem Value="4">P4</asp:ListItem>
                                <asp:ListItem Value="5">P5</asp:ListItem>
                                <asp:ListItem Value="6">P6</asp:ListItem>
                                <asp:ListItem Value="7">P7</asp:ListItem>
                                <asp:ListItem Value="8">P8</asp:ListItem>
                                <asp:ListItem Value="9">P9</asp:ListItem>
                            </asp:CheckBoxList>
                            <asp:CustomValidator ID="CustomValidatorCheckBoxListPeriods" Display="None" ErrorMessage="Please Select Period(s)."
                                ClientValidationFunction="ValidateCheckBoxList" runat="server" ValidationGroup="Attendance">*</asp:CustomValidator>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label128" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Subject:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewSections" runat="server" AutoGenerateColumns="False" DataKeyNames="SectionCatalogID,CourseCategory"
                                DataSourceID="SqlDataSourceSections" ShowHeader="False" Width="95%" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Staff/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SectionCatalogID" HeaderText="SectionCatalogID" SortExpression="SectionCatalogID"
                                        Visible="False" />
                                    <asp:TemplateField HeaderText="Section" SortExpression="SectionCatalog">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelSection" runat="server" Text='<%# Bind("SectionCatalog") %>'
                                                Font-Size="XX-Small"></asp:Label>
                                            -<asp:Label ID="LabelCourse" runat="server" Text='<%# Eval("CourseCategory") %>'
                                                Font-Size="XX-Small"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/No_Data_Icon.png" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"
                                            Text="Sorry, No Subjects Found!"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ATTENDANCE CHECKLIST</h2>
                <br />
                <table bgcolor="#F0F0F0" style="border: 1px solid #999999" width="680">
                    <tr>
                        <td height="28" width="25" align="center">
                        </td>
                        <td>
                            <asp:Label ID="Label31" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Please Write Session Topic:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="TextBoxNotes" runat="server" Height="50px" Width="95%" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="20" valign="top">
                        </td>
                        <td valign="top">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername" runat="server"
                                ControlToValidate="TextBoxNotes" Display="None" ErrorMessage="Invalid Character!"
                                Font-Bold="True" ValidationExpression="^([a-zA-Z0-9.]|-|\s)+$" ValidationGroup="Attendance">*</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSessionTopic" runat="server"
                                ControlToValidate="TextBoxNotes" Display="None" ErrorMessage="Please Write Session Topic."
                                ValidationGroup="Attendance">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="PanelAttendanceLeaves" runat="server">
                    <asp:Label ID="Label40" runat="server" Font-Bold="True" Text="///////////// Permissions for Today"></asp:Label>
                    <br />
                    <asp:GridView ID="GridViewAttendanceLeaves" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceAttendanceLeaves" Width="680px" DataKeyNames="LeaveID">
                        <Columns>
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
                            <asp:TemplateField HeaderText="P1" SortExpression="AT1">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP1" runat="server" Text='<%# Eval("Period1") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P2" SortExpression="AT2">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP2" runat="server" Text='<%# Eval("Period2") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P3" SortExpression="AT3">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP3" runat="server" Text='<%# Eval("Period3") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P4" SortExpression="AT4">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP4" runat="server" Text='<%# Eval("Period4") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P5" SortExpression="AT5">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP5" runat="server" Text='<%# Eval("Period5") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P6" SortExpression="AT6">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP6" runat="server" Text='<%# Eval("Period6") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P7" SortExpression="AT7">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP7" runat="server" Text='<%# Eval("Period7") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P8" SortExpression="AT8">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP8" runat="server" Text='<%# Eval("Period8") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="P9" SortExpression="AT9">
                                <ItemTemplate>
                                    <asp:Label ID="LabelP9" runat="server" Text='<%# Eval("Period9") %>' Visible="False"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="D">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButtonDeleteAttendance" runat="server" CommandName="Delete"
                                        ImageUrl="images/Delete.gif" OnClientClick="return confirm('Gerçekten silmek istiyormusunuz?');" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <img alt="" src="images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                <br />
                                <br />
                                <asp:Label ID="LabelWarnings" runat="server" Font-Bold="True" Text="No Students with Permisson Today!"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:GridView ID="GridViewAttendanceTypes" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="AttendanceTypeID" DataSourceID="SqlDataSourceAttendanceTypes" Width="680px"
                        Visible="False">
                        <Columns>
                            <asp:TemplateField HeaderText="AttendanceTypeID" InsertVisible="False" SortExpression="AttendanceTypeID">
                                <ItemTemplate>
                                    <asp:Label ID="LabelATID" runat="server" Text='<%# Bind("AttendanceTypeID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AttendanceType" SortExpression="AttendanceType">
                                <ItemTemplate>
                                    <asp:Label ID="LabelAT" runat="server" Text='<%# Bind("AttendanceType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color" SortExpression="Color">
                                <ItemTemplate>
                                    <asp:Label ID="LabelCR" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                </asp:Panel>
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    Width="680px" DataSourceID="SqlDataSourceStudents">
                    <Columns>
                        <asp:TemplateField HeaderText="NO">
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Absence">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAttendanceTypes" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                    DataTextField="Definition" DataValueField="AttendanceTypeID" Width="90%">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Additional Notes (Optional)">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxNotes" runat="server" Width="175px"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Staff/Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="Label51" runat="server" Font-Bold="True" Text="Please Select a Subject from the Menu!"
                                Font-Size="Medium" ForeColor="#CC0000"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonAddAttendance" runat="server" Height="30px" Text="Add Attendance Records"
                    Width="680px" ValidationGroup="Attendance" />
                <br />
                <asp:ValidationSummary ID="ValidationSummaryPopup" runat="server" ValidationGroup="Attendance"
                    Font-Bold="False" ShowMessageBox="True" ShowSummary="False" />
                <uswnb:WebMessageBox ID="WebMessageBoxAttendance" runat="server" />
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM vw_AcademicTermsStudents WHERE (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendance" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AttendanceID, AcademicTermID, SchoolCode, StudentID, Date, Period, AttendanceTypeID, SavedOn, SavedAt, SavedBy, Notes FROM tbl_Attendance"
                    UpdateCommand="UPDATE tbl_Attendance SET AcademicTermID = @AcademicTermID, SchoolCode = @SchoolCode, AttendanceTypeID = @AttendanceTypeID, SavedOn = @SavedOn, SavedAt = @SavedAt, SavedBy = @SavedBy, Notes=@Notes WHERE (StudentID = @StudentID) AND (Date = @Date) AND (Period = @Period) IF @@ROWCOUNT = 0 INSERT INTO tbl_Attendance(AcademicTermID, SchoolCode, StudentID, Date, Period, AttendanceTypeID, SavedOn, SavedAt, SavedBy,Notes) VALUES (@AcademicTermID,@SchoolCode,@StudentID,@Date,@Period,@AttendanceTypeID,@SavedOn,@SavedAt,@SavedBy,@Notes)">
                    <UpdateParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="AttendanceTypeID" />
                        <asp:Parameter Name="SavedOn" />
                        <asp:Parameter Name="SavedAt" />
                        <asp:Parameter Name="SavedBy" />
                        <asp:Parameter Name="Notes" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Period" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceLeaves" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_AttendanceLeaves.AcademicTermID, tbl_AttendanceLeaves.StudentID, tbl_AttendanceLeaves.SavedBy, tbl_AttendanceLeaves.Date, tbl_AttendanceLeaves.SchoolCode, tbl_Students.CurrentSectionID, tbl_AttendanceLeaves.Details, tbl_AttendanceLeaves.Period1, tbl_AttendanceLeaves.Period2, tbl_AttendanceLeaves.Period3, tbl_AttendanceLeaves.Period4, tbl_AttendanceLeaves.Period5, tbl_AttendanceLeaves.Period6, tbl_AttendanceLeaves.Period7, tbl_AttendanceLeaves.Period8, tbl_Students.StudentName, tbl_AttendanceLeaves.LeaveID, tbl_AttendanceLeaves.Period9 FROM tbl_AttendanceLeaves INNER JOIN tbl_Students ON tbl_AttendanceLeaves.StudentID = tbl_Students.StudentID WHERE (tbl_AttendanceLeaves.Date = @Date) AND (tbl_AttendanceLeaves.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID)"
                    DeleteCommand="DELETE FROM tbl_AttendanceLeaves WHERE (LeaveID = @LeaveID)">
                    <DeleteParameters>
                        <asp:Parameter Name="LeaveID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CalendarAttendanceDate" Name="Date" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceClassRegister" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT RegisterID, AcademicTermID, Date, Notes, Status, StaffID, ReportedBy, SectionCatalogID, Period, Title FROM tbl_ClassRegister"
                    UpdateCommand="UPDATE tbl_ClassRegister SET StaffID = @StaffID, ReportedBy = @ReportedBy, Title = @Title, Notes = @Notes, Status = @Status WHERE (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (Date = @Date) AND (Period = @Period) IF @@ROWCOUNT=0 INSERT INTO tbl_ClassRegister(AcademicTermID, StaffID, ReportedBy, SectionCatalogID, Period, Date, Title, Notes, Status) VALUES (@AcademicTermID, @StaffID, @ReportedBy, @SectionCatalogID, @Period, @Date, @Title, @Notes, @Status)">
                    <UpdateParameters>
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="ReportedBy" />
                        <asp:Parameter Name="Title" />
                        <asp:Parameter Name="Notes" />
                        <asp:Parameter Name="Status" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Period" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) AND (StaffID = @StaffID) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT CourseCategory FROM vw_CourseSections WHERE (StaffID = @StaffID) AND (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT SectionCatalogID, SectionCatalog, SectionGroup, SectionType, CourseCategory FROM vw_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (StaffID = @StaffID) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [Definition], [Color], [AttendanceType] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
