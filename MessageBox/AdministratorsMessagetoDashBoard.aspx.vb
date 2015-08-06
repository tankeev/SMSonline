
Partial Class SendMessagetoStudents
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonSendMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSendMessage.Click

        Try

            ' Dim MessageCounter As Integer = 0

            'For Each listItem As ListItem In RadioButtonListSections.Items

            'If ListItem.Selected = True Then

            'For Each listItemStudents As ListItem In CheckBoxListStudents.Items

            'If listItemStudents.Selected = True Then

            SqlDataSourceDashBoard.InsertParameters.Clear()
            SqlDataSourceDashBoard.InsertParameters.Add("SenderID", Session("UserID").ToString)
            SqlDataSourceDashBoard.InsertParameters.Add("Message", TextBoxMessage.Text)
            SqlDataSourceDashBoard.InsertParameters.Add("Date", DateTime.Now.Date.ToString("yyyyMMdd"))

            SqlDataSourceDashBoard.Insert()

            'MessageCounter += 1

            'End If

            'Next

            'LabelCounter.Text = MessageCounter & " Messages Have Been Sent!"

            PanelAdded.Visible = True

            'End If

            'Next

        Catch ex As Exception

            LabelStatus.Text = ex.Message

            PanelWarning.Visible = True

        End Try
    End Sub

End Class
