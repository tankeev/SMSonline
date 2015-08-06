<%@ Page Title="SIS Add Bonus Points" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="DisciplineAddBonusPoints.aspx.vb" Inherits="Attendance_Checklist" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script language="javascript" type="text/javascript">
        function expandcollapse(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == "none") {
                div.style.display = "block";
                if (row == 'alt') {
                    img.src = "Images/minus.gif";
                }
                else {
                    img.src = "Images/minus.gif";
                }
                img.alt = "Close to view other Students";
            }
            else {
                div.style.display = "none";
                if (row == 'alt') {
                    img.src = "Images/plus.gif";
                }
                else {
                    img.src = "Images/plus.gif";
                }
                img.alt = "Expand to show Assessments";
            }
        } 
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    DISCIPLINE</h2>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Staff/Images/button_green.png"
                                NavigateUrl="~/Staff/DisciplineChecklist.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Discipline Points"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Staff/Images/button_green.png"
                                NavigateUrl="~/Staff/DisciplineStudentPoints.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Behaviour Points"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LoginView ID="LoginViewDiscipline" runat="server">
                    <RoleGroups>
                        <asp:RoleGroup Roles="DisciplineAdmin">
                            <ContentTemplate>
                                <table class="content-table" width="240">
                                    </tr>
                                    <tr>
                                        <td width="40">
                                            <asp:HyperLink ID="HyperLink1" runat="server" Enabled="False" ImageUrl="~/Staff/Images/button_orange.png"
                                                NavigateUrl="~/Staff/DisciplineAddBonusPoints.aspx">Add New</asp:HyperLink>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Update Bonus Points"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table class="content-table" width="240">
                                    </tr>
                                    <tr>
                                        <td width="40">
                                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Staff/Images/button_orange.png"
                                                NavigateUrl="~/Staff/DisciplineAddOffensePoints.aspx">Add New</asp:HyperLink>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label45" runat="server" Text="Update Offense Points"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table class="content-table" width="240">
                                    </tr>
                                    <tr>
                                        <td class="style1" width="40">
                                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Staff/Images/button_orange.png"
                                                NavigateUrl="~/Staff/DisciplineTypes.aspx">Add New</asp:HyperLink>
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="Label47" runat="server" Text="Edit Discipline Points"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" Width="95%" DataSourceID="SqlDataSourceAcademicTerms"
                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" TabIndex="7" Width="95%"
                                DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                AutoPostBack="True" Enabled="False">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Calendar ID="CalendarDisciplineDate" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Section:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                RepeatColumns="4" Width="95%">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ADD BONUS POINTS</h2>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    DataSourceID="SqlDataSourceStudents" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="javascript:expandcollapse('div<%# Eval("StudentID") %>', 'one');">
                                    <img id="imgdiv<%# Eval("StudentID") %>" alt="Click to show/hide Orders for Customer <%# Eval("StudentID") %>"
                                        border="0" src="Images/plus.gif" />
                                </a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Bonus Type">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListDisciplineTypes" runat="server" DataSourceID="SqlDataSourceDisciplineTypes"
                                    DataTextField="DisciplineType" DataValueField="DisciplineTypeID" Width="95%"
                                    AppendDataBoundItems="True">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Given By">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListStaff" runat="server" AppendDataBoundItems="True"
                                    DataSourceID="SqlDataSourceStaff" DataTextField="StaffName" DataValueField="StaffID"
                                    Width="95%">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <tr>
                                    <td colspan="100%">
                                        <div id="div<%# Eval("StudentID") %>" style="display: none; position: relative; left: 10px;
                                            overflow: auto; text-align: center;">
                                            <br />
                                            <asp:TextBox ID="TextBoxDescription" runat="server" Height="50px" TextMode="MultiLine"
                                                Width="90%"></asp:TextBox>
                                            <br />
                                        </div>
                                        <asp:Label ID="LabelStatusRow" runat="server" Font-Bold="True" Font-Size="XX-Small"
                                            ForeColor="Red"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="10px" />
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
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonAddRecords" runat="server" Text="Add Bonus Records" Width="680px" />
                <br />
                <br />
                <table width="680">
                    <tr>
                        <td align="center" height="30" width="35">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/plus.gif" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Use the button to add details to records."></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
            </div>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                <SelectParameters>
                    <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName"
                InsertCommand="INSERT INTO tbl_Discipline(AcademicTermID, DisciplineTypeID, StudentID, Date, SavedOn, SavedAt, Description, GivenByID, AddedByID) VALUES (@AcademicTermID, @DisciplineTypeID, @StudentID, @Date, @SavedOn, @SavedAt, @Description, @GivenByID, @AddedByID)">
                <InsertParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="DisciplineTypeID" />
                    <asp:Parameter Name="StudentID" />
                    <asp:Parameter Name="Date" />
                    <asp:Parameter Name="SavedOn" />
                    <asp:Parameter Name="SavedAt" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="GivenByID" />
                    <asp:Parameter Name="AddedByID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDisciplineTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DisciplineTypeID, DisciplineType, PointType FROM tbl_DisciplineTypes WHERE (PointType = 1) AND (SchoolCode = @SchoolCode) ORDER BY DisciplineType">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
