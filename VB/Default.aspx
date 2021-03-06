﻿<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function OnTabChanging(s, e) {
            var tabName = (pageControl.GetActiveTab()).name;
            e.cancel = !ASPxClientEdit.ValidateGroup('group' + tabName);
        }
        function OnButtonClick(s, e) {
            var indexTab = (pageControl.GetActiveTab()).index;
            pageControl.SetActiveTab(pageControl.GetTab(indexTab + 1));

        }
        function OnFinishClick(s, e) {
            if (ASPxClientEdit.ValidateGroup('groupTabContact')) {
                var str = '<b>Personal Info:</b><br />' + txtFirstName.GetValue() + '<br />' + txtLastName.GetValue() + '<hr />';
                str += '<b>Date Info:</b><br />' + getShortDate(deAnyDate.GetValue().toString()) + '<br />' + cbStates.GetValue() + '<hr />';
                str += '<b>Contact Info:</b><br />' + txtEmail.GetValue() + '<br />' + txtZipcode.GetValue() + '<hr />';
                popupControl.SetContentHtml(str);
                popupControl.ShowAtElement(pageControl.GetMainElement());
                popupControl.UpdatePositionAtElement(pageControl.GetMainElement());//ShowTabs
            }
        }
        function getShortDate(longDate) {
            var date = new Date(longDate);
            var month = date.getMonth() + 1;
            var str = month.toString() + '/' + date.getDate().toString() + '/' + date.getFullYear().toString();
            return str;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxCheckBox ID="showTabs" runat="server" AutoPostBack="true" Text="Show Tabs" OnCheckedChanged="showTabs_CheckedChanged" OnInit="showTabs_Init">
        </dx:ASPxCheckBox><br />
        <dx:ASPxPageControl ID="pageControl" ClientInstanceName="pageControl" runat="server"
            ActiveTabIndex="0" EnableHierarchyRecreation="true" >
            <ClientSideEvents ActiveTabChanging="OnTabChanging" />
            <TabPages>
                <dx:TabPage Name="TabPersonal" Text="Personal">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxLabel ID="lblFirstName" runat="server" Text="First name">
                            </dx:ASPxLabel>
                            <dx:ASPxTextBox ID="txtFirstName" runat="server" Width="170px" ClientInstanceName="txtFirstName">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="groupTabPersonal">
                                    <RequiredField IsRequired="True" ErrorText="First Name is required" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                            <hr />
                            <dx:ASPxLabel ID="lblLastName" runat="server" Text="Last name">
                            </dx:ASPxLabel>
                            <dx:ASPxTextBox ID="txtLastName" runat="server" Width="170px" ClientInstanceName="txtLastName">
                                <ValidationSettings SetFocusOnError="true" ValidationGroup="groupTabPersonal">
                                    <RequiredField IsRequired="true" ErrorText="Last Name is required" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                            <hr />
                            <dx:ASPxCheckBox ID="checkBox" runat="server" ClientInstanceName="checkBox" Text="I agree">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="groupTabPersonal">
                                    <RequiredField IsRequired="True" ErrorText="I agree is required" />
                                </ValidationSettings>
                            </dx:ASPxCheckBox>
                            <hr />
                            <dx:ASPxButton ID="btnNextPersonal" runat="server" Text="Next" ClientInstanceName="btnNextPersonal"
                                AutoPostBack="false" ValidationGroup="groupTabPersonal">
                                <ClientSideEvents Click="OnButtonClick" />
                            </dx:ASPxButton>
                            <dx:ASPxValidationSummary ID="validSummaryPersonal" runat="server" ValidationGroup="groupTabPersonal">
                            </dx:ASPxValidationSummary>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="TabDate" Text="Date">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxLabel ID="lblAnyDate" runat="server" Text="AnyDate">
                            </dx:ASPxLabel>
                            <dx:ASPxDateEdit ID="deAnyDate" runat="server" ClientInstanceName="deAnyDate">
                                <ValidationSettings ValidationGroup="groupTabDate" ValidateOnLeave="true" SetFocusOnError="true">
                                    <RequiredField IsRequired="true" ErrorText="Any Date is required" />
                                </ValidationSettings>
                            </dx:ASPxDateEdit>
                            <hr />
                            <dx:ASPxLabel ID="lblStates" runat="server" Text="State">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="cbStates" runat="server" ValueType="System.String" ClientInstanceName="cbStates">
                                <Items>
                                    <dx:ListEditItem Value="Alaska" Text="Alaska" />
                                    <dx:ListEditItem Value="Indiana" Text="Indiana" />
                                    <dx:ListEditItem Value="Kentucky" Text="Kentucky" />
                                    <dx:ListEditItem Value="Minnesota" Text="Minnesota" />
                                    <dx:ListEditItem Value="Nevada" Text="Nevada" />
                                </Items>
                                <ValidationSettings ValidationGroup="groupTabDate" ValidateOnLeave="true" SetFocusOnError="true">
                                    <RequiredField IsRequired="true" ErrorText="States is required" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                            <hr />
                            <dx:ASPxButton ID="btnNext" ValidationGroup="groupTabDate" runat="server" Text="Next"
                                ClientInstanceName="btnNextDate" AutoPostBack="false">
                                <ClientSideEvents Click="OnButtonClick" />
                            </dx:ASPxButton>
                            <dx:ASPxValidationSummary ID="validSummaryDate" runat="server" ValidationGroup="groupTabDate">
                            </dx:ASPxValidationSummary>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="TabContact" Text="Contact">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxLabel ID="lblEmail" runat="server" Text="E-Mail">
                            </dx:ASPxLabel>
                            <dx:ASPxTextBox ID="txtEmail" runat="server" ClientInstanceName="txtEmail" Width="170px">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="groupTabContact">
                                    <RegularExpression ErrorText="Invalid E-Mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <RequiredField IsRequired="True" ErrorText="E-Mail is required" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                            <hr />
                            <dx:ASPxLabel ID="lblZipcode" runat="server" Text="ZIP Code">
                            </dx:ASPxLabel>
                            <dx:ASPxTextBox ID="txtZipcode" runat="server" Width="170px" ClientInstanceName="txtZipcode">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="groupTabContact">
                                    <RequiredField IsRequired="true" ErrorText="ZIP Code is required" />
                                    <RegularExpression ValidationExpression="\d{5}(-\d{4})?" ErrorText="Invalid ZIP Code" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                            <hr />
                            <dx:ASPxButton ID="btnFinish" runat="server" Text="Finish" ValidationGroup="groupTabContact"
                                AutoPostBack="false">
                                <ClientSideEvents Click="OnFinishClick" />
                            </dx:ASPxButton>
                            <dx:ASPxValidationSummary ID="validSummaryContact" ValidationGroup="groupTabContact"
                                runat="server">
                            </dx:ASPxValidationSummary>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
    </div>
    <dx:ASPxPopupControl ID="popupControl" runat="server" CloseAction="CloseButton" ClientInstanceName="popupControl"
        HeaderText="Summary" PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="10">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    </form>
</body>
</html>