<%@ Page Title="SIS Global Assessment Types" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="AssessmentTypesGlobal.aspx.vb" Inherits="AssessmentTypesGlobal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewMainAssessmentTypes" runat="server" AutoGenerateColumns="False"
                DataKeyNames="AssessmentTypeID" DataSourceID="SqlDataSourceAssessmentTypes" ShowFooter="True"
                Width="675px">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" style="width: 16px; height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="AssessmentTypeID" HeaderText="ID" InsertVisible="False"
                        ReadOnly="True" SortExpression="AssessmentTypeID">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="ATID" SortExpression="ATID" Visible="False">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxATID" runat="server" Text='<%# Bind("ATID") %>' Width="25px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Assessment Types" SortExpression="AssessmentType">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAssessmentType" runat="server" Text='<%# Bind("AssessmentType") %>'
                                Width="90%" ValidationGroup="Update"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color" SortExpression="Color">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxColor" runat="server" Text='<%# Bind("Color") %>'></asp:TextBox>
                            <asp:ColorPickerExtender ID="TextBoxColor_ColorPickerExtender" runat="server" Enabled="True"
                                TargetControlID="TextBoxColor">
                            </asp:ColorPickerExtender>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxOrder" runat="server" Text='<%# Bind("OrderBy") %>' Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif"
                                ToolTip="Update!" ValidationGroup="Update" />
                            <br />
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/delete.gif"
                                ToolTip="Delete!" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtenderDelete" runat="server" TargetControlID="ImageButtonDelete"
                                ConfirmText="Do You Really Want to Delete?" ConfirmOnFormSubmit="false">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
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
            <asp:FormView ID="FormViewMainAssessmentTypes" runat="server" DataKeyNames="AssessmentTypeID"
                DataSourceID="SqlDataSourceAssessmentTypes" DefaultMode="Insert" Width="675px">
                <EditItemTemplate>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="divRow">
                        <div class="divCellTitle">
                            <div class="divImage">
                                <table width="100%">
                                    <tr>
                                        <td height="25" width="20">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="LabelWeekNo2" runat="server" Text="Assessment Type ID:"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="TextBoxAssessmentTypeID" runat="server" Text='<%# Bind("ATID") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="center" rowspan="5" valign="top">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25" width="20">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td width="120">
                                            <asp:Label ID="LabelWeekNo" runat="server" Text="Assessment Type:"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="TextBoxAssessmentType" runat="server" Text='<%# Bind("AssessmentType") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo0" runat="server" Text="Color:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxColor" runat="server" Text='<%# Bind("Color") %>' Width="95%"></asp:TextBox>
                                            <asp:ColorPickerExtender ID="TextBoxColor_ColorPickerExtender" runat="server" Enabled="True"
                                                TargetControlID="TextBoxColor">
                                            </asp:ColorPickerExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo1" runat="server" Text="Order:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxOrder" runat="server" Text='<%# Bind("OrderBy") %>' Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Assessment Type"
                                                ValidationGroup="AddWeek" Width="99%" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AssessmentTypeID, ATID, AssessmentType, Color, OrderBy FROM tbl_AssessmentTypes"
                UpdateCommand="UPDATE tbl_AssessmentTypes SET ATID = @ATID, AssessmentType = @AssessmentType, Color = @Color, OrderBy = @OrderBy WHERE (AssessmentTypeID = @AssessmentTypeID)"
                DeleteCommand="DELETE FROM tbl_AssessmentTypes WHERE (AssessmentTypeID = @AssessmentTypeID)"
                InsertCommand="INSERT INTO tbl_AssessmentTypes(AssessmentType, Color, OrderBy, ATID) VALUES (@AssessmentType, @Color, @OrderBy, @ATID)">
                <DeleteParameters>
                    <asp:Parameter Name="AssessmentTypeID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AssessmentType" />
                    <asp:Parameter Name="Color" />
                    <asp:Parameter Name="OrderBy" />
                    <asp:Parameter Name="ATID" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ATID" />
                    <asp:Parameter Name="AssessmentType" />
                    <asp:Parameter Name="Color" />
                    <asp:Parameter Name="OrderBy" />
                    <asp:Parameter Name="AssessmentTypeID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
