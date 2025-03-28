﻿<%@ Page Language="C#" AutoEventWireup="true" Culture="auto" UICulture="auto" %>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button1.Text = DateTime.Now.ToString();
        Panel1.Visible = true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button2.Text = DateTime.Now.ToString();
        Panel2.Visible = true;
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ScriptCombiner Manual Test</title>
    <style type="text/css">
        .modalBackground { background-color:gray; };
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" CombineScriptsHandlerUrl="~/CombineScriptsHandler.ashx" EnableScriptGlobalization="true" EnableScriptLocalization="true" />

        <asp:UpdatePanel runat="server" ID="UpdatePanel2">
            <ContentTemplate>
                <asp:Button ID="Button1" runat="server" Text="Press for TextBoxWatermark" OnClick="Button1_Click" />
                <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender runat="server" TargetControlID="TextBox3" WatermarkText="watermark" />
                </asp:Panel>
                <ajaxToolkit:ConfirmButtonExtender runat="server" TargetControlID="Button1" ID="cb1"
                    ConfirmText="OK to submit?">
                </ajaxToolkit:ConfirmButtonExtender>
            </ContentTemplate>
        </asp:UpdatePanel>

        <br />

        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <asp:Button ID="Button2" runat="server" Text="Press for ModalPopup" OnClick="Button2_Click" />
                <asp:Panel ID="Panel2" runat="server" Visible="false">
                    <asp:Button ID="btnModal" runat="server" Text="Show ModalPopup" />
                    <asp:Panel ID="Panel3" runat="server" BackColor="Red" BorderColor="Black" style="display:none;">
                        Modal Text
                        <br />
                        <asp:Button ID="btnOK" runat="server" Text="Dismiss ModalPopup" />
                    </asp:Panel>
                    <ajaxToolkit:ModalPopupExtender TargetControlID="btnModal" runat="server" OkControlID="btnOK" PopupControlID="Panel3" BackgroundCssClass="modalBackground" />
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <br />

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender runat="server" ID="cal1" TargetControlID="TextBox1" />

        <br />
        <br />

        <ajaxToolkit:Accordion runat="server" ID="Accordion1">
            <Panes>
                <ajaxToolkit:AccordionPane runat="server">
                    <Header>Pane A</Header>
                    <Content><i>Content for pane A</i></Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                    <Header>Pane B</Header>
                    <Content><i>Content for pane B</i></Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                    <Header>Pane C</Header>
                    <Content><i>Content for pane C</i></Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
                    <Header>Pane D</Header>
                    <Content><i>Content for pane D</i></Content>
                </ajaxToolkit:AccordionPane>
            </Panes>
        </ajaxToolkit:Accordion>

        <br />

        <asp:Button ID="Button4" runat="server" Text="Full Postback" />

    </form>
</body>
</html>
