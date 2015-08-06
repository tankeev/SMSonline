
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub RadioButtonListSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.DataBound
        If RadioButtonListSections.Items.Count <> 0 Then
            RadioButtonListSections.SelectedIndex = 0
            GridViewStudents.DataBind()
        End If
    End Sub

    Protected Sub GridViewStudents_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewStudents.RowUpdating
        e.NewValues("SectionCatalogID") = DirectCast(GridViewStudents.Rows(e.RowIndex).FindControl("DropDownListSections"), DropDownList).SelectedValue
    End Sub

    Protected Sub DropDownListSectionsMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim DropDownListSectionsMaster As DropDownList = DirectCast(sender, DropDownList)

            If Not DropDownListSectionsMaster.SelectedValue = 0 Then

                For Each GridviewStudentsRow As GridViewRow In GridViewStudents.Rows
                    If GridviewStudentsRow.RowType = DataControlRowType.DataRow Then
                        Dim DropDownListSections As DropDownList = GridviewStudentsRow.FindControl("DropDownListSections")

                        DropDownListSections.SelectedValue = DropDownListSectionsMaster.SelectedValue
                    End If
                Next
            End If
        Catch ex As Exception
            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub

    Protected Sub GridViewStudentsGraduatedAll(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            For Each GridviewStudentsRow As GridViewRow In GridViewStudents.Rows
                If GridviewStudentsRow.RowType = DataControlRowType.DataRow Then

                    Dim LabelStudentID As Label = GridviewStudentsRow.FindControl("LabelStudentID")

                    SqlDataSourceStudentsGraduated.UpdateParameters.Item("StudentID").DefaultValue = LabelStudentID.Text
                    SqlDataSourceStudentsGraduated.UpdateParameters.Item("Continue").DefaultValue = 0

                    SqlDataSourceStudentsGraduated.Update()

                End If
            Next

            GridViewStudents.DataBind()

            WebMessageBoxStudents.Show("Done! Records Have Been Successfully Updated!", "Success")

        Catch ex As Exception
            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try
            For Each GridviewStudentsRow As GridViewRow In GridViewStudents.Rows
                If GridviewStudentsRow.RowType = DataControlRowType.DataRow Then

                    Dim LabelStudentID As Label = GridviewStudentsRow.FindControl("LabelStudentID")
                    Dim DropDownListSections As DropDownList = GridviewStudentsRow.FindControl("DropDownListSections")
                    Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")

                    SqlDataSourceStudents.UpdateParameters.Item("StudentID").DefaultValue = LabelStudentID.Text
                    SqlDataSourceStudents.UpdateParameters.Item("SectionCatalogID").DefaultValue = DropDownListSections.SelectedValue
                    SqlDataSourceStudents.UpdateParameters.Item("AcademicTermID").DefaultValue = DropDownListAcademicTermsMaster.SelectedValue

                    SqlDataSourceStudents.Update()

                End If
            Next

            GridViewStudents.DataBind()

            WebMessageBoxStudents.Show("Done! Records Have Been Successfully Updated!", "Success")

        Catch ex As Exception
            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub


End Class
