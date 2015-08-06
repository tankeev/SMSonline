Imports System.Data.SqlClient

Partial Class Students
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.DataBound, ListBoxStudents.SelectedIndexChanged
        Try
            LabelTotal.Text = ListBoxStudents.Items.Count.ToString + " Student(s)"
        Catch ex As Exception
            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub

    Protected Sub FormViewStudents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsBasicInformation.ItemUpdating
        'e.NewValues("CurrentSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListCurrentGrade"), DropDownList).SelectedValue
        e.NewValues("Gender") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListGender"), DropDownList).SelectedValue
    End Sub

    Protected Sub FormViewStudentsEnrollmentDetails_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsEnrollmentDetails.ItemUpdating
        e.NewValues("StartingAcademicTermID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingTerm"), DropDownList).SelectedValue
        e.NewValues("StartingSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingSection"), DropDownList).SelectedValue
        e.NewValues("LevelEng") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelEnglish"), DropDownList).SelectedValue
        e.NewValues("LevelTr") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelTurkce"), DropDownList).SelectedValue
    End Sub

    Protected Sub FormViewStudentsAdditionalInformation_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsAdditionalInformation.ItemUpdating
        e.NewValues("BloodType") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListBloodType"), DropDownList).SelectedValue
    End Sub

    Protected Sub FormViewStudents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStudentsBasicInformation.ItemUpdated, FormViewStudentsEnrollmentDetails.ItemUpdated, FormViewStudentsAdditionalInformation.ItemUpdated, FormViewParentsParentsInformation.ItemUpdated, FormViewParentsGuardianDetails.ItemUpdated

        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.

                ListBoxStudents.DataBind()

                WebMessageBoxStudents.Show("Records Updated Successfully!", "Success")
            Else
                WebMessageBoxStudents.Show("An error occurred during the insert operation.", "Error")
            End If
        Else
            WebMessageBoxStudents.Show("The Following Error Occured: " & e.Exception.Message, "Error")
            e.ExceptionHandled = True
        End If

    End Sub

End Class
