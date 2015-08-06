<%@ Page Title="SIS Asessments By Courses" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AssessmentsByTeachers.aspx.vb" Inherits="Assignments" %>

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
                <uc1:MenuAssessments ID="MenuAssessments1" runat="server" />
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/Administrators/Images/menu_school.png"
                                NavigateUrl="~/Administrators/MPEResultsByCourses.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label28" runat="server" Text="Mitra Pasiad Exams"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label33" runat="server" Text="Course Teachers"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxTeachers" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceTeachers"
                                DataTextField="StaffName" DataValueField="StaffID" Height="240px" Width="95%">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENTS BY TEACHERS</h2>
                <br />
                <div id="divChild">
                    <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Assessments"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceAssessments" Width="680px" DataKeyNames="AssessmentID"
                        AllowPaging="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="ImageItem0" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="CourseCategory" HeaderText="Course " SortExpression="CourseCategory">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog" />
                            <asp:BoundField DataField="AssessmentType" HeaderText="Type" SortExpression="AssessmentType" />
                            <asp:BoundField DataField="Assessment" HeaderText="Assessment" SortExpression="Assessment" />
                            <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="75px" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Staff/Images/info.png" ShowSelectButton="True">
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:CommandField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                                <br />
                                <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                                <br />
                                <br />
                                <br />
                                <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                                <br />
                            </asp:Panel>
                        </EmptyDataTemplate>
                        <HeaderStyle Height="30px" />
                        <SelectedRowStyle BackColor="#FFFF99" />
                    </asp:GridView>
                    <br />
                    <table width="680">
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label30" runat="server" Font-Bold="True" ForeColor="#333333" Text="Please Use this button to see the results:"></asp:Label>
                            </td>
                            <td align="center" width="35">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/info.png" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="Red" Text="Assessment Marks"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceAssessmentsMarks" Width="680px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="ImageItem" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NO">
                                <ItemTemplate>
                                    <strong>
                                        <%# Container.DataItemIndex + 1 %>
                                    </strong>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Score" SortExpression="Score">
                                <ItemTemplate>
                                    <asp:Label ID="LabelScore" runat="server" ForeColor="Red" Text='<%# Bind("Score") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                                <br />
                                <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                                <br />
                                <br />
                                <br />
                                <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                                <br />
                            </asp:Panel>
                        </EmptyDataTemplate>
                        <HeaderStyle Height="30px" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT StudentName, AssessmentMark AS Score FROM vw_AssessmentMarks WHERE (AssessmentID = @AssessmentID) ORDER BY StudentName">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT AcademicTermID, StaffID, AssessmentID, SectionCatalog, CourseCategory, Date, Assessment, AssessmentType FROM vw_AssessmentsByTeachers WHERE (AcademicTermID = @AcademicTermID) AND (StaffID = @StaffID) ORDER BY SectionCatalog, CourseCategory, AssessmentType, Assessment">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ListBoxTeachers" Name="StaffID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
