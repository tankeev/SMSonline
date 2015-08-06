<%@ Page Title="Setup Attendance Types" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="AttendanceTypes.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:GridView ID="GridViewAttendanceTypes" runat="server" AutoGenerateColumns="False"
        DataKeyNames="AttendanceTypeID" DataSourceID="SqlDataSourceAttendanceTypes" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="AttendanceTypeID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("AttendanceTypeID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="35px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Priority" SortExpression="Priority">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxPriority" runat="server" Text='<%# Bind("Priority") %>' Width="35px"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="AttendanceType">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxType" runat="server" Text='<%# Bind("AttendanceType") %>'
                        Width="80px"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Definition" SortExpression="Definition">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxDefinition" runat="server" Text='<%# Bind("Definition") %>'
                        Width="90%"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Color" SortExpression="Color">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxColor" runat="server" Text='<%# Bind("Color") %>' Width="80px"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Update"
                        ImageUrl="~/Setup/Images/save.gif" Text="Edit" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="35px" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"
                        ImageUrl="~/Setup/Images/delete.gif" Text="Edit" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="35px" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div align="center">
                <br />
                <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                <br />
                <br />
                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                <br />
                <br />
            </div>
        </EmptyDataTemplate>
        <RowStyle Height="30px" />
    </asp:GridView>
    <br />
    <asp:FormView ID="FormViewAttendanceTypes" runat="server" DataKeyNames="AttendanceTypeID"
        DataSourceID="SqlDataSourceAttendanceTypes" DefaultMode="Insert" Width="100%">
        <EditItemTemplate>
            AttendanceTypeID:
            <asp:Label ID="AttendanceTypeIDLabel1" runat="server" Text='<%# Eval("AttendanceTypeID") %>' />
            <br />
            Priority:
            <asp:TextBox ID="PriorityTextBox" runat="server" Text='<%# Bind("Priority") %>' />
            <br />
            AttendanceType:
            <asp:TextBox ID="AttendanceTypeTextBox" runat="server" Text='<%# Bind("AttendanceType") %>' />
            <br />
            Definition:
            <asp:TextBox ID="DefinitionTextBox" runat="server" Text='<%# Bind("Definition") %>' />
            <br />
            Color:
            <asp:TextBox ID="ColorTextBox" runat="server" Text='<%# Bind("Color") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update" />
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table width="100%">
                <tr>
                    <td height="30" width="120">
                        <asp:Label ID="Label2" runat="server" Text="Priority:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="PriorityTextBox" runat="server" Text='<%# Bind("Priority") %>' Width="220px" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label3" runat="server" Text="Attendance Type:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="AttendanceTypeTextBox" runat="server" Text='<%# Bind("AttendanceType") %>'
                            Width="220px" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label4" runat="server" Text="Definition:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="DefinitionTextBox" runat="server" Text='<%# Bind("Definition") %>'
                            Width="220px" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label5" runat="server" Text="Color:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="ColorTextBox" runat="server" Text='<%# Bind("Color") %>' Width="220px" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Add Attendance Type" Width="220px"
                            CommandName="Insert" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            AttendanceTypeID:
            <asp:Label ID="AttendanceTypeIDLabel" runat="server" Text='<%# Eval("AttendanceTypeID") %>' />
            <br />
            Priority:
            <asp:Label ID="PriorityLabel" runat="server" Text='<%# Bind("Priority") %>' />
            <br />
            AttendanceType:
            <asp:Label ID="AttendanceTypeLabel" runat="server" Text='<%# Bind("AttendanceType") %>' />
            <br />
            Definition:
            <asp:Label ID="DefinitionLabel" runat="server" Text='<%# Bind("Definition") %>' />
            <br />
            Color:
            <asp:Label ID="ColorLabel" runat="server" Text='<%# Bind("Color") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit" />
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete" />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT AttendanceTypeID, Priority, AttendanceType, Definition, Color FROM tbl_AttendanceTypes"
        DeleteCommand="DELETE FROM tbl_AttendanceTypes WHERE (AttendanceTypeID = @AttendanceTypeID)"
        InsertCommand="INSERT INTO tbl_AttendanceTypes(Priority, AttendanceType, Definition, Color) VALUES (@Priority, @AttendanceType, @Definition, @Color)"
        UpdateCommand="UPDATE tbl_AttendanceTypes SET Priority = @Priority, AttendanceType = @AttendanceType, Definition = @Definition, Color = @Color WHERE (AttendanceTypeID = @AttendanceTypeID)">
        <DeleteParameters>
            <asp:Parameter Name="AttendanceTypeID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Priority" />
            <asp:Parameter Name="AttendanceType" />
            <asp:Parameter Name="Definition" />
            <asp:Parameter Name="Color" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Priority" />
            <asp:Parameter Name="AttendanceType" />
            <asp:Parameter Name="Definition" />
            <asp:Parameter Name="Color" />
            <asp:Parameter Name="AttendanceTypeID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
