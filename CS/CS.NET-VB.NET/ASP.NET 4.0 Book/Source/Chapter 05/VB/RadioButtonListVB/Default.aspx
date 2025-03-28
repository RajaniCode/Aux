﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RadioButtonList Control Example</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
			ForeColor="Black" Text="Select the Category:" Font-Italic="True"></asp:Label>
			<asp:RadioButtonList ID="RadioButtonList1" runat="server" 
 			  AutoPostBack="True" 
			Font-Size="Medium" ForeColor="Black" Height="41px" 
			Width="505px" DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
            DataValueField="CategoryName" RepeatLayout="UnorderedList">
			</asp:RadioButtonList>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT [CategoryName] FROM [Categories]"></asp:SqlDataSource>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
			Font-Underline="True" Text="RadioButtonList Control Example"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="Small" 
 			  ForeColor="#FF0066"></asp:Label>

    </div>
    </form>
</body>
</html>
