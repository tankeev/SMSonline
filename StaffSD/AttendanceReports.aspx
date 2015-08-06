<%@ Page Title="SIS Attendance Reports" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceReports.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendanceCoordinators" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAttendanceCoordinators ID="MenuAttendanceCoordinators" runat="server" />
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkView" runat="server" ImageUrl="~/StaffSD/Images/menu_view.png"
                                NavigateUrl="~/StaffSD/AttendanceTotal.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label142" runat="server" Text="Attendance By Date"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Starting Date:"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:TextBox ID="TextBoxStartDate" runat="server" Width="90%"></asp:TextBox>
                            <asp:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="TextBoxStartDate" Format="D">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label127" runat="server" Font-Bold="True" Text="Select Finish Date:"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:TextBox ID="TextBoxFinishDate" runat="server" Width="90%"></asp:TextBox>
                            <asp:CalendarExtender ID="TextBoxFinishDate_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="TextBoxFinishDate" Format="D">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Section:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                Width="95%" AutoPostBack="True" Font-Size="X-Small">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label128" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Student:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:DropDownList ID="DropDownListStudents" runat="server" TabIndex="7" Width="95%"
                                DataSourceID="SqlDataSourceStudents" DataTextField="StudentName" DataValueField="StudentID">
                                <asp:ListItem Value="">Select Section First</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonShow" runat="server" Text="Show Records" Width="95%" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ATTENDANCE REPORT</h2>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="100%">
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelPresent0" runat="server" BackColor="#99CC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="Present" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithoutLeave1" runat="server" BackColor="Red" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(A) "></asp:Label>
                            <asp:Label ID="Label14" runat="server" Text="Absent" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelSickLeave0" runat="server" BackColor="#FFFF99" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(S) "></asp:Label>
                            <asp:Label ID="Label13" runat="server" Text="Sick" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td class="style2">
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
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(L) "></asp:Label>
                            <asp:Label ID="Label15" runat="server" Text="Late" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithLeave0" runat="server" BackColor="#FF6699" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(O) "></asp:Label>
                            <asp:Label ID="Label9" runat="server" Text="Olympiad" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelEarlyLeave" runat="server" BackColor="#FFCC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(I) "></asp:Label>
                            <asp:Label ID="Label17" runat="server" Text="Permission" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewAttendanceReports" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAttendanceReports" Width="100%" DataKeyNames="StudentID"
                    OnDataBound="GridViewAttendanceReports_DataBound">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/StaffSD/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:D}">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="1" SortExpression="1">
                            <ItemTemplate>
                                <asp:Label ID="LabelP1" runat="server" Text='<%# Eval("1") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2" SortExpression="2">
                            <ItemTemplate>
                                <asp:Label ID="LabelP2" runat="server" Text='<%# Eval("2") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="3" SortExpression="3">
                            <ItemTemplate>
                                <asp:Label ID="LabelP3" runat="server" Text='<%# Eval("3") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="4" SortExpression="4">
                            <ItemTemplate>
                                <asp:Label ID="LabelP4" runat="server" Text='<%# Eval("4") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="5" SortExpression="5">
                            <ItemTemplate>
                                <asp:Label ID="LabelP5" runat="server" Text='<%# Eval("5") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="6" SortExpression="6">
                            <ItemTemplate>
                                <asp:Label ID="LabelP6" runat="server" Text='<%# Eval("6") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="7" SortExpression="7">
                            <ItemTemplate>
                                <asp:Label ID="LabelP7" runat="server" Text='<%# Eval("7") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="8" SortExpression="8">
                            <ItemTemplate>
                                <asp:Label ID="LabelP8" runat="server" Text='<%# Eval("8") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="9" SortExpression="9">
                            <ItemTemplate>
                                <asp:Label ID="LabelP9" runat="server" Text='<%# Eval("9") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="../Students/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAttendanceReports" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, CurrentSectionID, StudentID, Date, [1], [2], [3], [4], [5], [6], [7], [8], [9] FROM vw_AttendanceReports WHERE (StudentID = @StudentID) AND (Date &gt; @StartDate) AND (Date &lt; @FinishDate) ORDER BY Date DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListStudents" Name="StudentID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="TextBoxStartDate_CalendarExtender" Name="StartDate"
                            PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="TextBoxFinishDate_CalendarExtender" Name="FinishDate"
                            PropertyName="SelectedDate" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewAttendanceTypes" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="AttendanceTypeID" DataSourceID="SqlDataSourceAttendanceTypes" Visible="False"
                    Width="100%">
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
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="INSERT INTO tbl_Attendance(AcademicTermID, SchoolCode, AttendanceTypeID, StudentID, Date, Period, SavedOn, SavedAt, SavedBy) VALUES (@AcademicTermID, @SchoolCode, @AttendanceTypeID, @StudentID, @Date, @Period, @SavedOn, @SavedAt, @SavedBy)"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND ([Continue] = 1) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName"
                    UpdateCommand="UPDATE tbl_Attendance SET AttendanceTypeID = @AttendanceTypeID WHERE (StudentID = @StudentID) AND (Date = @Date) AND (Period = @Period)
IF @@ROWCOUNT=0
INSERT INTO tbl_Attendance(AcademicTermID, SchoolCode, AttendanceTypeID, StudentID, Date, Period, SavedOn, SavedAt, SavedBy) VALUES (@AcademicTermID, @SchoolCode, @AttendanceTypeID, @StudentID, @Date, @Period, @SavedOn, @SavedAt, @SavedBy)">
                    <InsertParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="AttendanceTypeID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Period" />
                        <asp:Parameter Name="SavedOn" />
                        <asp:Parameter Name="SavedAt" />
                        <asp:Parameter Name="SavedBy" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AttendanceTypeID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Period" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="SavedOn" />
                        <asp:Parameter Name="SavedAt" />
                        <asp:Parameter Name="SavedBy" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [AttendanceType], [Color] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
