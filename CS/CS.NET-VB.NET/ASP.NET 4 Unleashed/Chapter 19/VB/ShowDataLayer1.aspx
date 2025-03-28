<%@ Page Language="VB" %>
<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
 
    Private Sub Page_Load()
        ' Get database data
        Dim categories As New List(Of DataLayer1.MovieCategory)()
        Dim movies As New List(Of DataLayer1.Movie)()
        DataLayer1.GetMovieData(categories, movies)
 
        ' Bind the data
        grdCategories.DataSource = categories
        grdCategories.DataBind()
        grdMovies.DataSource = movies
        grdMovies.DataBind()
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show DataLayer1</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <h1>Movie Categories</h1>
    <asp:GridView
        id="grdCategories"
        Runat="server" />
        
    <h1>Movies</h1>    
    <asp:GridView
        id="grdMovies"
        Runat="server" />    
    
    </div>
    </form>
</body>
</html>
