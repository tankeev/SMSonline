<%@ Page Title="Statistics" Language="VB" MasterPageFile="Default.Master" CodeFile="StatisticsUserActivity.aspx.vb"
    Inherits="UserActivity" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table id="TableNumberofUserActivity" width="97%">
                <tr>
                    <td height="30" width="300">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Last 10 Logins"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridViewUserActivity" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceUserActivity" Width="100%">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="Images/Item.png" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelUsername" runat="server" Font-Size="X-Small" Text='<%# Bind("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="180px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="SchoolName" HeaderText="School Name" SortExpression="SchoolName">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Date" SortExpression="LastLoginDate">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelDate" runat="server" Font-Size="X-Small" Text='<%# Bind("LastLoginDate", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="160px" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle Height="30px" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceUserActivity" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT TOP (9) LastLoginDate, UserName, SchoolName FROM vw_aspnet_MembershipUsers ORDER BY LastLoginDate DESC">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Last 10 Added Users"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridViewLastAddedStudents" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceLastAddedStudents" Width="100%">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="Images/Item.png" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="180px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SchoolName" HeaderText="School Name" SortExpression="SchoolName">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CreateDate" DataFormatString="{0:D}" HeaderText="Date"
                                    SortExpression="CreateDate">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="160px" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center" style="background-color: #FFFFFF">
                                    <br />
                                    <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Record Found!"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </EmptyDataTemplate>
                            <RowStyle Height="30px" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceLastAddedStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT TOP (9) aspnet_Users.UserName, tbl_Schools.SchoolCode, tbl_Schools.SchoolName, aspnet_Membership.CreateDate FROM aspnet_Users INNER JOIN tbl_Schools ON aspnet_Users.SchoolCode = tbl_Schools.SchoolCode INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId ORDER BY aspnet_Membership.CreateDate DESC">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:FormView ID="FormViewUsersTotal" runat="server" DataSourceID="SqlDataSourceUsersTotal"
                            Width="100%">
                            <EditItemTemplate>
                                Total:
                                <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" />
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                Total:
                                <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Insert" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red" Text="Total "></asp:Label>
                                <asp:Label ID="TotalLabel" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"
                                    Text='<%# Bind("Total") %>' />
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text="People are using MP SIS."></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSourceUsersTotal" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT COUNT(UserId) AS Total FROM aspnet_Users"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
