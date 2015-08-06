Imports System
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports DayPilot.Utils

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsPostBack Then
            LoadResources()

            DayPilotScheduler1.StartDate = New Date(Date.Today.Year, 1, 1)
            DayPilotScheduler1.Days = Year.Days(Date.Today.Year)
            DayPilotScheduler1.DataSource = DbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days)
            DayPilotScheduler1.DataBind()
        End If
    End Sub

    Private Function DbGetEvents(ByVal start As Date, ByVal days As Integer) As DataTable
        Dim da As New SqlDataAdapter("SELECT [id], [name], [eventstart], [eventend], [resource_id] FROM [event] WHERE NOT (([eventend] <= @start) OR ([eventstart] >= @end))", ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
        da.SelectCommand.Parameters.AddWithValue("start", start)
        da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days))
        Dim dt As New DataTable()
        da.Fill(dt)
        Return dt
    End Function

    Private Sub DbUpdateEvent(ByVal id As String, ByVal start As Date, ByVal [end] As Date, ByVal resource As String)
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("UPDATE [event] SET eventstart = @start, eventend = @end, resource_id = @resource WHERE id = @id", con)
            cmd.Parameters.AddWithValue("id", id)
            cmd.Parameters.AddWithValue("start", start)
            cmd.Parameters.AddWithValue("end", [end])
            cmd.Parameters.AddWithValue("resource", resource)
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Private Sub LoadResources()
        DayPilotScheduler1.Resources.Clear()

        Dim da As New SqlDataAdapter("SELECT [id], [name] FROM [resource]", ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
        Dim dt As New DataTable()
        da.Fill(dt)

        For Each r As DataRow In dt.Rows
            Dim name As String = DirectCast(r("name"), String)
            Dim id_Renamed As String = Convert.ToString(r("id"))

            DayPilotScheduler1.Resources.Add(name, id_Renamed)
        Next r
    End Sub

    Protected Sub LinkButtonSample_Click(ByVal sender As Object, ByVal e As EventArgs)
        DbClearResources()
        DbClearEvents()

        Dim random As New Random()

        For i As Integer = 1 To 10
            DbInsertResource("Room " & i.ToString("D2"), i)

            Dim start As Date = (New Date(Date.Today.Year, Date.Today.Month, 1)).AddDays(random.Next(1, 5))
            For x As Integer = 1 To 100
                Dim duration As Integer = random.Next(3, 8)
                Dim [end] As Date = start.AddDays(duration)
                DbInsertEvent(start, [end], "Reservation #" & i & "-" & x, i)
                start = [end].AddDays(random.Next(1, 5))
            Next x

        Next i

        Response.Redirect(Request.Url.PathAndQuery)
    End Sub

    Private Sub DbInsertResource(ByVal name As String, ByVal id As Integer)
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("INSERT INTO [resource] (name, id) VALUES(@name, @id)", con)
            cmd.Parameters.AddWithValue("name", name)
            cmd.Parameters.AddWithValue("id", id)
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Private Sub DbInsertEvent(ByVal start As Date, ByVal [end] As Date, ByVal name As String, ByVal resource As Integer)
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("INSERT INTO [event] (eventstart, eventend, name, resource_id) VALUES(@start, @end, @name, @resource)", con)
            cmd.Parameters.AddWithValue("start", start)
            cmd.Parameters.AddWithValue("end", [end])
            cmd.Parameters.AddWithValue("name", name)
            cmd.Parameters.AddWithValue("resource", resource)
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Private Sub DbClearEvents()
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("delete from [event]", con)
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Private Sub DbClearResources()
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("delete from [resource]", con)
            cmd.ExecuteNonQuery()
        End Using
    End Sub
End Class
