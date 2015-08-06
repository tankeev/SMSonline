<%@ Page Title="SIS Search Database" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="UsersSearch.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc1" %>
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
                <uc1:MenuUsers ID="MenuUsers" runat="server" />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    SEARCH</h2>
                <br />
                <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch">
                    <table class="content-table" width="675">
                        <tr>
                            <td height="30">
                                <asp:Label ID="LabelSearch" runat="server" Font-Bold="True" Text="Username or Student Name or Staff Name or Parent Name:"></asp:Label>
                            </td>
                            <td height="25" width="180">
                                <asp:TextBox ID="TextBoxSearch" runat="server" Width="160px"></asp:TextBox>
                            </td>
                            <td height="25" width="60">
                                <asp:Button ID="ButtonSearch" runat="server" Text="Find" Width="40px" PostBackUrl="UsersSearch.aspx" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:GridView ID="GridviewUsers" runat="server" AutoGenerateColumns="False" Width="675px"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewUsers"
                    AllowPaging="True">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Secretary/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelSchoolName" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Activity Date">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastActivityDate") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="145px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image41" runat="server" ImageUrl="~/Secretary/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Sorry, No User Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Students:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridviewStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewStudents"
                    PageSize="5" Width="675px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image42" runat="server" ImageUrl="~/Secretary/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="Label34" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName0" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SectionCatalog") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("StudentName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image43" runat="server" ImageUrl="~/Secretary/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Sorry, No Student Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Staff:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridviewStaff" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewStaff"
                    PageSize="5" Width="675px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image44" runat="server" ImageUrl="~/Secretary/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Staff Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("StaffName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image45" runat="server" ImageUrl="~/Secretary/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Sorry, No Staff Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Parents:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridviewParents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewParents"
                    PageSize="5" Width="675px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image46" runat="server" ImageUrl="~/Secretary/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="Label36" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FatherName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("FatherName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MotherName">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("MotherName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image47" runat="server" ImageUrl="~/Secretary/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Sorry, No Users Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
