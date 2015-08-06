<%@ Page Title="Setup Course Sections" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="Timeline.aspx.vb" Inherits="CoursesAdd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="ChildHead">
    <script language="javascript" type="text/javascript">
        function expandcollapse(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == "none") {
                div.style.display = "block";
                if (row == 'alt') {
                    img.src = "Images/minus.gif";
                }
                else {
                    img.src = "Images/minus.gif";
                }
                img.alt = "Close to view other Students";
            }
            else {
                div.style.display = "none";
                if (row == 'alt') {
                    img.src = "Images/plus.gif";
                }
                else {
                    img.src = "Images/plus.gif";
                }
                img.alt = "Expand to show Assessments";
            }
        } 
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table width="680">
                <tr>
                    <td valign="top" width="20" height="30">
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td height="35">
                    </td>
                    <td>
                        <asp:GridView ID="GridViewDashBoard" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceDashBoard" Width="95%" DataKeyNames="DashboardID">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href="javascript:expandcollapse('div<%# Eval("DashboardID") %>', 'one');">
                                            <img id="imgdiv<%# Eval("DashboardID") %>" alt="Click to show/hide Orders for Customer <%# Eval("DashboardID") %>"
                                                border="0" src="Images/plus.gif" />
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName">
                                </asp:BoundField>
                                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message">
                                </asp:BoundField>
                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}" />
                                <asp:TemplateField HeaderText=" ">
                                    <ItemTemplate>
                                        <tr>
                                            <td colspan="100%">
                                                <div id="div<%# Eval("DashboardID") %>" style="display: none; position: relative;
                                                    left: 10px; overflow: auto; text-align: center;">
                                                    <br />
                                                    <asp:GridView ID="GridViewDashBoardComments" runat="server" AutoGenerateColumns="False"
                                                        DataKeyNames="DashBoardCommentID" DataSourceID="SqlDataSourceDashBoardComments"
                                                        Width="90%">
                                                        <Columns>
                                                            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                                                            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                                                            <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date" />
                                                        </Columns>
                                                        <EmptyDataTemplate>
                                                            No Comment!
                                                        </EmptyDataTemplate>
                                                    </asp:GridView>
                                                    <asp:HiddenField ID="HiddenFieldDashBoardID" runat="server" Value='<%# Bind("DashboardID") %>' />
                                                    <asp:SqlDataSource ID="SqlDataSourceDashBoardComments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                        SelectCommand="SELECT DashBoardCommentID, UserName, Comment, Date FROM vw_DashBoardComments WHERE (DashBoardID = @DashBoardID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="HiddenFieldDashBoardID" Name="DashBoardID" PropertyName="Value" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td height="50">
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td height="50">
                    </td>
                    <td>
                        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools where (Show = 1) ORDER BY SchoolName">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DashboardID, UserName, Message, Date FROM vw_DashBoard">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
