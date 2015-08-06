
Partial Class SendMessagetoStaff
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonSendMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSendMessage.Click

        Try

            Dim MessageCounter As Integer = 0

            For Each listItem As ListItem In RadioButtonListRoles.Items

                If listItem.Selected = True Then

                    For Each listItemStudents As ListItem In CheckBoxListStaff.Items

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

                End If

            Next

        Catch ex As Exception

            LabelStatus.Text = ex.Message

            PanelWarning.Visible = True

        End Try
    End Sub

    Protected Sub RadioButtonListRoles_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListRoles.PreRender
        RadioButtonListRoles.Items.Remove(RadioButtonListRoles.Items.FindByText("Student"))
        RadioButtonListRoles.Items.Remove(RadioButtonListRoles.Items.FindByText("Parent"))
    End Sub

End Class
