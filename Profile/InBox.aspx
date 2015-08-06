<%@ Page Title="SIS InBox" Language="VB" MasterPageFile="Profile.Master" AutoEventWireup="false"
    CodeFile="InBox.aspx.vb" Inherits="InBox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanelInbox" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewInbox" runat="server" AutoGenerateColumns="False" DataKeyNames="MessageID"
                DataSourceID="SqlDataSourceGridviewInBox" AllowPaging="True" Width="680px">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSelect" runat="server" CausesValidation="False" CommandName="Select"
                                ImageUrl="~/Profile/Images/new_message.gif" Text="Select" />
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
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Profile/Images/details.gif"
                        ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDeleteRow" runat="server" CausesValidation="False"
                                CommandName="Delete" ImageUrl="~/Profile/Images/delete_icon.gif" Text="Delete"
                                ToolTip="Delete Message!" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtenderRowDelete" runat="server" TargetControlID="ImageButtonDeleteRow"
                                ConfirmText="Are You Sure?">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="25px" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelRead" runat="server" Text='<%# Bind("Read") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Read") %>'></asp:TextBox>
                        </EditItemTemplate>
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
                SelectCommand="SELECT MessageID, ReceipentID, SenderID, Date, Title, Message, [Read], InBoxShow, OutBoxShow, Sender FROM vw_MessageBox WHERE (InBoxShow = 1) AND (ReceipentID = @UserID) ORDER BY MessageID DESC"
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
            <br />
            <asp:SqlDataSource ID="SqlDataSourceFormViewInBox" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT * FROM [vw_MessageBox] WHERE ([MessageID] = @MessageID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewInbox" Name="MessageID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
