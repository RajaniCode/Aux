﻿

<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_ljxtfwm0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <center>
    <div>
        <br />
        <br />
       Enter First Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        Enter Last Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
            <asp:Button ID="Btnfullname" runat="server" Text="Full Name" 
            onclick="Btnfullname_Click"/>
            <br />
        <br />
            <br />
        <asp:Label ID="Label1" runat="server" ></asp:Label>
        
    </div></center>
    </form>
</body>
</html>
