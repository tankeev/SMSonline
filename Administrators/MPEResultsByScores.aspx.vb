Partial Class General_Test_Scores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If DataListGeneralTestsStudents.Items.Count = 0 Then
            PanelScores.Visible = False
        Else
            PanelScores.Visible = True
        End If

    End Sub

    Protected Sub ButtonFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonFilter.Click

        Dim SqlDataSourceGeneralTestsScores As New SqlDataSource()
        SqlDataSourceGeneralTestsScores.ID = "SqlDataSourceGeneralTestsScores"
        Me.Page.Controls.Add(SqlDataSourceGeneralTestsScores)

        SqlDataSourceGeneralTestsScores.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

        Dim SqlString As String = "SELECT GeneralTestGroupID, SchoolCode, CurrentSectionID, SectionCatalog, StudentID, StudentName FROM vw_GeneralTestsStudentsList "

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

            SqlString += "Where SchoolCode=@SchoolCode And GeneralTestGroupID=@GeneralTestGroupID And (" & SqlStringFilter & ") Order By StudentName"

            SqlDataSourceGeneralTestsScores.SelectCommand = SqlString

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            If SqlDataSourceGeneralTestsScores.SelectParameters.Count = 0 Then
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("SchoolCode", Data.DbType.Int32, DropDownListSchoolCodesMaster.SelectedValue))
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("GeneralTestGroupID", Data.DbType.String, DropDownListGeneralTestsGroups.SelectedValue))
            Else
                SqlDataSourceGeneralTestsScores.SelectParameters("SchoolCode").DefaultValue = DropDownListSchoolCodesMaster.SelectedValue
                SqlDataSourceGeneralTestsScores.SelectParameters("GeneralTestGroupID").DefaultValue = DropDownListGeneralTestsGroups.SelectedValue
                SqlDataSourceGeneralTestsScores.DataBind()
            End If
            DataListGeneralTestsStudents.DataSource = SqlDataSourceGeneralTestsScores
            DataListGeneralTestsStudents.DataBind()
        End If
    End Sub



End Class
