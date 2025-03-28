﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>		
		<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
			<ProgressTemplate>
				<strong>
					Updation is in progress
				</strong>
			</ProgressTemplate>
		</asp:UpdateProgress>		
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
        <h2>
		<asp:Label ID="LabelHeading" runat="server" Text="Application Using UpdateProgress Control"></asp:Label>
		</h2>
		 <asp:Button ID="BtnProgress" runat="server" Text="Start Progress" onclick="BtnProgress_Click" />
		&nbsp;
		</ContentTemplate>
		</asp:UpdatePanel>       
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <asp:Label ID="LabelDemo" runat="server" Text="UpdateProgress Demo"></asp:Label>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
