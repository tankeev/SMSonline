<%@ Page Title="Statistics" Language="VB" MasterPageFile="Default.Master" CodeFile="StatisticsStudents.aspx.vb"
    Inherits="Students" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table id="TableNumberofStudents" width="97%">
                <tr>
                    <td height="30" width="300">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Number of Students in School Sections"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:GridView ID="GridViewClassStudents" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceNumberofStudentsInSectionsInSchools" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="School Name" SortExpression="SchoolName">
                                    <ItemTemplate>
                                        <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px">
                                            <asp:Label ID="LabelSchoolName" runat="server" Font-Size="X-Small" Text='<%# Bind("SchoolName") %>'
                                                ToolTip='<%# Bind("SchoolName") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-1" SortExpression="1">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter1" runat="server" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("1") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-2" SortExpression="2">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter2" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("2") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-3" SortExpression="3">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter3" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("3") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-4" SortExpression="4">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter4" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("4") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-5" SortExpression="5">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter5" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("5") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-6" SortExpression="6">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter6" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("6") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-7" SortExpression="7">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter7" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("7") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-8" SortExpression="8">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter8" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("8") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-9" SortExpression="9">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter9" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("9") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-10" SortExpression="10">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter10" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("10") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-11" SortExpression="11">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter11" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("11") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="G-12" SortExpression="12">
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooter12" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("12") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total" SortExpression="TotalSchool">
                                    <ItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("TotalSchool") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="45px" />
                                </asp:TemplateField>
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
                            <RowStyle Height="30px" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceNumberofStudentsInSectionsInSchools" runat="server"
                            ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT SchoolName, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], TotalSchool FROM vw_NumberofStudentsInSections ORDER BY TotalSchool">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Chart ID="ChartNumberofStudents" runat="server" DataSourceID="SqlDataSourceNumberofStudentsInSchools"
                            ImageLocation="~/Images/ChartImages/ChartPic_#SEQ(300,3)" ImageStorageMode="UseImageLocation"
                            Width="640px">
                            <Series>
                                <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="true" Name="Series1" XValueMember="SchoolName"
                                    YValueMembers="Total">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSourceNumberofStudentsInSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT SchoolCode, SchoolName, Total FROM vw_NumberofStudents ORDER BY SchoolName">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
