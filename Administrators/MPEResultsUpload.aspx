<%@ Page Title="SIS Upload MP Exam Results" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="MPEResultsUpload.aspx.vb" Inherits="General_Test_Scores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuMPExams.ascx" TagName="MenuMPExams" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            MENU</h2>
        <br />
        <uc1:MenuMPExams ID="MenuMPExams" runat="server" />
        <br />
        <asp:ModalPopupExtender ID="MPAddAssessment" runat="server" PopupControlID="PanelAddAssessment"
            TargetControlID="ButtonAddNewAssessment" OnCancelScript="DoCancel()" BackgroundCssClass="modalBackground"
            CancelControlID="ButtonAssessmentCancel">
        </asp:ModalPopupExtender>
        <br />
    </div>
    <div class="content-right">
        <h2>
            MPE RESULTS UPLOAD</h2>
        <br />
        <asp:Panel ID="PanelWarning" runat="server" BackColor="White" BorderColor="#999999"
            BorderWidth="1px" Width="680px" BorderStyle="Solid">
            <div align="center">
                <br />
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                <br />
                <br />
                <br />
                <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" Text="Use This Form to Upload & Send Exam Results of Your Students!"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label39" runat="server" Font-Bold="True" Text="SAMPLE EXCEL FORM:"></asp:Label>
                <br />
                <br />
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Administrators/Images/UploadStep1.PNG" />
                <br />
                <br />
                <asp:Label ID="Label40" runat="server" Font-Bold="True" ForeColor="Black" Text="For a successful upload, your excel file should be exactly like the sample above."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label41" runat="server" Font-Bold="True" ForeColor="Red" Text="(Maximum 30 Students in one Upload File. Number of Questions may change.)"></asp:Label>
                <br />
                <br />
                <asp:Button ID="ButtonAddNewAssessment" runat="server" Text="Upload Results" ValidationGroup="AddWeek"
                    Width="587px" />
                <br />
                <br />
                <br />
            </div>
        </asp:Panel>
        <br />
        <asp:Panel ID="PanelResults" runat="server" Visible="False">
            <div style='overflow: auto; width: 100%;'>
                <asp:Label ID="Label31" runat="server" Font-Bold="True" ForeColor="Red" Text="Step 1:"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label34" runat="server" Font-Bold="True" ForeColor="Maroon" Text="Please Check Uploaded Content."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label42" runat="server" Font-Bold="True" ForeColor="Black" Text="ID Column data comes from the MP Exam you chose in the previous step."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label32" runat="server" Font-Bold="True" ForeColor="Maroon" Text="Make sure NISN numbers look correct. Be careful with NISNs starting with 0 (zero)."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label33" runat="server" Font-Bold="True" ForeColor="Black" Text="Student Answers Column should contain One Character like A, B, C, D, E ONLY. It may be BLANK."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Maroon" Text="Student Answers Column should NOT contain any row like AB, BCD, _, *, ?, etc..."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label45" runat="server" Font-Bold="True" ForeColor="Black" Text="Make Sure Student Answer Columns are correct in number, no additional columns allowed!"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewStudentAnswers" runat="server" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Check">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxCheck" runat="server" Checked="True" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="40px" />
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
            </div>
            <br />
            <asp:Label ID="LabelCounter" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label36" runat="server" Font-Bold="True" ForeColor="Red" Text="Step 2:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label35" runat="server" Font-Bold="True" ForeColor="Black" Text="If any of the conditions above not satified, please refresh the page and upload your Excel file again, after you modified it."></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label37" runat="server" Font-Bold="True" ForeColor="Red" Text="Step 3:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label38" runat="server" Font-Bold="True" ForeColor="Black" Text="Send you Results to the System."></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonSendResults" runat="server" Text="Send Results" Width="99%" />
            <br />
            <br />
            <asp:Label ID="LabelCounter0" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label46" runat="server" Font-Bold="True" ForeColor="Red" Text="Step 4:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label47" runat="server" Font-Bold="True" ForeColor="Black" Text="Check Status Table. If error occurs, try again."></asp:Label>
            <br />
            <br />
            <asp:ListBox ID="ListBoxStatus" runat="server" Font-Size="X-Small" ForeColor="Maroon"
                Height="240px" Width="100%"></asp:ListBox>
            <br />
            <br />
            <asp:Label ID="Label48" runat="server" Font-Bold="True" ForeColor="Black" Text="If you upload same data for more than once, old data will be removed from the system."></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label49" runat="server" Font-Bold="True" ForeColor="Red" Text="Step 5:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label50" runat="server" Font-Bold="True" ForeColor="Black" Text="Successfully Uploaded data requires Admin Confirmation to be published."></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label51" runat="server" Font-Bold="True" ForeColor="Black" Text="In a few hours, data will be checked by Admin. Thank you!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="PanelAddAssessment" runat="server" CssClass="modalPopup" Width="450px"
            Style="display: none;">
            <table width="100%">
                <tr>
                    <td height="35">
                        <asp:Button ID="ButtonAssessmentCancel" runat="server" Text="Close" Width="98%" />
                    </td>
                </tr>
                <tr>
                    <td height="25">
                        <asp:Label ID="Label29" runat="server" Text="1) Select MP Exam:" Font-Bold="True"
                            ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="25">
                        <asp:Label ID="Label43" runat="server" Font-Bold="True" ForeColor="Black" Text="Please be carefull what you choose, there is no UnDo option."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:DropDownList ID="DropDownListMPExams" runat="server" DataSourceID="SqlDataSourceMPExams"
                            DataTextField="GeneralTestName" DataValueField="GeneralTestID" Width="98%" Style="margin-bottom: 0px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="2) Select File to be Uploaded:"
                            ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:Label ID="Label44" runat="server" Font-Bold="True" ForeColor="Black" Text="The file you choose to upload should be similar to the sample."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:FileUpload ID="FileUploadMPEResults" runat="server" Width="98%" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUpload" runat="server" ControlToValidate="FileUploadMPEResults"
                            ErrorMessage="Please Choose an Excel file to Upload!" Font-Bold="True" ForeColor="Red"
                            ValidationGroup="UploadResults"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorUpload" runat="server"
                            ControlToValidate="FileUploadMPEResults" ErrorMessage="Only Excel file is allowed!"
                            Font-Bold="True" ForeColor="Red" ValidationExpression="^.+(.xls|.XLS|.xlsx|.XLSX)$"
                            ValidationGroup="UploadResults"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td height="35">
                        <asp:Button ID="ButtonAddAssessment" runat="server" Text="Upload!" ValidationGroup="UploadResults"
                            Width="98%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSourceMPExams" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT GeneralTestID, GeneralTestName, AcademicTermID FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestName">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
