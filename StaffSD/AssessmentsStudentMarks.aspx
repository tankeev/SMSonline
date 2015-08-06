<%@ Page Title="SIS Assessment Marks" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="AssessmentsStudentMarks.aspx.vb" Inherits="Assessment_Marks" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessmentsStaff" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc3" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessmentsStaff ID="MenuAssessmentsStaff" runat="server" />
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkView" runat="server" ImageUrl="~/StaffSD/Images/menu_view.png"
                                NavigateUrl="~/StaffSD/AssessmentsStudentMarksAll.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label142" runat="server" Text="Marks in Sheet View"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label171" runat="server" Font-Bold="True" Text="Select a Course Please"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxCourses" runat="server" DataSourceID="SqlDataSourceCourses"
                                DataTextField="CourseCategory" DataValueField="CourseSectionID" Height="250px"
                                Width="95%" AutoPostBack="True" Font-Size="Small" ForeColor="Maroon"></asp:ListBox>
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
                        <td height="28">
                            <asp:Label ID="Label149" runat="server" Text="Add Missing Students"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonShowAddMissing" runat="server" OnCancelScript="DoCancel()"
                                Text="Add Missing Students" Width="95%" Enabled="False" />
                            <asp:ModalPopupExtender ID="MPAddMissing" runat="server" BackgroundCssClass="modalBackground"
                                CancelControlID="ButtonAddMissingCancel" OnCancelScript="DoCancel()" PopupControlID="PanelAddMissing"
                                TargetControlID="ButtonShowAddMissing">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENT MARKS</h2>
                <br />
                <table style="border: 1px solid #999999; background-color: #E5E5E5" width="675">
                    <tr>
                        <td height="28" width="35">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                        <td width="75">
                            <asp:Label ID="Label144" runat="server" Font-Bold="True" ForeColor="Red" Text="Weighting:"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label145" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Homework:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label146" runat="server" Font-Bold="True" ForeColor="Red" Text="20%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label147" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Quizzes:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label166" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label167" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Mid-Term Exam:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label168" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label169" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Final Exam:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label170" runat="server" Font-Bold="True" ForeColor="Red" Text="30%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessments" Width="675px" DataKeyNames="AssessmentID"
                    AllowPaging="True">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="ImageItem0" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="AssessmentType" HeaderText="Assessment Type" SortExpression="AssessmentType">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Assessment" HeaderText="Assessment" SortExpression="Assessment">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="%">
                            <ItemTemplate>
                                <asp:Label ID="LabelPercentage" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Percentage") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="45px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="L">
                            <ItemTemplate>
                                <asp:Image ID="ImageStatus" runat="server" ImageUrl="~/Staff/Images/assessment_unlocked.png" />
                                <asp:HoverMenuExtender ID="ImageStatus_HoverMenuExtender" runat="server" OffsetX="0"
                                    OffsetY="0" PopDelay="50" PopupControlID="PanelInfoImageStatus" PopupPosition="Right"
                                    TargetControlID="ImageStatus">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="PanelInfoImageStatus" runat="server" CssClass="MenuToolTip" Style="display: none;"
                                    Width="200" HorizontalAlign="Left">
                                    <asp:Label ID="dLabdel1" runat="server" Text="Is Assessment Locked?" ForeColor="Red"
                                        Font-Bold="True"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label1d31" runat="server" Text="When the Assessment is locked, Scores con not be editted. Only StaffSD can update Scores."></asp:Label>
                                    <img class="callout" src="images/callout.gif" />
                                </asp:Panel>
                                <asp:HiddenField ID="HiddenFieldIsLocked" runat="server" Value='<%# Eval("IsLocked") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="S" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonEdit" runat="server" CausesValidation="False" CommandName="Select"
                                    ImageUrl="~/Staff/Images/edit.png" Text="Select" />
                                <asp:HoverMenuExtender ID="ImageButtonEdit_HoverMenuExtender" runat="server" OffsetX="0"
                                    OffsetY="0" PopDelay="50" PopupControlID="PanelInfoImageButtonEdit" PopupPosition="Right"
                                    TargetControlID="ImageButtonEdit">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="PanelInfoImageButtonEdit" runat="server" CssClass="MenuToolTip" Style="display: none;"
                                    Width="200" HorizontalAlign="Left">
                                    <asp:Label ID="dLdfdabdel1" runat="server" Text="Edit Assessment Scores" ForeColor="Red"
                                        Font-Bold="True"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Ladfdfbel1d31" runat="server" Text="Click here to see or edit Student Assessment Scores."></asp:Label>
                                    <img class="callout" src="images/callout.gif" />
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="Please Select a Course to Load Given Assessments!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                    <SelectedRowStyle BackColor="#FFFF99" />
                </asp:GridView>
                <br />
                <table style="border: 1px solid #999999; background-color: #E5E5E5" width="675">
                    <tr>
                        <td align="center" height="28" width="35">
                            <asp:Image ID="ImageLockStatus" runat="server" ImageUrl="~/Staff/Images/assessment_lock.png" />
                        </td>
                        <td width="375">
                            <asp:Label ID="LabelLockStatus" runat="server" Font-Bold="True" ForeColor="Red">Assessment is LOCKED. Scores can not be modified!</asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label172" runat="server" Font-Bold="True" ForeColor="#333333" Text="Use this button to see Scores:"></asp:Label>
                        </td>
                        <td align="center" width="35">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Staff/Images/edit.png" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="PanelAssessmentMarks" runat="server" Enabled="False">
                    <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceAssessmentsMarks" Width="675px" DataKeyNames="AssessmentMarkID">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="ImageItem" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <strong>
                                        <%# Container.DataItemIndex + 1 %>
                                    </strong>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Excused?">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBoxExcused" runat="server" Checked='<%# Bind("Excused") %>'
                                        AutoPostBack="True" OnCheckedChanged="CheckBoxExcused_CheckedChanged" />
                                    <asp:HiddenField ID="HiddenFieldIsLocked" runat="server" Value='<%# Eval("IsLocked") %>' />
                                    <asp:HoverMenuExtender ID="CheckBoxExcused_HoverMenuExtender" runat="server" OffsetX="0"
                                        OffsetY="0" PopDelay="50" PopupControlID="PanelInfoCheckBoxExcused" PopupPosition="Right"
                                        TargetControlID="CheckBoxExcused">
                                    </asp:HoverMenuExtender>
                                    <asp:Panel ID="PanelInfoCheckBoxExcused" runat="server" CssClass="MenuToolTip" Width="240"
                                        Style="display: none;" HorizontalAlign="Left">
                                        <asp:Label ID="Label1" runat="server" Text="Is Student Excused?" ForeColor="Red"
                                            Font-Bold="True"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label131" runat="server" Text="Check this, if the student is excused from Assessment for a valid reason."></asp:Label>
                                        <img class="callout" src="images/callout.gif" />
                                    </asp:Panel>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="75px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Score">
                                <ItemTemplate>
                                    <asp:RangeValidator ID="RangeValidator" runat="server" ControlToValidate="TextBoxInput"
                                        ErrorMessage="*" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="0"
                                        Type="Integer" ValidationGroup="AssessmentMarks">*</asp:RangeValidator>
                                    <asp:TextBox ID="TextBoxInput" runat="server" Text='<%# Bind("Score") %>' Width="30px"
                                        ValidationGroup="AssessmentMarks"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="TextBoxInput"
                                        ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentMarks">*</asp:RequiredFieldValidator>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="75px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                &nbsp;<br />
                                <br />
                                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                    Text="Please Select an Assessment to Load Student Marks!"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                        <HeaderStyle Height="30px" />
                    </asp:GridView>
                    <br />
                    <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update Assessment Marks" ValidationGroup="AssessmentMarks"
                        Width="675px" />
                </asp:Panel>
                <br />
                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelAddMissing"
                    TargetControlID="ButtonShowAddMissing" OnCancelScript="DoCancel()" BackgroundCssClass="modalBackground"
                    CancelControlID="ButtonAddMissingCancel">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAddMissing" runat="server" Width="430px" Style="display: none;">
                    <table style="border: 1px solid #999999; background-color: #E5E5E5" width="100%">
                        <tr>
                            <td height="28" width="35">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Staff/Images/info.png" />
                            </td>
                            <td width="100" colspan="2" style="width: 320px">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red" Text="Use the form to add missing students on the list above."></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td height="28" width="35">
                                <asp:Image ID="ImageItem1" runat="server" ImageUrl="~/Staff/Images/Item.png" />
                            </td>
                            <td width="100">
                                <asp:Label ID="Label143" runat="server" Text="Select Section"></asp:Label>
                            </td>
                            <td width="220">
                                <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="ImageItem2" runat="server" ImageUrl="~/Staff/Images/Item.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Select Student"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListStudents" runat="server" DataSourceID="SqlDataSourceStudents"
                                    DataTextField="StudentName" DataValueField="StudentID" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="ImageItem3" runat="server" ImageUrl="~/Staff/Images/Item.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Input Mark"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxMark" runat="server" Width="190px" MaxLength="3" />
                            </td>
                            <td>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBoxMark"
                                    ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="0"
                                    Type="Integer" ValidationGroup="Missing">(*)</asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Add Missing Student"
                                    Width="200px" ValidationGroup="Missing" />
                                <asp:ConfirmButtonExtender ID="ButtonInsert_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure?" Enabled="True" TargetControlID="ButtonInsert">
                                </asp:ConfirmButtonExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="ButtonAddMissingCancel" runat="server" CausesValidation="False" Text="Close Form"
                                    Width="200px" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_SectionCatalog.SectionCatalogID, tbl_SectionCatalog.SectionCatalog FROM tbl_CourseSections INNER JOIN tbl_SectionCatalog ON tbl_CourseSections.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_CourseSections.CourseSectionID = @CourseSectionID) ORDER BY tbl_SectionCatalog.SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND ([Continue] = 1) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, SectionGroup, SectionCatalog + N' ' + CourseCategory AS CourseCategory FROM vw_CourseSections WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) AND (CourseCategory &lt;&gt; N'Guidance') ORDER BY SectionGroup, SectionCatalog + N' ' + CourseCategory">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentID, AssessmentType, Assessment, Date, Percentage, IsLocked FROM vw_AssessmentsByTeachers WHERE (AcademicTermID = @AcademicTermID) AND (CourseSectionID = @CourseSectionID) AND (StaffID = @StaffID) ORDER BY AssessmentType, Assessment">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_AssessmentMarks.AssessmentMarkID, tbl_AssessmentMarks.AssessmentID, tbl_AssessmentMarks.StudentID, tbl_Students.StudentName, tbl_AssessmentMarks.AssessmentMark AS Score, tbl_AssessmentMarks.Excused, tbl_Assessments.IsLocked FROM tbl_AssessmentMarks INNER JOIN tbl_Students ON tbl_AssessmentMarks.StudentID = tbl_Students.StudentID INNER JOIN tbl_Assessments ON tbl_AssessmentMarks.AssessmentID = tbl_Assessments.AssessmentID WHERE (tbl_AssessmentMarks.AssessmentID = @AssessmentID) ORDER BY tbl_Students.StudentName"
                    UpdateCommand="UPDATE tbl_AssessmentMarks SET AssessmentMark = @AssessmentMark, Excused = @Excused WHERE (AssessmentMarkID = @AssessmentMarkID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AssessmentMark" />
                        <asp:Parameter Name="Excused" />
                        <asp:Parameter Name="AssessmentMarkID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <uc3:WebMessageBox ID="WebMessageBoxMarks" runat="server" />
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
