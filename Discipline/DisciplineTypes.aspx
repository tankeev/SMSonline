<%@ Page Title="Discipline Discipline Types" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="DisciplineTypes.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Src="MenuDiscipline.ascx" TagName="MenuDiscipline" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    DISCIPLINE</h2>
                <br />
                <uc1:MenuDiscipline ID="MenuDiscipline" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="50" align="center">
                            <asp:Button ID="ButtonAddNewType" runat="server" Text="Add New Discipline Tye" Width="95%" />
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                            <asp:ModalPopupExtender ID="MPAddDisciplineType" runat="server" BackgroundCssClass="modalBackground"
                                BehaviorID="MPDisciplineTypes" CancelControlID="ButtonCloseDisciplineTypes" PopupControlID="PanelDisciplineTypes"
                                TargetControlID="ButtonAddNewType">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ADD BONUS POINTS</h2>
                <br />
                <asp:GridView ID="GridViewDiscipline" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="DisciplineTypeID" DataSourceID="SqlDataSourceDisciplineTypes" Width="675px"
                    AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="AttendanceTypeID">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Discipline/Images/Item.png" />
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
                                    ImageUrl="~/Discipline/Images/delete.gif" Text="Edit" />
                                <asp:ConfirmButtonExtender ID="ImageButtonDelete_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Are you sure?" Enabled="True" 
                                    TargetControlID="ImageButtonDelete">
                                </asp:ConfirmButtonExtender>
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
                <asp:Panel ID="PanelDisciplineTypes" runat="server" Width="500px" CssClass="modalPopup">
                    <asp:ImageButton ID="ButtonCloseDisciplineTypes" runat="server" CssClass="CloseButton"
                        ImageUrl="~/Discipline/Images/Message_Error.png" />
                    <br />
                    <asp:FormView ID="FormViewDiscipline" runat="server" DataKeyNames="DisciplineTypeID"
                        DataSourceID="SqlDataSourceDisciplineTypes" DefaultMode="Insert" Width="420px">
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
                    <br />
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSourceDisciplineTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DisciplineTypeID, DisciplineType, DisciplineTypeLocalName, DisciplinePoint, PointType, SchoolCode FROM tbl_DisciplineTypes WHERE (SchoolCode = @SchoolCode)"
                    DeleteCommand="DELETE FROM tbl_DisciplineTypes WHERE (DisciplineTypeID = @DisciplineTypeID)"
                    InsertCommand="INSERT INTO tbl_DisciplineTypes(DisciplineType, DisciplineTypeLocalName, DisciplinePoint, PointType, SchoolCode) VALUES (@DisciplineType, @DisciplineTypeLocalName, @DisciplinePoint, @PointType, @SchoolCode)"
                    UpdateCommand="UPDATE tbl_DisciplineTypes SET DisciplineType = @DisciplineType, DisciplineTypeLocalName = @DisciplineTypeLocalName, DisciplinePoint = @DisciplinePoint, PointType = @PointType WHERE (DisciplineTypeID = @DisciplineTypeID)">
                    <DeleteParameters>
                        <asp:Parameter Name="DisciplineTypeID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DisciplineType" />
                        <asp:Parameter Name="DisciplineTypeLocalName" />
                        <asp:Parameter Name="DisciplinePoint" />
                        <asp:Parameter Name="PointType" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DisciplineType" />
                        <asp:Parameter Name="DisciplineTypeLocalName" />
                        <asp:Parameter Name="DisciplinePoint" />
                        <asp:Parameter Name="PointType" />
                        <asp:Parameter Name="DisciplineTypeID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <uc2:WebMessageBox ID="WebMessageBoxDiscipline" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
