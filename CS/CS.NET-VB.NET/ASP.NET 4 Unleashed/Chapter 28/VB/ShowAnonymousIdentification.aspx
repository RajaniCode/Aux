<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
 
    Private Sub Page_PreRender()
        lblUserName.Text = Profile.UserName
        lblIsAnonymous.Text = Profile.IsAnonymous.ToString()
        Profile.numberOfVisits = Profile.numberOfVisits + 1
        lblNumberOfVisits.Text = Profile.numberOfVisits.ToString()
    End Sub
 
    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs)
        FormsAuthentication.SetAuthCookie("Bob", False)
        Response.Redirect(Request.Path)
    End Sub
 
    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        FormsAuthentication.SignOut()
        Response.Redirect(Request.Path)
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show Anonymous Identification</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    User Name:
    <asp:Label
        id="lblUserName"
        Runat="server" />
    <br />
    Is Anonymous:
    <asp:Label
        id="lblIsAnonymous"
        Runat="server" />
    <br />
    Number Of Visits:
    <asp:Label
        id="lblNumberOfVisits"
        Runat="server" />

    <hr />
    <asp:Button
        id="btnReload"
        Text="Reload"
        Runat="server" />

    <asp:Button
        id="btnLogin"
        Text="Login"
        OnClick="btnLogin_Click" 
        Runat="server" />
        
    <asp:Button
        id="btnLogout"
        Text="Logout"
        OnClick="btnLogout_Click" 
        Runat="server" />
            
    </div>
    </form>
</body>
</html>
