<%@ Page Title="Setup Manage Staff" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    ValidateRequest="false" CodeFile="ManageStaff.aspx.vb" Inherits="Courses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table class="content-table" width="680">
                <tr>
                    <td height="25" width="170">
                        <asp:Label ID="LabelSearch1" runat="server" Font-Bold="True" Text="Nomor KTP or Staff Name:"></asp:Label>
                    </td>
                    <td height="25">
                        <asp:TextBox ID="TextBoxSearch" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td height="25" width="80">
                        <asp:Button ID="ButtonSearch" runat="server" Text="Find" Width="95%" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridViewStaff" runat="server" AutoGenerateColumns="False" DataKeyNames="StaffID"
                DataSourceID="SqlDataSourceStaff" ShowFooter="True" AllowPaging="True" 
                Width="680px">
                <Columns>
                    <asp:TemplateField HeaderText="School Code" SortExpression="SchoolCode">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" DataSourceID="SqlDataSourceSchoolCodes"
                                DataTextField="SchoolName" DataValueField="SchoolCode" TabIndex="7" Width="95%"
                                SelectedValue='<%# Bind("SchoolCode") %>'>
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="180px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username" SortExpression="UserName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxUsername" runat="server" Text='<%# Bind("UserName") %>' Width="85%"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="125px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Staff Name" SortExpression="StaffName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxStaffName" runat="server" Text='<%# Bind("StaffName") %>'
                                Width="85%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="DateofBirth" DataFormatString="{0:d}" HeaderText="Date of Birth"
                        SortExpression="DateofBirth" />
                    <asp:TemplateField HeaderText="Continue" SortExpression="Continue">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxContinue" runat="server" Checked='<%# Bind("Continue") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
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
                <RowStyle Height="30px" />
            </asp:GridView>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update All" Width="680px" />
            <br />
            <br />
            <asp:Label ID="LabelSuccess" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT [SchoolCode], [SchoolName] FROM [tbl_Schools] ORDER BY [SchoolName]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT aspnet_Users.UserName, tbl_Staff.StaffName, tbl_Staff.[Continue], tbl_Staff.SchoolCode, tbl_Staff.DateofBirth, tbl_Staff.Gender, tbl_Staff.StaffID FROM aspnet_Users INNER JOIN tbl_Staff ON aspnet_Users.UserId = tbl_Staff.StaffID"
                FilterExpression="StaffName LIKE '{0}%' or UserName LIKE '{0}%'  " UpdateCommand="UPDATE tbl_Staff SET SchoolCode = @SchoolCode, StaffName=@StaffName WHERE (StaffID = @UserId)

UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @UserId)">
                <FilterParameters>
                    <asp:ControlParameter ControlID="TextBoxSearch" Name="Parameter" PropertyName="Text"
                        Type="String" />
                </FilterParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="StaffName" />
                    <asp:Parameter Name="UserId" />
                    <asp:Parameter Name="UserName" />
                    <asp:Parameter Name="LoweredUserName" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
