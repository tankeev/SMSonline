Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Dim myzone As TimeZone = TimeZone.CurrentTimeZone
    Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
    Dim universalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarDisciplineDate.PreRender
        If Not IsPostBack Then

            CalendarDisciplineDate.SelectedDate = universalDateTime.Date

        End If
    End Sub

    Protected Sub ButtonAddRecords_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddRecords.Click
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")

            For Each CheckBoxListStudentsItem As ListItem In CheckBoxListStudents.Items

                If CheckBoxListStudentsItem.Selected = True Then
                    SqlDataSourceStudents.InsertParameters.Clear()
                    SqlDataSourceStudents.InsertParameters.Add("Date", CalendarDisciplineDate.SelectedDate)
                    SqlDataSourceStudents.InsertParameters.Add("DisciplineTypeID", DropDownListDisciplineTypes.SelectedValue)
                    SqlDataSourceStudents.InsertParameters.Add("GivenByID", DropDownListStaff.SelectedValue.ToString)
                    SqlDataSourceStudents.InsertParameters.Add("Description", TextBoxDescription.Text)
                    SqlDataSourceStudents.InsertParameters.Add("StudentID", CheckBoxListStudentsItem.Value.ToString)
                    SqlDataSourceStudents.InsertParameters.Add("SavedOn", universalDateTime.Date)
                    SqlDataSourceStudents.InsertParameters.Add("SavedAt", Date.UtcNow)
                    SqlDataSourceStudents.InsertParameters.Add("AddedByID", Session("UserID").ToString)
                    SqlDataSourceStudents.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)

                    SqlDataSourceStudents.Insert()
                End If
            Next

            WebMessageBoxDiscipline.Show("Updated Successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxDiscipline.Show("An Error Occured: " & ex.Message.ToString, "Error")

        End Try
    End Sub
End Class
