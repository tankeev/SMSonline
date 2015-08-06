<%@ Page Title="SIS School Assessment Types" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AssessmentsBySchoolTypesAll.aspx.vb" Inherits="AssessmentTypesSchools" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessments ID="MenuAssessments" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkView" runat="server" ImageUrl="~/Staff/Images/menu_view.png"
                                NavigateUrl="~/Coordinators/AssessmentsBySchoolTypes.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label81" runat="server" Text="Assessment Types Table View"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" 
                                Text="Select a Course Please" ForeColor="Red"></asp:Label>
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
                    <tr>
                        <td height="28">
                            
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    SCHOOL ASSESSMENT TYPES</h2>
                <br />
                <asp:GridView ID="GridViewAssessmentTypes" runat="server" OnDataBound="OnDataBound"
                    AutoGenerateColumns="False" DataKeyNames="CourseSectionAssessmentTypeID" DataSourceID="SqlDataSourceAssessmentTypes"
                    Width="675px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemStyle Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CourseCategory" HeaderText="Course " SortExpression="CourseCategory">
                            <ItemStyle Width="120px" Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Assessment Type" SortExpression="Description" />
                        <asp:BoundField DataField="Percentage" HeaderText="%" SortExpression="Percentage">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" Font-Bold="True" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="Please Select a Section to see the Records!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="25px" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE  (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionAssessmentTypeID, CourseCategory, SectionCatalog, SectionGroup, Description, Percentage FROM vw_CourseSectionAssessmentTypes WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) ORDER BY SectionCatalog, CourseCategory, Description">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
