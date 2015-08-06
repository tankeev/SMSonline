
Partial Class SendMessagetoParents
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (User.IsInRole("Coordinator") Or User.IsInRole("CoordinatorSD")) Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonSendMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSendMessage.Click

        Try

            Dim MessageCounter As Integer = 0

            For Each listItem As ListItem In RadioButtonListSections.Items

                If listItem.Selected = True Then

                    For Each listItemStudents As ListItem In CheckBoxListStudents.Items

                        If listItemStudents.Selected = True Then

                            SqlDataSourceMessage.InsertParameters.Clear()
                            SqlDataSourceMessage.InsertParameters.Add("UserID", listItemStudents.Value)
                            SqlDataSourceMessage.InsertParameters.Add("SenderID", Session("UserID").ToString)
                            SqlDataSourceMessage.InsertParameters.Add("Message", TextBoxMessage.Text)
                            SqlDataSourceMessage.InsertParameters.Add("Title", TextBoxTitle.Text)
                            SqlDataSourceMessage.InsertParameters.Add("Date", DateTime.Now.Date.ToString("yyyyMMdd"))
                            SqlDataSourceMessage.InsertParameters.Add("Read", "0")
                            SqlDataSourceMessage.Insert()

                            MessageCounter += 1

                        End If

                    Next

                    LabelCounter.Text = MessageCounter & " Messages Have Been Sent!"

                    PanelAdded.Visible = True

                    SqlDataSourceParents.FilterExpression = ""

                End If

            Next

        Catch ex As Exception

            LabelStatus.Text = ex.Message

            PanelWarning.Visible = True

        End Try
    End Sub

End Class
