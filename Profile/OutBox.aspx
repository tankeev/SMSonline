<%@ Page Title="About Us" Language="VB" MasterPageFile="Profile.Master" AutoEventWireup="false"
    CodeFile="OutBox.aspx.vb" Inherits="About" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanelOutBox" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewOutBox" runat="server" AutoGenerateColumns="False" DataKeyNames="MessageID"
                DataSourceID="SqlDataSourceGridViewOutBox" AllowPaging="True" 
                Width="680px">
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Profile/Images/new_message.gif"
                        ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Date" SortExpression="Date">
                        <ItemTemplate>
                            <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("Date", "{0:dd-M-yyyy}") %>'></asp:Label></ItemTemplate>
                        <ItemStyle Font-Bold="False" Width="90px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="To" SortExpression="Receipent">
                        <ItemTemplate>
                            <asp:Label ID="LabelSender" runat="server" Text='<%# Bind("Receipent") %>'></asp:Label></ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Font-Bold="False" Width="180px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                ImageUrl="~/Profile/Images/delete_icon.gif" Text="Delete" ToolTip="Delete Message!" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtenderRowDelete" runat="server" TargetControlID="ImageButtonDelete"
                                ConfirmText="Are You Sure?">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Width="25px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelRead" runat="server" Text='<%# Bind("Read") %>'></asp:Label></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Read") %>'></asp:TextBox></EditItemTemplate>
                        <ItemStyle Width="25px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" /><br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Text="No Message Found!" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:FormView ID="FormViewOutBox" runat="server" DataSourceID="SqlDataSourceFormViewOutBox"
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
                    <asp:Label ID="Sender" runat="server" Text='<%# Eval("Receipent") %>' Style="font-weight: 700"></asp:Label>
                    <br />
                    <br />
                    <asp:TextBox ID="TextBoxReadMessageOut" runat="server" Height="250px" Text='<%# Bind("Message") %>'
                        TextMode="MultiLine" Width="98%"></asp:TextBox>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceGridViewOutBox" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT MessageID, ReceipentID, Receipent, SenderID, Sender, Title, Message, Date, [Read], OutBoxShow FROM vw_MessageBox WHERE (SenderID = @SenderID) AND (OutBoxShow = 1) ORDER BY MessageID DESC"
                DeleteCommand="UPDATE tbl_MessageBox SET OutBoxShow = 0 WHERE (MessageID = @MessageID)"
                UpdateCommand="UPDATE tbl_MessageBox SET [Read] = @Read WHERE (MessageID = @MessageID)">
                <SelectParameters>
                    <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="MessageID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Read" />
                    <asp:Parameter Name="MessageID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceFormViewOutBox" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT * FROM [vw_MessageBox] WHERE ([MessageID] = @MessageID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewOutBox" Name="MessageID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
