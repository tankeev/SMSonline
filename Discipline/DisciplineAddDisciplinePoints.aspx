<%@ Page Title="SIS Add Discipline Points" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="DisciplineAddDisciplinePoints.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Src="MenuDiscipline.ascx" TagName="MenuDiscipline" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc3" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU
                </h2>
                <br />
                <uc1:MenuDiscipline ID="MenuDiscipline" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Calendar ID="CalendarDisciplineDate" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" ForeColor="Red" Text="Select School Level"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:RadioButtonList ID="RadioButtonListSectionSchool" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal" Width="95%">
                                <asp:ListItem Value="SD">SD</asp:ListItem>
                                <asp:ListItem Value="SMP">SMP</asp:ListItem>
                                <asp:ListItem Selected="True" Value="SMA">SMA</asp:ListItem>
                            </asp:RadioButtonList>
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
                    ADD OFFENSE POINTS</h2>
                <br />
                <table width="675">
                    <tr>
                        <td height="28" width="25">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Discipline/Images/Item.png" />
                        </td>
                        <td width="150">
                            <asp:Label ID="Label176" runat="server" Font-Bold="True" Text="Offense Type:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListBonusType" runat="server" AppendDataBoundItems="True"
                                DataSourceID="SqlDataSourceDisciplineTypes" DataTextField="DisciplineType" DataValueField="DisciplineTypeID"
                                Width="450px">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Discipline/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label177" runat="server" Font-Bold="True" Text="Given By:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListStaff" runat="server" AppendDataBoundItems="True"
                                DataSourceID="SqlDataSourceStaff" DataTextField="StaffName" DataValueField="StaffID"
                                Width="450px">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDescription" runat="server" Height="50px" TextMode="MultiLine"
                                Width="440px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxListStudents" runat="server" DataSourceID="SqlDataSourceStudents"
                                DataTextField="StudentName" DataValueField="StudentID" RepeatColumns="2">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="ButtonAddRecords" runat="server" Text="Add Offense Card" Width="675px" />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (SectionSchool = @SectionSchool) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionSchool" Name="SectionSchool"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, Gender, UserName, SectionCatalogID FROM vw_AcademicTermsStudents WHERE (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName"
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
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName, [Continue] FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) AND ([Continue] = 1) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDisciplineTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DisciplineTypeID, DisciplineType, PointType FROM tbl_DisciplineTypes WHERE (PointType = 0) ORDER BY DisciplineType">
                </asp:SqlDataSource>
                <uc3:WebMessageBox ID="WebMessageBoxDiscipline" runat="server" />
                <asp:Button ID="btnShow" runat="server" Style="display: none;" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
