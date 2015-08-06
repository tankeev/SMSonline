<%@ Page Title="SIS Assessment Marks" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="AssessmentsChecklist.aspx.vb" Inherits="Assessment_Marks" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="UCWebMessageBox" TagPrefix="uc3" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        function DoCancel() {
            $get('<%=TextBoxMark.ClientID%>').value = "";

        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="50" align="center">
                            <asp:Button ID="ButtonAddNewAssessment" runat="server" 
                                Text="Add New Assessment" Width="95%" />
                            <asp:ModalPopupExtender ID="MPAddGroup" runat="server" 
                                BackgroundCssClass="modalBackground" BehaviorID="MPAssessmentTypes" 
                                CancelControlID="ButtonCloseAssessmentTypes" 
                                PopupControlID="PanelAssessmentTypes" TargetControlID="ButtonAddNewAssessment">
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
                        <td height="28" width="35" align="center">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                        <td width="80">
                            <asp:Label ID="Label133" runat="server" Font-Bold="True" ForeColor="Red" Text="Weighting:"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Exams:"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label138" runat="server" Font-Bold="True" ForeColor="Red" Text="30%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label136" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Quizzes:"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label139" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label137" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Homework:"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label141" runat="server" Font-Bold="True" ForeColor="Red" Text="20%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label140" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Evaluation:"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label135" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessments" Width="675px" DataKeyNames="AssessmentID"
                    AllowPaging="True" PageSize="15">
                    <Columns>
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
                                    <asp:Label ID="Label1d31" runat="server" Text="When the Assessment is locked, Scores con not be editted. Only Staff can update Scores."></asp:Label>
                                    <img class="callout" src="images/callout.gif" />
                                </asp:Panel>
                                <asp:HiddenField ID="HiddenFieldIsLocked" runat="server" Value='<%# Eval("IsLocked") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="S" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonAssessmentMarks" runat="server" CausesValidation="False"
                                    ImageUrl="~/Staff/Images/edit.png" Text="Select" OnClick="ImageButtonAssessmentMarks_Click" />
                                <asp:HoverMenuExtender ID="ImageButtonAssessmentMarks_HoverMenuExtender" runat="server"
                                    OffsetX="0" OffsetY="0" PopDelay="50" PopupControlID="PanelInfoImageButtonEdit"
                                    PopupPosition="Right" TargetControlID="ImageButtonAssessmentMarks">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="PanelInfoImageButtonEdit" runat="server" CssClass="MenuToolTip" HorizontalAlign="Left"
                                    Style="display: none;" Width="200">
                                    <asp:Label ID="dLdfdabdel1" runat="server" Font-Bold="True" ForeColor="Red" Text="Edit Assessment Scores"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Ladfdfbel1d31" runat="server" Text="Click here to see or edit Student Assessment Scores."></asp:Label>
                                    <img class="callout" src="images/callout.gif" />
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section">
                            <ItemTemplate>
                                <asp:Label ID="LabelSection" runat="server" Font-Bold="True" Text='<%# Bind("SectionCatalog") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceGridViewAssessmentTypes"
                                    DataTextField="CourseSectionAssessmentType" DataValueField="CourseSectionAssessmentTypeID"
                                    SelectedValue='<%# DataBinder.Eval (Container.DataItem, "CourseSectionAssessmentTypeID") %>'
                                    ValidationGroup="AssessmentType" Width="95%">
                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assessment">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxAssessmentName" runat="server" MaxLength="40" Text='<%# Bind("Assessment") %>'
                                    ValidationGroup="AssessmentType" Width="90%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="%">
                            <ItemTemplate>
                                <asp:Label ID="LabelPercentage" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Percentage") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" SortExpression="AssessmentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelAID" runat="server" Text='<%# Bind("AssessmentID") %>' Font-Size="XX-Small"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" Font-Size="XX-Small" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="C" Visible="False">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxIsLocked" runat="server" Checked='<%# Bind("IsLocked") %>'
                                    Enabled="False" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="D">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDelete" runat="server" ImageUrl="~/Staff/Images/delete.gif"
                                    OnClientClick="return confirm('Are you sure you want to delete this Assessment?')"
                                    ToolTip="Delete!" OnClick="ImageButtonClick_AssessmentDelete" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no_results.jpg" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="Please Add Assessments!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                    <RowStyle Height="28px" />
                    <SelectedRowStyle BackColor="#FFFF99" />
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdate" runat="server" Text="Save Changes" Width="675px" />
                <br />
                <asp:ConfirmButtonExtender ID="ButtonUpdate_ConfirmButtonExtender" runat="server"
                    ConfirmText="Are you Sure?" Enabled="True" TargetControlID="ButtonUpdate">
                </asp:ConfirmButtonExtender>
                <br />
                <asp:Panel ID="PanelAssessmentMarks" runat="server" Width="550px" CssClass="modalPopup"
                    Style="display: none;">
                    <asp:ImageButton ID="ButtonCloseAssessmentMarks" runat="server" CssClass="CloseButton"
                        ImageUrl="~/Administrators/Images/Message_Error.png" />
                    <br />
                    <table style="border: 1px solid #999999; background-color: #E5E5E5" width="510">
                        <tr>
                            <td align="center" height="28" width="35">
                                <asp:Image ID="ImageLockStatus" runat="server" ImageUrl="~/Staff/Images/assessment_lock.png" />
                            </td>
                            <td>
                                <asp:Label ID="LabelLockStatus" runat="server" Font-Bold="True" ForeColor="Red">Assessment is LOCKED. Scores can not be modified!</asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="510">
                        <tr>
                            <td height="350">
                                <div style='overflow: auto; height: 100%;'>
                                    <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="AssessmentMarkID" DataSourceID="SqlDataSourceAssessmentsMarks"
                                        Width="99%">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <strong>
                                                        <%# Container.DataItemIndex + 1 %></strong>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxExcused" runat="server" AutoPostBack="True" Checked='<%# Bind("Excused") %>'
                                                        OnCheckedChanged="CheckBoxExcused_CheckedChanged" />
                                                    <asp:HiddenField ID="HiddenFieldIsLocked" runat="server" Value='<%# Eval("IsLocked") %>' />
                                                    <asp:HoverMenuExtender ID="CheckBoxExcused_HoverMenuExtender" runat="server" OffsetX="0"
                                                        OffsetY="0" PopDelay="50" PopupControlID="PanelInfoCheckBoxExcused" PopupPosition="Right"
                                                        TargetControlID="CheckBoxExcused">
                                                    </asp:HoverMenuExtender>
                                                    <asp:Panel ID="PanelInfoCheckBoxExcused" runat="server" CssClass="MenuToolTip" HorizontalAlign="Left"
                                                        Style="display: none;" Width="230">
                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Is Student Excused?"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label131" runat="server" Text="Check this, if the student is excused from Assessment for a valid reason."></asp:Label>
                                                        <img class="callout" src="images/callout.gif" />
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Score">
                                                <ItemTemplate>
                                                    <asp:RangeValidator ID="RangeValidatorTextBoxInput" runat="server" ControlToValidate="TextBoxInput"
                                                        ErrorMessage="*" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="0"
                                                        Type="Integer" ValidationGroup="AssessmentMarks">*</asp:RangeValidator>
                                                    <asp:TextBox ID="TextBoxInput" runat="server" Text='<%# Bind("Score") %>' ValidationGroup="AssessmentMarks"
                                                        Width="30px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxInput" runat="server"
                                                        ControlToValidate="TextBoxInput" ErrorMessage="*" Font-Bold="True" ForeColor="Red"
                                                        ValidationGroup="AssessmentMarks">*</asp:RequiredFieldValidator>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="75px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <br />
                                                <img alt="" src="Images/no_results.jpg" />
                                                <br />
                                                <br />
                                                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                                    Text="Please Select an Assessment to Load Student Marks!"></asp:Label>
                                                <br />
                                                <br />
                                            </div>
                                        </EmptyDataTemplate>
                                        <HeaderStyle Height="30px" />
                                        <RowStyle Height="25px" />
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update Assessment Marks" ValidationGroup="AssessmentMarks"
                        Width="510px" />
                    <br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="PanelAddMissing" runat="server" Width="450px" CssClass="modalPopup"
                    Style="display: none;">
                    <asp:ImageButton ID="ButtonCloseAddMissing" runat="server" CssClass="CloseButton"
                        ImageUrl="~/Administrators/Images/Message_Error.png" />
                    <table width="410">
                        <tr>
                            <td width="100" colspan="2" style="width: 320px" height="28">
                                <asp:Label ID="Label147" runat="server" Font-Bold="True" ForeColor="Red" Text="Use the form to add missing students on the list above."></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" height="28">
                                <asp:Label ID="Label143" runat="server" Text="Select Section" Font-Bold="True"></asp:Label>
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
                                <asp:Label ID="Label144" runat="server" Text="Select Student" Font-Bold="True"></asp:Label>
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
                                <asp:Label ID="Label145" runat="server" Text="Input Mark" Font-Bold="True"></asp:Label>
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
                                <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Add Missing Student"
                                    Width="200px" ValidationGroup="Missing" />
                                <asp:ConfirmButtonExtender ID="ButtonInsert_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure?" Enabled="True" TargetControlID="ButtonInsert">
                                </asp:ConfirmButtonExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelAssessmentTypes" runat="server" CssClass="modalPopup" Width="450px"
                    Style="display: none;">
                    <asp:ImageButton ID="ButtonCloseAssessmentTypes" runat="server" ImageUrl="~/Staff/Images/Message_Error.png"
                        CssClass="CloseButton" />
                    <table width="410">
                        <tr>
                            <td height="28">
                                <asp:Label ID="LabelWeekNo" runat="server" Font-Bold="True" Text="Select Assessment Type(s):"
                                    ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="150">
                                <div style='overflow: auto; height: 100%;'>
                                    <asp:GridView ID="GridViewAssessmentTypes" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="CourseSectionAssessmentTypeID" DataSourceID="SqlDataSourceAssessmentTypes"
                                        Width="99%">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxAssessmentType" runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CourseSectionID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelCourseSectionID" runat="server" Text='<%# Bind("CourseSectionID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CourseSectionAssessmentTypeID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelCourseSectionAssessmentTypeID" runat="server" Text='<%# Bind("CourseSectionAssessmentTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog" />
                                            <asp:BoundField DataField="CourseCategory" HeaderText="Course" SortExpression="CourseCategory" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <br />
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/No_Data_Icon.png" />
                                                <br />
                                                <br />
                                                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                                    Text="Sorry, No Assessment Types Found!"></asp:Label>
                                                <br />
                                                <br />
                                            </div>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Label ID="LabelWeekNo1" runat="server" Font-Bold="True" Text="Assessment Name:"
                                    ForeColor="Red"></asp:Label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorUsername" runat="server"
                                    ControlToValidate="TextBoxAssessmentName" ErrorMessage="Invalid Character!" Font-Bold="True"
                                    ForeColor="Red" ValidationExpression="^([a-zA-Z0-9.]|-|\s)+$" ValidationGroup="AssessmentType">(*)</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxAssessmentName"
                                    ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentType">(*)</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:TextBox ID="TextBoxAssessmentName" runat="server" Width="95%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Button ID="ButtonAddAssessment" runat="server" CommandName="Insert" Text="Add Assessment"
                                    ValidationGroup="AssessmentType" Width="97%" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentID, AssessmentType, Assessment, Date, Percentage, IsLocked, CourseSectionAssessmentTypeID, SectionCatalog FROM vw_AssessmentsByTeachers WHERE (AcademicTermID = @AcademicTermID) AND (StaffID = @StaffID) ORDER BY Date DESC, AssessmentType, SectionCatalog"
                    DeleteCommand="DELETE FROM tbl_Assessments WHERE (AssessmentID = @AssessmentID) 
DELETE FROM tbl_AssessmentMarks WHERE (AssessmentID = @AssessmentID)" UpdateCommand="UPDATE tbl_Assessments SET CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID, Assessment = @Assessment WHERE (AssessmentID = @AssessmentID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AssessmentID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                        <asp:Parameter Name="Assessment" />
                        <asp:Parameter Name="AssessmentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGridViewAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionAssessmentTypeID, SectionCatalog + N' / ' + Description AS CourseSectionAssessmentType, AcademicTermID FROM vw_CourseSectionAssessmentTypes WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) ORDER BY CourseSectionAssessmentType">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentMarkID, AssessmentID, StudentID, StudentName, IsLocked, Excused, AssessmentMark AS Score FROM vw_AssessmentMarks WHERE (AssessmentID = @AssessmentID)"
                    UpdateCommand="UPDATE tbl_AssessmentMarks SET AssessmentMark = @AssessmentMark, Excused = @Excused WHERE (AssessmentMarkID = @AssessmentMarkID)"
                    InsertCommand="IF NOT EXISTS 

(
SELECT        AssessmentMarkID
FROM            tbl_AssessmentMarks
WHERE        (AssessmentID = @AssessmentID) AND (StudentID = @StudentID)
)

INSERT INTO tbl_AssessmentMarks(AssessmentID, StudentID, AssessmentMark, Excused) VALUES (@AssessmentID, @StudentID, @AssessmentMark, @Excused)">
                    <InsertParameters>
                        <asp:Parameter Name="AssessmentID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="AssessmentMark" />
                        <asp:Parameter Name="Excused" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AssessmentMark" />
                        <asp:Parameter Name="Excused" />
                        <asp:Parameter Name="AssessmentMarkID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
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
                <asp:SqlDataSource ID="SqlDataSourceAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionAssessmentTypeID, CourseSectionID, Description, CourseCategory, SectionCatalog FROM vw_CourseSectionAssessmentTypes WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) ORDER BY Description, CourseCategory, SectionCatalog">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourseSectionsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="IF NOT EXISTS 

(
SELECT        AssessmentMarkID
FROM            tbl_AssessmentMarks
WHERE        (AssessmentID = @AssessmentID) AND (StudentID = @StudentID)
)

INSERT INTO tbl_AssessmentMarks(AssessmentID, StudentID, AssessmentMark, Excused) VALUES (@AssessmentID, @StudentID, @AssessmentMark, 0)"
                    SelectCommand="SELECT CourseSectionID, StudentID FROM tbl_CourseSectionStudents">
                    <InsertParameters>
                        <asp:Parameter Name="AssessmentID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="AssessmentMark" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <uc3:UCWebMessageBox ID="WebMessageBoxAssessments" runat="server" />
                <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                <asp:Button ID="btnShowMarks" runat="server" Style="display: none;" />
                <asp:ModalPopupExtender ID="MPAssessmentMarks" runat="server" BackgroundCssClass="modalBackground"
                    CancelControlID="ButtonCloseAssessmentMarks" PopupControlID="PanelAssessmentMarks"
                    TargetControlID="btnShowMarks" BehaviorID="MPAssessmentMarks">
                </asp:ModalPopupExtender>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
