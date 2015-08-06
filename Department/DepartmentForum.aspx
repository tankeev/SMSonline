<%@ Page Title="SIS Department Forums" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="DepartmentForum.aspx.vb" Inherits="NewUserAccount" %>

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
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div id="right_wrap">
                <div id="right_content">
                    <h2>
                        FORUM</h2>
                    <br />
                    <div id="divChild">
                        <asp:FormView ID="FormViewDashBoard" runat="server" DataKeyNames="DasboardID" DataSourceID="SqlDataSourceDepartmentsForum"
                            DefaultMode="Insert" Width="98%">
                            <InsertItemTemplate>
                                <table style="border: 1px solid #CCCCCC; background-color: #FFFFE1" width="100%">
                                    <tr>
                                        <td height="30">
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Welcome to Discussion Forums. Here you can post!"></asp:Label>
                                        </td>
                                        <td width="50">
                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red" Text="(Beta)"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="MessageTextBoxTopic" runat="server" Height="50px" Text='<%# Bind("Message") %>'
                                                TextMode="MultiLine" Width="97%" />
                                        </td>
                                        <td width="50">
                                            <asp:Button ID="ButtonDashBoard" runat="server" CommandName="Insert" Height="50px"
                                                Text="Send" ValidationGroup="TimelineTopic" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTopic" runat="server" ControlToValidate="MessageTextBoxTopic"
                                                ErrorMessage="* Please write something..." Font-Bold="True" ForeColor="Red" ValidationGroup="TimelineTopic">* Please write something first...</asp:RequiredFieldValidator>
                                        </td>
                                        <td width="50">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <br />
                        <asp:GridView ID="GridViewDashBoard" runat="server" AutoGenerateColumns="False" DataKeyNames="DasboardID"
                            CellSpacing="10" CellPadding="5" DataSourceID="SqlDataSourceDepartmentsForum"
                            ShowHeader="False" Width="98%">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td align="center" height="25" width="25">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Administrators/Images/row.gif" />
                                                </td>
                                                <td height="25">
                                                    <p class="message-box info">
                                                        <b>
                                                            <asp:Label ID="DateLabel1" runat="server" Font-Bold="True" ForeColor="#333333" Text="From:" />
                                                            <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" ForeColor="Red"
                                                                Text='<%# Bind("Username") %>' />
                                                            <asp:Label ID="DateLabel" runat="server" Font-Size="X-Small" ForeColor="Gray"
                                                                Text='<%# Bind("Date", "{0:D}") %>' />
                                                        </b>
                                                    </p>
                                                </td>
                                                <td height="25" width="50">
                                                    <asp:Label ID="LabelLiked" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Text=" Likes"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="justify">
                                                </td>
                                                <td align="justify">
                                                    <p class="message-box clean">
                                                        <asp:Label ID="MessageLabel" runat="server" Font-Size="Small" Text='<%# Bind("Message") %>' />
                                                    </p>
                                                </td>
                                                <td align="justify">
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="justify" height="25">
                                                    
                                                </td>
                                                <td align="justify">
                                                    <a href="javascript:switchViews('div<%# Eval("DasboardID") %>', 'one');">
                                                        <img id="imgdiv<%# Eval("DasboardID") %>" alt="Click to Show/Hide Replies" border="0"
                                                            src="Images/plus.gif" />
                                                        <asp:Label ID="Label26" runat="server" Text="Click Here to Show / Hide Replies!"
                                                            ForeColor="Red"></asp:Label></a>
                                                </td>
                                                <td align="justify">
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="20">
                                                    
                                                </td>
                                                <td height="20">
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="50">
                                                            </td>
                                                            <td>
                                                                <div id="div<%# Eval("DasboardID") %>" style="display: none; position: relative;
                                                                    left: 25px;">
                                                                    <asp:GridView ID="GridViewReply" runat="server" AutoGenerateColumns="False" DataKeyNames="DasboardID"
                                                                        DataSourceID="SqlDataSourceDashBoardReply" ShowFooter="True" ShowHeader="False"
                                                                        Width="100%">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <FooterTemplate>
                                                                                    Additional Replies:
                                                                                    <asp:FormView ID="FormViewReply" runat="server" DataKeyNames="DasboardID" DataSourceID="SqlDataSourceDashBoardReply"
                                                                                        DefaultMode="Insert" Width="97%">
                                                                                        <InsertItemTemplate>
                                                                                            <table width="100%">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <asp:TextBox ID="MessageTextBoxFooter" runat="server" Height="50px" Text='<%# Bind("Message") %>'
                                                                                                            TextMode="MultiLine" Width="97%" />
                                                                                                    </td>
                                                                                                    <td width="35">
                                                                                                        <asp:Button ID="ButtonInsertReply" runat="server" CommandName="Insert" Height="50px"
                                                                                                            Text="Reply" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTopic0" runat="server" ControlToValidate="MessageTextBoxFooter"
                                                                                                            ErrorMessage="* Please write something..." Font-Bold="True" ForeColor="Red" ValidationGroup='<%# "RowNo" & Container.DataItemIndex %>'> * Please write something first...</asp:RequiredFieldValidator>
                                                                                                    </td>
                                                                                                    <td width="35">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </InsertItemTemplate>
                                                                                    </asp:FormView>
                                                                                </FooterTemplate>
                                                                                <ItemTemplate>
                                                                                    <table style="border: 1px solid #009933; background-color: #F2FFF2" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" height="25" width="25">
                                                                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Administrators/Images/row.gif" />
                                                                                            </td>
                                                                                            <td height="25">
                                                                                                <p class="message-box info">
                                                                                                    <b>
                                                                                                        <asp:Label ID="DateLabel2" runat="server" Font-Bold="True" ForeColor="#333333" Text="From:" />
                                                                                                        <asp:Label ID="TitleLabelReply" runat="server" Font-Bold="True" ForeColor="#FF3300"
                                                                                                            Text='<%# Bind("Username") %>' />
                                                                                                        <asp:Label ID="DateLabelReply" runat="server" Font-Size="X-Small" ForeColor="Gray"
                                                                                                            Text='<%# Bind("Date", "{0:D}") %>' />
                                                                                                    </b>
                                                                                                </p>
                                                                                            </td>
                                                                                            <td height="25" width="50">
                                                                                                <asp:Label ID="LabelLiked0" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                                                                                                <asp:Label ID="Label25" runat="server" ForeColor="Red" Text=" Likes"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="justify">
                                                                                                
                                                                                            </td>
                                                                                            <td align="justify">
                                                                                                <p class="message-box clean">
                                                                                                    <asp:Label ID="MessageLabelReply" runat="server" Font-Size="Small" Text='<%# Bind("Message") %>' />
                                                                                                </p>
                                                                                            </td>
                                                                                            <td align="justify">
                                                                                                
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <EmptyDataTemplate>
                                                                            First Reply:
                                                                            <asp:FormView ID="FormViewEmptyReply" runat="server" DataKeyNames="DasboardID" DataSourceID="SqlDataSourceDashBoardReply"
                                                                                DefaultMode="Insert" Width="97%">
                                                                                <InsertItemTemplate>
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:TextBox ID="MessageTextBoxEmpty" runat="server" Height="50px" Text='<%# Bind("Message") %>'
                                                                                                    TextMode="MultiLine" Width="97%" />
                                                                                            </td>
                                                                                            <td width="35">
                                                                                                <asp:Button ID="ButtonInsertReply0" runat="server" CommandName="Insert" Height="50px"
                                                                                                    Text="Reply" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTopic1" runat="server" ControlToValidate="MessageTextBoxEmpty"
                                                                                                    ErrorMessage="* Please write something..." Font-Bold="True" ForeColor="Red" ValidationGroup='<%# "RowNo" & GridViewDashBoard.Rows.Count.ToString %>'>* Please write something first...</asp:RequiredFieldValidator>
                                                                                            </td>
                                                                                            <td width="35">
                                                                                                
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </InsertItemTemplate>
                                                                            </asp:FormView>
                                                                        </EmptyDataTemplate>
                                                                    </asp:GridView>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:HiddenField ID="HiddenFieldDashBoardID" runat="server" Value='<%# Eval("DasboardID") %>' />
                                                    <asp:HiddenField ID="HiddenFieldToday" runat="server" />
                                                    <asp:SqlDataSource ID="SqlDataSourceDashBoardReply" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                        InsertCommand="INSERT INTO tbl_DepartmentsForum(SenderID, MessageID, Message, Date, IsReply, Show) VALUES (@SenderID, @MessageID, @Message, @Date, 1, 1)"
                                                        SelectCommand="SELECT tbl_DepartmentsForum.DasboardID, tbl_DepartmentsForum.SenderID, aspnet_Users.UserName, tbl_DepartmentsForum.MessageID, tbl_DepartmentsForum.Message, tbl_DepartmentsForum.Date, tbl_DepartmentsForum.IsReply FROM aspnet_Users INNER JOIN tbl_DepartmentsForum ON aspnet_Users.UserId = tbl_DepartmentsForum.SenderID WHERE (tbl_DepartmentsForum.MessageID = @DasboardID) ORDER BY tbl_DepartmentsForum.DasboardID ASC">
                                                        <InsertParameters>
                                                            <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                                                            <asp:ControlParameter ControlID="HiddenFieldDashboardID" Name="MessageID" PropertyName="Value" />
                                                            <asp:Parameter Name="Message" />
                                                            <asp:ControlParameter ControlID="HiddenFieldToday" Name="Date" PropertyName="Value" />
                                                        </InsertParameters>
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="HiddenFieldDashBoardID" Name="DasboardID" PropertyName="Value" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                                <td height="20">
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center">
                                    <br />
                                    <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry No Threads Found!"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </EmptyDataTemplate>
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
                        SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1)  ORDER BY SchoolName">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDepartmentsForum" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        InsertCommand="INSERT INTO tbl_DepartmentsForum(SenderID, MessageID, Message, Date, IsReply) VALUES (@SenderID, @MessageID, @Message, @Date, @IsReply)"
                        SelectCommand="SELECT aspnet_Users.UserName, tbl_DepartmentsForum.DasboardID, tbl_DepartmentsForum.SenderID, tbl_DepartmentsForum.MessageID, tbl_DepartmentsForum.Message, tbl_DepartmentsForum.Date, tbl_DepartmentsForum.IsReply FROM aspnet_Users INNER JOIN tbl_DepartmentsForum ON aspnet_Users.UserId = tbl_DepartmentsForum.SenderID WHERE (tbl_DepartmentsForum.IsReply = 0) ORDER BY tbl_DepartmentsForum.DasboardID DESC">
                        <InsertParameters>
                            <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                            <asp:Parameter DefaultValue="0" Name="MessageID" />
                            <asp:Parameter Name="Message" />
                            <asp:Parameter DefaultValue="1.1.2000" Name="Date" />
                            <asp:Parameter DefaultValue="0" Name="IsReply" />
                        </InsertParameters>
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
                    DEPARTMENT</h2>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Department/Images/editor.png"
                                NavigateUrl="~/Department/DepartmentStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="Department Staff"></asp:Label>
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
                            <asp:Label ID="Label1" runat="server" Text="Department Forum" ForeColor="Red"></asp:Label>
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
                            <asp:Label ID="Label2" runat="server" Text="Staff Assignments"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/SharedDocuments.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Shared Documents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" Width="95%" Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                TabIndex="7" Width="95%">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" width="150">
                            
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="clear">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
