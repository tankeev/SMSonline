<%@ Page Title="Setup Academic Terms" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="AcademicTerms.aspx.vb" Inherits="Academic_Terms" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewAcademicYears" runat="server" AutoGenerateColumns="False"
                DataKeyNames="AcademicTermID" DataSourceID="SqlDataSourceGridViewAcademicTerms"
                ShowFooter="True" Width="100%">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" style="width: 16px; height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="YID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxYID" runat="server" Text='<%# Bind("AcademicYearID") %>'
                                Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Year">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAcademicYear" runat="server" Text='<%# Bind("AcademicYear") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SID" SortExpression="AcademicSemesterID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAcademicSemesterID" runat="server" 
                                Text='<%# Bind("AcademicSemesterID") %>' Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Semester">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAcademicSemester" runat="server" 
                                Text='<%# Bind("AcademicSemester") %>' Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TID" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelTID" runat="server" Text='<%# Bind("AcademicTermID") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Term">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxAcademicTerm" runat="server" Text='<%# Bind("AcademicTerm") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxActive" runat="server" Checked='<%# Bind("Active") %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <FooterTemplate>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif"
                                ToolTip="Update!" ValidationGroup="Update" />
                            <br />
                        </ItemTemplate>
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
            <br />
            <asp:FormView ID="FormViewAcademicTerms" runat="server" DataKeyNames="AcademicTermID"
                DataSourceID="SqlDataSourceGridViewAcademicTerms" DefaultMode="Insert" Width="100%">
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
                                            <asp:Label ID="LabelWeekNo" runat="server" Text="Academic Year:"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="TextBoxAcademicYear" runat="server" Text='<%# Bind("AcademicYear") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="center" rowspan="8" valign="top">
                                            <asp:Image ID="ImageAcademicTerms" runat="server" ImageUrl="~/Administrators/Images/AcademicsTerms.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Start Date:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicYearStart" runat="server" Text='<%# Bind("AcademicYearStart", "{0:d}") %>'
                                                Width="95%"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxAcademicYearStart_CalendarExtender" 
                                                runat="server" Enabled="True" TargetControlID="TextBoxAcademicYearStart">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="End Date:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicYearEnd" runat="server" Text='<%# Bind("AcademicYearEnd", "{0:d}") %>'
                                                Width="95%"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxAcademicYearEnd_CalendarExtender" 
                                                runat="server" Enabled="True" TargetControlID="TextBoxAcademicYearEnd">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo4" runat="server" Text="Academic Semester:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicSemester" runat="server" Text='<%# Bind("AcademicSemester") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Start Date:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicSemesterStart" runat="server" Text='<%# Bind("AcademicSemesterStart", "{0:d}") %>'
                                                Width="95%"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxAcademicSemesterStart_CalendarExtender" 
                                                runat="server" Enabled="True" TargetControlID="TextBoxAcademicSemesterStart">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="End Date:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicSemesterEnd" runat="server" Text='<%# Bind("AcademicSemesterEnd", "{0:d}") %>'
                                                Width="95%"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxAcademicSemesterEnd_CalendarExtender" 
                                                runat="server" Enabled="True" TargetControlID="TextBoxAcademicSemesterEnd">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo0" runat="server" Text="Academic Term:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicTerm" runat="server" Text='<%# Bind("AcademicTerm") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo1" runat="server" Text="Start Date:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicTermStart" runat="server" Text='<%# Bind("AcademicTermStart", "{0:d}") %>'
                                                Width="95%"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxAcademicTermStart_CalendarExtender" 
                                                runat="server" Enabled="True"
                                                TargetControlID="TextBoxAcademicTermStart">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo2" runat="server" Text="End Date:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAcademicTermEnd" runat="server" Text='<%# Bind("AcademicTermEnd", "{0:d}") %>'
                                                Width="95%"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxAcademicTermEnd_CalendarExtender" 
                                                runat="server" Enabled="True"
                                                TargetControlID="TextBoxAcademicTermEnd">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo3" runat="server" Text="Active Term:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckBoxActive" runat="server" Checked='<%# Bind("Active") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Academic Term"
                                                ValidationGroup="AddWeek" Width="95%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="100">
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
            <asp:SqlDataSource ID="SqlDataSourceGridViewAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicTerm, AcademicTermStart, AcademicTermEnd, AcademicSemesterID, AcademicSemester, AcademicSemesterStart, AcademicSemesterEnd, AcademicYearID, AcademicYear, AcademicYearStart, AcademicYearEnd, Active FROM tbl_AcademicTerms"
                UpdateCommand="UPDATE tbl_AcademicTerms SET AcademicTerm = @AcademicTerm, AcademicTermStart = @AcademicTermStart, AcademicTermEnd = @AcademicTermEnd, AcademicYearID = @AcademicYearID, AcademicYear = @AcademicYear, AcademicYearStart = @AcademicYearStart, AcademicYearEnd = @AcademicYearEnd, AcademicSemesterID = @AcademicSemesterID, AcademicSemester = @AcademicSemester, AcademicSemesterStart = @AcademicSemesterStart, AcademicSemesterEnd = @AcademicSemesterEnd, Active = @Active WHERE (AcademicTermID = @AcademicTermID)"
                DeleteCommand="DELETE FROM tbl_AcademicTerms WHERE (AcademicTermID = @AcademicTermID)"
                InsertCommand="INSERT INTO tbl_AcademicTerms(AcademicTerm, AcademicTermStart, AcademicTermEnd, AcademicYearID, AcademicYear, AcademicYearStart, AcademicYearEnd, AcademicSemesterID, AcademicSemester, AcademicSemesterStart, AcademicSemesterEnd, Active) VALUES (@AcademicTerm, @AcademicTermStart, @AcademicTermEnd, @AcademicYearID, @AcademicYear, @AcademicYearStart, @AcademicYearEnd, @AcademicSemesterID, @AcademicSemester, @AcademicSemesterStart, @AcademicSemesterEnd, @Active)">
                <DeleteParameters>
                    <asp:Parameter Name="AcademicTermID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AcademicTerm" />
                    <asp:Parameter Name="AcademicTermStart" />
                    <asp:Parameter Name="AcademicTermEnd" />
                    <asp:Parameter Name="AcademicYearID" />
                    <asp:Parameter Name="AcademicYear" />
                    <asp:Parameter Name="AcademicYearStart" />
                    <asp:Parameter Name="AcademicYearEnd" />
                    <asp:Parameter Name="AcademicSemesterID" />
                    <asp:Parameter Name="AcademicSemester" />
                    <asp:Parameter Name="AcademicSemesterStart" />
                    <asp:Parameter Name="AcademicSemesterEnd" />
                    <asp:Parameter Name="Active" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AcademicTerm" />
                    <asp:Parameter Name="AcademicTermStart" />
                    <asp:Parameter Name="AcademicTermEnd" />
                    <asp:Parameter Name="AcademicYearID" />
                    <asp:Parameter Name="AcademicYear" />
                    <asp:Parameter Name="AcademicYearStart" />
                    <asp:Parameter Name="AcademicYearEnd" />
                    <asp:Parameter Name="AcademicSemesterID" />
                    <asp:Parameter Name="AcademicSemester" />
                    <asp:Parameter Name="AcademicSemesterStart" />
                    <asp:Parameter Name="AcademicSemesterEnd" />
                    <asp:Parameter Name="Active" />
                    <asp:Parameter Name="AcademicTermID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
