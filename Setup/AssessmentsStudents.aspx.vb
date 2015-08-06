Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class Assessments_Students
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try
            For Each GridViewClassesTeachersRow As GridViewRow In GridViewGivenAssessments.Rows

                Dim DropDownListAssessments As DropDownList = GridViewClassesTeachersRow.FindControl("DropDownListAssessments")
                Dim LabelAMID As Label = GridViewClassesTeachersRow.FindControl("LabelAMID")

                SqlDataSourcesStudentsGivenAssessments.UpdateParameters.Clear()
                SqlDataSourcesStudentsGivenAssessments.UpdateParameters.Add("AssessmentID", DropDownListAssessments.SelectedValue)
                SqlDataSourcesStudentsGivenAssessments.UpdateParameters.Add("AssessmentMarkID", LabelAMID.Text)
                SqlDataSourcesStudentsGivenAssessments.Update()
            Next
            LabelStatus.Text = "Records Updated!"
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub DropDownListSchoolCodes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSchoolCodes.SelectedIndexChanged
        GridViewGivenAssessments.DataBind()
    End Sub


    Protected Sub GridViewGivenAssessments_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewGivenAssessments.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim DropDownListAssessments As DropDownList = e.Row.FindControl("DropDownListAssessments")
            DropDownListAssessments.DataBind()
        End If
    End Sub

    Protected Sub FormViewAssessments_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormViewAssessments.ItemInserting
        e.Values("AssessmentID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListAssessments"), DropDownList).SelectedValue
    End Sub
End Class
