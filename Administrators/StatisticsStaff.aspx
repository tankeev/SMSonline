<%@ Page Title="Statistics" Language="VB" MasterPageFile="Default.Master" CodeFile="StatisticsStaff.aspx.vb"
    Inherits="Staff" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table id="TableNumberofStaff" width="97%">
                <tr>
                    <td height="30" width="300">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Number of Staff in Schools:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:GridView ID="GridViewSchools" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSchoolCodes"
                            Width="100%" DataKeyNames="SchoolCode" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="School Name" SortExpression="SchoolName">
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td width="35">
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        ImageUrl="~/Administrators/Images/more.png" Text="Select" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelSchoolName" runat="server" Font-Bold="True" Text='<%# Bind("SchoolName") %>'
                                                        ToolTip='<%# Bind("SchoolName") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="35">
                                                    
                                                </td>
                                                <td>
                                                    <asp:GridView ID="GridViewNumberofStaff" runat="server" AutoGenerateColumns="False"
                                                        DataSourceID="SqlDataSourceNumberofStaff" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField></asp:TemplateField>
                                                            <asp:BoundField DataField="Secretary" HeaderText="Secretary" SortExpression="Secretary">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Staff" HeaderText="Staff" SortExpression="Staff">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:HiddenField ID="HiddenFieldSchoolCode" runat="server" Value='<%# Eval("SchoolCode") %>' />
                                        <asp:SqlDataSource ID="SqlDataSourceNumberofStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                            SelectCommand="SELECT Staff, Secretary FROM vw_NumberofStaff WHERE (SchoolCode = @SchoolCode)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="HiddenFieldSchoolCode" Name="SchoolCode" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle Height="28px" />
                            <RowStyle Height="30px" />
                            <SelectedRowStyle BackColor="#FFFFCC" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1) ORDER BY SchoolName">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridViewLastAddedStaff" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SchoolCode" DataSourceID="SqlDataSourceLastAddedStaff" PageSize="9"
                            Width="100%">
                            <Columns>
                                <asp:BoundField DataField="StaffName" HeaderText="Staff Name" SortExpression="StaffName" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                <asp:BoundField DataField="DateofBirth" DataFormatString="{0:d}" HeaderText="Date of Birth"
                                    SortExpression="DateofBirth" />
                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                <asp:BoundField DataField="CreateDate" DataFormatString="{0:d}" HeaderText="CreateDate"
                                    SortExpression="CreateDate" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center" style="background-color: #FFFFFF">
                                    <br />
                                    <img alt="" src="../Administrators/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Record Found!"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </EmptyDataTemplate>
                            <FooterStyle Height="28px" />
                            <RowStyle Height="30px" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceLastAddedStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT TOP (100) tbl_Staff.StaffName, tbl_Staff.SchoolCode, tbl_Staff.DateofBirth, tbl_Staff.University, tbl_Staff.Department, tbl_Staff.Gender, tbl_Staff.Position, aspnet_Administrators.CreateDate, tbl_Staff.[Continue] FROM tbl_Staff INNER JOIN aspnet_Administrators ON tbl_Staff.StaffID = aspnet_Administrators.UserId WHERE (tbl_Staff.SchoolCode = @SchoolCode) AND (tbl_Staff.[Continue] = 1) ORDER BY aspnet_Administrators.CreateDate DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridViewSchools" Name="SchoolCode" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
