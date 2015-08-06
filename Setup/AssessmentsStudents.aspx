<%@ Page Title="Setup Asessments Marks" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="AssessmentsStudents.aspx.vb" Inherits="Assessments_Students" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" AutoPostBack="True"
        DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
        Width="95%">
    </asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
        DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
        Width="95%">
        <asp:ListItem Value="">Select A School to Filter!</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSections"
        DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="95%">
        <asp:ListItem Value="">Select A School to Filter!</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:ListBox ID="ListBoxStudents" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceListBoxStudents"
        DataTextField="StudentName" DataValueField="StudentID" Height="250px" Width="95%">
    </asp:ListBox>
    <br />
    <br />
    <asp:GridView ID="GridViewGivenAssessments" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourcesStudentsGivenAssessments" Width="95%" DataKeyNames="AssessmentMarkID">
        <Columns>
            <asp:TemplateField HeaderText="AMID" SortExpression="AssessmentMarkID" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="LabelAMID" runat="server" Text='<%# Bind("AssessmentMarkID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AID">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownListAssessments" runat="server" DataSourceID="SqlDataSourcesStudentsAssessmentTypes"
                        DataTextField="Description" DataValueField="AssessmentID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "AssessmentID") %>'
                        Width="95%" AppendDataBoundItems="True">
                        <asp:ListItem Value="">Not Selected!</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AssessmentMark" HeaderText="Mark" SortExpression="AssessmentMark">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="60px" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Setup/Images/delete.gif" />
                    <asp:ConfirmButtonExtender ID="ImageButtonDelete_ConfirmButtonExtender" runat="server"
                        ConfirmText="Are you sure?" Enabled="True" TargetControlID="ImageButtonDelete">
                    </asp:ConfirmButtonExtender>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="ButtonUpdate" runat="server" Text="Update All" />
    <br />
    <br />
    <asp:FormView ID="FormViewAssessments" runat="server" DataKeyNames="AssessmentMarkID"
        DataSourceID="SqlDataSourcesStudentsGivenAssessments" DefaultMode="Insert" Width="95%">
        <InsertItemTemplate>
            <asp:DropDownList ID="DropDownListAssessments" runat="server" AppendDataBoundItems="True"
                DataSourceID="SqlDataSourcesStudentsAssessmentTypes" DataTextField="Description"
                DataValueField="AssessmentID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "AssessmentID") %>'
                Width="95%">
                <asp:ListItem Value="">Not Selected!</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel" />
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <br />
    <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSourcesStudentsGivenAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT StudentID, AcademicTermID, AssessmentMarkID, AssessmentID, Assessment, AssessmentMark FROM vw_AssessmentMarks WHERE (StudentID = @StudentID) AND (AcademicTermID = @AcademicTermID)"
        UpdateCommand="UPDATE tbl_AssessmentMarks SET AssessmentID = @AssessmentID WHERE (AssessmentMarkID = @AssessmentMarkID)"
        DeleteCommand="DELETE FROM tbl_AssessmentMarks WHERE (AssessmentMarkID = @AssessmentMarkID)"
        InsertCommand="INSERT INTO tbl_AssessmentMarks(StudentID, AssessmentID, AssessmentMark, Excused) VALUES (@StudentID, @AssessmentID, 0, 0)">
        <DeleteParameters>
            <asp:Parameter Name="AssessmentMarkID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue"
                Type="String" />
            <asp:Parameter Name="AssessmentID" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AssessmentID" />
            <asp:Parameter Name="AssessmentMarkID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcesStudentsAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT tbl_Assessments.AssessmentID, tbl_SectionCatalog.SectionCatalog + N' ' + tbl_CourseCatalog.CourseCatalog + N' ' + tbl_CourseSectionAssessmentTypes.Description + N' ' + tbl_Assessments.Assessment AS Description FROM tbl_Assessments INNER JOIN tbl_CourseSectionAssessmentTypes ON tbl_Assessments.CourseSectionAssessmentTypeID = tbl_CourseSectionAssessmentTypes.CourseSectionAssessmentTypeID INNER JOIN tbl_CourseSections ON tbl_CourseSectionAssessmentTypes.CourseSectionID = tbl_CourseSections.CourseSectionID INNER JOIN tbl_SectionCatalog ON tbl_CourseSections.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID INNER JOIN tbl_CourseCatalog ON tbl_CourseSections.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID WHERE (tbl_CourseSections.SchoolCode = @SchoolCode) AND (tbl_CourseSections.AcademicTermID = @AcademicTermID) ORDER BY tbl_SectionCatalog.SectionCatalog + N' ' + tbl_CourseCatalog.CourseCatalog + N' ' + tbl_CourseSectionAssessmentTypes.Description + N' ' + tbl_Assessments.Assessment">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1) ORDER BY SchoolName">
        <InsertParameters>
            <asp:Parameter Name="RoleName" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceListBoxStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT StudentID, StudentName, CurrentSectionID FROM vw_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
