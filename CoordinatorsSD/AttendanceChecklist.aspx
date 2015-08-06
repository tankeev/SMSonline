<%@ Page Title="SIS Attendance Checklist" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceChecklist.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendance" TagPrefix="usmac" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <usmac:MenuAttendance ID="MenuAttendanceLeft" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date"></asp:Label>
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
                            <asp:Label ID="Label43" runat="server" Font-Bold="True" Text="Select Periods"></asp:Label>
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
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label49" runat="server" Font-Bold="True" Text="Select Class Level Type"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:RadioButtonList ID="RadioButtonListRegulator" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="1">Regular</asp:ListItem>
                                <asp:ListItem Value="2">English</asp:ListItem>
                                <asp:ListItem Value="3">Turkce</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Section"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                RepeatColumns="4" Width="95%">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ATTENDANCE CHECKLIST</h2>
                <br />
                <table bgcolor="#F0F0F0" style="border: 1px solid #999999" width="675">
                    <tr>
                        <td height="35" width="25">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Coordinators/Images/menu-alt-24.png" />
                        </td>
                        <td height="35" width="130">
                            <asp:Label ID="Label32" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Subject Teacher:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListStaff" runat="server" DataSourceID="SqlDataSourceStaff"
                                DataTextField="StaffName" DataValueField="StaffID" Width="97%">
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorStaff" runat="server" ControlToValidate="DropDownListStaff"
                                ErrorMessage="Select A Staff Please!" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                ValidationGroup="Attendance">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            &nbsp;
                        </td>
                        <td height="30">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label38" runat="server" Font-Bold="True" Text="Ex:  "></asp:Label>
                            <asp:Label ID="Label36" runat="server" Text=" Mathematics"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="35">
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Coordinators/Images/menu-alt-24.png" />
                        </td>
                        <td height="35">
                            <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Title:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSourceCourses"
                                DataTextField="CourseCategory" DataValueField="CourseCategory" Width="97%">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="DropDownListCourses"
                                ErrorMessage="Select A Title Please!" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                ValidationGroup="Attendance">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            &nbsp;
                        </td>
                        <td height="30">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label39" runat="server" Font-Bold="True" Text="Ex:  "></asp:Label>
                            <asp:Label ID="Label37" runat="server" Text="Introduction to Counting Principles"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;
                        </td>
                        <td valign="top">
                            <asp:Label ID="Label31" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Teacher Notes:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxNotes" runat="server" Height="100px" Width="95%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNotes" runat="server" ControlToValidate="TextBoxNotes"
                                ErrorMessage="Write A Note Please!" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                ValidationGroup="Attendance">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            &nbsp;
                        </td>
                        <td height="25">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="675">
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelPresent0" runat="server" BackColor="#99CC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label17" runat="server" Font-Bold="True" ForeColor="Red" Text="(P) "></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="Present"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithoutLeave1" runat="server" BackColor="Red" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" Text="(A) "></asp:Label>
                            <asp:Label ID="Label14" runat="server" Text="Absent"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelSickLeave0" runat="server" BackColor="#FFFF99" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="130">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" Text="(S) "></asp:Label>
                            <asp:Label ID="Label13" runat="server" Text="Sick"></asp:Label>
                        </td>
                        <td width="120">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelPresent1" runat="server" BackColor="#009933" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Font-Bold="True" ForeColor="Red" Text="(L) "></asp:Label>
                            <asp:Label ID="Label15" runat="server" Text="Late"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithLeave0" runat="server" BackColor="#FF6699" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" Text="(O) "></asp:Label>
                            <asp:Label ID="Label41" runat="server" Text="Olympiad"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelEarlyLeave" runat="server" BackColor="#FFCC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Red" Text="(I) "></asp:Label>
                            <asp:Label ID="Label10" runat="server" Text="Permission"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="Label40" runat="server" Font-Bold="True" Text="///////////// Permissions for Today"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewAttendanceLeaves" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAttendanceLeaves" Width="675px" DataKeyNames="LeaveID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
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
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:GridView ID="GridViewAttendanceTypes" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="AttendanceTypeID" DataSourceID="SqlDataSourceAttendanceTypes" Width="675px"
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
                <asp:Label ID="Label48" runat="server" Font-Bold="True" Text="///////////// Student List"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    Width="675px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
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
                                    DataTextField="Definition" DataValueField="AttendanceTypeID" Width="95%">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
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
                <asp:Panel ID="PanelEmpty" runat="server" BorderColor="#999999" BorderStyle="Solid"
                    BorderWidth="1px" HorizontalAlign="Center" Width="675px">
                    <br />
                    <asp:Image ID="ImageEmpty0" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label51" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Please Select a Section from the Menu Left!"></asp:Label>
                    <br />
                    <br />
                </asp:Panel>
                <br />
                <asp:Button ID="ButtonAddAttendance" runat="server" Height="30px" Text="Add Attendance Records"
                    ValidationGroup="Attendance" Width="675px" />
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="Attendance"
                    Width="675px" />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, [Continue] FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND (SchoolCode = @SchoolCode) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudentsEng" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, [Continue] FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (LevelEng = @CurrentSectionID) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudentsTur" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (LevelTr = @CurrentSectionID) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendance" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AttendanceID, AcademicTermID, SchoolCode, StudentID, Date, Period, AttendanceTypeID, SavedOn, SavedAt, SavedBy FROM tbl_Attendance"
                    UpdateCommand="UPDATE tbl_Attendance SET AcademicTermID = @AcademicTermID, SchoolCode = @SchoolCode, AttendanceTypeID = @AttendanceTypeID, SavedOn = @SavedOn, SavedAt = @SavedAt, SavedBy = @SavedBy WHERE (StudentID = @StudentID) AND (Date = @Date) AND (Period = @Period) IF @@ROWCOUNT = 0 INSERT INTO tbl_Attendance(AcademicTermID, SchoolCode, StudentID, Date, Period, AttendanceTypeID, SavedOn, SavedAt, SavedBy) VALUES (@AcademicTermID, @SchoolCode, @StudentID, @Date, @Period, @AttendanceTypeID, @SavedOn, @SavedAt, @SavedBy)">
                    <UpdateParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="AttendanceTypeID" />
                        <asp:Parameter Name="SavedOn" />
                        <asp:Parameter Name="SavedAt" />
                        <asp:Parameter Name="SavedBy" />
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
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
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
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT Distinct CourseCategory FROM vw_Courses WHERE (SchoolCode = @SchoolCode) ORDER BY CourseCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [Definition], [Color], [AttendanceType] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
