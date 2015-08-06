Imports System.Data

Partial Class Courses
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub


    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click

        Try


            For Each RadioButtonListStaffItem As ListItem In RadioButtonListStaff.Items

                If RadioButtonListStaffItem.Selected = True Then

                    For Each CheckBoxListTraineesItem As ListItem In CheckBoxListTrainees.Items

                        If CheckBoxListTraineesItem.Selected = True Then

                            SqlDataSourceTrainers.InsertParameters.Clear()
                            SqlDataSourceTrainers.InsertParameters.Add("AcademicTermID", DropDownListAcademicTerms.SelectedValue)
                            SqlDataSourceTrainers.InsertParameters.Add("SchoolCode", DropDownListSchoolCodes.SelectedValue)
                            SqlDataSourceTrainers.InsertParameters.Add("TrainerID", RadioButtonListStaffItem.Value.ToString)
                            SqlDataSourceTrainers.InsertParameters.Add("TraineeID", CheckBoxListTraineesItem.Value.ToString)

                            SqlDataSourceTrainers.Insert()

                        End If

                    Next

                End If

            Next

            LabelStatus.Text = "Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try

    End Sub
End Class
