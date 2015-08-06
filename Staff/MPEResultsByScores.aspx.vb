Partial Class General_Test_Scores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If DataListGeneralTestsStudents.Items.Count = 0 Then
            PanelScores.Visible = False
        Else
            PanelScores.Visible = True
        End If

    End Sub

    Protected Sub ButtonFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonFilter.Click
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            Dim SqlString As String = "SELECT [SchoolCode], [CurrentSectionID], [StudentID], [StudentName] FROM [tbl_Students] "
            Dim SqlStringFilter As String = String.Empty
            Dim SelectedItemCounter As Integer = 0

            For Each listItem As ListItem In CheckBoxListSections.Items
                SqlStringFilter += If(listItem.Selected, String.Format("CurrentSectionID='{0}' OR ", listItem.Value), "")
                If listItem.Selected Then
                    SelectedItemCounter += 1
                End If
            Next

            If Not String.IsNullOrEmpty(SqlStringFilter) Then
                SqlStringFilter = SqlStringFilter.Substring(0, SqlStringFilter.Length - 3)
            End If

            If SelectedItemCounter = 0 Then

                PanelStatus.Visible = True
                PanelScores.Visible = False

                LabelStatus.Text = "Select A Grade First!"

            Else

                LabelCheck.Text = ""

                PanelStatus.Visible = False
                PanelScores.Visible = True

                SqlString += " Where SchoolCode=@SchoolCode And (" & SqlStringFilter & ") Order By StudentName"

                SqlDataSourceGeneralTestsScores.SelectCommand = SqlString

                SqlDataSourceGeneralTestsScores.SelectParameters.Clear()
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("SchoolCode", Data.DbType.Int32, DropDownListSchoolCodesMaster.SelectedValue))
                SqlDataSourceGeneralTestsScores.DataBind()

                DataListGeneralTestsStudents.DataSource = SqlDataSourceGeneralTestsScores
                DataListGeneralTestsStudents.DataBind()

            End If

        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try
    End Sub

    Protected Sub DataListGeneralTestsStudents_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListGeneralTestsStudents.ItemDataBound
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            Dim HiddenFieldStudentID As HiddenField = e.Item.FindControl("HiddenFieldStudentID")
            Dim DataListGeneralTestsReports As DataList = e.Item.FindControl("DataListGeneralTestsReports")

            DataListGeneralTestsReports.DataSource = SqlDataSourceGeneralTestsReports

            SqlDataSourceGeneralTestsReports.SelectParameters("StudentID").DefaultValue = HiddenFieldStudentID.Value
            SqlDataSourceGeneralTestsReports.SelectParameters("GeneralTestGroupID").DefaultValue = DropDownListGeneralTestsGroups.SelectedValue
            SqlDataSourceGeneralTestsReports.SelectParameters("AcademicTermID").DefaultValue = DropDownListAcademicTermsMaster.SelectedValue

            DataListGeneralTestsReports.DataBind()

        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try

    End Sub
End Class
