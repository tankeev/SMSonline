Imports System.Data.SqlClient

Partial Class Students
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.DataBound

        If ListBoxStudents.Items.Count > 0 Then

            ListBoxStudents.SelectedIndex = 0

            FormViewStudentsBasicInformation.DataBind()
            FormViewStudentsAdditionalInformation.DataBind()
            FormViewStudentsEnrollmentDetails.DataBind()
            FormViewParentsGuardianDetails.DataBind()
            FormViewParentsParents.DataBind()

        End If

        LabelTotal.Text = ListBoxStudents.Items.Count.ToString + " Student(s)"
       
    End Sub

    Protected Sub ListBoxStudents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

    Protected Sub DropDownListLevelEnglish_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)

        'Dim DropDownListLevelEnglish As DropDownList = FormViewStudents.FindControl("DropDownListLevelEnglish")

        'Dim li As New ListItem("Not Selected!", "0")

        'DropDownListLevelEnglish.Items.Insert(0, li)

    End Sub

    Protected Sub DropDownListLevelTurkce_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)

        'Dim DropDownListLevelTurkce As DropDownList = FormViewStudents.FindControl("DropDownListLevelTurkce")

        'Dim li As New ListItem("Not Selected!", "0")

        'DropDownListLevelTurkce.Items.Insert(0, li)

    End Sub

    'Protected Sub FormViewStudents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStudents.ItemUpdated

    '    ' Use the Exception property to determine whether an exception
    '    ' occurred during the update operation.

    '    If e.Exception Is Nothing Then

    '        If e.AffectedRows > 0 Then
    '            'Record Inserted Successfully.
    '            LabelStatus.Text = "Updated Successfully!"
    '        Else
    '            LabelStatus.Text = "An error occurred during the insert operation."
    '        End If
    '    Else
    '        LabelStatus.Text = e.Exception.Message
    '        e.ExceptionHandled = True
    '    End If

    'End Sub

    'Protected Sub FormViewStudents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudents.ItemUpdating
    '    e.NewValues("SchoolCode") = DirectCast(DirectCast(sender, FormView).FindControl("SchoolCode"), DropDownList).SelectedValue
    '    e.NewValues("CurrentSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListCurrentGrade"), DropDownList).SelectedValue
    '    e.NewValues("StartingTermID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingTerm"), DropDownList).SelectedValue
    '    e.NewValues("StartingSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingSection"), DropDownList).SelectedValue
    '    e.NewValues("LevelEng") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelEnglish"), DropDownList).SelectedValue
    '    e.NewValues("LevelTr") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelTurkce"), DropDownList).SelectedValue
    '    e.NewValues("BloodType") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListBloodTypeStudent"), DropDownList).SelectedValue
    'End Sub

    'Protected Sub FormViewParents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewParents.ItemUpdated
    '    ' Use the Exception property to determine whether an exception
    '    ' occurred during the update operation.

    '    If e.Exception Is Nothing Then

    '        If e.AffectedRows > 0 Then
    '            'Record Inserted Successfully.
    '            LabelStatus.Text = "Updated Successfully!"
    '        Else
    '            LabelStatus.Text = "An error occurred during the insert operation."
    '        End If
    '    Else
    '        LabelStatus.Text = e.Exception.Message
    '        e.ExceptionHandled = True
    '    End If
    'End Sub

    'Protected Sub FormViewParents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewParents.ItemUpdating
    '    e.NewValues("SchoolCode") = DirectCast(DirectCast(sender, FormView).FindControl("SchoolCode"), DropDownList).SelectedValue
    'End Sub



End Class
