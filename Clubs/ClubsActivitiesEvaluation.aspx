<%@ Page Title="SIS Clubs - Activities" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="ClubsActivitiesEvaluation.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkHome" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/Default.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Clubs &amp; Activities Home"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkSettings" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesSettings.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Clubs &amp; Activities Settings"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkStudents" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesStudents.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Clubs &amp; Activities Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkEvaluation" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesEvaluation.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Clubs &amp; Activities Evaluation"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    CLUBS &amp; ACTIVITIES</h2>
                <br />
                <table width="675">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Academic Semester"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:DropDownList ID="DropDownListAcademicSemesters" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAcademicSemesters" DataTextField="AcademicSemester"
                                DataValueField="AcademicSemesterID" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Club &amp; Activity"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:DropDownList ID="DropDownListClubsActivities" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceDropDownListClubsActivities" DataTextField="ClubActivityName"
                                DataValueField="ClubActivityID" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red" Text="Student List"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewClubsActivities" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="ClubActivityStudentID" DataSourceID="SqlDataSourceClubsActivitiesStudents"
                                Width="100%" AllowPaging="True" PageSize="25">
                                <Columns>
                                    <asp:TemplateField HeaderText="CID" InsertVisible="False" SortExpression="ClubActivityStudentID">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelCID" runat="server" Text='<%# Bind("ClubActivityStudentID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                                    <asp:TemplateField HeaderText="Input" SortExpression="Input">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxInput" runat="server" Text='<%# Bind("Input") %>' Width="25px"></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update All" Width="100%" />
                            <asp:ConfirmButtonExtender ID="ButtonUpdateAll_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are you sure?" Enabled="True" TargetControlID="ButtonUpdateAll">
                            </asp:ConfirmButtonExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicSemesterID, AcademicYear + N' ' + AcademicSemester AS AcademicSemester FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListClubsActivities" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT ClubActivityID, ClubActivityName FROM tbl_ClubsActivities WHERE (SchoolCode = @SchoolCode) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY ClubActivityName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceClubsActivitiesStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT ClubActivityStudentID, StudentName, Input FROM vw_ClubsActivitiesStudents WHERE (ClubActivityID = @ClubActivityID) AND ([Continue] = 1) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY StudentName"
                    UpdateCommand="UPDATE tbl_ClubsActivitiesStudents SET Input = @Input WHERE (ClubActivityStudentID = @ClubActivityStudentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListClubsActivities" Name="ClubActivityID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Input" />
                        <asp:Parameter Name="ClubActivityStudentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
