Partial Public Class MultipleChoiceQuestionResponse

    Inherits System.Web.UI.UserControl

    Public Event RemoveUserControl As EventHandler

    Protected Friend Sub LinkButtonRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButtonRemove.Click
        RaiseEvent RemoveUserControl(sender, e)
    End Sub

End Class
