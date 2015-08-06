
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub ReadUpdate(ByVal MessageID As Integer)
        If IsNumeric(MessageID) Then
            SqlDataSourceGridviewInBox.UpdateParameters.Clear()
            SqlDataSourceGridviewInBox.UpdateParameters.Add("MessageID", MessageID)
            SqlDataSourceGridviewInBox.UpdateParameters.Add("Read", "True")
            SqlDataSourceGridviewInBox.Update()
        End If
    End Sub

    Protected Sub GridViewInbox_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewInbox.PreRender
        For Each MarkRow As GridViewRow In GridViewInbox.Rows
            Dim LabelRead As Label = CType(MarkRow.FindControl("LabelRead"), Label)
            Dim LabelDate As Label = CType(MarkRow.FindControl("LabelDate"), Label)
            Dim LabelSender As Label = CType(MarkRow.FindControl("LabelSender"), Label)
            Dim LabelTitle As Label = CType(MarkRow.FindControl("LabelTitle"), Label)
            Dim HyperLinkMessage As ImageButton = CType(MarkRow.FindControl("ImageButtonSelect"), ImageButton)

            If LabelRead.Text = "True" Then
                HyperLinkMessage.ImageUrl = "~/MessageBox/Images/new_message.gif"
            Else
                HyperLinkMessage.ImageUrl = "~/MessageBox/Images/old_message.gif"
                LabelDate.Font.Bold = True
                LabelSender.Font.Bold = True
                LabelTitle.Font.Bold = True
            End If
        Next
    End Sub

    Protected Sub GridViewInbox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewInbox.SelectedIndexChanged
        Try
            ReadUpdate(GridViewInbox.SelectedValue)
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub GridViewInbox_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewInbox.RowCommand
        Try
            If e.CommandName = "ReadMessage" Then

                'Dim index As Integer = Convert.ToInt32(e.CommandArgument)

                'Dim row As GridViewRow = GridViewInbox.Rows(index)

                'ReadUpdate(Convert.ToInt32(GridViewInbox.DataKeys(row.RowIndex).Value))

                ReadUpdate(GridViewInbox.SelectedValue)

            End If
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

End Class
