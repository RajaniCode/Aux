<%@ Page Language="VB" UICulture="auto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<script runat="server">
    
    sub Page_Load()
        lblMessage.Text = Resources.Site.Title
    end sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Program Global Typed</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <asp:Label
        id="lblMessage"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
