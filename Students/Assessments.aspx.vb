
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Student") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.DataBound
        If ListBoxCourses.Items.Count > 0 Then

            ListBoxCourses.SelectedIndex = 0
            GridViewAssessments.DataBind()

        End If
    End Sub

    Protected Sub GridViewAssessments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssessments.DataBound
        If GridViewAssessments.Rows.Count > 0 Then

            GridViewAssessments.SelectedIndex = 0
            GridViewAssessmentsMarks.DataBind()

        End If
    End Sub

End Class
