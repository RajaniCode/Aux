﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Data.Linq" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    void Page_Load()
    {
        MyDatabaseDataContext db = new MyDatabaseDataContext();
        grd.DataSource = db.Movies.OrderBy(m => m.BoxOfficeTotals);
        grd.DataBind();
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>List Movies by Box Office</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:GridView
        id="grd"
        runat="server" />
    
    </div>
    </form>
</body>
</html>
