<%@ Page Title="SIS Asessments By Courses" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AssessmentsByTeachers.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessments ID="MenuAssessments" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Teacher List"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxTeachers" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceTeachers"
                                DataTextField="StaffName" DataValueField="StaffID" Height="250px" Width="95%">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAssessmentMarks" runat="server" ImageUrl="~/Coordinators/Images/menu_report_card.png"
                                NavigateUrl="~/Coordinators/AssessmentsStudentMarks.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label35" runat="server" Text="Update Assessment Marks"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENTS BY TEACHERS</h2>
                <br />
                <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessments" Width="675px" DataKeyNames="AssessmentID"
                    AllowPaging="True" PageSize="15">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="ImageItem0" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AID">
                            <ItemTemplate>
                                <asp:Label ID="LabelAID" runat="server" ForeColor="Red" Text='<%# Eval("AssessmentID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="45px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CourseCategory" HeaderText="Course " SortExpression="CourseCategory">
                        </asp:BoundField>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Type" SortExpression="CourseSectionAssessmentTypeID">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAssessmentType" runat="server" DataSourceID="SqlDataSourceAssessmentsTypes"
                                    DataTextField="Assessment Type" DataValueField="CourseSectionAssessmentTypeID"
                                    SelectedValue='<%# DataBinder.Eval (Container.DataItem, "CourseSectionAssessmentTypeID") %>'
                                    Width="90%">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assessment" SortExpression="Assessment">
                            <ItemTemplate>
                                <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 150px">
                                    <asp:Label ID="LabelAssessments" runat="server" Text='<%# Bind("Assessment") %>'
                                        ToolTip='<%# Bind("Assessment") %>' Font-Size="XX-Small"></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="L" SortExpression="IsLocked">
                            <HeaderTemplate>
                                <asp:CheckBox ID="CheckBoxAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxAll" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxIsLocked" runat="server" Checked='<%# Bind("IsLocked") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="S">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Coordinators/Images/Save-as-icon.png"
                                    Width="22px" />
                                <asp:ConfirmButtonExtender ID="ImageButtonSave_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Do you really want to Update?" Enabled="True" TargetControlID="ImageButtonSave">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                            <br />
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                            <br />
                        </asp:Panel>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                    <SelectedRowStyle BackColor="#FFFF99" />
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdateAll" runat="server" Text="Save Changes" Width="675px" />
                <asp:ConfirmButtonExtender ID="ButtonUpdateAll_ConfirmButtonExtender" runat="server"
                    ConfirmText="Do you really want to save changes?" Enabled="True" TargetControlID="ButtonUpdateAll">
                </asp:ConfirmButtonExtender>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) AND ([Continue] = 1) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentID, SectionCatalog, CourseCategory, AssessmentType, Assessment, Date, CourseSectionAssessmentTypeID, IsLocked FROM vw_AssessmentsByTeachers WHERE (AcademicTermID = @AcademicTermID) AND (StaffID = @StaffID) ORDER BY CourseCategory, SectionCatalog, AssessmentType, Assessment"
                    UpdateCommand="UPDATE tbl_Assessments SET CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID, IsLocked = @IsLocked WHERE (AssessmentID = @AssessmentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxTeachers" Name="StaffID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                        <asp:Parameter Name="IsLocked" />
                        <asp:Parameter Name="AssessmentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionAssessmentTypeID, CourseCategory + N' ' + SectionCatalog + N' ' + Description AS [Assessment Type] FROM vw_CourseSectionAssessmentTypes WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) ORDER BY [Assessment Type]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxTeachers" Name="StaffID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc2:WebMessageBox ID="WebMessageBoxAssessments" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
