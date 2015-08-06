Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each MarkRow As GridViewRow In GridViewClubsActivities.Rows

                Dim TextBoxInput As TextBox = MarkRow.FindControl("TextBoxInput")
                Dim LabelCID As Label = MarkRow.FindControl("LabelCID")

                SqlDataSourceClubsActivitiesStudents.UpdateParameters.Clear()
                SqlDataSourceClubsActivitiesStudents.UpdateParameters.Add("Input", TextBoxInput.Text)
                SqlDataSourceClubsActivitiesStudents.UpdateParameters.Add("ClubActivityStudentID", LabelCID.Text)

                SqlDataSourceClubsActivitiesStudents.Update()
            Next

            LabelStatus.Text = "Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub
End Class
