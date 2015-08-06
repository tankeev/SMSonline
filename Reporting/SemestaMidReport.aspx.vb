
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If FormViewStudents.CurrentMode = FormViewMode.ReadOnly Then

                Dim LabelDate As Label = FormViewStudents.FindControl("LabelDate")

                LabelDate.Text = Convert.ToDateTime(Request.QueryString("D").ToString).ToString("d MMM yyyy")

            End If

        Catch ex As Exception

        End Try

    End Sub
End Class
