<%@ Page Title="SIS Attendance Leaves" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceLeaves.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendance" TagPrefix="usmac" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU
                </h2>
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
                            <asp:Calendar ID="CalendarAttendance" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonClearDates" runat="server" Text="Clear Selected Dates" Width="95%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label43" runat="server" Font-Bold="True" Text="Select Period"></asp:Label>
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
            </div>
            <div class="content-right">
                <h2>
                    ATTENDANCE LEAVES</h2>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="100%">
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
                        <td width="90" align="right">
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
                            <asp:Label ID="Label1" runat="server" Text="Olympiad"></asp:Label>
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
                        <td align="right">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="Label51" runat="server" ForeColor="Red" Text="1) Select Section."></asp:Label>
                <br />
                <asp:Label ID="Label52" runat="server" ForeColor="Red" Text="2) Select Dates."></asp:Label>
                <br />
                <asp:Label ID="Label53" runat="server" ForeColor="Red" Text="3) Select Students."></asp:Label>
                <br />
                <asp:Label ID="Label54" runat="server" ForeColor="Red" Text="4) Select Period."></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    DataSourceID="SqlDataSourceStudents" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                        <asp:TemplateField HeaderText="Leave Type">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAttendanceTypes" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                    DataTextField="Definition" DataValueField="AttendanceTypeID" Width="95%" AppendDataBoundItems="True">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Details">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxDetails" runat="server" Width="80%"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle Width="180px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Select a Section to See the List!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdate" runat="server" Height="30px" Text="Add Students" Width="100%" />
                <br />
                <br />
                <asp:Panel ID="PanelAdded" runat="server" BackColor="White" BorderColor="#999999"
                    BorderWidth="1px" Visible="False" Width="100%">
                    <div align="center">
                        <br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="Images/success.png" />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Records  Have Been Added Successfully!"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, [Continue] FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND (SchoolCode = @SchoolCode) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [Definition] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceLeaves" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_AttendanceLeaves.AcademicTermID, tbl_AttendanceLeaves.StudentID, tbl_AttendanceLeaves.SavedBy, tbl_AttendanceLeaves.Date, tbl_AttendanceLeaves.SchoolCode, tbl_Students.CurrentSectionID, tbl_AttendanceLeaves.Details, tbl_AttendanceLeaves.Period1, tbl_AttendanceLeaves.Period2, tbl_AttendanceLeaves.Period3, tbl_AttendanceLeaves.Period4, tbl_AttendanceLeaves.Period5, tbl_AttendanceLeaves.Period6, tbl_AttendanceLeaves.Period7, tbl_AttendanceLeaves.Period8 FROM tbl_AttendanceLeaves INNER JOIN tbl_Students ON tbl_AttendanceLeaves.StudentID = tbl_Students.StudentID WHERE (tbl_AttendanceLeaves.Date = @Date) AND (tbl_AttendanceLeaves.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID)"
                    InsertCommand="INSERT INTO tbl_AttendanceLeaves(AcademicTermID, SchoolCode, SavedBy, StudentID, Date, Details, Period1, Period2, Period3, Period4, Period5, Period6, Period7, Period8, Period9) VALUES (@AcademicTermID, @SchoolCode, @SavedBy, @StudentID, @Date, @Details, @Period1, @Period2, @Period3, @Period4, @Period5, @Period6, @Period7, @Period8, @Period9)">
                    <InsertParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="SavedBy" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Details" />
                        <asp:Parameter Name="Period1" />
                        <asp:Parameter Name="Period2" />
                        <asp:Parameter Name="Period3" />
                        <asp:Parameter Name="Period4" />
                        <asp:Parameter Name="Period5" />
                        <asp:Parameter Name="Period6" />
                        <asp:Parameter Name="Period7" />
                        <asp:Parameter Name="Period8" />
                        <asp:Parameter Name="Period9" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CalendarAttendance" Name="Date" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
