<%@ Page Title="SIS Send Message" Language="VB" MasterPageFile="~/Site.Master" CodeFile="Default.aspx.vb"
    Inherits="_Default" %>

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
                    MESSAGE</h2>
                <br />
                <asp:GridView ID="GridViewInbox" runat="server" AutoGenerateColumns="False" DataKeyNames="MessageID"
                    DataSourceID="SqlDataSourceGridviewInBox" AllowPaging="True" Width="680px">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonSelect" runat="server" CausesValidation="False" CommandName="Select"
                                    ImageUrl="~/Coordinators/Images/new_message.gif" Text="Select" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="Date">
                            <ItemTemplate>
                                <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("Date", "{0:dd-M-yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="False" Width="90px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sender" SortExpression="UserName">
                            <ItemTemplate>
                                <asp:Label ID="LabelSender" runat="server" Text='<%# Bind("Sender") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Font-Bold="False" Width="180px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                            <ItemTemplate>
                                <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Profile/Images/details.gif"
                            ShowSelectButton="True">
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:CommandField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDeleteRow" runat="server" CausesValidation="False"
                                    CommandName="Delete" ImageUrl="~/Profile/Images/delete_icon.gif" Text="Delete"
                                    ToolTip="Delete Message!" OnClientClick="return confirm('Are you sure you want to delete this Message?')" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelRead" runat="server" Text='<%# Bind("Read") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="25px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" /><br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="No Message Found!"></asp:Label><br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#FFFF99" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceGridviewInBox" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT MessageID, ReceipentID, SenderID, Date, Title, Message, [Read], InBoxShow, OutBoxShow, Sender FROM vw_MessageBox WHERE (InBoxShow = 1) AND (ReceipentID = @UserID)"
                    DeleteCommand="UPDATE tbl_MessageBox SET InBoxShow = 0 WHERE (MessageID = @MessageID)"
                    UpdateCommand="UPDATE tbl_MessageBox SET [Read] = @Read WHERE (MessageID = @MessageID)">
                    <DeleteParameters>
                        <asp:Parameter Name="MessageID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Read" />
                        <asp:Parameter Name="MessageID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:FormView ID="FormViewReadMessage" runat="server" DataSourceID="SqlDataSourceFormViewInBox"
                    Width="680px" BorderColor="#AEA797" BorderStyle="Solid" BorderWidth="1px">
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" /><br />
                            <br />
                            <asp:Label ID="LabelReadMessage" runat="server" Text="Please Select A Message!" Font-Bold="True"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Sender:" Font-Bold="True"></asp:Label>
                        <asp:Label ID="Sender" runat="server" Text='<%# Eval("Sender") %>' Style="font-weight: 700"></asp:Label>
                        <br />
                        <br />
                        <asp:TextBox ID="TextBoxReadMessage" runat="server" Height="250px" Text='<%# Bind("Message") %>'
                            TextMode="MultiLine" Width="98%"></asp:TextBox>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceFormViewInBox" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT * FROM [vw_MessageBox] WHERE ([MessageID] = @MessageID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewInbox" Name="MessageID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
