﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("Displayprofile.aspx");
        }

    }
    protected void BtnCreateUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreateUser.aspx");
    }
}