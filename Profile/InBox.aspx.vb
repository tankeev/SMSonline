
Partial Class InBox
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If GridViewInbox.Rows.Count < 1 Then
            FormViewReadMessage.Visible = False
        Else
            FormViewReadMessage.Visible = True
        End If
    End Sub

    Protected Sub GridViewInbox_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewInbox.PreRender

        For Each MarkRow As GridViewRow In GridViewInbox.Rows
            Dim LabelRead As Label = CType(MarkRow.FindControl("LabelRead"), Label)
            Dim LabelDate As Label = CType(MarkRow.FindControl("LabelDate"), Label)
            Dim LabelSender As Label = CType(MarkRow.FindControl("LabelSender"), Label)
            Dim HyperLinkMessage As ImageButton = CType(MarkRow.FindControl("ImageButtonSelect"), ImageButton)

            If LabelRead.Text = "True" Then
                HyperLinkMessage.ImageUrl = "~/Profile/Images/new_message.gif"
            Else
                HyperLinkMessage.ImageUrl = "~/Profile/Images/old_message.gif"
                LabelDate.Font.Bold = True
                LabelSender.Font.Bold = True
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

    Protected Sub ReadUpdate(ByVal MessageID As Integer)
        If IsNumeric(MessageID) Then
            SqlDataSourceGridviewInBox.UpdateParameters.Clear()
            SqlDataSourceGridviewInBox.UpdateParameters.Add("MessageID", MessageID)
            SqlDataSourceGridviewInBox.UpdateParameters.Add("Read", "True")
            SqlDataSourceGridviewInBox.Update()
        End If

    End Sub

    Protected Sub GridViewInbox_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridViewInbox.RowDeleted
        GridViewInbox.DataBind()
        FormViewReadMessage.DataBind()
    End Sub
End Class
