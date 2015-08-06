Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each MarkRow As GridViewRow In GridViewClubsActivities.Rows

                Dim DropDownListAcademicSemesters As DropDownList = MarkRow.FindControl("DropDownListAcademicSemesters")
                Dim DropDownListResponsibleStaff As DropDownList = MarkRow.FindControl("DropDownListResponsibleStaff")
                Dim TextBoxClubActivityName As TextBox = MarkRow.FindControl("TextBoxClubActivityName")
                Dim LabelID As Label = MarkRow.FindControl("LabelID")

                SqlDataSourceClubsActivities.UpdateParameters.Clear()
                SqlDataSourceClubsActivities.UpdateParameters.Add("AcademicSemesterID", DropDownListAcademicSemesters.SelectedValue)
                SqlDataSourceClubsActivities.UpdateParameters.Add("ClubActivityStaffID", DropDownListResponsibleStaff.SelectedValue)
                SqlDataSourceClubsActivities.UpdateParameters.Add("ClubActivityName", TextBoxClubActivityName.Text)
                SqlDataSourceClubsActivities.UpdateParameters.Add("ClubActivityID", LabelID.Text)

                SqlDataSourceClubsActivities.Update()
            Next

            LabelStatus.Text = "Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub
End Class
