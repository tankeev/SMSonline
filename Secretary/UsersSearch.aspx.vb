Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Secretary") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub OnPageIndexChangingGridviewUsers(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridviewUsers.PageIndex = e.NewPageIndex
        Me.BindGridviewUsers()
    End Sub

    Protected Sub OnPageIndexChangingGridviewStudents(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridviewStudents.PageIndex = e.NewPageIndex
        Me.BindGridviewStudents()
    End Sub

    Protected Sub OnPageIndexChangingGridviewStaff(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridviewStaff.PageIndex = e.NewPageIndex
        Me.BindGridviewStaff()
    End Sub

    Protected Sub OnPageIndexChangingGridviewParents(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridviewParents.PageIndex = e.NewPageIndex
        Me.BindGridviewParents()
    End Sub

    Protected Sub OnRowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    e.Row.Cells(1).Text = Regex.Replace(e.Row.Cells(1).Text, TextBoxSearch.Text.Trim(), Function(match As Match) String.Format("<span style = 'background-color:#D9EDF7'>{1}</span>", match.Value), RegexOptions.IgnoreCase)

        'End If
    End Sub

    Private Sub BindGridviewUsers()
        Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Using con As New SqlConnection(conStringSettings)
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT tbl_Schools.SchoolName, aspnet_Users.UserName, aspnet_Roles.RoleName, aspnet_Users.LastActivityDate FROM aspnet_UsersInRoles INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId INNER JOIN tbl_Schools ON aspnet_Users.SchoolCode = tbl_Schools.SchoolCode WHERE UserName LIKE '%' + @UserName + '%'"
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@UserName", TextBoxSearch.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    GridviewUsers.DataSource = dt
                    GridviewUsers.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Private Sub BindGridviewStudents()
        Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Using con As New SqlConnection(conStringSettings)
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT tbl_Students.StudentID, tbl_Students.SchoolCode, aspnet_Users.UserName, tbl_SectionCatalog.SectionCatalog, tbl_Students.StudentName, tbl_Schools.SchoolName FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID INNER JOIN tbl_Schools ON tbl_Students.SchoolCode = tbl_Schools.SchoolCode LEFT OUTER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId  WHERE UserName LIKE '%' + @UserName + '%' OR StudentName LIKE '%' + @StudentName + '%'"
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@StudentName", TextBoxSearch.Text.Trim())
                cmd.Parameters.AddWithValue("@UserName", TextBoxSearch.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    GridviewStudents.DataSource = dt
                    GridviewStudents.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Private Sub BindGridviewStaff()
        Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Using con As New SqlConnection(conStringSettings)
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT tbl_Schools.SchoolName, aspnet_Users.UserName, tbl_Staff.StaffName FROM tbl_Staff INNER JOIN tbl_Schools ON tbl_Staff.SchoolCode = tbl_Schools.SchoolCode LEFT OUTER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId  WHERE UserName LIKE '%' + @UserName + '%' OR StaffName LIKE '%' + @StaffName + '%'"
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@StaffName", TextBoxSearch.Text.Trim())
                cmd.Parameters.AddWithValue("@UserName", TextBoxSearch.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    GridviewStaff.DataSource = dt
                    GridviewStaff.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Private Sub BindGridviewParents()
        Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Using con As New SqlConnection(conStringSettings)
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT tbl_Schools.SchoolName, aspnet_Users.UserName, tbl_Parents.FatherName, tbl_Parents.MotherName FROM tbl_Parents INNER JOIN tbl_Schools ON tbl_Parents.SchoolCode = tbl_Schools.SchoolCode LEFT OUTER JOIN aspnet_Users ON tbl_Parents.ResponsibleParentID = aspnet_Users.UserId  WHERE UserName LIKE '%' + @UserName + '%' OR FatherName LIKE '%' + @FatherName + '%' OR MotherName LIKE '%' + @MotherName + '%'"
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@FatherName", TextBoxSearch.Text.Trim())
                cmd.Parameters.AddWithValue("@MotherName", TextBoxSearch.Text.Trim())
                cmd.Parameters.AddWithValue("@UserName", TextBoxSearch.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    GridviewParents.DataSource = dt
                    GridviewParents.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub ButtonSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSearch.Click
        Try

            BindGridviewUsers()
            BindGridviewStudents()
            BindGridviewStaff()
            BindGridviewParents()

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try

    End Sub


End Class
