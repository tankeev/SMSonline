<%@ Page Title="SIS Clubs - Activities" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="ClubsActivitiesSettings.aspx.vb" Inherits="_Default" %>

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
                <asp:GridView ID="GridViewClubsActivities" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ClubActivityID" DataSourceID="SqlDataSourceClubsActivities" Width="675px"
                    AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ClubActivityID">
                            <ItemTemplate>
                                <asp:Label ID="LabelID" runat="server" Text='<%# Bind("ClubActivityID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Academic Semester">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAcademicSemesters" runat="server" DataSourceID="SqlDataSourceClubsActivitiesAcademicSemesters"
                                    DataTextField="AcademicSemester" DataValueField="AcademicSemesterID" SelectedValue='<%# Bind("AcademicSemesterID") %>'
                                    Width="90%">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Responsible Staff">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListResponsibleStaff" runat="server" DataSourceID="SqlDataSourceClubsActivitiesStaff"
                                    DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# Bind("ClubActivityStaffID") %>'
                                    Width="90%">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Club Activity Name">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxClubActivityName" runat="server" Text='<%# Bind("ClubActivityName") %>'
                                    Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Clubs/Images/delete.gif"
                                    Enabled="False" />
                                <asp:ConfirmButtonExtender ID="ImageButtonDelete_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure?" Enabled="True" TargetControlID="ImageButtonDelete">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
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
                <br />
                <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update All" Width="675px" />
                <asp:ConfirmButtonExtender ID="ButtonUpdateAll_ConfirmButtonExtender" runat="server"
                    ConfirmText="Are you sure?" Enabled="True" TargetControlID="ButtonUpdateAll">
                </asp:ConfirmButtonExtender>
                <br />
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:FormView ID="FormViewClubsActitivies" runat="server" DataKeyNames="ClubActivityID"
                    DataSourceID="SqlDataSourceClubsActivities" DefaultMode="Insert" Width="675px">
                    <InsertItemTemplate>
                        <table width="100%">
                            <tr>
                                <td width="25" height="28">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Clubs/Images/edit.png" />
                                </td>
                                <td width="120">
                                    <asp:Label ID="Label8" runat="server" Text="Academic Semester:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListAcademicSemesters" runat="server" DataSourceID="SqlDataSourceClubsActivitiesAcademicSemesters"
                                        DataTextField="AcademicSemester" DataValueField="AcademicSemesterID" SelectedValue='<%# Bind("AcademicSemesterID") %>'
                                        Width="460px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td height="28" width="25">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Clubs/Images/edit.png" />
                                </td>
                                <td width="120">
                                    <asp:Label ID="Label6" runat="server" Text="Responsible Staff:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListResponsibleStaffInsert" runat="server" DataSourceID="SqlDataSourceClubsActivitiesStaff"
                                        DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# Bind("ClubActivityStaffID") %>'
                                        Width="460px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Clubs/Images/edit.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="Club Activity Name:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ClubActivityNameTextBoxInsert" runat="server" Text='<%# Bind("ClubActivityName") %>'
                                        Width="450px" />
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Insert" Width="460px" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSourceClubsActivities" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_ClubsActivities WHERE (ClubActivityID = @ClubActivityID)"
                    InsertCommand="INSERT INTO tbl_ClubsActivities(AcademicSemesterID, ClubActivityStaffID, ClubActivityName, SchoolCode) VALUES (@AcademicSemesterID, @ClubActivityStaffID, @ClubActivityName, @SchoolCode)"
                    SelectCommand="SELECT ClubActivityID, AcademicSemesterID, SchoolCode, ClubActivityStaffID, ClubActivityName FROM tbl_ClubsActivities WHERE (SchoolCode = @SchoolCode)"
                    UpdateCommand="UPDATE tbl_ClubsActivities SET AcademicSemesterID = @AcademicSemesterID, ClubActivityStaffID = @ClubActivityStaffID, ClubActivityName = @ClubActivityName WHERE (ClubActivityID = @ClubActivityID)">
                    <DeleteParameters>
                        <asp:Parameter Name="ClubActivityID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="ClubActivityStaffID" />
                        <asp:Parameter Name="ClubActivityName" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="ClubActivityStaffID" />
                        <asp:Parameter Name="ClubActivityName" />
                        <asp:Parameter Name="ClubActivityID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceClubsActivitiesStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName, [Continue], SchoolCode FROM tbl_Staff WHERE ([Continue] = 1) AND (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceClubsActivitiesAcademicSemesters" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT AcademicSemesterID, AcademicTermID, AcademicYear + N' ' + AcademicSemester AS AcademicSemester FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicSemester">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
