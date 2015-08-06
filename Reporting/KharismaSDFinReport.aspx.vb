Partial Class Reporting_ReportCard

    Inherits System.Web.UI.Page

    Private csw As New clsNum2Word()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            LabelDate.Text = Convert.ToDateTime(Request.QueryString("D").ToString).ToString("D")
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub ButtonOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonOK.Click
        Try

            LabelAT1.Text = TextBox1.Text
            LabelAT2.Text = TextBox2.Text
            LabelAT3.Text = TextBox3.Text
            LabelAT4.Text = TextBox4.Text

            LinkButtonAT.Text = ""

        Catch ex As Exception

        End Try
    End Sub
End Class
