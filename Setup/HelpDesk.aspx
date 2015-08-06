<%@ Page Title="Setup Help Desk" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    CodeFile="HelpDesk.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="ChildHead">
    <script language="javascript" type="text/javascript">
        function expandcollapse(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == "none") {
                div.style.display = "block";
                if (row == 'alt') {
                    img.src = "Images/minus.gif";
                }
                else {
                    img.src = "Images/minus.gif";
                }
                img.alt = "Close to view other Students";
            }
            else {
                div.style.display = "none";
                if (row == 'alt') {
                    img.src = "Images/plus.gif";
                }
                else {
                    img.src = "Images/plus.gif";
                }
                img.alt = "Expand to show Assessments";
            }
        } 
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewHelpDesk" runat="server" AutoGenerateColumns="False" DataKeyNames="HelpDeskID"
                DataSourceID="SqlDataSourceHelpDesk" Width="680px">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="javascript:expandcollapse('div<%# Eval("HelpDeskID") %>', 'one');">
                                <img id="imgdiv<%# Eval("HelpDeskID") %>" alt="Click to show/hide Orders for Customer <%# Eval("HelpDeskID") %>"
                                    border="0" src="Images/plus.gif" />
                            </a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField></asp:TemplateField>
                    <asp:TemplateField HeaderText="School Name" SortExpression="SchoolName">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SchoolName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SchoolName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" SortExpression="Date">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Date", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Setup/Images/delete.gif" ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText=" ">
                        <ItemTemplate>
                            <tr>
                                <td colspan="100%">
                                    <asp:Label ID="LabelStatusRow" runat="server" Font-Bold="True" Font-Size="XX-Small"
                                        ForeColor="Red"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="10px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceHelpDesk" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_HelpDesk.HelpDeskID, tbl_HelpDesk.UserID, tbl_HelpDesk.Message, tbl_HelpDesk.Date, tbl_HelpDesk.IsActive, aspnet_Users.UserName, tbl_Schools.SchoolName FROM tbl_HelpDesk INNER JOIN aspnet_Users ON tbl_HelpDesk.UserID = aspnet_Users.UserId INNER JOIN tbl_Schools ON aspnet_Users.SchoolCode = tbl_Schools.SchoolCode"
                DeleteCommand="DELETE FROM tbl_HelpDesk WHERE (HelpDeskID = @HelpDeskID)">
                <DeleteParameters>
                    <asp:Parameter Name="HelpDeskID" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourcePrivateMessages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT Title, Date, Message, UserID, SenderID, OutBoxShow, [Read], InBoxShow FROM tbl_MessageBox">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
