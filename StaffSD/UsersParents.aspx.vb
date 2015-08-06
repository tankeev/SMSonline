Imports System.Data.SqlClient
Imports System.Data

Partial Class Users_Parents
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxParents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxParents.DataBound

        FormViewParentsOverview.DataBind()
        FormViewParentsAdditional.DataBind()
        FormViewParentsNotes.DataBind()

        LabelTotal.Text = ListBoxParents.Items.Count.ToString + " Parent(s)"
    End Sub

    'Protected Sub FormViewParents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewParents.ItemUpdated
    '    ' Use the Exception property to determine whether an exception
    '    ' occurred during the update operation.

    '    If e.Exception Is Nothing Then

    '        If e.AffectedRows = 1 Then
    '            'Record Inserted Successfully.
    '            LabelStatus.Text = "Updated Successfully!"

    '            'GridViewStaff.DataBind()
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

    'Protected Sub ButtonSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSearch.Click
    '    If Trim(TextBoxSearchUser.Text <> "") Then
    '        SqlDataSourceListBoxParents.FilterExpression = "ResponsibleParent LIKE '{1}%' "
    '    Else
    '        SqlDataSourceListBoxParents.FilterExpression = ""
    '    End If
    '    ListBoxParents.DataBind()
    'End Sub

    Protected Sub SqlDataSourceListBoxStudents_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourceListBoxParents.Selecting
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
                SqlDataSourceListBoxParents.FilterExpression = "CurrentSectionID={0}"
            Else
                SqlDataSourceListBoxParents.FilterExpression = ""
            End If

        Catch ex As Exception
            ' LabelStatus.Text = ex.Message

            WebMessageBoxAttendance.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try
    End Sub

    Protected Sub CheckBoxSD_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSD.CheckedChanged
        If CheckBoxSD.Checked = True Then
            SqlDataSourceListBoxParents.SelectParameters("IsSD").DefaultValue = "SD"
        Else
            SqlDataSourceListBoxParents.SelectParameters("IsSD").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMA_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMA.CheckedChanged
        If CheckBoxSMA.Checked = True Then
            SqlDataSourceListBoxParents.SelectParameters("IsSMA").DefaultValue = "SMA"
        Else
            SqlDataSourceListBoxParents.SelectParameters("IsSMA").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMP_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMP.CheckedChanged

        If CheckBoxSMP.Checked = True Then
            SqlDataSourceListBoxParents.SelectParameters("IsSMP").DefaultValue = "SMP"
        Else
            SqlDataSourceListBoxParents.SelectParameters("IsSMP").DefaultValue = ""
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

            SqlDataSourceListBoxParents.FilterExpression = "CurrentSectionID={0}"
        Else
            DropDownListSections.Enabled = False

            CheckBoxSD.Enabled = True
            'CheckBoxSMP.Enabled = True
            'CheckBoxSMA.Enabled = True

            SqlDataSourceListBoxParents.FilterExpression = ""
        End If
    End Sub

    Protected Sub DropDownListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.SelectedIndexChanged

        SqlDataSourceListBoxParents.DataBind()
        SqlDataSourceListBoxParents.DataBind()

        LabelStatus.Text = ""
    End Sub
End Class
