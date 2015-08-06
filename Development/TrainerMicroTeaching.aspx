<%@ Page Title="SIS Micro Teaching" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="TrainerMicroTeaching.aspx.vb" Inherits="TrainerTeaching" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    PROFESSIONAL</h2>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerAttendanceChecklist.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="Attendance Checklist"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerTrainerTeaching.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Trainer Teaching Sessions"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerMicroTeaching.aspx" Enabled="False">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Micro Teaching Sessions" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerSubjectUnitTests.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Subject Unit Tests"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerSubjectBooksEvaluation.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Subject Books Evaluation"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    DEVELOPMENT</h2>
                <br />
                <asp:TabContainer ID="TabContainerMicroTeaching" runat="server" ActiveTabIndex="0"
                    Width="97%" CssClass="tab">
                    <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                        <HeaderTemplate>
                            MICRO-TEACHING
                        
</HeaderTemplate>
                        
<ContentTemplate>
                            <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Micro Teaching Checklist for Trainers:"></asp:Label>

                            <br />
                            <br />
                            <asp:GridView ID="GridViewMicroTeaching" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="MicroTeachingID" DataSourceID="SqlDataSourceMicroTeaching" Width="100%"><Columns>
<asp:TemplateField><ItemTemplate>
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Development/Images/menu-alt-24.png" />
                                        
</ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="35px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Date / Name" SortExpression="Date">
    <ItemTemplate>
                                            <asp:Label ID="LabelDate" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"
                                                Text='<%# Bind("Date", "{0:D}") %>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="LabelName" runat="server" Font-Bold="True" Font-Size="X-Small" Text='<%# Bind("TraineeName") %>'></asp:Label>
                                        
</ItemTemplate>

<ItemStyle Width="150px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Teaching Topics / Notes" SortExpression="TopicID">
    <ItemTemplate>
                                            <asp:Label ID="LabelTitle" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"
                                                Text='<%# Eval("UnitTitle") %>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="LabelNotes" runat="server" Font-Bold="True" Font-Size="X-Small" Text='<%# Bind("Notes") %>'></asp:Label>
                                        
</ItemTemplate>
</asp:TemplateField>
</Columns>
<EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning1" runat="server" Font-Bold="True" Text="Sorry! No Record Found!"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                
</EmptyDataTemplate>

<RowStyle Height="75px" />
</asp:GridView>

                            <br />
                            <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" Text="Add New Micro Teaching Record:"></asp:Label>

                            <br />
                            <br />
                            <table style="border: 1px solid #990033; background-color: #EBF4E1" width="100%">
                                <tr>
                                    <td height="30" width="30">
                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />

                                    </td>
                                    <td height="30" width="150">
                                        <asp:Label ID="Label42" runat="server" Text="Teaching Course:"></asp:Label>

                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListTeachingCourses" runat="server" DataSourceID="SqlDataSourceTeachingCourses"
                                            DataTextField="CourseCategory" DataValueField="CourseCategoryID" Width="95%"
                                            AutoPostBack="True"></asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="30">
                                        <asp:Image ID="Image9" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />

                                    </td>
                                    <td height="30" width="150">
                                        <asp:Label ID="Label43" runat="server" Text="Teaching Units:"></asp:Label>

                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListTeachingUnits" runat="server" DataSourceID="SqlDataSourceTeachingUnits"
                                            DataTextField="CourseUnit" DataValueField="CourseUnitID" Width="95%" AutoPostBack="True"></asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="30">
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />

                                    </td>
                                    <td height="30" width="150">
                                        <asp:Label ID="Label24" runat="server" Text="Teaching Titles:"></asp:Label>

                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListTeachingTitle" runat="server" DataSourceID="SqlDataSourceTeachingTitles"
                                            DataTextField="UnitTitle" DataValueField="UnitTitleID" Width="95%"></asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        
                                    </td>
                                    <td height="30">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />

                                    </td>
                                    <td height="30">
                                        <asp:Label ID="Label30" runat="server" Text="School Section:"></asp:Label>

                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListSchoolSections" runat="server" DataSourceID="SqlDataSourceSchoolSections"
                                            DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="95%"></asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />

                                    </td>
                                    <td height="30">
                                        <asp:Label ID="Label29" runat="server" Text="Session Date:"></asp:Label>

                                    </td>
                                    <td>
                                        <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Notes") %>' Width="93%" />

                                        <asp:CalendarExtender ID="DateTextBox_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="DateTextBox"></asp:CalendarExtender>

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />

                                    </td>
                                    <td height="30">
                                        <asp:Label ID="Label25" runat="server" Text="Session Notes:"></asp:Label>

                                    </td>
                                    <td>
                                        <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' Width="93%" />

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        
                                    </td>
                                    <td height="30">
                                        
                                    </td>
                                    <td>
                                        <asp:CheckBoxList ID="CheckBoxListTrainees" runat="server" DataSourceID="SqlDataSourceDevelopmentTrainees"
                                            DataTextField="TraineeName" DataValueField="TraineeID" Width="100%"></asp:CheckBoxList>

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        
                                    </td>
                                    <td height="30">
                                        
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonAddRecords" runat="server" CommandName="Insert" Text="Add Record"
                                            Width="95%" />

                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        
                                    </td>
                                    <td height="30">
                                        
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelMicroTeachingStatus" runat="server"></asp:Label>

                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceMicroTeaching" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                InsertCommand="INSERT INTO tbl_DevelopmentMicroTeaching(TraineeID, Date, Notes, AcademicTermID, UnitTitleID, SavedBy, SectionCatalogID, SchoolCode) VALUES (@TraineeID, @Date, @Notes, @AcademicTermID, @UnitTitleID, @SavedBy, @SectionCatalogID, @SchoolCode)"
                                SelectCommand="SELECT tbl_DevelopmentMicroTeaching.MicroTeachingID, tbl_DevelopmentMicroTeaching.TraineeID, tbl_DevelopmentMicroTeaching.Date, tbl_DevelopmentMicroTeaching.Notes, tbl_DevelopmentMicroTeaching.AcademicTermID, tbl_DevelopmentMicroTeaching.SavedBy, tbl_Staff.StaffName AS TraineeName, tbl_DevelopmentMicroTeaching.UnitTitleID, tbl_SectionCatalog.SectionCatalog, tbl_CourseUnitTitles.UnitTitle FROM tbl_DevelopmentMicroTeaching INNER JOIN tbl_Staff ON tbl_DevelopmentMicroTeaching.TraineeID = tbl_Staff.StaffID INNER JOIN tbl_SectionCatalog ON tbl_DevelopmentMicroTeaching.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID INNER JOIN tbl_CourseUnitTitles ON tbl_DevelopmentMicroTeaching.UnitTitleID = tbl_CourseUnitTitles.UnitTitleID"><InsertParameters>
<asp:Parameter Name="TraineeID" />
<asp:Parameter Name="Date" />
<asp:Parameter Name="Notes" />
<asp:Parameter Name="AcademicTermID" />
<asp:Parameter Name="UnitTitleID" />
<asp:Parameter Name="SavedBy" />
<asp:Parameter Name="SectionCatalogID" />
<asp:Parameter Name="SchoolCode" />
</InsertParameters>
</asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceTeachingCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                DeleteCommand="DELETE FROM tbl_CourseCategories WHERE (CourseCategoryID = @CourseCategoryID)"
                                InsertCommand="INSERT INTO tbl_CourseCategories(CourseCategoryCode, CourseCategory, CourseReportOrder, CourseGroupingID, CourseGroupingIsChild, CourseGroupName) VALUES (@CourseCategoryCode, @CourseCategory, 0, 0, 0, @CourseGroupName)"
                                SelectCommand="SELECT CourseCategoryID, CourseCategory FROM tbl_CourseCategories WHERE (IsDevelopment = 1)"
                                UpdateCommand="UPDATE tbl_CourseCategories SET CourseCategoryCode = @CourseCategoryCode, CourseCategory = @CourseCategory, CourseReportOrder = @CourseReportOrder, CourseGroupingID = @CourseGroupingID, CourseGroupingIsChild = @CourseGroupingIsChild, CourseGroupName = @CourseGroupName WHERE (CourseCategoryID = @CourseCategoryID)"><DeleteParameters>
<asp:Parameter Name="CourseCategoryID" />
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="CourseCategoryCode" />
<asp:Parameter Name="CourseCategory" />
<asp:Parameter Name="CourseGroupName" />
</InsertParameters>
<UpdateParameters>
<asp:Parameter Name="CourseCategoryCode" />
<asp:Parameter Name="CourseCategory" />
<asp:Parameter Name="CourseReportOrder" />
<asp:Parameter Name="CourseGroupingID" />
<asp:Parameter Name="CourseGroupingIsChild" />
<asp:Parameter Name="CourseGroupName" />
<asp:Parameter Name="CourseCategoryID" />
</UpdateParameters>
</asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceTeachingUnits" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                DeleteCommand="DELETE FROM tbl_CourseCategories WHERE (CourseCategoryID = @CourseCategoryID)"
                                InsertCommand="INSERT INTO tbl_CourseCategories(CourseCategoryCode, CourseCategory, CourseReportOrder, CourseGroupingID, CourseGroupingIsChild, CourseGroupName) VALUES (@CourseCategoryCode, @CourseCategory, 0, 0, 0, @CourseGroupName)"
                                SelectCommand="SELECT CourseUnitID, CourseUnit FROM tbl_CourseUnits WHERE (IsAcademic = 1) AND (CourseCategoryID = @CourseCategoryID)"
                                UpdateCommand="UPDATE tbl_CourseCategories SET CourseCategoryCode = @CourseCategoryCode, CourseCategory = @CourseCategory, CourseReportOrder = @CourseReportOrder, CourseGroupingID = @CourseGroupingID, CourseGroupingIsChild = @CourseGroupingIsChild, CourseGroupName = @CourseGroupName WHERE (CourseCategoryID = @CourseCategoryID)"><DeleteParameters>
<asp:Parameter Name="CourseCategoryID" />
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="CourseCategoryCode" />
<asp:Parameter Name="CourseCategory" />
<asp:Parameter Name="CourseGroupName" />
</InsertParameters>
<SelectParameters>
<asp:ControlParameter ControlID="DropDownListTeachingCourses" Name="CourseCategoryID"
                                        PropertyName="SelectedValue" />
</SelectParameters>
<UpdateParameters>
<asp:Parameter Name="CourseCategoryCode" />
<asp:Parameter Name="CourseCategory" />
<asp:Parameter Name="CourseReportOrder" />
<asp:Parameter Name="CourseGroupingID" />
<asp:Parameter Name="CourseGroupingIsChild" />
<asp:Parameter Name="CourseGroupName" />
<asp:Parameter Name="CourseCategoryID" />
</UpdateParameters>
</asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceTeachingTitles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT UnitTitleID, UnitTitle FROM tbl_CourseUnitTitles WHERE (IsAcademic = 1) AND (CourseUnitID = @CourseUnitID) ORDER BY UnitTitle"><SelectParameters>
<asp:ControlParameter ControlID="DropDownListTeachingUnits" Name="CourseUnitID" PropertyName="SelectedValue" />
</SelectParameters>
</asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceSchoolSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM tbl_SectionCatalog ORDER BY SectionGroup"></asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceDevelopmentTrainees" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT tbl_DevelopmentTrainees.TraineeID, tbl_Staff.StaffName AS TraineeName FROM tbl_DevelopmentTrainees INNER JOIN tbl_Staff ON tbl_DevelopmentTrainees.TraineeID = tbl_Staff.StaffID WHERE (tbl_DevelopmentTrainees.AcademicTermID = @AcademicTermID) AND (tbl_DevelopmentTrainees.TrainerID = @TrainerID) ORDER BY TraineeName"><SelectParameters>
<asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                        PropertyName="SelectedValue" />
<asp:SessionParameter Name="TrainerID" SessionField="UserID" />
</SelectParameters>
</asp:SqlDataSource>

                        
</ContentTemplate>
                    
</asp:TabPanel>
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            OBSERVATION FORM
                        
</HeaderTemplate>
                        
<ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanelObservationForm" runat="server">
                                <ContentTemplate>
                                    <table width="100%" style="border: 1px solid #990033; background-color: #EECCDD">
                                        <tr>
                                            <td height="30" width="35">
                                                <asp:Image ID="Image11" runat="server" ImageUrl="~/Development/Images/Item.png" />
                                            </td>
                                            <td height="30" width="120">
                                                <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Trainee:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListTrainees" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDevelopmentTraineesObservation"
                                                    DataTextField="TraineeName" DataValueField="TraineeID" Width="95%">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:GridView ID="GridViewObservation" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="ObservationID" DataSourceID="SqlDataSourceMicroTeachingObservationForm"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField InsertVisible="False">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ObservationID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Development/Images/Item.png" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OID" InsertVisible="False" SortExpression="ObservationID"
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelOID" runat="server" Text='<%# Bind("ObservationID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ObservationName" HeaderText="Key Indicator" SortExpression="ObservationName" />
                                            <asp:TemplateField HeaderText="Score (1-5)">
                                                <ItemTemplate>
                                                    <asp:Rating ID="RatingObservation" runat="server" StarCssClass="blankstar" WaitingStarCssClass="waitingstar"
                                                        FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar">
                                                    </asp:Rating>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle Width="120px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <asp:Button ID="ButtonSend" runat="server" Text="Send Form" Width="100%" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelObservation" runat="server" Font-Bold="True" Font-Italic="False"
                                        ForeColor="Red"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSourceDevelopmentTraineesObservation" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT tbl_DevelopmentTrainees.TraineeID, tbl_Staff.StaffName AS TraineeName FROM tbl_DevelopmentTrainees INNER JOIN tbl_Staff ON tbl_DevelopmentTrainees.TraineeID = tbl_Staff.StaffID WHERE (tbl_DevelopmentTrainees.AcademicTermID = @AcademicTermID) AND (tbl_DevelopmentTrainees.TrainerID = @TrainerID) ORDER BY TraineeName">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                                PropertyName="SelectedValue" />
                                            <asp:SessionParameter Name="TrainerID" SessionField="UserID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceMicroTeachingObservationForm" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT ObservationID, ObservationName FROM tbl_DevelopmentObservationForm ORDER BY ObservationName"
                                        InsertCommand="INSERT INTO tbl_DevelopmentObservations(TraineeID, TraineerID, ObservationID, ObservationScore, Date) VALUES (@TraineeID, @TraineerID, @ObservationID, @ObservationScore, @Date)">
                                        <InsertParameters>
                                            <asp:Parameter Name="TraineeID" />
                                            <asp:Parameter Name="TraineerID" />
                                            <asp:Parameter Name="ObservationID" />
                                            <asp:Parameter Name="ObservationScore" />
                                            <asp:Parameter Name="Date" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        
</ContentTemplate>
                    
</asp:TabPanel>
                </asp:TabContainer>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
