Imports System.Data.SqlClient
Imports System.Data

Partial Class CoursesAdd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonRemoveAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonRemoveAll.Click
        Try


            For Each GridViewCoursesRow As GridViewRow In GridViewAddedStudents.Rows
                Dim LabelCourseSectionID As Label = GridViewCoursesRow.FindControl("LabelCourseSectionID")

                SqlDataSourceCourseAddedStudents.DeleteParameters.Clear()
                SqlDataSourceCourseAddedStudents.DeleteParameters.Add("CourseSectionID", LabelCourseSectionID.Text)
                SqlDataSourceCourseAddedStudents.Delete()

            Next

            LabelStatus.Text = "Removed!"

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub
End Class
