Partial Class Reporting_ReportCard

    Inherits System.Web.UI.Page

    Private csw As New clsNum2Word()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            LabelDate.Text = Convert.ToDateTime(Request.QueryString("D").ToString).ToString("D")
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub GridViewCourseAverages_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourseAverages.DataBound
        Dim LabelTheory As Label
        Dim LabelTheorytoLetter As Label

        Try

            For Each MarkRow As GridViewRow In GridViewCourseAverages.Rows

                LabelTheory = DirectCast(MarkRow.FindControl("LabelScore"), Label)
                LabelTheorytoLetter = DirectCast(MarkRow.FindControl("LabelScoretoLetter"), Label)

                LabelTheorytoLetter.Text = csw.Num2WordConverter(LabelTheory.Text.Trim()).ToString()
            Next

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub

End Class
