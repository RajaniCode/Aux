﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PalceHolder Control Example</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" 
				Text="PlaceHolder Control Example showing TextBox at Runtime" 
 				  Font-Bold="True" 
				Font-Underline="True"></asp:Label>
				<br />
				<br />
				<asp:Button ID="Button1" runat="server" Text="Click Me!!" Font-
 				  Bold="True" onclick="Button1_Click" 
				/>
				<br />
				<br />
				<br />
				<asp:PlaceHolder ID="PlaceHolder1" 
 				  runat="server"></asp:PlaceHolder>
    </div>
    </form>
</body>
</html>
