
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            If GridViewGeneralTestsScores.Rows.Count = 0 Then
                PanelTestScores.Visible = False
            Else
                PanelTestScores.Visible = True
            End If
        End If

    End Sub

    Sub Item_DataBound(ByVal sender As Object, ByVal e As DataListItemEventArgs)

        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

            ' Retrieve the Label control in the current DataListItem.
            Dim LabelAnswer As Label = CType(e.Item.FindControl("LabelAnswer"), Label)
            Dim LabelKey As Label = CType(e.Item.FindControl("LabelKey"), Label)

            If LabelAnswer.Text.ToLower = LabelKey.Text.ToLower Then
                LabelAnswer.ForeColor = Drawing.Color.DarkGreen
            Else
                LabelAnswer.ForeColor = Drawing.Color.DarkRed
                LabelAnswer.Font.Underline = True
            End If

        End If

    End Sub

    Protected Sub ButtonFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonFilter.Click

        Dim SqlDataSourceGeneralTestsScores As New SqlDataSource()
        SqlDataSourceGeneralTestsScores.ID = "SqlDataSourceGeneralTestsScores"
        Me.Page.Controls.Add(SqlDataSourceGeneralTestsScores)

        SqlDataSourceGeneralTestsScores.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

        Dim SqlString As String = "SELECT GeneralTestID, GeneralTestName, SectionCatalog, StudentID, StudentName, Correct, Wrong, NotAnswered, Score, CourseCategory, SchoolCode, CurrentSectionID FROM vw_GeneralTestsScoresCalculated "
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

            PanelTestScores.Visible = False

            LabelStatus.Text = "Select A Grade First!"

        Else

            LabelStatus.Text = ""

            PanelStatus.Visible = False

            PanelTestScores.Visible = True

            SqlString += "Where SchoolCode=@SchoolCode And GeneralTestGroupID=@GeneralTestGroupID And CourseCategory=@CourseCategory And (" & SqlStringFilter & ") Order By StudentName"

            SqlDataSourceGeneralTestsScores.SelectCommand = SqlString

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            If SqlDataSourceGeneralTestsScores.SelectParameters.Count = 0 Then
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("SchoolCode", Data.DbType.Int32, DropDownListSchoolCodesMaster.SelectedValue))
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("CourseCategory", Data.DbType.String, DropDownListCourses.SelectedValue))
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("GeneralTestGroupID", Data.DbType.String, DropDownListGeneralTestsGroups.SelectedValue))
            Else
                SqlDataSourceGeneralTestsScores.SelectParameters("SchoolCode").DefaultValue = DropDownListSchoolCodesMaster.SelectedValue
                SqlDataSourceGeneralTestsScores.SelectParameters("CourseCategory").DefaultValue = DropDownListCourses.SelectedValue
                SqlDataSourceGeneralTestsScores.SelectParameters("GeneralTestGroupID").DefaultValue = DropDownListGeneralTestsGroups.SelectedValue
                SqlDataSourceGeneralTestsScores.DataBind()
            End If

            GridViewGeneralTestsScores.DataSource = SqlDataSourceGeneralTestsScores
            GridViewGeneralTestsScores.DataBind()
        End If
    End Sub

    Protected Sub GridViewGeneralTestsScores_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        Try
            If (e.CommandName = "ShowAnswers") Then

                Dim MyCommandArgument As String = e.CommandArgument.ToString()

                Dim MyArguments As String() = New String(2) {}

                Dim splitter As Char() = {";"}

                MyArguments = MyCommandArgument.Split(splitter)

                ' Retrieve the row index stored in the CommandArgument property.
                Dim index As Integer = Convert.ToInt32(MyArguments(0))

                ' Retrieve the row that contains the button from the Rows collection.
                Dim row As GridViewRow = GridViewGeneralTestsScores.Rows(index)

                Dim CourseCategoryLabel As Label = row.FindControl("CourseCategoryLabel")

                CourseCategoryLabel.Text = MyArguments(2) + " - " + MyArguments(1)

                Dim DataListGeneralTestStudentAnswers As DataList = row.FindControl("DataListGeneralTestStudentAnswers")

                Dim SqlDataSourceGeneralTestStudentAnswers As SqlDataSource = row.FindControl("SqlDataSourceGeneralTestStudentAnswers")

                SqlDataSourceGeneralTestStudentAnswers.SelectParameters("CourseCategory").DefaultValue = MyArguments(1)

                DataListGeneralTestStudentAnswers.DataBind()

            End If
        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try
    End Sub


End Class
