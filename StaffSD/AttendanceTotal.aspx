<%@ Page Title="SIS Attendance Total" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceTotal.aspx.vb" Inherits="Attendance_Checklist" %>

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
                                NavigateUrl="~/StaffSD/AttendanceReports.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label142" runat="server" Text="Attendance By Students"></asp:Label>
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
                                Width="95%" Font-Size="X-Small">
                            </asp:RadioButtonList>
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
                    ATTENDANCE TOTAL</h2>
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
                <br />
                <asp:GridView ID="GridViewAttendanceTotal" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceStudents" Width="100%" DataKeyNames="StudentID" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/StaffSD/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table width="90%">
                                    <tr>
                                        <td height="30" width="25">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelName" runat="server" Font-Bold="True" Text='<%# Eval("StudentName") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False"
                                                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                                                CellPadding="4" DataKeyNames="StudentID" DataSourceID="SqlDataSourceAttendanceTotal"
                                                GridLines="Horizontal" ShowHeader="False" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No">
                                                        <ItemTemplate>
                                                            <strong>
                                                                <%# Container.DataItemIndex + 1 %>) </strong>
                                                        </ItemTemplate>
                                                        <ItemStyle Font-Bold="True" Height="20px" Width="40px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Definition" HeaderText="Definition" SortExpression="Definition">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Total" SortExpression="TOTAL">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TOTAL") %>'></asp:Label>
                                                            &nbsp;<asp:Label ID="Label16" runat="server" Text="Period(s)"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <br />
                                                    Not Available!
                                                    <br />
                                                    <br />
                                                </EmptyDataTemplate>
                                                <FooterStyle BackColor="White" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="White" Font-Size="8pt" ForeColor="#333333" Height="18px" />
                                                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                <SortedAscendingHeaderStyle BackColor="#487575" />
                                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                <SortedDescendingHeaderStyle BackColor="#275353" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                <asp:SqlDataSource ID="SqlDataSourceAttendanceTotal" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT StudentID, StudentName, Definition, COUNT(*) AS Total FROM vw_AttendanceTotal WHERE (Date &gt; @StartDate) AND (Date &lt; @FinishDate) GROUP BY StudentID, StudentName, Definition HAVING (StudentID = @StudentID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBoxStartDate" Name="StartDate" PropertyName="Text"
                                            Type="DateTime" />
                                        <asp:ControlParameter ControlID="TextBoxFinishDate" Name="FinishDate" PropertyName="Text"
                                            Type="DateTime" />
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
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
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                <br />
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
