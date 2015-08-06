
Partial Class _Default
    Inherits System.Web.UI.Page

    Private csw As New clsNum2WordIndo()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DataListAverages_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListAverages.ItemDataBound

        Try

            If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

                Dim LabelTheory As New Label
                Dim LabelTheorytoLetter As New Label

                LabelTheory = DirectCast(e.Item.FindControl("LabelTheory"), Label)
                LabelTheorytoLetter = DirectCast(e.Item.FindControl("LabelTheoryToLetter"), Label)

                If Not LabelTheory.Text = "--" Then
                    LabelTheorytoLetter.Text = " - " & csw.Num2WordConverter(LabelTheory.Text.Trim()).ToString()
                End If

                Dim LabelPractice As New Label
                Dim LabelPracticetoLetter As New Label

                LabelPractice = DirectCast(e.Item.FindControl("LabelPractice"), Label)
                LabelPracticetoLetter = DirectCast(e.Item.FindControl("LabelPracticeToLetter"), Label)
                If Not LabelPractice.Text = "--" Then
                    LabelPracticetoLetter.Text = " - " & csw.Num2WordConverter(LabelPractice.Text.Trim()).ToString()
                End If

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub
End Class
