<%@ Page Title="SIS Update Students" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Survey.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="SISDefault">
                <br />
                <table width="95%" style="background-color: #EBEBEB; border: 1px solid #999999; margin-left: 25px;">
                    <tr>
                        <td width="50" height="28">
                            &nbsp;</td>
                        <td width="75">
                            <asp:Label ID="LabelCode" runat="server" Font-Bold="True" ForeColor="Red" Text="CODE"></asp:Label>
                        </td>
                        <td width="75">
                            <asp:Label ID="LabelCode0" runat="server" Font-Bold="True" ForeColor="Red" Text="YEAR"></asp:Label>
                        </td>
                        <td width="75">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="LabelSearch" runat="server" Font-Bold="True" ForeColor="Red" Text="SEARCH"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" height="28">
                            <asp:Button ID="ButtonGo" runat="server" Text="Go!" />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListCode" runat="server" Width="95%">
                                <asp:ListItem Value="0">?</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>
                                <asp:ListItem Value="7">7</asp:ListItem>
                                <asp:ListItem Value="8">8</asp:ListItem>
                                <asp:ListItem Value="9">9</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListYear" runat="server" Width="95%">
                                <asp:ListItem Value="0">?</asp:ListItem>
                                <asp:ListItem Value="2015">2015</asp:ListItem>
                                <asp:ListItem Value="2014">2014</asp:ListItem>
                                <asp:ListItem Value="2013">2013</asp:ListItem>
                                <asp:ListItem Value="2012">2012</asp:ListItem>
                                <asp:ListItem Value="2011">2011</asp:ListItem>
                                <asp:ListItem Value="2010">2010</asp:ListItem>
                                <asp:ListItem Value="2009">2009</asp:ListItem>
                                <asp:ListItem Value="2008">2008</asp:ListItem>
                                <asp:ListItem Value="2007">2007</asp:ListItem>
                                <asp:ListItem Value="2006">2006</asp:ListItem>
                                <asp:ListItem Value="2005">2005</asp:ListItem>
                                <asp:ListItem Value="2004">2004</asp:ListItem>
                                <asp:ListItem Value="2003">2003</asp:ListItem>
                                <asp:ListItem Value="2002">2002</asp:ListItem>
                                <asp:ListItem Value="2001">2001</asp:ListItem>
                                <asp:ListItem Value="2000">2000</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxSearch" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="background-color: #EBEBEB; border: 1px solid #999999; margin-left: 25px;"
                    width="95%">
                    <tr>
                        <td>
                            &nbsp; &nbsp;
                            <asp:GridView ID="GridViewSurveyData" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSourceSurveyData" Width="100%" DataKeyNames="ID">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Column3" HeaderText="Nick Name" SortExpression="Column3" />
                                    <asp:BoundField DataField="Column4" HeaderText="E/K" SortExpression="Column4">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Column6" HeaderText="Exam" SortExpression="Column6">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Column7" HeaderText="Course" SortExpression="Column7">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Column8" HeaderText="IELTS" SortExpression="Column8">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Column24" HeaderText="Hobby" SortExpression="Column24">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Column25" HeaderText="Marital" SortExpression="Column25">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/Survey/Images/edit.png"
                                                ToolTip="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Panel ID="PanelStatus" runat="server">
                                        <div align="center">
                                            <br />
                                            <img alt="" src="../Coordinators/Images/no-data.png" />
                                            <br />
                                            <br />
                                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" ForeColor="Red" Text="Please Filter Data By Using Controls Above!"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                    </asp:Panel>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#FFFFCC" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:FormView ID="FormViewSurveyData" runat="server" DataSourceID="SqlDataSourceSurveyDataEdit"
                                DefaultMode="Edit" Width="100%" DataKeyNames="ID">
                                <EditItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td valign="top">
                                                <table width="450">
                                                    <tr>
                                                        <td height="28" width="30">
                                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28" width="120">
                                                            <asp:Label ID="Label4" runat="server" Text="Nick Name:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column3TextBox" runat="server" Text='<%# Bind("Column3") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label20" runat="server" Text="Contact:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column18TextBox" runat="server" Text='<%# Bind("Column18") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label21" runat="server" Text="E-Mail:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column19TextBox" runat="server" Text='<%# Bind("Column19") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label28" runat="server" Text="Marital Status:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column25TextBox" runat="server" Text='<%# Bind("Column25") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label18" runat="server" Text="City:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column16TextBox" runat="server" Text='<%# Bind("Column16") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label19" runat="server" Text="Country:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column17TextBox" runat="server" Text='<%# Bind("Column17") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label26" runat="server" Text="Resident Address:"></asp:Label>
                                                        </td>
                                                        <td rowspan="2">
                                                            <asp:TextBox ID="Column23TextBox" runat="server" Text='<%# Bind("Column23") %>' 
                                                                Width="220px" Height="50px" TextMode="MultiLine" />
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <table width="400">
                                                    <tr>
                                                        <td height="28" width="30">
                                                            <asp:Image ID="Image16" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28" width="120">
                                                            <asp:Label ID="Label2" runat="server" Text="User ID:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column0TextBox" runat="server" Text='<%# Bind("Column0") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image17" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label3" runat="server" Text="Code:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image18" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label30" runat="server" Text="Year:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column2TextBox" runat="server" Text='<%# Bind("Column2") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image19" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label5" runat="server" Text="E/K:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListEK" runat="server" SelectedValue='<%# Bind("Column4") %>'
                                                                Width="230px">
                                                                <asp:ListItem Value="?"></asp:ListItem>
                                                                <asp:ListItem Value="E"></asp:ListItem>
                                                                <asp:ListItem Value="K"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image20" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label6" runat="server" Text="Exam:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column6TextBox" runat="server" Text='<%# Bind("Column6") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image21" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label7" runat="server" Text="Course:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column7TextBox" runat="server" Text='<%# Bind("Column7") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image22" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label8" runat="server" Text="IELTS:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column8TextBox" runat="server" Text='<%# Bind("Column8") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image23" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label27" runat="server" Text="Hobby:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column24TextBox" runat="server" Text='<%# Bind("Column24") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" width="50%">
                                                <table width="450">
                                                    <tr>
                                                        <td height="28" width="30">
                                                            <asp:Image ID="Image9" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28" width="120">
                                                            <asp:Label ID="Label9" runat="server" Text="University:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column9TextBox" runat="server" Text='<%# Bind("Column9") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image10" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label10" runat="server" Text="Faculty:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column11TextBox" runat="server" Text='<%# Bind("Column11") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image11" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label16" runat="server" Text="Department:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column10TextBox" runat="server" Text='<%# Bind("Column10") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image12" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label17" runat="server" Text="Degree:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column13TextBox" runat="server" Text='<%# Bind("Column13") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image13" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label11" runat="server" Text="Current Level:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column12TextBox" runat="server" Text='<%# Bind("Column12") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image14" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label12" runat="server" Text="Company:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column14TextBox" runat="server" Text='<%# Bind("Column14") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image15" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label13" runat="server" Text="Position:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column15TextBox" runat="server" Text='<%# Bind("Column15") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <table width="400">
                                                    <tr>
                                                        <td height="28" width="30">
                                                            <asp:Image ID="Image24" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28" width="120">
                                                            <asp:Label ID="Label23" runat="server" Text="Parent Nick:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column20TextBox" runat="server" Text='<%# Bind("Column20") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image25" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label24" runat="server" Text="Parent Position:"></asp:Label>
                                                        </td>
                                                        <td class="style1">
                                                            <asp:TextBox ID="Column21TextBox" runat="server" Text='<%# Bind("Column21") %>' 
                                                                Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image26" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label25" runat="server" Text="Father Contact:"></asp:Label>
                                                        </td>
                                                        <td class="style1">
                                                            <asp:TextBox ID="Column22TextBox" runat="server" Text='<%# Bind("Column22") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td class="style1">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            <asp:Image ID="Image27" runat="server" ImageUrl="~/Survey/Images/arrow.gif" />
                                                        </td>
                                                        <td height="28">
                                                            <asp:Label ID="Label29" runat="server" Text="Last Modified:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Column5TextBox" runat="server" Text='<%# Bind("Column5") %>' Width="220px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update Data"
                                                                Width="220px" />
                                                            <asp:ConfirmButtonExtender ID="ButtonUpdate_ConfirmButtonExtender" runat="server"
                                                                ConfirmText="Are you sure?" Enabled="True" TargetControlID="ButtonUpdate">
                                                            </asp:ConfirmButtonExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td height="28">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSourceSurveyData" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT Column3, Column4, Column6, Column7, Column8, Column24, Column25, ID FROM tbl_SurveyData WHERE (Column1 = @Column1) AND (Column2 = @Column2) ORDER BY Column3">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListCode" Name="Column1" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListYear" Name="Column2" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSurveyDataEdit" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT ID, Column0, Column1, Column2, Column3, Column4, Column6, Column7, Column8, Column24, Column25, Column5, Column9, Column10, Column11, Column12, Column13, Column14, Column15, Column16, Column17, Column18, Column19, Column20, Column21, Column22, Column23 FROM tbl_SurveyData WHERE (ID = @ID)"
                    UpdateCommand="UPDATE tbl_SurveyData SET Column0 = @Column0, Column1 = @Column1, Column2 = @Column2, Column3 = @Column3, Column4 = @Column4, Column5 = @Column5, Column6 = @Column6, Column7 = @Column7, Column8 = @Column8, Column9 = @Column9, Column10 = @Column10, Column11 = @Column11, Column12 = @Column12, Column13 = @Column13, Column14 = @Column14, Column15 = @Column15, Column16 = @Column16, Column17 = @Column17, Column18 = @Column18, Column19 = @Column19, Column20 = @Column20, Column21 = @Column21, Column22 = @Column22, Column23 = @Column23, Column24 = @Column24, Column25 = @Column25 WHERE (ID = @ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewSurveyData" Name="ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Column0" />
                        <asp:Parameter Name="Column1" />
                        <asp:Parameter Name="Column2" />
                        <asp:Parameter Name="Column3" />
                        <asp:Parameter Name="Column4" />
                        <asp:Parameter Name="Column5" />
                        <asp:Parameter Name="Column6" />
                        <asp:Parameter Name="Column7" />
                        <asp:Parameter Name="Column8" />
                        <asp:Parameter Name="Column9" />
                        <asp:Parameter Name="Column10" />
                        <asp:Parameter Name="Column11" />
                        <asp:Parameter Name="Column12" />
                        <asp:Parameter Name="Column13" />
                        <asp:Parameter Name="Column14" />
                        <asp:Parameter Name="Column15" />
                        <asp:Parameter Name="Column16" />
                        <asp:Parameter Name="Column17" />
                        <asp:Parameter Name="Column18" />
                        <asp:Parameter Name="Column19" />
                        <asp:Parameter Name="Column20" />
                        <asp:Parameter Name="Column21" />
                        <asp:Parameter Name="Column22" />
                        <asp:Parameter Name="Column23" />
                        <asp:Parameter Name="Column24" />
                        <asp:Parameter Name="Column25" />
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
