<%@ Page Language="VB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>BetterProfileProvider Report</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <h1>Activity Report</h1>
    
    <asp:GridView
        id="grdProfiles"
        DataSourceID="srcProfiles"
        Runat="server" />
    
    <asp:SqlDataSource  
        id="srcProfiles"
        ConnectionString="<%$ ConnectionStrings:conProfile %>"
        SelectCommand="SELECT ProfileID,FirstName,LastName,NumberOfVisits
            FROM ProfileData"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
