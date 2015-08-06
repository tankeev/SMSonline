<%@ Page Title="SIS Attendance Checklist" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceChecklist.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendance" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAttendance ID="MenuAttendance1" runat="server" />
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
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label45" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Class Level Type:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:RadioButtonList ID="RadioButtonListRegulator" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">Regular</asp:ListItem>
                                <asp:ListItem Value="2">English</asp:ListItem>
                                <asp:ListItem Value="3">Turkce</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Section:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                RepeatColumns="4" Width="95%" Font-Size="X-Small">
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
                <table bgcolor="#F0F0F0" style="border: 1px solid #999999" width="680">
                    <tr>
                        <td height="35" width="25">
                            
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
                            
                        </td>
                        <td height="30">
                            
                        </td>
                        <td>
                            <asp:Label ID="Label38" runat="server" Font-Bold="True" Text="Ex:  "></asp:Label>
                            <asp:Label ID="Label36" runat="server" Text=" Mathematics"></asp:Label>
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                        <td height="35">
                            
                        </td>
                        <td height="35">
                            <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Title:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTitle" runat="server" Width="95%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="TextBoxTitle"
                                ErrorMessage="Write A Title Please!" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                ValidationGroup="Attendance">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            
                        </td>
                        <td height="30">
                            
                        </td>
                        <td>
                            <asp:Label ID="Label39" runat="server" Font-Bold="True" Text="Ex:  "></asp:Label>
                            <asp:Label ID="Label37" runat="server" Text="Introduction to Counting Principles"></asp:Label>
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            
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
                            
                        </td>
                        <td height="25">
                            
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="680">
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
                            
                        </td>
                        <td>
                            
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
                            
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAttendanceTypes" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                    DataTextField="Definition" DataValueField="AttendanceTypeID" Width="95%">
                                </asp:DropDownList>
                            </ItemTemplate>
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
                <br />
                <asp:Button ID="ButtonAddAttendance" runat="server" Height="30px" Text="Add Attendance Records"
                    ValidationGroup="Attendance" Width="680px" />
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="Attendance" />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Panel ID="PanelEmpty" runat="server" BorderColor="#999999" BorderWidth="1px"
                    Width="680px" BorderStyle="Solid" HorizontalAlign="Center">
                    <br />
                    <asp:Image ID="ImageEmpty" runat="server" 
                        ImageUrl="~/Coordinators/Images/warning.png" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Please Select a Section from the Menu Left!"></asp:Label>
                    <br />
                    <br />
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND (SchoolCode = @SchoolCode) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudentsEng" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, LevelEng, [Continue] FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (LevelEng = @CurrentSectionID) AND ([Continue] = 1) ORDER BY StudentName">
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
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [Definition] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
