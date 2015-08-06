Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarDisciplineDate.PreRender
        If Not IsPostBack Then
            CalendarDisciplineDate.SelectedDate = DateAndTime.Today
        End If
    End Sub

    Protected Sub ButtonAddRecords_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddRecords.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            For Each MarkRow As GridViewRow In GridViewStudents.Rows
                Dim StudentID As Guid = GridViewStudents.DataKeys(MarkRow.RowIndex).Value
                Dim CheckBoxBonus As CheckBox = CType(MarkRow.FindControl("CheckBoxBonus"), CheckBox)
                Dim DropDownListDisciplineTypes As DropDownList = CType(MarkRow.FindControl("DropDownListDisciplineTypes"), DropDownList)
                Dim DropDownListStaff As DropDownList = MarkRow.FindControl("DropDownListStaff")
                Dim TextBoxDescription As TextBox = CType(MarkRow.FindControl("TextBoxDescription"), TextBox)

                If Not DropDownListDisciplineTypes.SelectedValue = "" Then
                    SqlDataSourceStudents.InsertParameters.Clear()
                    SqlDataSourceStudents.InsertParameters.Add("Date", CalendarDisciplineDate.SelectedDate)
                    SqlDataSourceStudents.InsertParameters.Add("DisciplineTypeID", DropDownListDisciplineTypes.SelectedValue)
                    SqlDataSourceStudents.InsertParameters.Add("GivenByID", DropDownListStaff.SelectedValue)
                    SqlDataSourceStudents.InsertParameters.Add("Description", TextBoxDescription.Text)
                    SqlDataSourceStudents.InsertParameters.Add("StudentID", StudentID.ToString)
                    SqlDataSourceStudents.InsertParameters.Add("SavedOn", Date.Today.Date)
                    SqlDataSourceStudents.InsertParameters.Add("SavedAt", Date.Now)
                    SqlDataSourceStudents.InsertParameters.Add("AddedByID", Session("UserID").ToString)
                    SqlDataSourceStudents.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)

                    SqlDataSourceStudents.Insert()

                End If
            Next

        Catch ex As Exception

            LabelStatus.Text = "Sorry, The Following Error Occured: " & ex.Message

        End Try
    End Sub
End Class
