Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser
Imports System.Text
Imports System.Web.Configuration

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.DataBound
        If ListBoxStudents.Items.Count > 0 Then
            ListBoxStudents.SelectedIndex = 0
            LabelStudentName.Text = ListBoxStudents.SelectedItem.Text
            BindGridViewAssessmentsMarks()
        End If

        LabelTotal.Text = ListBoxStudents.Items.Count.ToString + " Student(s)"
    End Sub

    Protected Sub ListBoxStudents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.SelectedIndexChanged
        BindGridViewAssessmentsMarks()
        LabelStudentName.Text = ListBoxStudents.SelectedItem.Text
    End Sub

    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridViewAssessmentsMarks.PageIndex = e.NewPageIndex
        Me.BindGridViewAssessmentsMarks()
    End Sub

    Private Sub BindGridViewAssessmentsMarks()

        Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
        Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Using con As New SqlConnection(conStringSettings)
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT StudentName, CourseCategory, Assessment, AssessmentMark AS Score, Date FROM vw_AssessmentsByStudents WHERE AcademicTermID = @AcademicTermID  AND StudentID = @StudentID ORDER BY CourseCategory"
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                cmd.Parameters.AddWithValue("@StudentID", ListBoxStudents.SelectedValue)
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    GridViewAssessmentsMarks.DataSource = dt
                    GridViewAssessmentsMarks.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub ImageButtonExcel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonExcel.Click
        Dim filename As String = "AssessmentMarks_" + ListBoxStudents.SelectedIndex.ToString + ".xls"

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages
            GridViewAssessmentsMarks.AllowPaging = False
            Me.BindGridViewAssessmentsMarks()

            GridViewAssessmentsMarks.HeaderRow.BackColor = System.Drawing.Color.White
            For Each cell As TableCell In GridViewAssessmentsMarks.HeaderRow.Cells
                cell.BackColor = GridViewAssessmentsMarks.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In GridViewAssessmentsMarks.Rows
                row.BackColor = System.Drawing.Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = GridViewAssessmentsMarks.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = GridViewAssessmentsMarks.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            GridViewAssessmentsMarks.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()
        End Using
    End Sub

    Protected Sub ImageButtonWord_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonWord.Click

        Dim filename As String = "AssessmentMarks_" + ListBoxStudents.SelectedIndex.ToString + ".doc"

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-word "

        Dim sw As New StringWriter()

        Dim hw As New HtmlTextWriter(sw)

        GridViewAssessmentsMarks.AllowPaging = False

        Me.BindGridViewAssessmentsMarks()

        GridViewAssessmentsMarks.RenderControl(hw)

        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
    End Sub

    Protected Sub ImageButtonPDF_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPDF.Click

        Me.BindGridViewAssessmentsMarks()

        'Create a table
        Dim table As New iTextSharp.text.Table(GridViewAssessmentsMarks.Columns.Count)
        table.Cellpadding = 5

        'Set the column widths
        Dim widths As Integer() = New Integer(GridViewAssessmentsMarks.Columns.Count - 1) {}
        For x As Integer = 0 To GridViewAssessmentsMarks.Columns.Count - 1
            widths(x) = CInt(GridViewAssessmentsMarks.Columns(x).ItemStyle.Width.Value)
            Dim cellText As String = Server.HtmlDecode(GridViewAssessmentsMarks.HeaderRow.Cells(x).Text)
            Dim cell As New iTextSharp.text.Cell(cellText)
            'cell.BackgroundColor = New Color(System.Drawing.ColorTranslator.FromHtml("#008000"))
            table.AddCell(cell)

        Next
        table.SetWidths(widths)

        'Transfer rows from GridView to table
        For i As Integer = 0 To GridViewAssessmentsMarks.Rows.Count - 1
            If GridViewAssessmentsMarks.Rows(i).RowType = DataControlRowType.DataRow Then
                For j As Integer = 0 To GridViewAssessmentsMarks.Columns.Count - 1
                    Dim cellText As String = Server.HtmlDecode(GridViewAssessmentsMarks.Rows(i).Cells(j).Text)
                    Dim cell As New iTextSharp.text.Cell(cellText)
                    'Set Color of Alternating row
                    If i Mod 2 <> 0 Then
                        'cell.BackgroundColor = New Color(System.Drawing.ColorTranslator.FromHtml("#C2D69B"))
                    End If
                    table.AddCell(cell)
                Next
            End If
        Next

        'Create the PDF Document

        Dim pdfDoc As New Document(PageSize.A4, 10.0F, 10.0F, 10.0F, 0.0F)
        pdfDoc.SetPageSize(iTextSharp.text.PageSize.A4.Rotate)

        PdfWriter.GetInstance(pdfDoc, Response.OutputStream)

        pdfDoc.Open()
        pdfDoc.Add(table)
        pdfDoc.Close()

        Dim filename As String = "AssessmentMarks_" + ListBoxStudents.SelectedIndex.ToString + ".pdf"

        Response.ContentType = "application/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Write(pdfDoc)
        Response.End()

    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub

End Class
