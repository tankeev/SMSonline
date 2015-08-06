Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class Users_Students
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImageButtonInfo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try

            Dim SenderImageButton As ImageButton = DirectCast(sender, ImageButton)
            Dim GridViewStudentsRow As GridViewRow = DirectCast(SenderImageButton.NamingContainer, GridViewRow)
            Dim LabelStudentID As Label = DirectCast(GridViewStudentsRow.FindControl("LabelStudentID"), Label)

            GridViewStudents.SelectedIndex = GridViewStudentsRow.RowIndex

            InfoStudents.ShowStudent(LabelStudentID.Text)

        Catch ex As Exception
            WebMessageBoxStudents.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub



    'Protected Sub FormView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewStudentsBasicInformation.DataBound, FormViewStudentsAdditionalInformation.DataBound, FormViewStudentsEnrollmentDetails.DataBound, FormViewParentsGuardianDetails.DataBound, FormViewParentsParentsInformation.DataBound
    '    Try
    '        Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
    '        Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
    '        Dim FormViewStudents As FormView = DirectCast(sender, FormView)

    '        'Check for its current mode
    '        If FormViewStudents.CurrentMode = FormViewMode.Edit Then

    '            'Check the RowType to where the Control is placed
    '            If FormViewStudents.Row.RowType = DataControlRowType.DataRow Then

    '                Dim ButtonSave As Button = DirectCast(FormViewStudents.FindControl("ButtonUpdate"), Button)

    '                Dim conStringStudent As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
    '                Dim dadStudent As New SqlDataAdapter("SELECT StaffID FROM vw_CourseSections where CourseCategory= 'Guidance' and SchoolCode=" & DropDownListSchoolCodesMaster.SelectedValue & " and AcademicTermID=" & DropDownListAcademicTermsMaster.SelectedValue & "", conStringStudent)
    '                Dim dtblStudent As New DataTable()
    '                dadStudent.Fill(dtblStudent)

    '                If dtblStudent.Rows.Count > 0 Then
    '                    If Session("UserID").ToString = Convert.ToString(dtblStudent.Rows.Item(0).Item("StaffID")) Then
    '                        ButtonSave.Visible = True
    '                    End If
    '                Else
    '                    ButtonSave.Visible = False
    '                End If

    '            End If

    '        End If

    '    Catch ex As Exception
    '        WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
    '    End Try
    'End Sub

    'Protected Sub FormView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStudentsBasicInformation.ItemUpdated, FormViewStudentsEnrollmentDetails.ItemUpdated, FormViewStudentsAdditionalInformation.ItemUpdated, FormViewParentsParentsInformation.ItemUpdated, FormViewParentsGuardianDetails.ItemUpdated

    '    ' Use the Exception property to determine whether an exception
    '    ' occurred during the update operation.

    '    If e.Exception Is Nothing Then

    '        If e.AffectedRows > 0 Then
    '            'Record Inserted Successfully.

    '            WebMessageBoxStudents.Show("Records Updated Successfully!", "Success")
    '        Else
    '            WebMessageBoxStudents.Show("An error occurred during the insert operation.", "Error")
    '        End If
    '    Else
    '        'LabelStatus.Text = e.Exception.Message
    '        WebMessageBoxStudents.Show("An error occurred during the insert operation.", "Error")
    '        e.ExceptionHandled = True
    '    End If

    'End Sub

    'Protected Sub FormViewStudentsEnrollmentDetails_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsEnrollmentDetails.ItemUpdating
    '    e.NewValues("StartingAcademicTermID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingTerm"), DropDownList).SelectedValue
    '    e.NewValues("StartingSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingSection"), DropDownList).SelectedValue
    '    e.NewValues("LevelEng") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelEnglish"), DropDownList).SelectedValue
    '    e.NewValues("LevelTr") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelTurkce"), DropDownList).SelectedValue
    'End Sub

    'Protected Sub FormViewStudentsAdditionalInformation_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsAdditionalInformation.ItemUpdating
    '    e.NewValues("BloodType") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListBloodType"), DropDownList).SelectedValue
    'End Sub

    

End Class
