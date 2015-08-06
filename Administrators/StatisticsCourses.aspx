<%@ Page Title="Statistics" Language="VB" MasterPageFile="Default.Master" CodeFile="StatisticsCourses.aspx.vb"
    Inherits="Courses" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewClassCourses" runat="server" AutoGenerateColumns="False"
                DataKeyNames="SchoolCode" DataSourceID="SqlDataSourceCoursesInSectionsInSchools"
                Width="680px">
                <Columns>
                    <asp:BoundField DataField="CourseCategory" HeaderText="Course" SortExpression="CourseCategory" />
                    <asp:TemplateField HeaderText="G-1" SortExpression="1">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text='<%# Bind("1") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-2" SortExpression="2">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text='<%# Bind("2") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-3" SortExpression="3">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text='<%# Bind("3") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-4" SortExpression="4">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text='<%# Bind("4") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-5" SortExpression="5">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text='<%# Bind("5") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-6" SortExpression="6">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text='<%# Bind("6") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-7" SortExpression="7">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" ForeColor="Red" Text='<%# Bind("7") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-8" SortExpression="8">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" ForeColor="Red" Text='<%# Bind("8") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-9" SortExpression="9">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text='<%# Bind("9") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-10" SortExpression="10">
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" ForeColor="Red" Text='<%# Bind("10") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-11" SortExpression="11">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" ForeColor="Red" Text='<%# Bind("11") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="G-12" SortExpression="12">
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" ForeColor="Red" Text='<%# Bind("12") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
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
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCoursesInSectionsInSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, CourseCategory, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] FROM vw_CoursesInSectionsInSchools WHERE (SchoolCode = @SchoolCode)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
