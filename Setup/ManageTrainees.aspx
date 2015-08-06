<%@ Page Title="Setup Manage Staff" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    ValidateRequest="false" CodeFile="ManageTrainees.aspx.vb" Inherits="Courses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table width="680px">
                <tr>
                    <td height="30">
                        <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                            Width="99%">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                            TabIndex="7" Width="99%">
                            <asp:ListItem Value="">Select School</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td height="150">
                        <div style='border: 1px solid #999999; overflow: auto; height: 100%; background-color: #E6E6E6;'>
                            <asp:RadioButtonList ID="RadioButtonListStaff" runat="server" DataSourceID="SqlDataSourceStaff"
                                DataTextField="StaffName" DataValueField="StaffID">
                            </asp:RadioButtonList>
                        </div>
                    </td>
                    <td height="150">
                        <div style='border: 1px solid #999999; overflow: auto; height: 100%; background-color: #E6E6E6;'>
                            <asp:CheckBoxList ID="CheckBoxListTrainees" runat="server" DataSourceID="SqlDataSourceTrainees"
                                DataTextField="StaffName" DataValueField="StaffID">
                            </asp:CheckBoxList>
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update" Width="680px" />
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewTrainers" runat="server" AutoGenerateColumns="False" DataKeyNames="DevelopmentTraineeID"
                DataSourceID="SqlDataSourceTrainers" Width="680px">
                <Columns>
                    <asp:TemplateField HeaderText="Academic Term " SortExpression="AcademicTermID">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                                SelectedValue='<%# Bind("AcademicTermID") %>' Width="90%">
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TrainerName" HeaderText="Trainer Name" SortExpression="TrainerName" />
                    <asp:BoundField DataField="TraineeName" HeaderText="Trainee Name" SortExpression="TraineeName" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Setup/Images/delete.gif" ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <br />    
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms ORDER BY AcademicTermID DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1) ORDER BY SchoolName">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceTrainees" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Staff.StaffName, tbl_Staff.[Continue], tbl_Staff.SchoolCode, tbl_Staff.DateofBirth, tbl_Staff.Gender, tbl_Staff.StaffID, aspnet_Roles.RoleName FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN tbl_Staff ON aspnet_UsersInRoles.UserId = tbl_Staff.StaffID WHERE (aspnet_Roles.RoleName = N'Trainee')"
                UpdateCommand="UPDATE tbl_Staff SET SchoolCode = @SchoolCode, StaffName=@StaffName WHERE (StaffID = @UserId)

UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @UserId)">
                <UpdateParameters>
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="StaffName" />
                    <asp:Parameter Name="UserId" />
                    <asp:Parameter Name="UserName" />
                    <asp:Parameter Name="LoweredUserName" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT  tbl_Staff.StaffName, tbl_Staff.[Continue], tbl_Staff.SchoolCode, tbl_Staff.DateofBirth, tbl_Staff.Gender, tbl_Staff.StaffID, aspnet_Roles.RoleName FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN tbl_Staff ON aspnet_UsersInRoles.UserId = tbl_Staff.StaffID WHERE (aspnet_Roles.RoleName = N'Staff') AND (tbl_Staff.SchoolCode = @SchoolCode) ORDER BY tbl_Staff.StaffName"
                UpdateCommand="UPDATE tbl_Staff SET SchoolCode = @SchoolCode, StaffName=@StaffName WHERE (StaffID = @UserId)

UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @UserId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="StaffName" />
                    <asp:Parameter Name="UserId" />
                    <asp:Parameter Name="UserName" />
                    <asp:Parameter Name="LoweredUserName" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceTrainers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_DevelopmentTrainees.DevelopmentTraineeID, tbl_DevelopmentTrainees.AcademicTermID, tbl_Staff_1.StaffName AS TrainerName, tbl_Staff.StaffName AS TraineeName FROM tbl_DevelopmentTrainees INNER JOIN tbl_Staff AS tbl_Staff_1 ON tbl_DevelopmentTrainees.TrainerID = tbl_Staff_1.StaffID INNER JOIN tbl_Staff ON tbl_DevelopmentTrainees.TraineeID = tbl_Staff.StaffID WHERE (tbl_DevelopmentTrainees.AcademicTermID = @AcademicTermID)"
                DeleteCommand="DELETE FROM tbl_DevelopmentTrainees WHERE (DevelopmentTraineeID = @DevelopmentTraineeID)"
                InsertCommand="INSERT INTO tbl_DevelopmentTrainees(AcademicTermID, SchoolCode, TrainerID, TraineeID) VALUES (@AcademicTermID, @SchoolCode, @TrainerID, @TraineeID)">
                <DeleteParameters>
                    <asp:Parameter Name="DevelopmentTraineeID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="TrainerID" />
                    <asp:Parameter Name="TraineeID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
