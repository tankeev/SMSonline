<%@ Page Title="Setup Asessments Marks" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="AssessmentsMarks.aspx.vb" Inherits="Assessment_Marks" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:ListBox ID="ListBoxCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCourses"
                DataTextField="CourseCatalog" DataValueField="CourseSectionID" Height="180px"
                Width="675px"></asp:ListBox>
            <br />
            <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSourceAssessments" Width="675px" DataKeyNames="AssessmentID"
                AllowPaging="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="ImageItem0" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <strong>
                                <%# Container.DataItemIndex + 1 %>
                            </strong>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CourseSectionID" HeaderText="CSID" SortExpression="CourseSectionID">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CourseCatalog" HeaderText="Course " SortExpression="CourseCatalog">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Assessment" HeaderText="Assessment" SortExpression="Assessment" />
                    <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Staff/Images/edit.png" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/delete.gif"
                                OnClientClick="return confirm('Are you sure you want to delete this Assessment?')"
                                ToolTip="Delete!" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                        <br />
                        <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                        <br />
                        <br />
                    </asp:Panel>
                </EmptyDataTemplate>
                <HeaderStyle Height="30px" />
                <SelectedRowStyle BackColor="#FFFF99" />
            </asp:GridView>
            <br />
            <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="Red" Text="Assessment Marks"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSourceAssessmentsMarks" Width="675px" 
                DataKeyNames="AssessmentMarkID">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="ImageItem" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <strong>
                                <%# Container.DataItemIndex + 1 %>
                            </strong>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Score" SortExpression="Score">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxInput" runat="server" Text='<%# Bind("Score") %>' Width="30px"
                                ValidationGroup="AssessmentMarks"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxInput"
                                ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentMarks">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxInput"
                                ErrorMessage="*" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="0"
                                Type="Integer" ValidationGroup="AssessmentMarks">*</asp:RangeValidator>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="75px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                        <br />
                        <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Select An Assessment to See Assessment Marks!"></asp:Label>
                        <br />
                        <br />
                    </asp:Panel>
                </EmptyDataTemplate>
                <HeaderStyle Height="30px" />
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update Assessment Marks" ValidationGroup="AssessmentMarks"
                Width="675px" />
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT SectionCatalogID, SectionCatalog, SectionGroup FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup, SectionCatalog">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseSectionID, SectionGroup, SectionCatalog + N' ' + CourseCatalog AS CourseCatalog, SchoolCode FROM vw_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (CourseCatalog &lt;&gt; N'Guidance') AND (SchoolCode = @SchoolCode) ORDER BY SectionGroup, CourseCatalog">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                DeleteCommand="DELETE FROM tbl_Assessments WHERE (AssessmentID = @AssessmentID) DELETE FROM tbl_AssessmentMarks WHERE (AssessmentID = @AssessmentID)"
                SelectCommand="SELECT CourseCatalog, AssessmentID, Assessment, Date, CourseSectionID, AcademicTermID, SectionCatalog FROM vw_Assessments WHERE (AcademicTermID = @AcademicTermID) AND (CourseSectionID = @CourseSectionID) ORDER BY CourseCatalog, Assessment">
                <DeleteParameters>
                    <asp:Parameter Name="AssessmentID" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_AssessmentMarks.AssessmentMarkID, tbl_AssessmentMarks.AssessmentID, tbl_AssessmentMarks.StudentID, tbl_Students.StudentName, tbl_AssessmentMarks.AssessmentMark AS Score FROM tbl_AssessmentMarks INNER JOIN tbl_Students ON tbl_AssessmentMarks.StudentID = tbl_Students.StudentID WHERE (tbl_AssessmentMarks.AssessmentID = @AssessmentID) ORDER BY tbl_Students.StudentName"
                UpdateCommand="UPDATE tbl_AssessmentMarks SET AssessmentMark = @AssessmentMark WHERE (AssessmentMarkID = @AssessmentMarkID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AssessmentMark" />
                    <asp:Parameter Name="AssessmentMarkID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
