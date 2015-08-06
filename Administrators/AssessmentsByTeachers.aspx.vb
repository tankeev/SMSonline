
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxTeachers.DataBound
        If ListBoxTeachers.Items.Count > 0 Then
            ListBoxTeachers.SelectedIndex = 0
        End If

        GridViewAssessments.DataBind()

    End Sub


    Protected Sub GridViewAssessments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssessments.DataBound
        If GridViewAssessments.Rows.Count > 0 Then
            GridViewAssessments.SelectedIndex = 0
        End If

        GridViewAssessmentsMarks.DataBind()
    End Sub
End Class
