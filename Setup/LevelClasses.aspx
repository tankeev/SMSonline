<%@ Page Title="Setup Level Classes" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="LevelClasses.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:TabContainer ID="TabContainerLevels" runat="server" ActiveTabIndex="0" Width="680px">
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Level English">
                    <ContentTemplate>
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red" Text="English Level Classes"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewLevelENG" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLevelClassEng"
                            Width="96%" DataKeyNames="LevelEngID">
                            <Columns>
                                <asp:BoundField DataField="LevelEngID" HeaderText="ID" SortExpression="LevelEngID"
                                    InsertVisible="False" ReadOnly="True">
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Academic Term" SortExpression="AcademicTermID">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                            DataTextField="AcademicTerm" DataValueField="AcademicTermID" SelectedValue='<%# Bind("AcademicTermID") %>'
                                            Width="95%">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="180px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Section Catalog" SortExpression="SectionCatalogID">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                            DataTextField="SectionCategory" DataValueField="SectionCatalogID" SelectedValue='<%# Bind("SectionCatalogID") %>'
                                            TabIndex="7" Width="95%">
                                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="120px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBoxDescription" runat="server" Text='<%# Bind("Description") %>'
                                            Width="85%"></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Image" CommandName="Update" ImageUrl="~/Setup/Images/save.gif"
                                    Text="Button">
                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                                </asp:ButtonField>
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
                        <asp:FormView ID="FormViewLevelENG" runat="server" DataKeyNames="LevelEngID" DataSourceID="SqlDataSourceLevelClassEng"
                            DefaultMode="Insert" Width="96%">
                            <InsertItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td width="35" height="30">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                                        </td>
                                        <td width="150">
                                            <asp:Label ID="Label4" runat="server" Text="Academic Term:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" SelectedValue='<%# Bind("AcademicTermID") %>'
                                                Width="95%">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Section Catalog:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                                DataTextField="SectionCategory" DataValueField="SectionCatalogID" SelectedValue='<%# Bind("SectionCatalogID") %>'
                                                TabIndex="7" Width="95%">
                                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Description:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                                                Width="93%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Add Records"
                                                Width="95%" />
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                        </asp:FormView>
                        <br />
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Level Turkce">
                    <ContentTemplate>
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red" Text="Turkce Level Classes"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewLevelTUR" runat="server" AutoGenerateColumns="False" DataKeyNames="LevelTurID"
                            DataSourceID="SqlDataSourceLevelClassTur" Width="96%">
                            <Columns>
                                <asp:BoundField DataField="LevelTurID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="LevelTurID">
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Academic Term" SortExpression="AcademicTermID">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownListAcademicTerms0" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                            DataTextField="AcademicTerm" DataValueField="AcademicTermID" SelectedValue='<%# Bind("AcademicTermID") %>'
                                            Width="95%">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="180px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Section Catalog" SortExpression="SectionCatalogID">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownListSections1" runat="server" DataSourceID="SqlDataSourceSections"
                                            DataTextField="SectionCategory" DataValueField="SectionCatalogID" SelectedValue='<%# Bind("SectionCatalogID") %>'
                                            TabIndex="7" Width="95%">
                                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="120px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBoxDescription0" runat="server" Text='<%# Bind("Description") %>'
                                            Width="85%"></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Image" CommandName="Update" ImageUrl="~/Setup/Images/save.gif"
                                    Text="Button">
                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                                </asp:ButtonField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center">
                                    <br />
                                    <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </EmptyDataTemplate>
                            <RowStyle Height="30px" />
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:FormView ID="FormViewLevelTUR" runat="server" DataKeyNames="LevelEngID" DataSourceID="SqlDataSourceLevelClassTur"
                            DefaultMode="Insert" Width="100%">
                            <InsertItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td width="35" height="30">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                                        </td>
                                        <td width="150">
                                            <asp:Label ID="Label4" runat="server" Text="Academic Term:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" SelectedValue='<%# Bind("AcademicTermID") %>'
                                                Width="95%">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Section Catalog:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSections0" runat="server" DataSourceID="SqlDataSourceSections"
                                                DataTextField="SectionCategory" DataValueField="SectionCatalogID" SelectedValue='<%# Bind("SectionCatalogID") %>'
                                                TabIndex="7" Width="95%">
                                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Description:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="DescriptionTextBox1" runat="server" Text='<%# Bind("Description") %>'
                                                Width="93%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Add Records"
                                                Width="95%" />
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                        </asp:FormView>
                        <br />
                        <br />
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
            <asp:SqlDataSource ID="SqlDataSourceLevelClassEng" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT LevelEngID, AcademicTermID, SectionCatalogID, Description FROM tbl_LevelClassesEng"
                InsertCommand="INSERT INTO tbl_LevelClassesEng(AcademicTermID, SectionCatalogID, Description) VALUES (@AcademicTermID, @SectionCatalogID, @Description)"
                UpdateCommand="UPDATE tbl_LevelClassesEng SET AcademicTermID = @AcademicTermID, SectionCatalogID = @SectionCatalogID, Description = @Description WHERE (LevelEngID = @LevelEngID)">
                <InsertParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="SectionCatalogID" />
                    <asp:Parameter Name="Description" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="SectionCatalogID" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="LevelEngID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceLevelClassTur" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                InsertCommand="INSERT INTO tbl_LevelClassesTur(AcademicTermID, SectionCatalogID, Description) VALUES (@AcademicTermID, @SectionCatalogID, @Description)"
                SelectCommand="SELECT LevelTurID, AcademicTermID, SectionCatalogID, Description FROM tbl_LevelClassesTur"
                UpdateCommand="UPDATE tbl_LevelClassesTur SET AcademicTermID = @AcademicTermID, SectionCatalogID = @SectionCatalogID, Description = @Description WHERE (LevelTurID = @LevelTurID)">
                <InsertParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="SectionCatalogID" />
                    <asp:Parameter Name="Description" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="SectionCatalogID" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="LevelTurID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SectionCatalogID, SectionCategory FROM tbl_SectionCatalog">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
