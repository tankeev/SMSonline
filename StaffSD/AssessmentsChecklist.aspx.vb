Imports System.Data.SqlClient
Imports System.Data
Imports System.Web.Configuration

Partial Class AssessmentTypesSchools
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub ListBoxCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.DataBound
        If ListBoxCourses.Items.Count > 0 Then
            ListBoxCourses.SelectedIndex = 0
        End If
    End Sub

    Protected Sub ListBoxCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.SelectedIndexChanged
        LabelStatus.Text = ""
        TextBoxAssessmentName.Text = ""
    End Sub

    Protected Sub GridViewAssessments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssessments.DataBound
        If GridViewAssessments.Rows.Count = 0 Then
            ButtonUpdate.Visible = False
        Else
            ButtonUpdate.Visible = True
        End If
    End Sub

    Protected Sub ButtonAddAssessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssessment.Click
        Try

            If Not DropDownListAssessmentTypes.SelectedValue = Nothing Then

                Dim conString As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

                Dim query As String = "INSERT INTO tbl_Assessments(CourseSectionAssessmentTypeID, Assessment, Date) VALUES (@CourseSectionAssessmentTypeID, @Assessment, @Date); Select Scope_Identity()"

                Dim AssessmentID As Integer

                Using conn As New SqlConnection(conString)

                    Using cmd As New SqlCommand(query, conn)

                        cmd.Parameters.AddWithValue("@CourseSectionAssessmentTypeID", DropDownListAssessmentTypes.SelectedValue)
                        cmd.Parameters.AddWithValue("@Assessment", TextBoxAssessmentName.Text)

                        Dim myzone As TimeZone = TimeZone.CurrentTimeZone
                        Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
                        Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

                        cmd.Parameters.AddWithValue("@Date", uiversalDateTime.Date)

                        conn.Open()

                        AssessmentID = cmd.ExecuteScalar()

                    End Using

                End Using

                SqlDataSourceCourseSectionsStudents.FilterExpression = "CourseSectionID = '" & ListBoxCourses.SelectedValue & "'"
                SqlDataSourceCourseSectionsStudents.DataBind()


                Dim StudentData As New GridView
                StudentData.DataSource = SqlDataSourceCourseSectionsStudents
                StudentData.DataBind()

                If Not StudentData.Rows.Count = 0 Then
                    For Each StudentDataRow As GridViewRow In StudentData.Rows
                        SqlDataSourceCourseSectionsStudents.InsertParameters.Clear()
                        SqlDataSourceCourseSectionsStudents.InsertParameters.Add("StudentID", StudentDataRow.Cells(1).Text)
                        SqlDataSourceCourseSectionsStudents.InsertParameters.Add("AssessmentID", AssessmentID)
                        SqlDataSourceCourseSectionsStudents.InsertParameters.Add("AssessmentMark", 0)
                        SqlDataSourceCourseSectionsStudents.InsertParameters.Add("Excused", 0)
                        SqlDataSourceCourseSectionsStudents.Insert()
                    Next
                End If


                SqlDataSourceCourseSectionsStudents.FilterExpression = ""
                SqlDataSourceCourseSectionsStudents.DataBind()

                GridViewAssessments.DataBind()

                WebMessageBoxChecklist.Show("Assessment(s) added successfully!", "Success")

            Else

                WebMessageBoxChecklist.Show("There is no Assessment Type Found!", "Warning")


            End If
        Catch ex As Exception
            WebMessageBoxChecklist.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try

            For Each GridViewRow As GridViewRow In GridViewAssessments.Rows

                Dim AssessmentID As Integer = Convert.ToInt32(GridViewAssessments.DataKeys(GridViewRow.RowIndex).Value)
                Dim GVDropDownListAssessmentTypes As DropDownList = GridViewRow.FindControl("DropDownListAssessmentTypes")
                Dim GVTextBoxAssessmentName As TextBox = GridViewRow.FindControl("TextBoxAssessmentName")

                SqlDataSourceAssessments.UpdateParameters.Clear()
                SqlDataSourceAssessments.UpdateParameters.Add("CourseSectionAssessmentTypeID", GVDropDownListAssessmentTypes.SelectedValue)
                SqlDataSourceAssessments.UpdateParameters.Add("Assessment", GVTextBoxAssessmentName.Text)
                SqlDataSourceAssessments.UpdateParameters.Add("AssessmentID", AssessmentID)

                SqlDataSourceAssessments.Update()

            Next

            GridViewAssessments.DataBind()

            WebMessageBoxChecklist.Show("Done! Records Have Been Successfully Updated", "Success")

        Catch ex As Exception
            WebMessageBoxChecklist.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ImageButtonClick_AssessmentDelete(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            Dim ImageButtonDelete As ImageButton = DirectCast(sender, ImageButton)
            Dim GridViewAssessmentsRow As GridViewRow = DirectCast(ImageButtonDelete.NamingContainer, GridViewRow)

            Dim CheckBoxIsLocked As CheckBox = DirectCast(GridViewAssessmentsRow.FindControl("CheckBoxIsLocked"), CheckBox)
            Dim LabelAID As Label = DirectCast(GridViewAssessmentsRow.FindControl("LabelAID"), Label)

            If CheckBoxIsLocked.Checked = True Then
                WebMessageBoxChecklist.Show("Sorry, This Assessment Has Been Locked, Cannot Be Deleted!", "Warning")
            Else
                SqlDataSourceAssessments.DeleteParameters.Clear()
                SqlDataSourceAssessments.DeleteParameters.Add("AssessmentID", LabelAID.Text)

                SqlDataSourceAssessments.Delete()

                WebMessageBoxChecklist.Show("Assessment Has Been Successfully Deleted!", "Success")
            End If
        Catch ex As Exception
            WebMessageBoxChecklist.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub
End Class
