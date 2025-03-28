﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CheckBoxList Control Example</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label2" runat="server" Font-Size="Medium" 
                        Text="Select an Employee Name:" ForeColor="Black" Font-Bold="True" Font-Italic="True"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
            Font-Size="Small" ForeColor="Black" Height="133px" Width="444px" 
            RepeatLayout="OrderedList" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="FirstName" 
            DataValueField="FirstName">
                    </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT [FirstName] FROM [Employees]"></asp:SqlDataSource>
            <br />
        <br />
        <br />
        <br />
        <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                        Font-Underline="True" Text="CheckBoxList Control Example"></asp:Label>
                         <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="#FF0066"></asp:Label>
    </div>
    </form>
</body>
</html>
