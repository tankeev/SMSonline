Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html.simpleparser

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Student") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If IsPostBack Then

            If CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(0).Selected Then
                'SCHOOL AND GRADE => GRADE
                GridviewGeneralTestsRanking.DataSource = SqlDataSourceGeneralTestsRankingSchoolGrade

            ElseIf CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(1).Selected Then
                'SCHOOL AND CLASS => CLASS
                GridviewGeneralTestsRanking.DataSource = SqlDataSourceGeneralTestsRankingSchoolClass

            ElseIf Not CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(0).Selected Then
                'GRADE ONLY => GENERAL GRADE
                GridviewGeneralTestsRanking.DataSource = SqlDataSourceGeneralTestsRankingGrade

            ElseIf Not CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(1).Selected Then
                LabelTotal.Text = "Sorry, This Option is Not Possible!"
            End If

            GridviewGeneralTestsRanking.DataBind()
        End If
    End Sub

    Protected Sub ButtonRanking_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonRanking.Click

        PanelStatus.Visible = False

        PanelRanking.Visible = True

        If CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(0).Selected Then
            'SCHOOL AND GRADE => GRADE
            GridviewGeneralTestsRanking.DataSource = SqlDataSourceGeneralTestsRankingSchoolGrade

        ElseIf CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(1).Selected Then
            'SCHOOL AND CLASS => CLASS
            GridviewGeneralTestsRanking.DataSource = SqlDataSourceGeneralTestsRankingSchoolClass

        ElseIf Not CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(0).Selected Then
            'GRADE ONLY => GENERAL GRADE
            GridviewGeneralTestsRanking.DataSource = SqlDataSourceGeneralTestsRankingGrade

        ElseIf Not CheckBoxSchoolFilter.Checked And RadioButtonListSections.Items(1).Selected Then
            LabelTotal.Text = "Sorry, This Option is Not Possible!"
        End If

        GridviewGeneralTestsRanking.PageIndex = 0
        GridviewGeneralTestsRanking.DataBind()
    End Sub

    Private Function ConvertSortDirectionToSql(ByVal sortDirection As SortDirection) As String
        Dim newSortDirection As String = [String].Empty

        Select Case sortDirection
            Case sortDirection.Ascending
                newSortDirection = "ASC"
                Exit Select

            Case sortDirection.Descending
                newSortDirection = "DESC"
                Exit Select
        End Select

        Return newSortDirection
    End Function

    Protected Sub GridviewGeneralTestsRanking_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridviewGeneralTestsRanking.PageIndexChanging
        GridviewGeneralTestsRanking.PageIndex = e.NewPageIndex
        GridviewGeneralTestsRanking.DataBind()
    End Sub

    Protected Sub GridviewGeneralTestsRanking_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridviewGeneralTestsRanking.Sorting
        Dim dataTable As Data.DataTable = TryCast(GridviewGeneralTestsRanking.DataSource, Data.DataTable)

        If dataTable IsNot Nothing Then
            Dim dataView As New Data.DataView(dataTable)
            dataView.Sort = Convert.ToString(e.SortExpression) & " " & ConvertSortDirectionToSql(e.SortDirection)

            GridviewGeneralTestsRanking.DataSource = dataView
            GridviewGeneralTestsRanking.DataBind()
        End If
    End Sub

    
End Class
