Partial Class General_Test_Scores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub DataListStudents_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListStudents.ItemDataBound
        Try

            If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

                Dim FormViewMCScore As FormView = e.Item.FindControl("FormViewMCScore")
                Dim FormViewESScore As FormView = e.Item.FindControl("FormViewESScore")

                Dim SqlDataSourceGeneralTestsMCScores As SqlDataSource = e.Item.FindControl("SqlDataSourceGeneralTestsMCScores")
                SqlDataSourceGeneralTestsMCScores.SelectParameters.Item("GeneralTestID").DefaultValue = DropDownListGeneralTests.SelectedValue
                SqlDataSourceGeneralTestsMCScores.SelectParameters.Item("CourseCategoryID").DefaultValue = RadioButtonListCourses.SelectedValue

                Dim SqlDataSourceGeneralTestsESScoresPhyMat As SqlDataSource = e.Item.FindControl("SqlDataSourceGeneralTestsESScoresPhyMat")
                SqlDataSourceGeneralTestsESScoresPhyMat.SelectParameters.Item("GeneralTestID").DefaultValue = DropDownListGeneralTests.SelectedValue

                Dim SqlDataSourceGeneralTestsESScoresBioChm As SqlDataSource = e.Item.FindControl("SqlDataSourceGeneralTestsESScoresBioChm")
                SqlDataSourceGeneralTestsESScoresBioChm.SelectParameters.Item("GeneralTestID").DefaultValue = DropDownListGeneralTests.SelectedValue

                If RadioButtonListCourses.SelectedIndex = 0 Or RadioButtonListCourses.SelectedIndex = 2 Then
                    FormViewESScore.DataSource = SqlDataSourceGeneralTestsESScoresPhyMat
                ElseIf RadioButtonListCourses.SelectedIndex = 1 Or RadioButtonListCourses.SelectedIndex = 3 Then
                    FormViewESScore.DataSource = SqlDataSourceGeneralTestsESScoresBioChm
                End If

                FormViewESScore.DataBind()

                FormViewMCScore.DataSource = SqlDataSourceGeneralTestsMCScores
                FormViewMCScore.DataBind()

                Dim MCScore As New Label
                Dim ESScore As New Label

                If Not FormViewMCScore.DataItemCount = 0 Then

                    Dim LabelMCScore As Label = DirectCast(FormViewMCScore.FindControl("LabelMCScore"), Label)
                    MCScore.Text = LabelMCScore.Text

                End If

                Dim LabelESScore As Label = DirectCast(FormViewESScore.FindControl("LabelESScore"), Label)
                ESScore.Text = LabelESScore.Text

                Dim LabelTotalScore As Label = e.Item.FindControl("LabelTotalScore")

                If Not (MCScore.Text = "" Or ESScore.Text = "") Then
                    LabelTotalScore.Text = Math.Round(Integer.Parse(MCScore.Text) * 0.7 + Integer.Parse(ESScore.Text), 0)
                End If

            End If

        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonShow.Click
        Try

            DataListStudents.DataBind()

            If DataListStudents.Items.Count > 0 Then
                PanelEmpty.Visible = False
            Else
                PanelEmpty.Visible = True
            End If
        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try
    End Sub


End Class
