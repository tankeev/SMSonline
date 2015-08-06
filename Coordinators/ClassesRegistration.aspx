<%@ Page Title="SIS Student Registration" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="ClassesRegistration.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuClasses.ascx" TagName="MenuClasses" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuClasses ID="MenuClasses" runat="server" />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    INFORMATION</h2>
                <table width="675">
                    <tr>
                        <td height="22" width="50%">
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Current Students for:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Registered Students for:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListAcademicTermsLeft" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                                Width="100%">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListAcademicTermsRight" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                                Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:RadioButtonList ID="RadioButtonListSectionTypesLeft" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">Regular</asp:ListItem>
                                <asp:ListItem Value="1">English</asp:ListItem>
                                <asp:ListItem Value="2">Turkce</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSectionTypesRight" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">Regular</asp:ListItem>
                                <asp:ListItem Value="1">English</asp:ListItem>
                                <asp:ListItem Value="2">Turkce</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="120">
                            <div style='border: 1px solid #999999; overflow: auto; height: 100%; background-color: #E6E6E6;'>
                                <asp:RadioButtonList ID="RadioButtonListSectionsLeft" runat="server" DataSourceID="SqlDataSourceSectionsLeft"
                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="6"
                                    AutoPostBack="True">
                                </asp:RadioButtonList>
                            </div>
                        </td>
                        <td height="120">
                            <div style='border: 1px solid #999999; overflow: auto; height: 100%; background-color: #E6E6E6;'>
                                <asp:RadioButtonList ID="RadioButtonListSectionsRight" runat="server" DataSourceID="SqlDataSourceSectionsRight"
                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="6"
                                    AutoPostBack="True">
                                </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="35">
                            <asp:Button ID="ButtonAdd" runat="server" Text="Add Selected Students &gt;&gt;" Width="97%"
                                OnClientClick="return confirm('Are you sure you want to add selected Students?')" />
                        </td>
                        <td>
                            <asp:Button ID="ButtonRemove" runat="server" Text="Remove Selected Students" Width="97%"
                                OnClientClick="return confirm('Are you sure you want to remove selected Students?')" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:CheckBox ID="CheckBoxCheckAllLeft" runat="server" AutoPostBack="True" Font-Bold="True"
                                ForeColor="Red" Text="Check All Students" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxCheckAllRight" runat="server" AutoPostBack="True" Font-Bold="True"
                                ForeColor="Red" Text="Check All Students" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" height="300">
                            <div style='overflow: auto; height: 100%;'>
                                <asp:CheckBoxList ID="CheckBoxListLeft" runat="server" DataSourceID="SqlDataSourceCurrentStudents"
                                    DataTextField="StudentName" DataValueField="StudentID">
                                </asp:CheckBoxList>
                            </div>
                        </td>
                        <td valign="top" height="300">
                            <div style='overflow: auto; height: 100%;'>
                                <asp:CheckBoxList ID="CheckBoxListRight" runat="server" DataSourceID="SqlDataSourceAcademicTermsStudents"
                                    DataTextField="StudentName" DataValueField="StudentID">
                                </asp:CheckBoxList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="LabelTotalStudentsLeft" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelTotalStudentsRight" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Button ID="ButtonArchiveStudents" runat="server" Text="Add Student From Archive"
                                Width="97%" />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListArchiveStudents" runat="server" DataSourceID="SqlDataSourceStudents"
                                DataTextField="StudentName" DataValueField="StudentID" Width="96%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicSemester + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSectionsLeft" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (SectionType = @SectionType) ORDER BY SectionGroup, SectionCatalog">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsLeft" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionTypesLeft" Name="SectionType"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSectionsRight" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (SectionType = @SectionType) ORDER BY SectionGroup, SectionCatalog">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsRight" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionTypesRight" Name="SectionType"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students ORDER BY StudentName"
                    UpdateCommand="UPDATE tbl_Students SET CurrentSectionID = @CurrentSectionID WHERE (StudentID = @StudentID)">
                    <UpdateParameters>
                        <asp:Parameter Name="CurrentSectionID" />
                        <asp:Parameter Name="StudentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCurrentStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM vw_AcademicTermsStudents WHERE (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) ORDER BY StudentName"
                    UpdateCommand="UPDATE tbl_Students SET CurrentSectionID = @CurrentSectionID WHERE (StudentID = @StudentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionsLeft" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsLeft" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CurrentSectionID" />
                        <asp:Parameter Name="StudentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAcademicTermsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM vw_AcademicTermsStudents WHERE (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) ORDER BY StudentName"
                    InsertCommand="IF NOT EXISTS (SELECT * FROM tbl_AcademicTermsStudents
                   WHERE AcademicTermID = @AcademicTermID
                   AND StudentID= @StudentID
                   AND SectionCatalogID = @SectionCatalogID)

INSERT INTO tbl_AcademicTermsStudents(AcademicTermID, SchoolCode, StudentID, SectionCatalogID) VALUES (@AcademicTermID, @SchoolCode, @StudentID, @SectionCatalogID)"
                    DeleteCommand="DELETE FROM tbl_AcademicTermsStudents WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (SectionCatalogID = @SectionCatalogID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="SectionCatalogID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="SchoolCode" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionsRight" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsRight" Name="AcademicTermID"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
