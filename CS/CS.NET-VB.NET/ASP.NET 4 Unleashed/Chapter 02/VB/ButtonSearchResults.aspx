<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub Page_Load()
        If Not IsNothing(PreviousPage) Then
            Dim txtSearch As TextBox = CType(PreviousPage.FindControl("txtSearch"), TextBox)
            lblSearch.Text = String.Format("Search For: {0}", txtSearch.Text)
        End If
    End Sub
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Button Search Results</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Label
        id="lblSearch"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
