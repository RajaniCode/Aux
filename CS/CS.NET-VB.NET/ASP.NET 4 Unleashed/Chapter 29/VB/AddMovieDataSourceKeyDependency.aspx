<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub dtlMovie_ItemInserted(ByVal sender As Object, ByVal e As DetailsViewInsertedEventArgs)
        Cache.Insert("MovieKey", DateTime.Now)
        Response.Redirect("~/DataSourceKeyDependency.aspx")
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Add Movie Key Dependency</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <h1>Add Movie</h1>
    
    <asp:DetailsView
        id="dtlMovie"
        DefaultMode="Insert"
        DataSourceID="srcMovies"
        AutoGenerateRows="false"
        AutoGenerateInsertButton="true"
        OnItemInserted="dtlMovie_ItemInserted"
        Runat="server">
        <Fields>
        <asp:BoundField
            DataField="Title"
            HeaderText="Title:" />
        <asp:BoundField
            DataField="Director"
            HeaderText="Director:" />
        </Fields>
    </asp:DetailsView>
    
    <asp:SqlDataSource
        id="srcMovies"
        ConnectionString="<%$ ConnectionStrings:Movies %>"
        InsertCommand="INSERT Movies (Title, Director)
            VALUES (@Title, @Director)"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
