
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CheckBoxCheckAllLeft_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCheckAllLeft.CheckedChanged
        For Each CheckBoxListLeftItem As ListItem In CheckBoxListLeft.Items
            If CheckBoxListLeftItem.Selected Then
                CheckBoxListLeftItem.Selected = False
            Else
                CheckBoxListLeftItem.Selected = True
            End If
        Next
    End Sub

    Protected Sub CheckBoxCheckAllRight_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCheckAllRight.CheckedChanged
        For Each CheckBoxListRightItem As ListItem In CheckBoxListRight.Items
            If CheckBoxListRightItem.Selected Then
                CheckBoxListRightItem.Selected = False
            Else
                CheckBoxListRightItem.Selected = True
            End If
        Next
    End Sub

    Protected Sub CheckBoxListLeft_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListLeft.DataBound
        LabelTotalStudentsLeft.Text = "Total " & CheckBoxListLeft.Items.Count.ToString & " Students Found."
    End Sub

    Protected Sub CheckBoxListRight_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListRight.DataBound
        LabelTotalStudentsRight.Text = "Total " & CheckBoxListRight.Items.Count.ToString & " Students Found."
    End Sub

    Protected Sub ButtonAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAdd.Click

        Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
        Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

        If Not RadioButtonListSectionsRight.SelectedValue = "" Then

            For Each CheckBoxListLeftItem As ListItem In CheckBoxListLeft.Items

                If CheckBoxListLeftItem.Selected = True Then

                    SqlDataSourceAcademicTermsStudents.InsertParameters.Clear()
                    SqlDataSourceAcademicTermsStudents.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsRight.SelectedValue)
                    SqlDataSourceAcademicTermsStudents.InsertParameters.Add("StudentID", CheckBoxListLeftItem.Value)
                    SqlDataSourceAcademicTermsStudents.InsertParameters.Add("SectionCatalogID", RadioButtonListSectionsRight.SelectedValue)
                    SqlDataSourceAcademicTermsStudents.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                    SqlDataSourceAcademicTermsStudents.Insert()

                End If

            Next

        End If
    End Sub

    Protected Sub ButtonRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonRemove.Click
        For Each CheckBoxListRightItem As ListItem In CheckBoxListRight.Items

            If CheckBoxListRightItem.Selected = True Then

                SqlDataSourceAcademicTermsStudents.DeleteParameters.Clear()
                SqlDataSourceAcademicTermsStudents.DeleteParameters.Add("AcademicTermID", DropDownListAcademicTermsRight.SelectedValue)
                SqlDataSourceAcademicTermsStudents.DeleteParameters.Add("StudentID", CheckBoxListRightItem.Value)
                SqlDataSourceAcademicTermsStudents.DeleteParameters.Add("SectionCatalogID", RadioButtonListSectionsRight.SelectedValue)
                SqlDataSourceAcademicTermsStudents.Delete()

            End If

        Next
    End Sub

    Protected Sub RadioButtonListSectionsLeft_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSectionsLeft.SelectedIndexChanged
        CheckBoxCheckAllLeft.Checked = False
    End Sub

    Protected Sub ButtonArchiveStudents_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonArchiveStudents.Click

        Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
        Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

        Try

            SqlDataSourceAcademicTermsStudents.InsertParameters.Clear()
            SqlDataSourceAcademicTermsStudents.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsRight.SelectedValue)
            SqlDataSourceAcademicTermsStudents.InsertParameters.Add("StudentID", DropDownListArchiveStudents.SelectedValue)
            SqlDataSourceAcademicTermsStudents.InsertParameters.Add("SectionCatalogID", RadioButtonListSectionsRight.SelectedValue)
            SqlDataSourceAcademicTermsStudents.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
            SqlDataSourceAcademicTermsStudents.Insert()

            LabelTotalStudentsLeft.Text = "Total " & CheckBoxListLeft.Items.Count.ToString & " Students Found."

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub
End Class
