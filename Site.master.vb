Imports System.Data.SqlClient
Imports System.Data
Imports System.Web.Configuration

Partial Class Site

    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'SESSION INFORMATION ============================================================
        If Session("UserID") = Nothing Then
            Session("UserID") = Membership.GetUser().ProviderUserKey.ToString()
        End If

        If Session("SchoolCode") = Nothing Then
            Session("SchoolCode") = Profile.SchoolCode
        End If

        If Session("AcademicTermID") = Nothing Then
            Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
            Dim dadSettings As New SqlDataAdapter("SELECT * FROM tbl_GlobalSettings ", conStringSettings)
            Dim dtblSettings As New DataTable()
            dadSettings.Fill(dtblSettings)
            Session("AcademicTermID") = dtblSettings.Rows.Item(0).Item("AcademicTermID")
            DropDownListAcademicTermsMaster.SelectedValue = Session("AcademicTermID")
        End If

        'ACTIVE USERS INFORMATION ===========================================================
        'LabelUsersOnline.Text = "On our Website now, there are " + Membership.GetNumberOfUsersOnline.ToString + " Members."

        'MESSAGEBOX INFORMATION ===========================================================
        Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
        Dim commandGetRecords As New SqlCommand("SELECT UserID, [Read], COUNT(*) AS Total FROM tbl_MessageBox GROUP BY UserID, [Read] HAVING (UserID = @UserID) AND ([Read] = 0)", sqlconn)
        Dim User As New SqlParameter("UserID", System.Data.OleDb.OleDbType.Guid)
        User.Value = Session("UserID")
        commandGetRecords.Parameters.Add(User)

        Dim ds As New DataSet
        Dim sqlAdapter As New SqlDataAdapter(commandGetRecords)
        sqlconn.Open()
        sqlAdapter.Fill(ds)

        LabelMessageCounter.Text = "(" & ds.Tables(0).Rows.Count & ")"

    End Sub

    Protected Sub Login_Status_Logging_Out(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs)
        HttpContext.Current.Session.Clear()
        HttpContext.Current.Session.Abandon()
    End Sub

    Protected Sub DropDownListSchoolCodesMaster_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSchoolCodesMaster.PreRender
        If Not Session("SchoolCode") = Nothing Then
            DropDownListSchoolCodesMaster.SelectedValue = Session("SchoolCode")
        End If
    End Sub

    Protected Sub DropDownListAcademicTermsMaster_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListAcademicTermsMaster.PreRender
        If Not Session("AcademicTermID") = Nothing Then
            DropDownListAcademicTermsMaster.SelectedValue = Session("AcademicTermID")
        End If

        If Roles.IsUserInRole("Administrator") Then
            DropDownListSchoolCodesMaster.Enabled = True
        Else
            DropDownListSchoolCodesMaster.Enabled = False
        End If
    End Sub

    Protected Sub DropDownListAcademicTermsMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListAcademicTermsMaster.SelectedIndexChanged
        Session("AcademicTermID") = DropDownListAcademicTermsMaster.SelectedValue
    End Sub

    Protected Sub DropDownListSchoolCodesMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSchoolCodesMaster.SelectedIndexChanged
        Session("SchoolCode") = DropDownListSchoolCodesMaster.SelectedValue
    End Sub

    Protected Sub ImageButtonProfile_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("~/Profile/Profile.aspx")
    End Sub

    Protected Sub ImageButtonMessageBox_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("~/Profile/Inbox.aspx")
    End Sub

    Protected Sub ImageButtonSetup_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("~/Setup/")
    End Sub

    Protected Sub ImageButtonTrainer_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("~/Development/")
    End Sub

    Protected Sub ImageButtonDepartment_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("~/Department/")
    End Sub


End Class

