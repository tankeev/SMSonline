Imports System.Data.SqlClient
Imports System.Data

Partial Class CoursesAdd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdateCourseStudents_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateCourseStudents.Click
        Try
            For Each listItem As ListItem In CheckBoxListSections.Items

                If listItem.Selected = True Then

                    'GET SECTION STUDENTS
                    Dim sqlconnStudents As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandGetRecordsStudents As New SqlCommand("SELECT StudentID FROM tbl_AcademicTermsStudents WHERE (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode)", sqlconnStudents)

                    Dim SchoolCode As New SqlParameter("SchoolCode", System.Data.OleDb.OleDbType.Integer)
                    Dim SectionCatalogID As New SqlParameter("SectionCatalogID", System.Data.OleDb.OleDbType.Integer)
                    Dim AcademicTermID As New SqlParameter("AcademicTermID", System.Data.OleDb.OleDbType.Integer)

                    Dim DropDownListAcademicTermsMaster As DropDownList = Master.Master.FindControl("DropDownListAcademicTermsMaster")

                    SchoolCode.Value = RadioButtonListSchools.SelectedValue
                    SectionCatalogID.Value = listItem.Value
                    AcademicTermID.Value = DropDownListAcademicTermsMaster.SelectedValue

                    commandGetRecordsStudents.Parameters.Add(AcademicTermID)
                    commandGetRecordsStudents.Parameters.Add(SectionCatalogID)
                    commandGetRecordsStudents.Parameters.Add(SchoolCode)

                    Dim dsStudents As New DataSet
                    Dim sqlAdapterStudents As New SqlDataAdapter(commandGetRecordsStudents)

                    sqlconnStudents.Open()
                    sqlAdapterStudents.Fill(dsStudents)

                    sqlconnStudents.Close()
                    commandGetRecordsStudents.Parameters.Clear()

                    ListBoxStatus.Items.Add("Total: " & dsStudents.Tables(0).Rows.Count & " Section Students Selected!")

                    'GET COURSE SECTIONS

                    Dim sqlconnCourseSections As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandGetRecordsCourseSections As New SqlCommand("SELECT CourseSectionID FROM vw_CourseSections WHERE (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID)", sqlconnCourseSections)

                    SectionCatalogID.Value = listItem.Value
                    AcademicTermID.Value = DropDownListAcademicTerms.SelectedValue

                    commandGetRecordsCourseSections.Parameters.Add(AcademicTermID)
                    commandGetRecordsCourseSections.Parameters.Add(SchoolCode)
                    commandGetRecordsCourseSections.Parameters.Add(SectionCatalogID)

                    Dim dsCourseSections As New DataSet
                    Dim sqlAdapterCourseSections As New SqlDataAdapter(commandGetRecordsCourseSections)

                    sqlconnCourseSections.Open()
                    sqlAdapterCourseSections.Fill(dsCourseSections)

                    sqlconnCourseSections.Close()
                    commandGetRecordsCourseSections.Parameters.Clear()

                    ListBoxStatus.Items.Add("Total: " & dsCourseSections.Tables(0).Rows.Count & " Course Sections Selected!")

                    'COPY

                    For Each CourseSectionRow As DataRow In dsCourseSections.Tables(0).Rows

                        For Each StudentRow As DataRow In dsStudents.Tables(0).Rows

                            SqlDataSourceCourseStudents.InsertParameters.Item("CourseSectionID").DefaultValue = CourseSectionRow.Item(0)
                            SqlDataSourceCourseStudents.InsertParameters.Item("StudentID").DefaultValue = Convert.ToString(StudentRow.Item(0))

                            SqlDataSourceCourseStudents.Insert()

                        Next

                    Next

                    ListBoxStatus.Items.Add("Data Has Been Updated Successfully!")

                End If

            Next

            LabelStatus.Text = "Data Has Been Updated Successfully!"

        Catch ex As Exception

            LabelStatus.Text = "Error:" + ex.Message

        End Try
    End Sub

    Protected Sub RadioButtonListSchools_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSchools.SelectedIndexChanged
        ListBoxStatus.Items.Clear()
    End Sub
End Class
