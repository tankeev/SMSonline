<%@ Page Title="SIS User Accounts" Language="VB" MasterPageFile="~/Site.Master" CodeFile="UsersAccounts.aspx.vb"
    Inherits="ManageUsers" %>

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
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Labdel1" runat="server" Text="Academic Terms"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:DropDownList ID="DropDownListAcademicTermsMaster" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                                Width="95%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Labdel2" runat="server" Text="School List"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:DropDownList ID="DropDownListSchoolCodesMaster" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                Enabled="False" TabIndex="7" Width="95%">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Labdel3" runat="server" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                RepeatColumns="4">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" width="150">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ACCOUNTS</h2>
                <br />
                <asp:TabContainer ID="TabContainerUsers" runat="server" ActiveTabIndex="0" CssClass="tab"
                    Width="98%">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            STUDENTS
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:GridView ID="GridviewStudents" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStudents"
                                Width="99%" DataKeyNames="StudentID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NO">
                                        <ItemTemplate>
                                            <strong>
                                                <%# Container.DataItemIndex + 1 %>
                                            </strong>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="25px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxStudentName" runat="server" Text='<%# Bind("StudentName") %>'
                                                Width="90%"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownListGender" runat="server" SelectedValue='<%# Bind("Gender") %>'
                                                Width="90%">
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxUserName" runat="server" Text='<%# Bind("UserName") %>' Width="85%"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Activity Date" SortExpression="LastActivityDate">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastActivityDate", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="190px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <img alt="" src="Images/no-data.png" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                            Text="Please Select A School Section!"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                                <RowStyle Height="28px" />
                            </asp:GridView>
                            <br />
                            <asp:Button ID="ButtonUpdateAllStudents" runat="server" Text="Update All" Width="99%" />
                            <asp:ConfirmButtonExtender ID="ButtonUpdateAllStudents_ConfirmButtonExtender" runat="server"
                                ConfirmText="Do you really want to Update?" Enabled="True" TargetControlID="ButtonUpdateAllStudents">
                            </asp:ConfirmButtonExtender>
                            <br />
                            <br />
                            <asp:Label ID="LabelStatusStudents" runat="server" Font-Bold="True"></asp:Label>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.StudentName, tbl_Students.Gender, aspnet_Users.UserName, tbl_Students.CurrentSectionID, aspnet_Users.LastActivityDate FROM tbl_Students INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId WHERE (tbl_Students.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID) AND (tbl_Students.[Continue] = 1) ORDER BY tbl_Students.StudentName"
                                UpdateCommand="UPDATE tbl_Students SET Gender = @Gender WHERE (StudentID = @StudentID)
UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @StudentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Gender" />
                                    <asp:Parameter Name="StudentID" />
                                    <asp:Parameter Name="UserName" />
                                    <asp:Parameter Name="LoweredUserName" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            PARENTS
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:GridView ID="GridviewParents" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceParents"
                                Width="99%" DataKeyNames="ResponsibleParentID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="ImageInfo" runat="server" ImageUrl="~/CoordinatorsSD/Images/info.png" />
                                            <asp:HoverMenuExtender ID="Info_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
                                                PopupControlID="PanelInfo" PopupPosition="Right" TargetControlID="ImageInfo">
                                            </asp:HoverMenuExtender>
                                            <asp:Panel ID="PanelInfo" runat="server" CssClass="MenuToolTip" Style="display: none;"
                                                Width="240">
                                                <asp:Label ID="Label1" runat="server" Text="Parent of: " ForeColor="Black" Font-Bold="True"></asp:Label>
                                                <asp:Label ID="LabelStudentName" runat="server" Text='<%# Eval("StudentName") %>'
                                                    ForeColor="Red" Font-Bold="True"></asp:Label>
                                                <br />
                                                <img class="callout" src="images/callout.gif" />
                                            </asp:Panel>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NO">
                                        <ItemTemplate>
                                            <strong>
                                                <%# Container.DataItemIndex + 1 %>
                                            </strong>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="25px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Parent Name" SortExpression="ResponsibleParent">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxResponsibleParent" runat="server" Text='<%# Bind("ResponsibleParent") %>'
                                                Width="90%"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender" SortExpression="ResponsibleParentGender">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownListGender" runat="server" SelectedValue='<%# Bind("ResponsibleParentGender") %>'
                                                Width="90%">
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxUserName" runat="server" Text='<%# Bind("UserName") %>' Width="85%"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="110px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Activity Date" SortExpression="LastActivityDate">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastActivityDate", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="190px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <img alt="" src="Images/no-data.png" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select A School Section!"
                                            Font-Size="Medium" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                                <RowStyle Height="28px" />
                            </asp:GridView>
                            <br />
                            <asp:Button ID="ButtonUpdateAllParents" runat="server" Text="Update All" Width="99%" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you really want to Update?"
                                Enabled="True" TargetControlID="ButtonUpdateAllParents">
                            </asp:ConfirmButtonExtender>
                            <br />
                            <br />
                            <asp:Label ID="LabelStatusParents" runat="server" Font-Bold="True"></asp:Label>
                            <br />
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceParents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT tbl_Parents.ResponsibleParentID, tbl_Parents.ResponsibleParent, tbl_Parents.ResponsibleParentGender, aspnet_Users.UserName, aspnet_Users.LastActivityDate, tbl_Students.StudentName FROM tbl_Students INNER JOIN tbl_Parents ON tbl_Students.ParentID = tbl_Parents.ResponsibleParentID INNER JOIN aspnet_Users ON tbl_Parents.ResponsibleParentID = aspnet_Users.UserId WHERE (tbl_Students.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID) AND (tbl_Students.[Continue] = 1) ORDER BY tbl_Students.StudentName"
                                UpdateCommand="UPDATE tbl_Parents SET ResponsibleParentGender = @ResponsibleParentGender, ResponsibleParent = @ResponsibleParent WHERE (ResponsibleParentID = @ResponsibleParentID)

UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @ResponsibleParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ResponsibleParentGender" />
                                    <asp:Parameter Name="ResponsibleParent" />
                                    <asp:Parameter Name="ResponsibleParentID" />
                                    <asp:Parameter Name="UserName" />
                                    <asp:Parameter Name="LoweredUserName" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            STAFF
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:GridView ID="GridviewStaff" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStaff"
                                Width="99%" DataKeyNames="StaffID" AllowPaging="True" PageSize="20">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="ImageInfo" runat="server" ImageUrl="~/CoordinatorsSD/Images/info.png" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NO">
                                        <ItemTemplate>
                                            <strong>
                                                <%# Container.DataItemIndex + 1 %>
                                            </strong>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="25px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Staff Name" SortExpression="StaffName">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxStaffName" runat="server" Text='<%# Bind("StaffName") %>'
                                                Width="90%"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownListGender" runat="server" SelectedValue='<%# Bind("Gender") %>'
                                                Width="90%">
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxUserName" runat="server" Text='<%# Bind("UserName") %>' Width="85%"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="130px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Activity Date" SortExpression="LastActivityDate">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastActivityDate", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="190px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <img alt="" src="Images/no-data.png" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select A School Section!"
                                            Font-Size="Medium" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                                <RowStyle Height="28px" />
                            </asp:GridView>
                            <br />
                            <asp:Button ID="ButtonUpdateAllStaff" runat="server" Text="Update All" Width="99%" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Do you really want to Update?"
                                Enabled="True" TargetControlID="ButtonUpdateAllStaff">
                            </asp:ConfirmButtonExtender>
                            <br />
                            <br />
                            <asp:Label ID="LabelStatusStaff" runat="server" Font-Bold="True"></asp:Label>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT tbl_Staff.StaffID, tbl_Staff.StaffName, aspnet_Users.UserName, tbl_Staff.Gender, aspnet_Users.LastActivityDate FROM tbl_Staff INNER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId WHERE (tbl_Staff.[Continue] = 1) AND (tbl_Staff.SchoolCode = @SchoolCode) ORDER BY tbl_Staff.StaffName"
                                UpdateCommand="UPDATE tbl_Staff SET StaffName = @StaffName, Gender = @Gender WHERE (StaffID = @StaffID)

UPDATE aspnet_Users SET UserName = @UserName, LoweredUserName = @LoweredUserName WHERE (UserId = @StaffID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="StaffName" />
                                    <asp:Parameter Name="Gender" />
                                    <asp:Parameter Name="StaffID" />
                                    <asp:Parameter Name="UserName" />
                                    <asp:Parameter Name="LoweredUserName" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (Show = 1) AND (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
