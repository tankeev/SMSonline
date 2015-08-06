<%@ Page Title="Setup Manage Students" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" ValidateRequest="false" CodeFile="ManageStudents.aspx.vb"
    Inherits="Courses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table class="content-table" width="680">
                <tr>
                    <td height="25" width="170">
                        <asp:Label ID="LabelSearch1" runat="server" Font-Bold="True" Text="NISN or Student Name:"></asp:Label>
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
            <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                DataSourceID="SqlDataSourceStudents" ShowFooter="True" AllowPaging="True" 
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
                    <asp:TemplateField HeaderText="Section" SortExpression="CurrentSectionID">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="7"
                                Width="90%" SelectedValue='<%# Bind("CurrentSectionID") %>'>
                                <asp:ListItem Value="">Select Section</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="70px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="NISN" SortExpression="UserName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxNISN" runat="server" Text='<%# Bind("UserName") %>' Width="85%"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="90px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxStudentName" runat="server" Text='<%# Bind("StudentName") %>'
                                Width="85%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT SectionCatalogID, SectionCatalog FROM tbl_SectionCatalog">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Students.StudentID, aspnet_Users.UserName, tbl_Students.StudentName, tbl_Students.SchoolCode, tbl_Students.ParentID, tbl_Students.CurrentSectionID, tbl_Students.[Continue] FROM tbl_Students INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId ORDER BY tbl_Students.StudentName"
                FilterExpression="StudentName LIKE '{0}%' or UserName LIKE '{0}%'  " UpdateCommand="UPDATE tbl_Students SET SchoolCode = @SchoolCode, CurrentSectionID = @CurrentSectionID, StudentName=@StudentName WHERE (StudentID = @UserId)

UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @UserId)">
                <FilterParameters>
                    <asp:ControlParameter ControlID="TextBoxSearch" Name="Parameter" PropertyName="Text"
                        Type="String" />
                </FilterParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="CurrentSectionID" />
                    <asp:Parameter Name="StudentName" />
                    <asp:Parameter Name="UserId" />
                    <asp:Parameter Name="UserName" />
                    <asp:Parameter Name="LoweredUserName" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
