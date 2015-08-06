<%@ Page Title="SIS Shared Documents" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="SharedDocuments.aspx.vb" Inherits="NewUserAccount" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="right_wrap">
        <div id="right_content">
            <h2>
                SHARED DOCUMENTS</h2>
            <br />
            <div id="divChild">
                <br />
                    <asp:Label ID="Label27" runat="server" 
                    Text="Please remove Space Character(s) before uploading a file. " 
                    ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewFileList" runat="server" AutoGenerateColumns="False" EmptyDataText="No files uploaded"
                    Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Department/Images/menu-alt-24.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="File Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelFileName" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Text") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDownload" runat="server" OnClick="DownloadFile" CommandArgument='<%# Eval("Value") %>'
                                    ImageUrl="~/Department/Images/Download.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDelete" runat="server" OnClick="DeleteFile" CommandArgument='<%# Eval("Value") %>'
                                    ImageUrl="~/Department/Images/Delete.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="../Administrators/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No File Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="35px" />
                </asp:GridView>
                <br />
                <br />
                <asp:Label ID="LabelTotal" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
            </div>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                
                SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1) AND (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                <SelectParameters>
                    <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDepartmentStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Staff.StaffID, tbl_Staff.StaffName, aspnet_Users.PhotoUrl FROM aspnet_Roles INNER JOIN vw_aspnet_UsersInRoles ON aspnet_Roles.RoleId = vw_aspnet_UsersInRoles.RoleId INNER JOIN tbl_Staff ON vw_aspnet_UsersInRoles.UserId = tbl_Staff.StaffID INNER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId WHERE (tbl_Staff.SchoolCode = @SchoolCode) AND (aspnet_Roles.RoleName = N'Staff') ORDER BY tbl_Staff.StaffName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="sidebar" id="sidebar">
        <h2>
            DEPARTMENTS</h2>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Department/Images/editor.png"
                        NavigateUrl="~/Department/DepartmentStaff.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Department Staff"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/DepartmentForum.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Department Forum"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/StaffAssignments.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Staff Assignments"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/SharedDocuments.aspx" Enabled="False">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Shared Documents" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td height="30">
                    <asp:Label ID="Label26" runat="server" Text="Academic Term:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                        DataTextField="AcademicTerm" DataValueField="AcademicTermID" Width="95%" Enabled="False">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Label ID="Label24" runat="server" Text="Select School:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                        TabIndex="7" Width="95%" Enabled="False">
                        <asp:ListItem Value="">Select School</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Label ID="Label25" runat="server" Text="Upload A File:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    
                    <asp:FileUpload ID="FileUploadDepartment" runat="server" Width="95%" />
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile" Width="95%" />
                </td>
            </tr>
            <tr>
                <td height="30">
                    </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="clear">
    </div>
</asp:Content>
