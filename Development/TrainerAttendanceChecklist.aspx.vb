Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonAddRecords_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddRecords.Click
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            If CheckBoxListTrainees.Items.Count > 0 Then

                For Each CheckBoxListPeriodsItem As ListItem In CheckBoxListTrainees.Items

                    If CheckBoxListPeriodsItem.Selected = True Then

                        'YENI ATTENDANCE KAYITLARI EKLENIYOR.
                        SqlDataSourceAttendanceChecklist.InsertParameters.Clear()
                        SqlDataSourceAttendanceChecklist.InsertParameters.Add("Date", DateTextBox.Text)
                        SqlDataSourceAttendanceChecklist.InsertParameters.Add("Notes", NotesTextBox.Text)
                        SqlDataSourceAttendanceChecklist.InsertParameters.Add("TraineeID", CheckBoxListPeriodsItem.Value.ToString)
                        SqlDataSourceAttendanceChecklist.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                        SqlDataSourceAttendanceChecklist.InsertParameters.Add("AttendanceTypeID", DropDownListAttendanceTypes.SelectedValue)
                        SqlDataSourceAttendanceChecklist.InsertParameters.Add("SavedBy", Session("UserID").ToString)
                        SqlDataSourceAttendanceChecklist.Insert()

                    End If

                Next

                LabelAttendanceStatus.Text = "Added Successfully!"
            Else

                LabelAttendanceStatus.Text = "There is No Student on the List!"

            End If

        Catch ex As Exception
            LabelAttendanceStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub

End Class
