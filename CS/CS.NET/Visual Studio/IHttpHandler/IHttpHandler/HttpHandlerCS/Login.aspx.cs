﻿using System.Web.Security;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {        
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            FormsAuthentication.Authenticate(Login1.UserName, Login1.Password);
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
        }
    }
}
