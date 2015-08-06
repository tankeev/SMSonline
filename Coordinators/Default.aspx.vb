Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewNumberofStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewNumberofStudents.DataBound
        Try
            Dim LabelTotalSum As Label = DirectCast(GridViewNumberofStudents.FooterRow.FindControl("LabelTotalSum"), Label)

            For Each GridViewNumberofStudentsRow As GridViewRow In GridViewNumberofStudents.Rows
                Dim LabelTotal As Label = DirectCast(GridViewNumberofStudentsRow.FindControl("LabelTotal"), Label)
                LabelTotalSum.Text += Convert.ToInt32(LabelTotal.Text)
            Next
        Catch ex As Exception

        End Try
    End Sub
End Class
