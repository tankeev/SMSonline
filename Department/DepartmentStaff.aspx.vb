Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub DropDownListAcademicTerms_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListAcademicTerms.DataBound
        RadioButtonListCourses.DataBind()
    End Sub

    Protected Sub RadioButtonListCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListCourses.DataBound
        If RadioButtonListCourses.Items.Count > 0 Then

            RadioButtonListCourses.SelectedIndex = 0

            GridViewDepartmentStaff.DataBind()
        End If
    End Sub

    Protected Sub CheckBoxFilter_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxFilter.CheckedChanged, ListBoxSchoolCodes.SelectedIndexChanged

        If CheckBoxFilter.Checked Then

            If (ListBoxSchoolCodes.Items.Count > 0) And (ListBoxSchoolCodes.SelectedIndex = -1) Then
                ListBoxSchoolCodes.SelectedIndex = 0
            End If

            SqlDataSourceDepartmentStaff.FilterExpression = "SchoolCode=" & ListBoxSchoolCodes.SelectedValue & ""

        Else

            SqlDataSourceDepartmentStaff.FilterExpression = ""

        End If

        GridViewDepartmentStaff.DataBind()

    End Sub
End Class
