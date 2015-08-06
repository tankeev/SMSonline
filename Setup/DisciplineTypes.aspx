<%@ Page Title="Setup Discipline Types" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="DisciplineTypes.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewDiscipline" runat="server" AutoGenerateColumns="False"
                DataKeyNames="DisciplineTypeID" DataSourceID="SqlDataSourceDisciplineTypes" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="AttendanceTypeID">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discipline Type" SortExpression="DisciplineType">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxDisciplineType" runat="server" Text='<%# Bind("DisciplineType") %>'
                                Width="230px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Local Name" SortExpression="DisciplineTypeLocalName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxLocalName" runat="server" Text='<%# Bind("DisciplineTypeLocalName") %>'
                                Width="230px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Point" SortExpression="DisciplinePoint">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxPoint" runat="server" Text='<%# Bind("DisciplinePoint") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bonus?" SortExpression="PointType">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxBonus" runat="server" Checked='<%# Bind("PointType") %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
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
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update Changes" Width="99%" />
            <br />
            <br />
            <asp:FormView ID="FormViewDiscipline" runat="server" DataKeyNames="DisciplineTypeID"
                DataSourceID="SqlDataSourceDisciplineTypes" DefaultMode="Insert" Width="100%">
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
                                <asp:Label ID="Label2" runat="server" Text="Discipline Type:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="PriorityTextBox" runat="server" Text='<%# Bind("DisciplineType") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label3" runat="server" Text="Local Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="AttendanceTypeTextBox" runat="server" Text='<%# Bind("DisciplineTypeLocalName") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label4" runat="server" Text="Point:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DefinitionTextBox" runat="server" Text='<%# Bind("DisciplinePoint") %>'
                                    Width="220px" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBoxBonus" runat="server" Checked='<%# Bind("PointType") %>'
                                    Font-Bold="True" Text="is Bonus Point?" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Add Discipline Type" Width="220px"
                                    CommandName="Insert" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceDisciplineTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DisciplineTypeID, DisciplineType, DisciplineTypeLocalName, DisciplinePoint, PointType FROM tbl_DisciplineTypes"
                DeleteCommand="DELETE FROM tbl_DisciplineTypes WHERE (DisciplineTypeID = @DisciplineTypeID)"
                InsertCommand="INSERT INTO tbl_DisciplineTypes(DisciplineType, DisciplineTypeLocalName, DisciplinePoint, PointType) VALUES (@DisciplineType, @DisciplineTypeLocalName, @DisciplinePoint, @PointType)"
                UpdateCommand="UPDATE tbl_DisciplineTypes SET DisciplineType = @DisciplineType, DisciplineTypeLocalName = @DisciplineTypeLocalName, DisciplinePoint = @DisciplinePoint, PointType = @PointType WHERE (DisciplineTypeID = @DisciplineTypeID)">
                <DeleteParameters>
                    <asp:Parameter Name="DisciplineTypeID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DisciplineType" />
                    <asp:Parameter Name="DisciplineTypeLocalName" />
                    <asp:Parameter Name="DisciplinePoint" />
                    <asp:Parameter Name="PointType" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DisciplineType" />
                    <asp:Parameter Name="DisciplineTypeLocalName" />
                    <asp:Parameter Name="DisciplinePoint" />
                    <asp:Parameter Name="PointType" />
                    <asp:Parameter Name="DisciplineTypeID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
