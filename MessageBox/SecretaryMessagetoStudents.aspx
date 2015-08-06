<%@ Page Title="SIS Send Message to Students" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="SecretaryMessagetoStudents.aspx.vb" Inherits="SendMessagetoStudents" %>

<%@ Register Src="MenuMessageBox.ascx" TagName="MenuMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    SEND MESSAGE</h2>
                <br />
                <uc1:MenuMessageBox ID="MenuMessageBox" runat="server" />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    MESSAGE TO STUDENTS</h2>
                <br />
                <asp:Panel ID="PanelMessageBox" runat="server" Width="100%">
                    <table width="680">
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label29" runat="server" Font-Bold="False" ForeColor="Red" 
                                    Text="Write a message title please:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:TextBox ID="TextBoxTitle" runat="server" Width="650px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label30" runat="server" Font-Bold="False" ForeColor="Red" 
                                    Text="Write your message here please:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBoxMessage" runat="server" Height="250px" Text='<%# Bind("Message") %>'
                                    TextMode="MultiLine" Width="650px" Font-Size="Small"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Select Section:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="100">
                                <div style='overflow: auto; height: 100%;'>
                                    <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                        DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                        RepeatColumns="8" Width="650px">
                                    </asp:RadioButtonList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Select Students:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="100">
                                <div style='overflow: auto; height: 100%;'>
                                    <asp:CheckBoxList ID="CheckBoxListStudents" runat="server" DataSourceID="SqlDataSourceStudents"
                                        DataTextField="Username" DataValueField="UserId" RepeatColumns="3" 
                                        Width="650px">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="ButtonSendMessage" runat="server" Height="25px" OnClientClick="return confirm('You are about to send this message to All Selected Students, do you confirm?')"
                                    Text="Send Message" ValidationGroup="Message" Width="650px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="PanelAdded" runat="server" HorizontalAlign="Center" Visible="False"
                                    Width="100%">
                                    <br />
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Profile/Images/success-icon.png" />
                                    <br />
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Your Message Has Been Sent Successfully!"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelCounter" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    <br />
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelWarning" runat="server" HorizontalAlign="Center" Visible="False"
                                    Width="100%">
                                    <br />
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Profile/Images/Error.png" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" ForeColor="Red" Text="Sorry, An Error Occured!"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    <br />
                                    <br />
                                    <br />
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ShowMessageBox="True"
                        ValidationGroup="Message" />
                    <asp:GridView ID="GridViewParents" runat="server" AutoGenerateColumns="False" DataKeyNames="RoleId,UserId"
                        Width="650px" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="SchoolCode" HeaderText="SchoolCode" SortExpression="SchoolCode" />
                            <asp:BoundField DataField="RoleId" HeaderText="RoleId" ReadOnly="True" SortExpression="RoleId" />
                            <asp:TemplateField HeaderText="UserId" SortExpression="UserId">
                                <ItemTemplate>
                                    <asp:Label ID="LabelUserID" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
                <br />
                <asp:Label ID="LabelCheck" runat="server"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT SectionCatalogID, SectionCatalog, SectionGroup FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT aspnet_UsersInRoles.UserId, tbl_Students.StudentName AS Username FROM aspnet_UsersInRoles INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId INNER JOIN tbl_Students ON aspnet_UsersInRoles.UserId = tbl_Students.StudentID WHERE (tbl_Students.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID) ORDER BY Username">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceMessage" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="INSERT INTO tbl_MessageBox(Title, Message, UserID, SenderID, Date, [Read], OutBoxShow) VALUES (@Title, @Message, @UserID, @SenderID, @Date, 0, 1)"
                    SelectCommand="SELECT * FROM [vw_MessageBox] WHERE ([UserID] = @UserID)">
                    <InsertParameters>
                        <asp:Parameter Name="Title" />
                        <asp:Parameter Name="Message" />
                        <asp:Parameter Name="UserID" />
                        <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                        <asp:Parameter Name="Date" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
