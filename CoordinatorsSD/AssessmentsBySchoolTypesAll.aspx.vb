
Partial Class AssessmentTypesSchools
    Inherits System.Web.UI.Page

    Dim LabelTotalPercentage As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub OnDataBound(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewAssessmentTypes.DataBound
        For i As Integer = GridViewAssessmentTypes.Rows.Count - 1 To 1 Step -1
            Dim row As GridViewRow = GridViewAssessmentTypes.Rows(i)
            Dim previousRow As GridViewRow = GridViewAssessmentTypes.Rows(i - 1)
            For j As Integer = 0 To row.Cells.Count - 1
                If row.Cells(j).Text = previousRow.Cells(j).Text Then
                    If previousRow.Cells(j).RowSpan = 0 Then
                        If row.Cells(j).RowSpan = 0 Then
                            previousRow.Cells(j).RowSpan += 2
                        Else
                            previousRow.Cells(j).RowSpan = row.Cells(j).RowSpan + 1
                        End If
                        row.Cells(j).Visible = False
                    End If
                End If
            Next
        Next
    End Sub

End Class
