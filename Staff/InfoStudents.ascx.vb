
Partial Class Staff_InfoStudents
    Inherits System.Web.UI.UserControl

    Public SelectedStudentID As String

    Public Sub ShowStudent(ByVal StudentID As String)

        HiddenFieldSelectedStudentID.Value = StudentID
        SqlDataSourceFormViewStudentsBasicInformation.SelectParameters("StudentID").DefaultValue = HiddenFieldSelectedStudentID.Value
        ModalPopupExtenderStudentInfo.Show()

    End Sub

    Protected Sub TabContainerStudents_ActiveTabChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TabContainerStudents.ActiveTabChanged
        If TabContainerStudents.ActiveTabIndex = 1 Then
            SqlDataSourceFormViewStudentsAdditionalInformation.SelectParameters("StudentID").DefaultValue = SelectedStudentID
        ElseIf TabContainerStudents.ActiveTabIndex = 2 Then
            SqlDataSourceFormViewStudentsEnrollmentDetails.SelectParameters("StudentID").DefaultValue = SelectedStudentID
        ElseIf TabContainerStudents.ActiveTabIndex = 3 Then
            SqlDataSourceFormViewParentsGuardiansDetails.SelectParameters("StudentID").DefaultValue = SelectedStudentID
        ElseIf TabContainerStudents.ActiveTabIndex = 4 Then
            SqlDataSourceFormViewParentsParentsInformation.SelectParameters("StudentID").DefaultValue = SelectedStudentID
        End If
    End Sub
End Class
