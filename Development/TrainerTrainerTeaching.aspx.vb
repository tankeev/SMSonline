Imports System.Data.SqlClient

Partial Class TrainerTeaching
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonAddRecords_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddRecords.Click
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            If CheckBoxListTrainees.Items.Count > 0 Then

                For Each CheckBoxListTraineesItem As ListItem In CheckBoxListTrainees.Items

                    If CheckBoxListTraineesItem.Selected = True Then

                        'YENI ATTENDANCE KAYITLARI EKLENIYOR.
                        SqlDataSourceTrainerTeaching.InsertParameters.Clear()
                        SqlDataSourceTrainerTeaching.InsertParameters.Add("Date", DateTextBox.Text)
                        SqlDataSourceTrainerTeaching.InsertParameters.Add("Notes", NotesTextBox.Text)
                        SqlDataSourceTrainerTeaching.InsertParameters.Add("TraineeID", CheckBoxListTraineesItem.Value.ToString)
                        SqlDataSourceTrainerTeaching.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                        SqlDataSourceTrainerTeaching.InsertParameters.Add("UnitTitleID", DropDownListTeachingTitle.SelectedValue)
                        SqlDataSourceTrainerTeaching.InsertParameters.Add("Duration", DropDownListDuration.SelectedValue)
                        SqlDataSourceTrainerTeaching.InsertParameters.Add("SavedBy", Session("UserID").ToString)
                        SqlDataSourceTrainerTeaching.Insert()

                    End If

                Next

                LabelTeachingStatus.Text = "Added Successfully!"
            Else

                LabelTeachingStatus.Text = "There is No Student on the List!"

            End If

        Catch ex As Exception
            LabelTeachingStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub

    Protected Sub DropDownListTeachingCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListTeachingCourses.SelectedIndexChanged
        DropDownListTeachingUnits.DataBind()
        DropDownListTeachingTitle.DataBind()
    End Sub

    Protected Sub DropDownListTeachingUnits_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListTeachingUnits.DataBound
        DropDownListTeachingTitle.DataBind()
    End Sub
End Class
