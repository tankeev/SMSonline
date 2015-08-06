
Partial Class Staff_WebMessageBox
    Inherits System.Web.UI.UserControl

    Public Sub Show(ByVal Message As String, ByVal Status As String)

        If Status = "Info" Then
            LabelHeader.Text = "System Message: Information"
            ImageMessage.ImageUrl = "Images/Message_Success.png"
            PanelHeader.BackColor = System.Drawing.ColorTranslator.FromHtml("#00529B")

        ElseIf Status = "Success" Then
            LabelHeader.Text = "System Message: Success"
            ImageMessage.ImageUrl = "Images/Message_Success.png"
            PanelHeader.BackColor = System.Drawing.ColorTranslator.FromHtml("#4F8A10")

        ElseIf Status = "Warning" Then
            LabelHeader.Text = "System Message: Warning"
            ImageMessage.ImageUrl = "Images/Message_Warning.png"
            PanelHeader.BackColor = System.Drawing.ColorTranslator.FromHtml("#9F6000")

        ElseIf Status = "Error" Then
            LabelHeader.Text = "System Message: Error"
            ImageMessage.ImageUrl = "Images/Message_Error.png"
            PanelHeader.BackColor = System.Drawing.ColorTranslator.FromHtml("#D8000C")

        End If

        LabelMessage.Text = Message

        ModalPopupExtenderMessageBox.Show()

    End Sub

End Class
