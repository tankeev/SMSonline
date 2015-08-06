<%@ Page Title="SIS Trainer Teaching" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="TrainerTrainerTeaching.aspx.vb" Inherits="TrainerTeaching" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    PROFESSIONAL</h2>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerAttendanceChecklist.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="Attendance Checklist"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerTrainerTeaching.aspx" Enabled="False">Add New</asp:HyperLink>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="Trainer Teaching Sessions" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerMicroTeaching.aspx">Add New</asp:HyperLink>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="Micro Teaching Sessions"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerSubjectUnitTests.aspx">Add New</asp:HyperLink>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" Text="Subject Unit Tests"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerSubjectBooksEvaluation.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Subject Books Evaluation"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    DEVELOPMENT</h2>
                <br />
                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Trainer Teaching Checklist for Trainers:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewTrainerTeaching" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="TeachingID" DataSourceID="SqlDataSourceTrainerTeaching" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Development/Images/menu-alt-24.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date / Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelDate" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Date", "{0:D}") %>'
                                    Font-Size="X-Small"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="LabelName" runat="server" Text='<%# Bind("TraineeName") %>' Font-Bold="True"
                                    Font-Size="X-Small"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Teaching Topics / Notes">
                            <ItemTemplate>
                                <asp:Label ID="LabelTitle" runat="server" Text='<%# Eval("UnitTitle") %>' Font-Bold="True"
                                    Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="LabelNotes" runat="server" Text='<%# Eval("Notes") %>' Font-Bold="True"
                                    Font-Size="X-Small"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Record Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="75px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" Text="Add New Trainer Teaching Record:"></asp:Label>
                <br />
                <br />
                <table style="border: 1px solid #990033; background-color: #EBF4E1" width="100%">
                    <tr>
                        <td height="30" width="30">
                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                        </td>
                        <td height="30" width="150">
                            <asp:Label ID="Label42" runat="server" Text="Teaching Course:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListTeachingCourses" runat="server" DataSourceID="SqlDataSourceTeachingCourses"
                                DataTextField="CourseCategory" DataValueField="CourseCategoryID" Width="95%"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" width="30">
                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                        </td>
                        <td height="30" width="150">
                            <asp:Label ID="Label43" runat="server" Text="Teaching Units:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListTeachingUnits" runat="server" DataSourceID="SqlDataSourceTeachingUnits"
                                DataTextField="CourseUnit" DataValueField="CourseUnitID" Width="95%" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" width="30">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                        </td>
                        <td height="30" width="150">
                            <asp:Label ID="Label24" runat="server" Text="Teaching Titles:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListTeachingTitle" runat="server" DataSourceID="SqlDataSourceTeachingTitles"
                                DataTextField="UnitTitle" DataValueField="UnitTitleID" Width="95%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            
                        </td>
                        <td height="30">
                            
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                        </td>
                        <td height="30">
                            <asp:Label ID="Label29" runat="server" Text="Session Date:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Notes") %>' Width="93%" />
                            <asp:CalendarExtender ID="DateTextBox_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="DateTextBox">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                        </td>
                        <td height="30">
                            <asp:Label ID="Label25" runat="server" Text="Session Notes:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' Width="93%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                        </td>
                        <td height="30">
                            <asp:Label ID="Label41" runat="server" Text="Session Duration:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListDuration" runat="server" Width="95%">
                                <asp:ListItem>0-15 Minutes</asp:ListItem>
                                <asp:ListItem>15-30 Minutes</asp:ListItem>
                                <asp:ListItem>30-45 Minutes</asp:ListItem>
                                <asp:ListItem>45-60 Minutes</asp:ListItem>
                                <asp:ListItem>60-75 Minutes</asp:ListItem>
                                <asp:ListItem>75-90 Minutes</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            
                        </td>
                        <td height="30">
                            
                        </td>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxListTrainees" runat="server" DataSourceID="SqlDataSourceDevelopmentTrainees"
                                DataTextField="TraineeName" DataValueField="TraineeID" Width="100%">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            
                        </td>
                        <td height="30">
                            
                        </td>
                        <td>
                            <asp:Button ID="ButtonAddRecords" runat="server" CommandName="Insert" Text="Add Record"
                                Width="95%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            
                        </td>
                        <td height="30">
                            
                        </td>
                        <td>
                            <asp:Label ID="LabelTeachingStatus" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceDevelopmentTrainees" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_DevelopmentTrainees.TraineeID, tbl_Staff.StaffName AS TraineeName FROM tbl_DevelopmentTrainees INNER JOIN tbl_Staff ON tbl_DevelopmentTrainees.TraineeID = tbl_Staff.StaffID WHERE (tbl_DevelopmentTrainees.AcademicTermID = @AcademicTermID) AND (tbl_DevelopmentTrainees.TrainerID = @TrainerID) ORDER BY TraineeName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="TrainerID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTeachingCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_CourseCategories WHERE (CourseCategoryID = @CourseCategoryID)"
                    InsertCommand="INSERT INTO tbl_CourseCategories(CourseCategoryCode, CourseCategory, CourseReportOrder, CourseGroupingID, CourseGroupingIsChild, CourseGroupName) VALUES (@CourseCategoryCode, @CourseCategory, 0, 0, 0, @CourseGroupName)"
                    SelectCommand="SELECT CourseCategoryID, CourseCategory FROM tbl_CourseCategories WHERE (IsDevelopment = 1)"
                    UpdateCommand="UPDATE tbl_CourseCategories SET CourseCategoryCode = @CourseCategoryCode, CourseCategory = @CourseCategory, CourseReportOrder = @CourseReportOrder, CourseGroupingID = @CourseGroupingID, CourseGroupingIsChild = @CourseGroupingIsChild, CourseGroupName = @CourseGroupName WHERE (CourseCategoryID = @CourseCategoryID)">
                    <DeleteParameters>
                        <asp:Parameter Name="CourseCategoryID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CourseCategoryCode" />
                        <asp:Parameter Name="CourseCategory" />
                        <asp:Parameter Name="CourseGroupName" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CourseCategoryCode" />
                        <asp:Parameter Name="CourseCategory" />
                        <asp:Parameter Name="CourseReportOrder" />
                        <asp:Parameter Name="CourseGroupingID" />
                        <asp:Parameter Name="CourseGroupingIsChild" />
                        <asp:Parameter Name="CourseGroupName" />
                        <asp:Parameter Name="CourseCategoryID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTeachingUnits" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_CourseCategories WHERE (CourseCategoryID = @CourseCategoryID)"
                    InsertCommand="INSERT INTO tbl_CourseCategories(CourseCategoryCode, CourseCategory, CourseReportOrder, CourseGroupingID, CourseGroupingIsChild, CourseGroupName) VALUES (@CourseCategoryCode, @CourseCategory, 0, 0, 0, @CourseGroupName)"
                    SelectCommand="SELECT CourseUnitID, CourseUnit FROM tbl_CourseUnits WHERE (IsAcademic = 1) AND (CourseCategoryID = @CourseCategoryID)"
                    UpdateCommand="UPDATE tbl_CourseCategories SET CourseCategoryCode = @CourseCategoryCode, CourseCategory = @CourseCategory, CourseReportOrder = @CourseReportOrder, CourseGroupingID = @CourseGroupingID, CourseGroupingIsChild = @CourseGroupingIsChild, CourseGroupName = @CourseGroupName WHERE (CourseCategoryID = @CourseCategoryID)">
                    <DeleteParameters>
                        <asp:Parameter Name="CourseCategoryID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CourseCategoryCode" />
                        <asp:Parameter Name="CourseCategory" />
                        <asp:Parameter Name="CourseGroupName" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListTeachingCourses" Name="CourseCategoryID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CourseCategoryCode" />
                        <asp:Parameter Name="CourseCategory" />
                        <asp:Parameter Name="CourseReportOrder" />
                        <asp:Parameter Name="CourseGroupingID" />
                        <asp:Parameter Name="CourseGroupingIsChild" />
                        <asp:Parameter Name="CourseGroupName" />
                        <asp:Parameter Name="CourseCategoryID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTeachingTitles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT UnitTitleID, UnitTitle FROM tbl_CourseUnitTitles WHERE (IsAcademic = 1) AND (CourseUnitID = @CourseUnitID) ORDER BY UnitTitle">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListTeachingUnits" Name="CourseUnitID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTrainerTeaching" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_DevelopmentTrainerTeaching.TeachingID, tbl_DevelopmentTrainerTeaching.TraineeID, tbl_DevelopmentTrainerTeaching.Date, tbl_DevelopmentTrainerTeaching.Notes, tbl_Staff.StaffName AS TraineeName, tbl_DevelopmentTrainerTeaching.AcademicTermID, tbl_DevelopmentTrainerTeaching.UnitTitleID, tbl_DevelopmentTrainerTeaching.SavedBy, tbl_DevelopmentTrainerTeaching.Duration, tbl_CourseUnitTitles.UnitTitle, tbl_Staff.SchoolCode FROM tbl_DevelopmentTrainerTeaching INNER JOIN tbl_Staff ON tbl_DevelopmentTrainerTeaching.TraineeID = tbl_Staff.StaffID INNER JOIN tbl_CourseUnitTitles ON tbl_DevelopmentTrainerTeaching.UnitTitleID = tbl_CourseUnitTitles.UnitTitleID WHERE (tbl_DevelopmentTrainerTeaching.AcademicTermID = @AcademicTermID) AND (tbl_Staff.SchoolCode = @SchoolCode)"
                    InsertCommand="INSERT INTO tbl_DevelopmentTrainerTeaching(AcademicTermID, TraineeID, UnitTitleID, Date, Notes, SavedBy, Duration) VALUES (@AcademicTermID, @TraineeID, @UnitTitleID, @Date, @Notes, @SavedBy, @Duration)">
                    <InsertParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="TraineeID" />
                        <asp:Parameter Name="UnitTitleID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Notes" />
                        <asp:Parameter Name="SavedBy" />
                        <asp:Parameter Name="Duration" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
