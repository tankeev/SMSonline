<%@ Page Title="SIS Assessment Marks" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="AssessmentsStudentMarksAll.aspx.vb" Inherits="Assessment_Marks" %>

<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessmentsStaff" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
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
                            <asp:HyperLink ID="HyperLinkView0" runat="server" ImageUrl="~/StaffSD/Images/menu_view.png"
                                NavigateUrl="~/StaffSD/AssessmentsStudentMarks.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label142" runat="server" Text="Marks in Table View"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Given Courses"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCourses"
                                DataTextField="CourseCategory" DataValueField="CourseSectionID" Height="250px"
                                Width="95%" Font-Size="Small" ForeColor="Maroon"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" Font-Size="XX-Small"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENT MARKS</h2>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="675">
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithoutLeave2" runat="server" BackColor="Red" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label154" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(F) "></asp:Label>
                            <asp:Label ID="Label155" runat="server" Font-Size="X-Small" Text="Failed"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelPresent5" runat="server" BackColor="#006600" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label152" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label153" runat="server" Font-Size="X-Small" Text="Passed"></asp:Label>
                        </td>
                        <td width="25">
                            &nbsp;
                        </td>
                        <td width="100">
                            &nbsp;
                        </td>
                        <td width="25">
                            &nbsp;
                        </td>
                        <td width="100">
                            &nbsp;
                        </td>
                        <td width="25">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithLeave1" runat="server" BackColor="#FFFF99" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label156" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(Q) "></asp:Label>
                            <asp:Label ID="Label157" runat="server" Font-Size="X-Small" Text="Quiz"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelEarlyLeave0" runat="server" BackColor="#FFCC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label158" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(H) "></asp:Label>
                            <asp:Label ID="Label159" runat="server" Font-Size="X-Small" Text="Homework"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelPresent2" runat="server" BackColor="#99CC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label160" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(M) "></asp:Label>
                            <asp:Label ID="Label161" runat="server" Font-Size="X-Small" Text="Mid-Exam"></asp:Label>
                        </td>
                        <td>
                            <asp:Panel ID="PanelSickLeave3" runat="server" BackColor="#6699FF" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label162" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(F) "></asp:Label>
                            <asp:Label ID="Label163" runat="server" Font-Size="X-Small" Text="Final-Exam"></asp:Label>
                        </td>
                        <td>
                            <asp:Panel ID="PanelSickLeave4" runat="server" BackColor="#FFCCFF" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label164" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label165" runat="server" Font-Size="X-Small" Text="Practice"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssessmentsStudents"
                    Width="675px" ShowHeader="False" AllowPaging="True" PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <ItemTemplate>
                                <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" ForeColor="Red"
                                    Text='<%# Bind("StudentName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanelDataList" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                    <asp:DataList ID="DataListAssessmentMarks" runat="server" DataSourceID="SqlDataSourceAssessmentsMarks"
                                                        RepeatDirection="Horizontal" DataKeyField="AssessmentMarkID" OnItemCreated="DatalistAssessmentMarks_ItemCreated"
                                                        OnItemDataBound="DatalistAssessmentMarks_DataBound">
                                                        <FooterTemplate>
                                                            <asp:Label ID="LabelEmpty" runat="server" Font-Bold="False" ForeColor="Black" Text="Sorry, No Assessment Found!"
                                                                Visible="False"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Panel ID="PanelDataItem" runat="server">
                                                                <table style="border: 1px solid #999999;" width="50">
                                                                    <tr>
                                                                        <td align="center">
                                                                            <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 45px">
                                                                                <asp:Label ID="LabelAssessment" runat="server" Text='<%# Eval("Assessment") %>' Font-Size="XX-Small"
                                                                                    ForeColor="Red" />
                                                                            </div>
                                                                            <asp:HoverMenuExtender ID="LabelAssessment_HoverMenuExtender" runat="server" OffsetX="0"
                                                                                OffsetY="0" PopDelay="50" PopupControlID="PanelInfoAssessment" PopupPosition="Left"
                                                                                TargetControlID="LabelAssessment">
                                                                            </asp:HoverMenuExtender>
                                                                            <asp:Panel ID="PanelInfoAssessment" runat="server" CssClass="MenuToolTip" Style="display: none;">
                                                                                <asp:Label ID="LabelInfoAssessment" runat="server" Text='<%# Eval("Assessment") %>'
                                                                                    Font-Size="XX-Small" /></asp:Label>
                                                                                <br />
                                                                            </asp:Panel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:TextBox ID="TextBoxAssessmentMark" runat="server" Text='<%# Eval("AssessmentMark") %>'
                                                                                Width="20px" MaxLength="3"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAssessmentMark" runat="server"
                                                                                ControlToValidate="TextBoxAssessmentMark" ErrorMessage="*" ForeColor="Red" ValidationGroup="AssessmentMark"></asp:RequiredFieldValidator>
                                                                            <asp:RangeValidator ID="RangeValidatorAssessmentMark" runat="server" ControlToValidate="TextBoxAssessmentMark"
                                                                                ErrorMessage="*" ForeColor="Red" MaximumValue="100" MinimumValue="0" Type="Integer"
                                                                                ValidationGroup="AssessmentMark"></asp:RangeValidator>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                            <asp:HiddenField ID="HiddenFieldColor" runat="server" Value='<%# Eval("Color") %>' />
                                                            <asp:HiddenField ID="HiddenFieldIsLocked" runat="server" Value='<%# Eval("IsLocked") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                                <td align="center" width="60">
                                                    <table style="border: 1px solid #999999;" width="50">
                                                        <tr>
                                                            <td align="center">
                                                                <asp:Label ID="LabelAssessment0" runat="server" Font-Size="XX-Small" ForeColor="Red"
                                                                    Text="Save!" />
                                                                <asp:HoverMenuExtender ID="LabelAssessment0_HoverMenuExtender" runat="server" OffsetX="0"
                                                                    OffsetY="0" PopDelay="50" PopupControlID="PanelInfoAssessment" PopupPosition="Left"
                                                                    TargetControlID="LabelAssessment0">
                                                                </asp:HoverMenuExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <asp:ImageButton ID="ImageButtonUpdateDataList" runat="server" ImageUrl="~/Staff/Images/Save-as-icon.png"
                                                                    OnClick="ImageButtonUpdateDataList_Click" ValidationGroup="AssessmentMark" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <asp:Label ID="LabelAssessment1" runat="server" Font-Size="XX-Small" ForeColor="Red"
                                                                    Text="Save!" />
                                                                <asp:HoverMenuExtender ID="LabelAssessment1_HoverMenuExtender" runat="server" OffsetX="0"
                                                                    OffsetY="0" PopDelay="50" PopupControlID="PanelInfoAssessment" PopupPosition="Left"
                                                                    TargetControlID="LabelAssessment1">
                                                                </asp:HoverMenuExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                        <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                            SelectCommand="SELECT AssessmentMarkID, AssessmentID, Assessment, AssessmentMark, Color, IsLocked FROM vw_AssessmentMarks WHERE (StudentID = @StudentID) AND (CourseSectionID = @CourseSectionID) ORDER BY Assessment"
                                            UpdateCommand="UPDATE tbl_AssessmentMarks SET AssessmentMark = @AssessmentMark WHERE (AssessmentMarkID = @AssessmentMarkID)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value"
                                                    DbType="Guid" />
                                                <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="AssessmentMark" />
                                                <asp:Parameter Name="AssessmentMarkID" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                        <asp:Panel ID="PanelInfoUpdateDataList" runat="server" CssClass="MenuToolTip" Width="230"
                                            Style="display: none;">
                                            <asp:Label ID="Lasbel1" runat="server" Text="Save Your Changes" ForeColor="Red" Font-Bold="True"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="Lasbel2" runat="server" Text="If you change the scores, please use this button to Update."></asp:Label>
                                            <img class="callout" src="images/callout.gif" />
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center" Width="100%">
                            <br />
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Staff/Images/no-data.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Please Select a Course from the List!"></asp:Label>
                            <br />
                            <br />
                        </asp:Panel>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update All Assessment Marks" Width="675px" />
                <asp:ConfirmButtonExtender ID="ButtonUpdate_ConfirmButtonExtender" runat="server"
                    ConfirmText="Are you sure? This will update all records!" Enabled="True" TargetControlID="ButtonUpdate">
                </asp:ConfirmButtonExtender>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, SectionGroup, SectionCatalog + N' ' + CourseCategory AS CourseCategory FROM vw_CourseSections WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) AND (CourseCategory &lt;&gt; N'Guidance') ORDER BY SectionGroup, SectionCatalog + N' ' + CourseCategory">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM vw_CourseSectionStudents WHERE (CourseSectionID = @CourseSectionID) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uswnb:WebMessageBox ID="WebMessageBoxMarksAll" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
