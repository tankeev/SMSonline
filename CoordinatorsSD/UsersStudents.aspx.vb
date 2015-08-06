Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class Students
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.DataBound, ListBoxStudents.SelectedIndexChanged

        Try

            If ListBoxStudents.Items.Count > 0 Then
                FormViewStudentsBasicInformation.DataBind()
                FormViewStudentsAdditionalInformation.DataBind()
                FormViewStudentsEnrollmentDetails.DataBind()
                FormViewParentsGuardianDetails.DataBind()
                FormViewParentsParentsInformation.DataBind()
            End If

            LabelTotal.Text = ListBoxStudents.Items.Count.ToString + " Student(s)"
            LabelStatus.Text = ""

        Catch ex As Exception
            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub

    Protected Sub DropDownListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

    Protected Sub SqlDataSourceListBoxStudents_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourceListBoxStudents.Selecting
        Try

            If CheckBoxSD.Checked = True Then
                e.Command.Parameters("@IsSD").Value = "SD"
            Else
                e.Command.Parameters("@IsSD").Value = ""
            End If

            If CheckBoxSMP.Checked = True Then
                e.Command.Parameters("@IsSMP").Value = "SMP"
            Else
                e.Command.Parameters("@IsSMP").Value = ""
            End If

            If CheckBoxSMA.Checked = True Then
                e.Command.Parameters("@IsSMA").Value = "SMA"
            Else
                e.Command.Parameters("@IsSMA").Value = ""
            End If

            If CheckBoxFilter.Checked = True Then
                SqlDataSourceListBoxStudents.FilterExpression = "CurrentSectionID={0}"
            Else
                SqlDataSourceListBoxStudents.FilterExpression = ""
            End If

        Catch ex As Exception

            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try

    End Sub

    Protected Sub CheckBoxSD_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSD.CheckedChanged
        If CheckBoxSD.Checked = True Then
            SqlDataSourceListBoxStudents.SelectParameters("IsSD").DefaultValue = "SD"
        Else
            SqlDataSourceListBoxStudents.SelectParameters("IsSD").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMA_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMA.CheckedChanged
        If CheckBoxSMA.Checked = True Then
            SqlDataSourceListBoxStudents.SelectParameters("IsSMA").DefaultValue = "SMA"
        Else
            SqlDataSourceListBoxStudents.SelectParameters("IsSMA").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMP_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMP.CheckedChanged
        If CheckBoxSMP.Checked = True Then
            SqlDataSourceListBoxStudents.SelectParameters("IsSMP").DefaultValue = "SMP"
        Else
            SqlDataSourceListBoxStudents.SelectParameters("IsSMP").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxFilter_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxFilter.CheckedChanged
        If CheckBoxFilter.Checked = True Then
            DropDownListSections.Enabled = True

            CheckBoxSD.Checked = True
            CheckBoxSD.Enabled = False
            'CheckBoxSMP.Checked = True
            'CheckBoxSMP.Enabled = False
            'CheckBoxSMA.Checked = True
            'CheckBoxSMA.Enabled = False

            SqlDataSourceListBoxStudents.FilterExpression = "CurrentSectionID=" & DropDownListSections.SelectedValue
        Else
            DropDownListSections.Enabled = False

            CheckBoxSD.Enabled = True
            'CheckBoxSMP.Enabled = True
            'CheckBoxSMA.Enabled = True

            SqlDataSourceListBoxStudents.FilterExpression = ""
        End If
    End Sub

    Protected Sub FormViewStudents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsBasicInformation.ItemUpdating
        e.NewValues("CurrentSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListCurrentGrade"), DropDownList).SelectedValue
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
