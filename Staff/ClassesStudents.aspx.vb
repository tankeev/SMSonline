Imports System.IO

Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            DropDownListAcademicTerms.SelectedValue = Session("AcademicTermID")
        End If

    End Sub

    Protected Sub DropDownListSchoolCodes_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSchoolCodes.DataBound
        LabelSchool.Text = DropDownListSchoolCodes.SelectedItem.Text
    End Sub

    Protected Sub DropDownListSchoolCodes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSchoolCodes.SelectedIndexChanged
        LabelSchool.Text = DropDownListSchoolCodes.SelectedItem.Text
    End Sub

    Protected Sub RadioButtonListSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.DataBound
        If RadioButtonListSections.Items.Count > 0 Then

            RadioButtonListSections.SelectedIndex = 0
            GridViewStudents.DataBind()

        End If
    End Sub

    Protected Sub ImageButtonExcel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonExcel.Click

        Dim filename As String = "ClassroomList_" + RadioButtonListSections.SelectedItem.ToString + ".xls"

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages
            GridViewStudents.AllowPaging = False
            GridViewStudents.DataBind()

            GridViewStudents.HeaderRow.BackColor = System.Drawing.Color.White
            For Each cell As TableCell In GridViewStudents.HeaderRow.Cells
                cell.BackColor = GridViewStudents.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In GridViewStudents.Rows
                row.BackColor = System.Drawing.Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = GridViewStudents.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = GridViewStudents.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            GridViewStudents.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()
        End Using
    End Sub

    Protected Sub ImageButtonWord_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonWord.Click

        Dim filename As String = "ClassroomList_" + RadioButtonListSections.SelectedItem.ToString + ".doc"

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-word "

        Dim sw As New StringWriter()

        Dim hw As New HtmlTextWriter(sw)

        GridViewStudents.AllowPaging = False

        GridViewStudents.DataBind()

        GridViewStudents.RenderControl(hw)

        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
    End Sub

    Protected Sub ImageButtonPDF_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPDF.Click

        GridViewStudents.DataBind()

        'Create a table
        Dim table As New iTextSharp.text.Table(GridViewStudents.Columns.Count)
        table.Cellpadding = 5

        'Set the column widths
        Dim widths As Integer() = New Integer(GridViewStudents.Columns.Count - 1) {}
        For x As Integer = 0 To GridViewStudents.Columns.Count - 1
            widths(x) = CInt(GridViewStudents.Columns(x).ItemStyle.Width.Value)
            Dim cellText As String = Server.HtmlDecode(GridViewStudents.HeaderRow.Cells(x).Text)
            Dim cell As New iTextSharp.text.Cell(cellText)
            'cell.BackgroundColor = New Color(System.Drawing.ColorTranslator.FromHtml("#008000"))
            table.AddCell(cell)

        Next
        table.SetWidths(widths)

        'Transfer rows from GridView to table
        For i As Integer = 0 To GridViewStudents.Rows.Count - 1
            If GridViewStudents.Rows(i).RowType = DataControlRowType.DataRow Then
                For j As Integer = 0 To GridViewStudents.Columns.Count - 1
                    Dim cellText As String = Server.HtmlDecode(GridViewStudents.Rows(i).Cells(j).Text)
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

        Dim bfTimes As BaseFont = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, False)
        Dim times As New Font(bfTimes, 10, Font.NORMAL, Color.BLACK)

        PdfWriter.GetInstance(pdfDoc, Response.OutputStream)

        pdfDoc.Open()

        'pdfDoc.Add(New Paragraph("List of Students:", times))

        pdfDoc.Add(table)
        pdfDoc.Close()

        Dim filename As String = "ClassroomList_" + RadioButtonListSections.SelectedItem.ToString + ".pdf"

        Response.ContentType = "application/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Write(pdfDoc)
        Response.End()

    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub


    Protected Sub GridViewStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStudents.DataBound
        LabelTotal.Text = GridViewStudents.Rows.Count.ToString + " Students Found."
    End Sub
End Class
