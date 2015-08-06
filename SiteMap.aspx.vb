Imports Subgurim.Controles.SSM

Partial Class SiteMap
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SubgurimSiteMapBLL.addSiteMap("http://www.mydomain.com/myfolder/mypage.aspx")
        Response.Clear()
        Response.ContentType = "text/xml"
        Response.Flush()
        Response.Write(SubgurimSiteMapBLL.showSiteMap())
        Response.[End]()
    End Sub
End Class
