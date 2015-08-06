<%@ Page Title="Setup Academic Terms" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="Sections.aspx.vb" Inherits="Sections" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewAcademicYears" runat="server" AutoGenerateColumns="False"
                DataKeyNames="SectionCatalogID" DataSourceID="SqlDataSourceSectionCatalog" ShowFooter="True"
                Width="675px" AllowPaging="True">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" style="width: 16px; height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="SectionCatalogID" HeaderText="ID" InsertVisible="False"
                        ReadOnly="True" SortExpression="SectionCatalogID">
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Section Catalog" SortExpression="SectionCatalog">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxSectionName" runat="server" Text='<%# Bind("SectionCatalog") %>'
                                Width="90%" ValidationGroup="Update"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section Group" SortExpression="SectionGroup">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SectionGroup") %>' Width="90%"
                                ValidationGroup="Update"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section School" SortExpression="SectionSchool">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SectionSchool") %>' Width="90%"
                                ValidationGroup="Update"></asp:TextBox>
                        </ItemTemplate>
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
            <br />
            <asp:FormView ID="FormViewAcademicTerms" runat="server" DataKeyNames="SectionCatalogID"
                DataSourceID="SqlDataSourceSectionCatalog" DefaultMode="Insert" Width="675px">
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
                                        <td width="120">
                                            <asp:Label ID="LabelWeekNo" runat="server" Text="Section Catalog:"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="TextBoxSectionCatalog" runat="server" Text='<%# Bind("SectionCatalog") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="center" rowspan="5" valign="top">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo0" runat="server" Text="Section Group:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxSectionCategory0" runat="server" Text='<%# Bind("SectionGroup") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo1" runat="server" Text="Section School:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxSectionCategory1" runat="server" Text='<%# Bind("SectionSchool") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Section"
                                                ValidationGroup="AddWeek" Width="99%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
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
            <asp:SqlDataSource ID="SqlDataSourceSectionCatalog" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SectionCatalogID, SectionCatalog, SectionGroup, SectionSchool FROM tbl_SectionCatalog ORDER BY SectionGroup"
                UpdateCommand="UPDATE tbl_SectionCatalog SET SectionCatalog = @SectionCatalog, SectionGroup = @SectionGroup, SectionSchool = @SectionSchool WHERE (SectionCatalogID = @SectionCatalogID)"
                DeleteCommand="DELETE FROM tbl_SectionCatalog WHERE (SectionCatalogID = @SectionCatalogID)"
                InsertCommand="INSERT INTO tbl_SectionCatalog(SectionGroup, SectionSchool, SectionCatalog) VALUES (@SectionGroup, @SectionSchool, @SectionCatalog)">
                <DeleteParameters>
                    <asp:Parameter Name="SectionCatalogID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SectionGroup" />
                    <asp:Parameter Name="SectionSchool" />
                    <asp:Parameter Name="SectionCatalog" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SectionCatalog" />
                    <asp:Parameter Name="SectionGroup" />
                    <asp:Parameter Name="SectionSchool" />
                    <asp:Parameter Name="SectionCatalogID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
