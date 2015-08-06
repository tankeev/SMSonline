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
        <table class="content-table" width="240">
            <tr>
                <td height="28">
                    <asp:Label ID="Label59" runat="server" Text="Not Found Students"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="28">
                    <asp:ListBox ID="ListBoxNotFound" runat="server" Font-Bold="True" ForeColor="Red"
                        Width="95%" Height="180px"></asp:ListBox>
                </td>
            </tr>
        </table>
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
        <div id="divChild">
            <asp:Panel ID="PanelStep1" runat="server" Width="680px">
                <div>
                    <asp:Label ID="Label54" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                        Text="Step 1: Upload Excel Data"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Black" Text="Use This Form to Upload & Send Exam Results of Your Students!"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label39" runat="server" Font-Bold="True" Text="SAMPLE EXCEL FORM:"
                        ForeColor="Maroon"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label58" runat="server" Font-Bold="True" ForeColor="Red" Text="Required Columns: NISN Number and 1-75 Question Answers"></asp:Label>
                    <br />
                    <br />
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Coordinators/Images/UploadStep1.PNG" />
                    <br />
                    <br />
                    <asp:Label ID="Label55" runat="server" Font-Bold="True" ForeColor="Red" Text="All Cells should be in Text Format."></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label40" runat="server" Font-Bold="True" ForeColor="Black" Text="For a successful upload, your excel file should be exactly like the sample above."></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label41" runat="server" Font-Bold="True" ForeColor="Red" Text="The more students in one upload file (approx. 30), the more time it takes."></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="ButtonAddNewAssessment" runat="server" Text="Upload Excel File" ValidationGroup="AddWeek"
                        Width="587px" Height="30px" />
                    <br />
                    <br />
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelStep2" runat="server" Visible="False" Width="680px">
                <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                    Text="Step 2: Check Uploaded Content"></asp:Label>
                <br />
                <br />
                <table style="background-color: #E9E9E9; border: 1px solid #999999" width="100%">
                    <tr>
                        <td width="30">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" ForeColor="Black" Text="Please check uploaded content from the table below."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label32" runat="server" Font-Bold="True" ForeColor="Maroon" Text="Make sure NISN numbers look correct. Be careful with NISNs starting with 0 (zero)."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label33" runat="server" Font-Bold="True" ForeColor="Black" Text="Student Answers Column should contain One Character like A, B, C, D, E ONLY. It may be BLANK."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Maroon" Text="Student Answers Column should NOT contain any row like AB, BCD, _, *, ?, etc..."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image9" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label45" runat="server" Font-Bold="True" ForeColor="Black" Text="Make Sure Student Answer Columns are correct in number, no additional columns allowed!"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image10" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label35" runat="server" Font-Bold="True" ForeColor="Maroon" Text="If any of the conditions above not satified, refresh the page and upload your Excel file again."></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelMPExamName" runat="server" Font-Bold="True" Font-Size="Small"
                    ForeColor="Red"></asp:Label>
                <br />
                <div style='overflow: auto; width: 100%;'>
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
                </div>
                <br />
                <asp:Label ID="LabelCounter" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Button ID="ButtonStep2" runat="server" Text="Next Step" Width="99%" Height="30px" />
                <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="PanelStep3" runat="server" Visible="False" Width="680px">
                <asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                    Text="Step 3: Send Your Results"></asp:Label>
                <br />
                <br />
                <table style="background-color: #E9E9E9; border: 1px solid #999999" width="100%">
                    <tr>
                        <td width="30">
                            <asp:Image ID="Image11" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label38" runat="server" Font-Bold="True" ForeColor="Black" Text="Send your Results to the System."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image12" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label47" runat="server" Font-Bold="True" ForeColor="Maroon" Text="Check Status Table below. If error occurs, try again."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image13" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label48" runat="server" Font-Bold="True" ForeColor="Black" Text="If you upload same data for more than once, old data will be removed from the system."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image14" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label50" runat="server" Font-Bold="True" ForeColor="Maroon" Text="When 'Uploading is Done!' message appears you may leave the page. "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image16" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label60" runat="server" Font-Bold="True" ForeColor="Black" Text="For NISNs, listed in the box 'Not Found Student', send their data to info@mitrapasiad.com"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image15" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                        </td>
                        <td>
                            <asp:Label ID="Label51" runat="server" Font-Bold="True" ForeColor="Maroon" Text="In a few hours, data will be checked by Admin. Thank you!"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="ButtonSendResults" runat="server" Text="Send Results" Width="99%"
                    Height="30px" />
                <br />
                <br />
                <asp:Label ID="Label57" runat="server" Font-Bold="True" ForeColor="Maroon" Text="STATUS TABLE"></asp:Label>
                <br />
                <br />
                <asp:ListBox ID="ListBoxStatus" runat="server" Font-Size="X-Small" ForeColor="Maroon"
                    Height="250px" Width="100%"></asp:ListBox>
                <br />
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Button ID="ButtonDone" runat="server" Text="Upload Another File" Width="99%"
                    Visible="False" Height="30px" />
                <br />
                <br />
            </asp:Panel>
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
    </div>
</asp:Content>
