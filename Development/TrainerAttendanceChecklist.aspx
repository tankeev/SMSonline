<%@ Page Title="SIS Attendance Checklist" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="TrainerAttendanceChecklist.aspx.vb" Inherits="NewUserAccount" %>

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
                                NavigateUrl="~/Development/TrainerAttendanceChecklist.aspx" Enabled="False">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="Attendance Checklist" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerTrainerTeaching.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Trainer Teaching Sessions"></asp:Label>
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
                        <td>
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
                        <td>
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
                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Attendance Checklist for Trainers:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="AttendanceID" DataSourceID="SqlDataSourceAttendanceChecklist" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Development/Images/menu-alt-24.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:D}" HeaderText="Date" SortExpression="Date">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TraineeName" HeaderText="Trainee" SortExpression="TraineeName" />
                        <asp:TemplateField HeaderText="Attendance Types" SortExpression="AttendanceTypeID">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAttendanceTypes" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                    DataTextField="Definition" DataValueField="AttendanceTypeID" Width="90%">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <ItemStyle Width="130px" />
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
                </asp:GridView>
                <br />
                <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" Text="Add New Attendance Record:"></asp:Label>
                <br />
                <br />
                <table style="border: 1px solid #990033; background-color: #EBF4E1" width="680">
                    <tr>
                        <td height="30" width="30">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                        </td>
                        <td height="30" width="150">
                            <asp:Label ID="Label24" runat="server" Text="Attendance Type:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListAttendanceTypes" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                DataTextField="Definition" DataValueField="AttendanceTypeID" Width="95%">
                            </asp:DropDownList>
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
                            <asp:ConfirmButtonExtender ID="ButtonAddRecords_ConfirmButtonExtender" runat="server"
                                ConfirmText="Do you really want to add Attendance Records?" Enabled="True" TargetControlID="ButtonAddRecords">
                            </asp:ConfirmButtonExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            
                        </td>
                        <td height="30">
                            
                        </td>
                        <td>
                            <asp:Label ID="LabelAttendanceStatus" runat="server" ForeColor="Red"></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [Definition] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceChecklist" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_DevelopmentAttendanceChecklist.AttendanceID, tbl_DevelopmentAttendanceChecklist.AcademicTermID, tbl_DevelopmentAttendanceChecklist.TraineeID, tbl_DevelopmentAttendanceChecklist.AttendanceTypeID, tbl_DevelopmentAttendanceChecklist.Date, tbl_DevelopmentAttendanceChecklist.Notes, tbl_Staff.StaffName AS TraineeName, tbl_DevelopmentAttendanceChecklist.SavedBy, tbl_Staff.SchoolCode FROM tbl_Staff INNER JOIN tbl_DevelopmentAttendanceChecklist ON tbl_Staff.StaffID = tbl_DevelopmentAttendanceChecklist.TraineeID WHERE (tbl_DevelopmentAttendanceChecklist.AcademicTermID = @AcademicTermID) AND (tbl_Staff.SchoolCode = @SchoolCode) ORDER BY tbl_DevelopmentAttendanceChecklist.Date DESC"
                    InsertCommand="INSERT INTO tbl_DevelopmentAttendanceChecklist(AcademicTermID, AttendanceTypeID, TraineeID, Date, Notes, SavedBy) VALUES (@AcademicTermID, @AttendanceTypeID, @TraineeID, @Date, @Notes, @SavedBy)">
                    <InsertParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="AttendanceTypeID" />
                        <asp:Parameter Name="TraineeID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Notes" />
                        <asp:Parameter Name="SavedBy" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
