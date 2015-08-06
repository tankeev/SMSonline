<%@ Page Title="SIS Secretary Home Page" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:TabContainer ID="TabContainerSecretary" runat="server" ActiveTabIndex="0" Width="96%"
        CssClass="tab">
        <asp:TabPanel ID="TabPanelAnnouncements" runat="server" HeaderText="TabPanelAnnouncements">
            <HeaderTemplate>
                ANNOUNCEMENTS</HeaderTemplate>
            <ContentTemplate>
                <asp:Repeater ID="RepeaterAnnouncements" runat="server" DataSourceID="SqlDataSourceAnnouncements">
                    <ItemTemplate>
                        <table width="98%">
                            <tr>
                                <td colspan="3" height="25">
                                    <b>
                                        <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black"
                                            Text='<%# Bind("Title") %>' /></b>
                                </td>
                            </tr>
                            <tr>
                                <td align="justify" colspan="3">
                                    <asp:Label ID="MessageLabel" runat="server" Font-Size="Small" Text='<%# Bind("Message") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td height="20" width="160">
                                    <asp:Label ID="DateLabel" runat="server" Font-Size="X-Small" ForeColor="#333333"
                                        Text='<%# Bind("Date") %>' />
                                </td>
                                <td width="40">
                                    <asp:Label ID="DateLabel1" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="#333333"
                                        Text="From:" />
                                </td>
                                <td>
                                    <asp:Label ID="AddedByLabel" runat="server" Font-Size="X-Small" ForeColor="#333333"
                                        Text='<%# Bind("AddedBy") %>' />
                                </td>
                            </tr>
                        </table>
                        <hr width="98%" />
                        <br />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSourceAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT AnnouncementID, Title, Message, Date, Publish, AddedBy, RoleName, SchoolCode FROM vw_Announcements WHERE (Publish = 1) AND (RoleName = N'Secretary') AND (SchoolCode = @SchoolCode) ORDER BY Date DESC">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanelRegistration" runat="server" HeaderText="TabPanelRegistration">
            <HeaderTemplate>
                REGISTRATION</HeaderTemplate>
            <ContentTemplate>
                <div style='overflow: auto; width: 100%;'>
                    <asp:FormView ID="FormViewRegistration" runat="server" DataSourceID="SqlDataSourceRegistration"
                        DefaultMode="Edit" Width="800px" DataKeyNames="RegistrationID">
                        <EditItemTemplate>
                            <table style="border: 1px solid #999999; font-size: xx-small" width="1350">
                                <tr>
                                    <td height="30" bgcolor="#FFDDDD">
                                    </td>
                                    <td align="center" colspan="9" bgcolor="#FFDDDD">
                                        <asp:Label ID="Label17" runat="server" Text="New Students (Siswa Dari Luar)" Font-Bold="True"
                                            ForeColor="Red"></asp:Label>
                                    </td>
                                    <td colspan="8" align="center" bgcolor="#FFDDDD">
                                        <asp:Label ID="Label45" runat="server" Text="School Students (Siswa Dari Sekolah Sendiri)"
                                            Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td colspan="3" bgcolor="#FFDDDD" align="center">
                                        <asp:Label ID="Label81" runat="server" Font-Bold="True" ForeColor="Red" Text="PSB 2015"></asp:Label>
                                    </td>
                                    <td colspan="3" bgcolor="#FFDDDD" align="center">
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="PSB 2014"></asp:Label>
                                    </td>
                                    <td colspan="3" bgcolor="#FFDDDD" align="center">
                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red" Text="Sementara 2015"></asp:Label>
                                    </td>
                                    <td colspan="3" bgcolor="#FFDDDD" align="center">
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red" Text="Target 2015"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" bgcolor="#FFC2A6">
                                    </td>
                                    <td align="center" colspan="3" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label18" runat="server" Text="SD" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="3" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label19" runat="server" Text="SMP" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="3" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label20" runat="server" Text="SMA" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="4" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label56" runat="server" Text="GRADE 6 SD" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="4" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label57" runat="server" Text="GRADE 9 SMP" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="3" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label61" runat="server" Text="THIS YEAR" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="3" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label62" runat="server" Text="LAST YEAR" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="3" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label69" runat="server" Text="TOTAL" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="center" colspan="3" bgcolor="#FFC2A6">
                                        <asp:Label ID="Label70" runat="server" Text="TARGET" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label16" runat="server" Text="School Name" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td xml:lang="3" align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label32" runat="server" Text="RD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label37" runat="server" Text="SS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label41" runat="server" Text="PD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label33" runat="server" Text="RD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label38" runat="server" Text="SS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label43" runat="server" Text="PD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label34" runat="server" Text="RD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label44" runat="server" Text="SS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label42" runat="server" Text="PD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label48" runat="server" Text="TS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label60" runat="server" Text="RD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label59" runat="server" Text="SS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label54" runat="server" Text="PD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label49" runat="server" Text="TS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label50" runat="server" Text="RD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label58" runat="server" Text="SS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label55" runat="server" Text="PD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label63" runat="server" Text="RD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label65" runat="server" Text="SS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label67" runat="server" Text="PD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label64" runat="server" Text="RD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label66" runat="server" Text="SS" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label68" runat="server" Text="PD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label71" runat="server" Text="SD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label73" runat="server" Text="SMP" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label75" runat="server" Text="SMA" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label72" runat="server" Text="SD" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label74" runat="server" Text="SMP" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td align="center" bgcolor="#FFFFCC">
                                        <asp:Label ID="Label76" runat="server" Text="SMA" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#EBEBEB">
                                        <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px">
                                            <asp:Label ID="SchoolCodeLabel" runat="server" Text='<%# Eval("SchoolName") %>' Font-Bold="True"
                                                ForeColor="Black" />
                                        </div>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="RD1" runat="server" Text='<%# Bind("NumStdNewSDRegistered") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="SS1" runat="server" Text='<%# Bind("NumStdNewSDScholarship") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="PD1" runat="server" Text='<%# Bind("NumStdNewSDPaid") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="RD2" runat="server" Text='<%# Bind("NumStdNewSMPRegistered") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="SS2" runat="server" Text='<%# Bind("NumStdNewSMPScholarship") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="PD2" runat="server" Text='<%# Bind("NumStdNewSMPPaid") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="RD3" runat="server" Text='<%# Bind("NumStdNewSMARegistered") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="SS3" runat="server" Text='<%# Bind("NumStdNewSMAScholarship") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="PD3" runat="server" Text='<%# Bind("NumStdNewSMAaid") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="TS1" runat="server" Text='<%# Bind("NumStdCurG6Total") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="RD4" runat="server" Text='<%# Bind("NumStdCurG6Registered") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="SS4" runat="server" Text='<%# Bind("NumStdCurG6Scholarship") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="PD4" runat="server" Text='<%# Bind("NumStdCurG6Paid") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="TS2" runat="server" Text='<%# Bind("NumStdCurG9Total") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="RD5" runat="server" Text='<%# Bind("NumStdCurG9Registered") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="SS5" runat="server" Text='<%# Bind("NumStdCurG9Scholarship") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="PD5" runat="server" Text='<%# Bind("NumStdCurG9Paid") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:Label ID="LabelTotalRD" runat="server" Font-Bold="True" ForeColor="Black" Text="0"></asp:Label>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:Label ID="LabelTotalSS" runat="server" Font-Bold="True" ForeColor="Black" Text="0"></asp:Label>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:Label ID="LabelTotalPD" runat="server" Font-Bold="True" ForeColor="Black" Text="0"></asp:Label>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="RD6" runat="server" Text='<%# Bind("NumTotalLastYearRegistered") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="SS6" runat="server" Text='<%# Bind("NumTotalLastYearScholarship") %>'
                                            Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="PD7" runat="server" Text='<%# Bind("NumTotalLastYearPaid") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:Label ID="LabelTotalSD" runat="server" Font-Bold="True" ForeColor="Black" Text="0"></asp:Label>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:Label ID="LabelTotalSMP" runat="server" Font-Bold="True" ForeColor="Black" Text="0"></asp:Label>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:Label ID="LabelTotalSMA" runat="server" Font-Bold="True" ForeColor="Black" Text="0"></asp:Label>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="TS3" runat="server" Text='<%# Bind("NumTotalNewYearSD") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="TS4" runat="server" Text='<%# Bind("NumTotalNewYearSMP") %>' Width="20px"></asp:TextBox>
                                    </td>
                                    <td width="35" align="center" bgcolor="#EBEBEB">
                                        <asp:TextBox ID="TS5" runat="server" Text='<%# Bind("NumTotalNewYearSMA") %>' Width="20px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Button ID="ButtonUpdate" runat="server" Text="Update All" Width="1350px" CommandName="Update" />
                            <br />
                            <br />
                        </EditItemTemplate>
                    </asp:FormView>
                </div>
                <br />
                <table width="400" style="background-color: #FFFFCC; border: 1px solid #FF6600">
                    <tr>
                        <td width="120" height="25">
                            <asp:Label ID="Label30" runat="server" Text="Registered" Font-Bold="True"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label31" runat="server" Text="RD" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label77" runat="server" Text="(Daftar)" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label35" runat="server" Text="Scholarship" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label36" runat="server" Text="SS" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label78" runat="server" Text="(Beasiswa)" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label39" runat="server" Text="Paid" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label40" runat="server" Text="PD" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label79" runat="server" Text="(Sudah Bayar)" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label46" runat="server" Text="Total Students" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label47" runat="server" Text="TS" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label80" runat="server" Text="(Jumlah Siswa)" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_Registration.RegistrationID, tbl_Registration.SchoolCode, tbl_Registration.NumStdNewSDRegistered, tbl_Registration.NumStdNewSMPRegistered, tbl_Registration.NumStdNewSMARegistered, tbl_Registration.NumStdNewSDScholarship, tbl_Registration.NumStdNewSMPScholarship, tbl_Registration.NumStdNewSMAScholarship, tbl_Registration.NumStdNewSDPaid, tbl_Registration.NumStdNewSMPPaid, tbl_Registration.NumStdNewSMAaid, tbl_Registration.NumStdCurG6Total, tbl_Registration.NumStdCurG6Registered, tbl_Registration.NumStdCurG9Total, tbl_Registration.NumStdCurG9Registered, tbl_Registration.NumStdCurG6Scholarship, tbl_Registration.NumStdCurG9Scholarship, tbl_Registration.NumStdCurG6Paid, tbl_Registration.NumStdCurG9Paid, tbl_Registration.NumTotalLastYearRegistered, tbl_Registration.NumTotalLastYearScholarship, tbl_Registration.NumTotalLastYearPaid, tbl_Registration.NumTotalNewYearSD, tbl_Registration.NumTotalNewYearSMP, tbl_Registration.NumTotalNewYearSMA, tbl_Schools.SchoolName FROM tbl_Registration INNER JOIN tbl_Schools ON tbl_Registration.SchoolCode = tbl_Schools.SchoolCode WHERE (tbl_Registration.SchoolCode = @SchoolCode)"
                    UpdateCommand="UPDATE tbl_Registration SET NumStdNewSDRegistered = @NumStdNewSDRegistered, NumStdNewSMPRegistered = @NumStdNewSMPRegistered, NumStdNewSMARegistered = @NumStdNewSMARegistered, NumStdNewSDScholarship = @NumStdNewSDScholarship, NumStdNewSMPScholarship = @NumStdNewSMPScholarship, NumStdNewSMAScholarship = @NumStdNewSMAScholarship, NumStdNewSDPaid = @NumStdNewSDPaid, NumStdNewSMPPaid = @NumStdNewSMPPaid, NumStdNewSMAaid = @NumStdNewSMAaid, NumStdCurG6Total = @NumStdCurG6Total, NumStdCurG9Total = @NumStdCurG9Total, NumStdCurG6Registered = @NumStdCurG6Registered, NumStdCurG9Registered = @NumStdCurG9Registered, NumStdCurG6Scholarship = @NumStdCurG6Scholarship, NumStdCurG9Scholarship = @NumStdCurG9Scholarship, NumStdCurG6Paid = @NumStdCurG6Paid, NumStdCurG9Paid = @NumStdCurG9Paid, NumTotalLastYearRegistered = @NumTotalLastYearRegistered, NumTotalLastYearScholarship = @NumTotalLastYearScholarship, NumTotalLastYearPaid = @NumTotalLastYearPaid, NumTotalNewYearSD = @NumTotalNewYearSD, NumTotalNewYearSMP = @NumTotalNewYearSMP, NumTotalNewYearSMA = @NumTotalNewYearSMA WHERE (RegistrationID = @RegistrationID)">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NumStdNewSDRegistered" />
                        <asp:Parameter Name="NumStdNewSMPRegistered" />
                        <asp:Parameter Name="NumStdNewSMARegistered" />
                        <asp:Parameter Name="NumStdNewSDScholarship" />
                        <asp:Parameter Name="NumStdNewSMPScholarship" />
                        <asp:Parameter Name="NumStdNewSMAScholarship" />
                        <asp:Parameter Name="NumStdNewSDPaid" />
                        <asp:Parameter Name="NumStdNewSMPPaid" />
                        <asp:Parameter Name="NumStdNewSMAaid" />
                        <asp:Parameter Name="NumStdCurG6Total" />
                        <asp:Parameter Name="NumStdCurG9Total" />
                        <asp:Parameter Name="NumStdCurG6Registered" />
                        <asp:Parameter Name="NumStdCurG9Registered" />
                        <asp:Parameter Name="NumStdCurG6Scholarship" />
                        <asp:Parameter Name="NumStdCurG9Scholarship" />
                        <asp:Parameter Name="NumStdCurG6Paid" />
                        <asp:Parameter Name="NumStdCurG9Paid" />
                        <asp:Parameter Name="NumTotalLastYearRegistered" />
                        <asp:Parameter Name="NumTotalLastYearScholarship" />
                        <asp:Parameter Name="NumTotalLastYearPaid" />
                        <asp:Parameter Name="NumTotalNewYearSD" />
                        <asp:Parameter Name="NumTotalNewYearSMP" />
                        <asp:Parameter Name="NumTotalNewYearSMA" />
                        <asp:Parameter Name="RegistrationID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
