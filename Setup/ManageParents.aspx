<%@ Page Title="Setup Manage Students" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" ValidateRequest="false" CodeFile="ManageParents.aspx.vb"
    Inherits="Courses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch">
                <table class="content-table" width="680">
                    <tr>
                        <td height="25" width="170">
                            <asp:Label ID="LabelSearch1" runat="server" Font-Bold="True" Text="Father or Mother Name:"></asp:Label>
                        </td>
                        <td height="25">
                            <asp:TextBox ID="TextBoxSearch" runat="server" Width="95%"></asp:TextBox>
                        </td>
                        <td height="25" width="80">
                            <asp:Button ID="ButtonSearch" runat="server" Text="Find" Width="95%" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:GridView ID="GridViewParents" runat="server" AutoGenerateColumns="False" DataKeyNames="ResponsibleParentID"
                DataSourceID="SqlDataSourceParents" ShowFooter="True" AllowPaging="True" 
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
                            <asp:TextBox ID="TextBoxUserName" runat="server" Text='<%# Bind("UserName") %>' Width="85%"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="90px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Father Name" SortExpression="FatherName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxFatherName" runat="server" Text='<%# Bind("FatherName") %>'
                                Width="85%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mother Name" SortExpression="MotherName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxMotherName" runat="server" Text='<%# Bind("MotherName") %>'
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
            <asp:SqlDataSource ID="SqlDataSourceParents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Parents.ResponsibleParentID, tbl_Parents.SchoolCode, tbl_Parents.[Continue], tbl_Parents.FatherName, aspnet_Users.UserName, tbl_Parents.MotherName FROM tbl_Parents INNER JOIN aspnet_Users ON tbl_Parents.ResponsibleParentID = aspnet_Users.UserId"
                FilterExpression="FatherName LIKE '{0}%' or MotherName LIKE '{0}%'  " UpdateCommand="UPDATE tbl_Parents SET SchoolCode = @SchoolCode, [Continue] = @Continue, FatherName=@FatherName, MotherName=@MotherName WHERE (ResponsibleParentID = @ResponsibleParentID)

UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @ResponsibleParentID)">
                <FilterParameters>
                    <asp:ControlParameter ControlID="TextBoxSearch" Name="Parameter" PropertyName="Text"
                        Type="String" />
                </FilterParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="Continue" />
                    <asp:Parameter Name="FatherName" />
                    <asp:Parameter Name="MotherName" />
                    <asp:Parameter Name="ResponsibleParentID" />
                    <asp:Parameter Name="UserName" />
                    <asp:Parameter Name="LoweredUserName" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
