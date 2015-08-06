<%@ Page Title="SIS Timeline" Language="VB" MasterPageFile="~/Site.Master" CodeFile="TimeLine.aspx.vb"
    EnableEventValidation="false" Inherits="_Default" %>

<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        function switchViews(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == "none") {
                div.style.display = "inline";
                img.src = "images/minus.gif";
            } else {
                div.style.display = "none";
                img.src = "images/plus.gif";
            }
        }
    </script>
    <script type="text/javascript">
        function DoCancel() {
            $get('<%=DashBoardGroupNameTextBox.ClientID%>').value = "";

        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    TIMELINE</h2>
                <br />
                <table id="tbl_UserActivity" class="content-table" width="240">
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label27" runat="server" Text="Your Groups:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label33" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="Use CheckBoxes to CHECK a group."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label36" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="Use Hand Icon to SELECT a group."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewGroups" runat="server" AutoGenerateColumns="False" DataKeyNames="DashBoardGroupID"
                                DataSourceID="SqlDataSourceDashBoardGroups" Width="95%" PageSize="5" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="C">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBoxUserGroup" runat="server" />
                                            <asp:HoverMenuExtender ID="CheckBoxUserGroup_HoverMenuExtender" runat="server" OffsetX="0"
                                                OffsetY="0" PopDelay="50" PopupControlID="PanelInfoCheckBoxUserGroup" PopupPosition="Right"
                                                TargetControlID="CheckBoxUserGroup">
                                            </asp:HoverMenuExtender>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="25px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="GID" InsertVisible="False" SortExpression="DashBoardGroupID"
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelGID" runat="server" Text='<%# Bind("DashBoardGroupID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Group Name">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelGroupName" runat="server" Text='<%# Bind("DashBoardGroupName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/Staff/Images/cursor_hand.png"
                                                Width="18px" />
                                            <asp:HoverMenuExtender ID="ImageButtonSelect_HoverMenuExtender" runat="server" OffsetX="0"
                                                OffsetY="0" PopDelay="50" PopupControlID="PanelInfoImageButtonSelect" PopupPosition="Right"
                                                TargetControlID="ImageButtonSelect">
                                            </asp:HoverMenuExtender>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="28px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="D">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2w" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/Delete24.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Group?')"
                                                ToolTip="Delete Group!" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Users Groups!
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#FFFFCC" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label32" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="Use Hand Icon to See Users in the Group."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonShowGroup" runat="server" Text="Add Group!" Width="95%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:ModalPopupExtender ID="MPAddGroup" runat="server" PopupControlID="PanelAddGroup"
                    TargetControlID="ButtonShowGroup" OnCancelScript="DoCancel()" BackgroundCssClass="modalBackground"
                    CancelControlID="ButtonGroupsCancel">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAddGroup" runat="server" CssClass="modalPopup" Width="230px"
                    tyle="display: none;">
                    <table width="100%">
                        <tr>
                            <td height="28">
                                <asp:Button ID="ButtonGroupsCancel" runat="server" Text="Close" Width="98%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text="Group Name:"></asp:Label>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DashBoardGroupNameTextBox"
                                    ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="GroupName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:TextBox ID="DashBoardGroupNameTextBox" runat="server" Width="94%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="LabelStatusGroups" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Button ID="ButtonAddGroup" runat="server" CommandName="Insert" Text="Add Group"
                                    ValidationGroup="GroupName" Width="98%" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Panel ID="PanelGroupUsers" runat="server" Width="240" Visible="False">
                    <table id="TableGroupUsers" class="content-table" width="100%">
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label34" runat="server" Text="Your Group Users:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label28" runat="server" ForeColor="Red" Text="Teachers in Selected Group:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridViewGroupsUsersStaff" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    DataKeyNames="DashBoardUserID" DataSourceID="SqlDataSourceDashBoardGroupsUsersStaff"
                                    Width="95%" ShowHeader="False">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBoxUserStaff" runat="server" />
                                                <asp:HoverMenuExtender ID="CheckBoxUserStaff_HoverMenuExtender" runat="server" OffsetX="0"
                                                    OffsetY="0" PopDelay="50" PopupControlID="PanelInfoCheckBoxUserStaff" PopupPosition="Right"
                                                    TargetControlID="CheckBoxUserStaff">
                                                </asp:HoverMenuExtender>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DashBoardUserID" SortExpression="DashBoardUserID"
                                            Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelUserID" runat="server" Text='<%# Bind("DashBoardUserID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                            <ItemTemplate>
                                                <div style="overflow: hidden; white-space: nowrap; width: 120px">
                                                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Small" Text='<%# Bind("UserName") %>'></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/Delete24.png"
                                                    OnClientClick="return confirm('Are you sure you want to delete this User?')"
                                                    ToolTip="Delete User!" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No User in this Group!
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="Label31" runat="server" Text="Students in Selected Group:" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridViewGroupsUsersStudents" runat="server" AllowPaging="True"
                                    AutoGenerateColumns="False" DataKeyNames="DashBoardUserID" DataSourceID="SqlDataSourceDashBoardGroupsUsersStudents"
                                    Width="95%" ShowHeader="False">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBoxUserStudent" runat="server" />
                                                <asp:HoverMenuExtender ID="CheckBoxUserStudent_HoverMenuExtender" runat="server"
                                                    OffsetX="0" OffsetY="0" PopDelay="50" PopupControlID="PanelInfoCheckBoxUserStudent"
                                                    PopupPosition="Right" TargetControlID="CheckBoxUserStudent">
                                                </asp:HoverMenuExtender>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DashBoardUserID" SortExpression="DashBoardUserID"
                                            Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelUserID" runat="server" Text='<%# Bind("DashBoardUserID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                            <ItemTemplate>
                                                <div style="overflow: hidden; white-space: nowrap; width: 120px">
                                                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Small" Text='<%# Bind("UserName") %>'></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/Delete24.png"
                                                    OnClientClick="return confirm('Are you sure you want to delete this User?')"
                                                    ToolTip="Delete User!" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No User in this Group!
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Button ID="ButtonShowGroupUsers" runat="server" Text="Add Group User!" Width="95%" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:ModalPopupExtender ID="MPAddGroupUser" runat="server" PopupControlID="PanelAddGroupUser"
                    TargetControlID="ButtonShowGroupUsers" BackgroundCssClass="modalBackground" CancelControlID="ButtonCloseGroupsUsers">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAddGroupUser" runat="server" CssClass="modalPopup" Width="230px"
                    Style="display: none;">
                    <table width="100%">
                        <tr>
                            <td height="25">
                                <asp:Button ID="ButtonCloseGroupsUsers" runat="server" Text="Close" Width="95%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="Label29" runat="server" Text="Select School:" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
                                    DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                    TabIndex="7" Width="95%" Enabled="False">
                                    <asp:ListItem Value="">Select School</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="Label30" runat="server" Text="Selected Group:" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:DropDownList ID="DropDownListGroups" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDashBoardGroups"
                                    DataTextField="DashBoardGroupName" DataValueField="DashBoardGroupID" TabIndex="7"
                                    Width="95%">
                                    <asp:ListItem Value="">Select School</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="Label7" runat="server" Text="Select Teachers:" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="150">
                                <div style="overflow: scroll; height: 150px; white-space: nowrap; width: 212px">
                                    <asp:CheckBoxList ID="CheckBoxListTeachers" runat="server" DataSourceID="SqlDataSourceTeachers"
                                        DataTextField="UserName" DataValueField="UserID" Width="100%" Font-Size="X-Small">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="Label2" runat="server" Text="Select Section:" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSchoolSections"
                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="7"
                                    Width="95%">
                                    <asp:ListItem Value="">Select School</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Select Students:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="150">
                                <div style="overflow: scroll; height: 150px; white-space: nowrap; width: 212px">
                                    <asp:CheckBoxList ID="CheckBoxListStudents" runat="server" DataSourceID="SqlDataSourceStudents"
                                        DataTextField="UserName" DataValueField="UserID" Width="100%" Font-Size="X-Small">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:CheckBox ID="CheckBoxCheckAll" runat="server" AutoPostBack="True" Font-Bold="True"
                                    ForeColor="Red" OnCheckedChanged="CheckBoxCheckAll_CheckedChanged" Text="Check / Uncheck All" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="ButtonAddUser" runat="server" CommandName="Insert" Text="Add Group User"
                                    Width="95%" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelInfoCheckBoxUserGroup" runat="server" CssClass="MenuToolTip"
                    Visible="False" Width="240">
                    <asp:Label ID="Label10" runat="server" Text="Check the Group" ForeColor="Red" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="Click here to Check the Group to post your message to all users in it!"></asp:Label>
                    <img class="callout" src="images/callout.gif" />
                </asp:Panel>
                <asp:Panel ID="PanelInfoImageButtonSelect" runat="server" CssClass="MenuToolTip"
                    Visible="False" Width="240">
                    <asp:Label ID="Label12" runat="server" Text="Select the Group" ForeColor="Red" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="Click here to Select the Group to see all the users in it!"></asp:Label>
                    <img class="callout" src="images/callout.gif" />
                </asp:Panel>
                <asp:Panel ID="PanelInfoCheckBoxUserStaff" runat="server" CssClass="MenuToolTip"
                    Visible="False" Width="240">
                    <asp:Label ID="Label14" runat="server" Text="Check the User (Staff)" ForeColor="Red"
                        Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label15" runat="server" Text="Click here to Check the User to post your message!"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label16" runat="server" Text="When A Group is checked, all users in it receives your post. It is not important if the users are checked or not."></asp:Label>
                    <img class="callout" src="images/callout.gif" />
                </asp:Panel>
                <asp:Panel ID="PanelInfoCheckBoxUserStudent" runat="server" CssClass="MenuToolTip"
                    Width="240" Visible="False">
                    <asp:Label ID="Label17" runat="server" Text="Check the User (Student)" ForeColor="Red"
                        Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label18" runat="server" Text="Click here to Check the User to post your message!"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label19" runat="server" Text="When A Group is checked, all users in it receives your post. It is not important if the users are checked or not."></asp:Label>
                    <img class="callout" src="images/callout.gif" />
                </asp:Panel>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    DASHBOARD</h2>
                <br />
                <div id="divChild">
                    <table width="675" style="border: 1px solid #CCCCCC; background-color: #FFFFE1">
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label4" runat="server" Text="Welcome to MP SMS Timeline! Here you can post!"
                                    Font-Bold="True"></asp:Label>
                            </td>
                            <td width="50">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red" Text="(Beta)"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="MessageTextBoxTopic" runat="server" Height="50px" TextMode="MultiLine"
                                    Width="97%" />
                            </td>
                            <td width="50">
                                <asp:Button ID="ButtonDashBoard" runat="server" CommandName="Insert" Height="50px"
                                    Text="Send" ValidationGroup="TimelineTopic" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTopic" runat="server" ControlToValidate="MessageTextBoxTopic"
                                    ErrorMessage="* Please write something..." Font-Bold="True" ForeColor="Red" ValidationGroup="TimelineTopic">* Please write something first...</asp:RequiredFieldValidator>
                            </td>
                            <td width="50">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="LabelTopicStatus1" runat="server" Font-Bold="False" ForeColor="Red"
                        Font-Size="XX-Small">Step 1-a: Type your message in the textbox above.</asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="LabelTopicStatus2a" runat="server" Font-Bold="False" ForeColor="Red"
                        Font-Size="XX-Small">Step 2-a: Check Group(s) or User(s) from the Menu left by simply clicking on the CheckBoxes.</asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="LabelTopicStatus2b" runat="server" Font-Bold="False" ForeColor="Red"
                        Font-Size="XX-Small">Step 2-b: If you dont have any Groups, please use Add Group Button to add a Group. </asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="LabelTopicStatus2c" runat="server" Font-Bold="False" ForeColor="Red"
                        Font-Size="XX-Small">Step 2-c: After adding a Group, when it is selected, add Users by using Add Group User Button.</asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="LabelTopicStatus3" runat="server" Font-Bold="False" ForeColor="Red"
                        Font-Size="XX-Small">Step 3-a: If a Group is checked, all Users in that group receives the post, regardless of checkboxes next to Usernames.</asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server" Font-Bold="False" ForeColor="Red" Font-Size="XX-Small">Step 3-b: In order to see User(s) in a Group, simply select it by clicking on the hand button.</asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="False" ForeColor="Red" Font-Size="XX-Small">Step 3-c: If you want to post a message to a few Users in a Group, select only the Users, not the Group.</asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewDashBoard" runat="server" AutoGenerateColumns="False" DataKeyNames="DashboardID"
                        DataSourceID="SqlDataSourceDashBoard" Width="675px" ShowHeader="False" AllowPaging="True"
                        PageSize="6">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td height="25" width="25" align="center">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/StaffSD/Images/row.gif" />
                                            </td>
                                            <td height="25">
                                                <p class="message-box info">
                                                    <b>
                                                        <asp:Label ID="DateLabel1" runat="server" Font-Bold="True" ForeColor="#333333" Text="From:" />
                                                        &nbsp;<asp:Label ID="TitleLabel" runat="server" Font-Bold="True" ForeColor="Red"
                                                            Text='<%# Bind("Username") %>' />
                                                        &nbsp;<asp:Label ID="DateLabel" runat="server" Font-Size="X-Small" ForeColor="Gray"
                                                            Text='<%# Bind("Date", "{0:D}") %>' />
                                                    </b>
                                                </p>
                                            </td>
                                            <td height="25" width="50">
                                                <asp:Label ID="LabelLiked" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                                                <asp:Label ID="Label3" runat="server" Text=" &nbsp;Likes" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="justify">
                                                &nbsp;
                                            </td>
                                            <td align="justify">
                                                <p class="message-box clean">
                                                    <asp:Label ID="MessageLabel" runat="server" Font-Size="Small" Text='<%# Bind("Message") %>' />
                                                </p>
                                            </td>
                                            <td align="justify">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td align="justify" height="25">
                                                &nbsp;
                                            </td>
                                            <td align="justify">
                                                <a href="javascript:switchViews('div<%# Eval("DashboardID") %>', 'one');">
                                                    <img id="imgdiv<%# Eval("DashboardID") %>" alt="Click to Show/Hide Replies" border="0"
                                                        src="Images/plus.gif" />
                                                    <asp:Label ID="Label26" runat="server" Text="Click Here to Show / Hide Replies!"
                                                        ForeColor="Red"></asp:Label></a>
                                            </td>
                                            <td align="justify">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="20">
                                                &nbsp;
                                            </td>
                                            <td height="20">
                                                <table width="100%">
                                                    <tr>
                                                        <td width="50">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <div id="div<%# Eval("DashboardID") %>" style="display: none; position: relative;">
                                                                <asp:GridView ID="GridViewReply" runat="server" AutoGenerateColumns="False" DataKeyNames="DashboardID"
                                                                    DataSourceID="SqlDataSourceDashBoardReply" ShowFooter="True" ShowHeader="False"
                                                                    Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <FooterTemplate>
                                                                                <asp:FormView ID="FormViewReply" runat="server" DataKeyNames="DasboardID" DataSourceID="SqlDataSourceDashBoardReply"
                                                                                    DefaultMode="Insert" Width="97%">
                                                                                    <InsertItemTemplate>
                                                                                        <table width="100%">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="MessageTextBoxFooter" runat="server" Height="50px" Text='<%# Bind("Comment") %>'
                                                                                                        TextMode="MultiLine" Width="97%" />
                                                                                                </td>
                                                                                                <td width="35">
                                                                                                    <asp:Button ID="ButtonInsertReply" runat="server" CommandName="Insert" Height="50px"
                                                                                                        Text="Reply" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTopic" runat="server" ControlToValidate="MessageTextBoxFooter"
                                                                                                        ErrorMessage="* Please write something..." Font-Bold="True" ForeColor="Red" ValidationGroup='<%# "RowNo" & GridViewDashBoard.Rows.Count.ToString %>'> * Please write something first...</asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td width="35">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </InsertItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        &nbsp;<br />
                                                                                        <br />
                                                                                    </ItemTemplate>
                                                                                </asp:FormView>
                                                                            </FooterTemplate>
                                                                            <ItemTemplate>
                                                                                <table width="100%" style="border: 1px solid #009933; background-color: #F2FFF2">
                                                                                    <tr>
                                                                                        <td height="25" width="25" align="center">
                                                                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/StaffSD/Images/row.gif" />
                                                                                        </td>
                                                                                        <td height="25">
                                                                                            <p class="message-box info">
                                                                                                <b>
                                                                                                    <asp:Label ID="DateLabel2" runat="server" Font-Bold="True" ForeColor="#333333" Text="From:" />
                                                                                                    &nbsp;<asp:Label ID="TitleLabelReply" runat="server" Font-Bold="True" ForeColor="#FF3300"
                                                                                                        Text='<%# Bind("Username") %>' />
                                                                                                    &nbsp;<asp:Label ID="DateLabelReply" runat="server" Font-Size="X-Small" ForeColor="Gray"
                                                                                                        Text='<%# Bind("Date", "{0:D}") %>' />
                                                                                                </b>
                                                                                            </p>
                                                                                        </td>
                                                                                        <td height="25" width="50">
                                                                                            <asp:Label ID="LabelLiked" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                                                                                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text=" &nbsp;Likes"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="justify">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td align="justify">
                                                                                            <p class="message-box clean">
                                                                                                <asp:Label ID="MessageLabelReply" runat="server" Font-Size="Small" Text='<%# Eval("Comment") %>' />
                                                                                            </p>
                                                                                        </td>
                                                                                        <td align="justify">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EmptyDataTemplate>
                                                                        <asp:FormView ID="FormViewReply" runat="server" DataKeyNames="DasboardID" DataSourceID="SqlDataSourceDashBoardReply"
                                                                            DefaultMode="Insert" Width="97%">
                                                                            <InsertItemTemplate>
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:TextBox ID="MessageTextBoxEmpty" runat="server" Height="50px" Text='<%# Bind("Comment") %>'
                                                                                                TextMode="MultiLine" Width="97%" />
                                                                                        </td>
                                                                                        <td width="35">
                                                                                            <asp:Button ID="ButtonInsertReply" runat="server" CommandName="Insert" Height="50px"
                                                                                                Text="Reply" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTopic" runat="server" ControlToValidate="MessageTextBoxEmpty"
                                                                                                ErrorMessage="* Please write something..." Font-Bold="True" ForeColor="Red" ValidationGroup="TimelineEmpty">* Please write something first...</asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                        <td width="35">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </InsertItemTemplate>
                                                                            <ItemTemplate>
                                                                                &nbsp;<br />
                                                                                <br />
                                                                            </ItemTemplate>
                                                                        </asp:FormView>
                                                                    </EmptyDataTemplate>
                                                                </asp:GridView>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:HiddenField ID="HiddenFieldDashBoardID" runat="server" Value='<%# Eval("DashboardID") %>' />
                                                <asp:HiddenField ID="HiddenFieldToday" runat="server" />
                                                <asp:SqlDataSource ID="SqlDataSourceDashBoardReply" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                    InsertCommand="INSERT INTO tbl_DashBoardComments(DashBoardID, SenderID, Comment, Date, Show, Liked) VALUES (@DashBoardID, @SenderID, @Comment, @Date, 1, 0)"
                                                    SelectCommand="SELECT tbl_DashBoardComments.DashBoardCommentID, tbl_DashBoardComments.DashBoardID, tbl_DashBoardComments.SenderID, aspnet_Users.UserName, tbl_DashBoardComments.Comment, tbl_DashBoardComments.Date FROM aspnet_Users INNER JOIN tbl_DashBoardComments ON aspnet_Users.UserId = tbl_DashBoardComments.SenderID WHERE (tbl_DashBoardComments.DashBoardID = @DashBoardID)">
                                                    <InsertParameters>
                                                        <asp:ControlParameter ControlID="HiddenFieldDashBoardID" Name="DashBoardID" PropertyName="Value" />
                                                        <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                                                        <asp:Parameter Name="Comment" />
                                                        <asp:ControlParameter ControlID="HiddenFieldToday" Name="Date" PropertyName="Value" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="HiddenFieldDashBoardID" Name="DashBoardID" PropertyName="Value" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td height="20">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <img alt="" src="../StaffSD/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                <br />
                                <br />
                                <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Message Found!"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="LabelWarning1" runat="server" Font-Bold="True" ForeColor="Red" Text="Get Your Groups & Users Ready and Start to Use Timeline!"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <uswnb:WebMessageBox ID="WebMessageBoxTimeLine" runat="server" />
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT tbl_DashBoard.DashboardID, tbl_DashBoard.SenderID, tbl_DashBoardWall.ReceiverID, tbl_DashBoard.Message, aspnet_Users.UserName, tbl_DashBoard.Date FROM tbl_DashBoard INNER JOIN aspnet_Users ON tbl_DashBoard.SenderID = aspnet_Users.UserId INNER JOIN tbl_DashBoardWall ON tbl_DashBoard.DashboardID = tbl_DashBoardWall.DashBoardID WHERE (tbl_DashBoardWall.ReceiverID = @ReceiverID) ORDER BY tbl_DashBoard.DashboardID DESC"
                        InsertCommand="INSERT INTO tbl_DashBoard(SenderID, Message, Date, Show, Liked) VALUES (@SenderID, @Message, @Date, @Show, @Liked) SET @LastAddedID = SCOPE_IDENTITY();">
                        <InsertParameters>
                            <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                            <asp:Parameter Name="Message" />
                            <asp:Parameter Name="Date" DefaultValue="1.1.2000" />
                            <asp:Parameter Name="Show" />
                            <asp:Parameter Name="Liked" />
                            <asp:Parameter Name="LastAddedID" Direction="Output" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="ReceiverID" SessionField="UserID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDashBoardWall" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT DashBoardWallID FROM tbl_DashBoardWall" InsertCommand="IF NOT EXISTS 
(
SELECT DashBoardWallID FROM tbl_DashBoardWall WHERE (DashBoardID=@DashBoardID AND ReceiverID=@ReceiverID )
)

INSERT INTO tbl_DashBoardWall(DashBoardID, ReceiverID) VALUES (@DashBoardID, @ReceiverID)">
                        <InsertParameters>
                            <asp:Parameter Name="DashBoardID" />
                            <asp:Parameter Name="ReceiverID" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDashBoardGroups" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        InsertCommand="INSERT INTO tbl_DashBoardGroups(DashBoardGroupName, DashBoardGroupOwnerID) VALUES (@DashBoardGroupName, @DashBoardGroupOwnerID)"
                        SelectCommand="SELECT DashBoardGroupID, DashBoardGroupOwnerID, DashBoardGroupName FROM tbl_DashBoardGroups WHERE (DashBoardGroupOwnerID = @DashBoardGroupOwnerID)"
                        DeleteCommand="DELETE FROM tbl_DashBoardGroups WHERE (DashBoardGroupID = @DashBoardGroupID)">
                        <DeleteParameters>
                            <asp:Parameter Name="DashBoardGroupID" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DashBoardGroupName" />
                            <asp:SessionParameter Name="DashBoardGroupOwnerID" SessionField="UserID" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="DashBoardGroupOwnerID" SessionField="UserID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDashBoardGroupsUsersStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        InsertCommand="IF NOT EXISTS 

(
SELECT        DasBoardUsersID
FROM            tbl_DashBoardGroupsUsers
WHERE DashBoardGroupID=@DashBoardGroupID AND DashBoardUserID=@DashBoardUserID
)



INSERT INTO tbl_DashBoardGroupsUsers(DashBoardUserID, DashBoardGroupID) VALUES (@DashBoardUserID, @DashBoardGroupID)"
                        SelectCommand="SELECT tbl_DashBoardGroupsUsers.DashBoardGroupID, tbl_DashBoardGroupsUsers.DashBoardUserID, tbl_Staff.StaffName AS Username FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN tbl_DashBoardGroupsUsers ON aspnet_UsersInRoles.UserId = tbl_DashBoardGroupsUsers.DashBoardUserID INNER JOIN tbl_Staff ON tbl_DashBoardGroupsUsers.DashBoardUserID = tbl_Staff.StaffID WHERE (tbl_DashBoardGroupsUsers.DashBoardGroupID = @DashBoardGroupID) AND (aspnet_Roles.RoleName = N'Staff') ORDER BY Username"
                        DeleteCommand="DELETE FROM tbl_DashBoardGroupsUsers WHERE (DashBoardGroupID = @DashBoardGroupID) AND (DashBoardUserID = @DashBoardUserID)">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridViewGroups" Name="DashBoardGroupID" PropertyName="SelectedValue" />
                            <asp:Parameter Name="DashBoardUserID" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DashBoardGroupID" />
                            <asp:Parameter Name="DashBoardUserID" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewGroups" Name="DashBoardGroupID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDashBoardGroupsUsersStudents" runat="server"
                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" DeleteCommand="DELETE FROM tbl_DashBoardGroupsUsers WHERE (DashBoardGroupID = @DashBoardGroupID) AND (DashBoardUserID = @DashBoardUserID)"
                        InsertCommand="IF NOT EXISTS 

(
SELECT        DasBoardUsersID
FROM            tbl_DashBoardGroupsUsers
WHERE DashBoardGroupID=@DashBoardGroupID AND DashBoardUserID=@DashBoardUserID
)



INSERT INTO tbl_DashBoardGroupsUsers(DashBoardUserID, DashBoardGroupID) VALUES (@DashBoardUserID, @DashBoardGroupID)"
                        SelectCommand="SELECT tbl_DashBoardGroupsUsers.DashBoardGroupID, tbl_DashBoardGroupsUsers.DashBoardUserID, tbl_Students.StudentName AS Username FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN tbl_DashBoardGroupsUsers ON aspnet_UsersInRoles.UserId = tbl_DashBoardGroupsUsers.DashBoardUserID INNER JOIN tbl_Students ON tbl_DashBoardGroupsUsers.DashBoardUserID = tbl_Students.StudentID WHERE (tbl_DashBoardGroupsUsers.DashBoardGroupID = @DashBoardGroupID) AND (aspnet_Roles.RoleName = N'Student') ORDER BY Username">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridViewGroups" Name="DashBoardGroupID" PropertyName="SelectedValue" />
                            <asp:Parameter Name="DashBoardUserID" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DashBoardGroupID" />
                            <asp:Parameter Name="DashBoardUserID" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewGroups" Name="DashBoardGroupID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (Show = 1) AND (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                        <SelectParameters>
                            <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceSchoolSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT tbl_Staff.StaffID AS UserID, tbl_Staff.StaffName AS UserName, aspnet_Roles.RoleName FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN tbl_Staff ON aspnet_UsersInRoles.UserId = tbl_Staff.StaffID WHERE (tbl_Staff.SchoolCode = @SchoolCode) AND (aspnet_Roles.RoleName = N'Staff') ORDER BY UserName">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT StudentID AS UserID, StudentName AS UserName, CurrentSectionID FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) ORDER BY UserName">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceUsersinGroups" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT DashBoardUserID FROM tbl_DashBoardGroupsUsers WHERE (DashBoardGroupID = @DashBoardGroupID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListGroups" Name="DashBoardGroupID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
