﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Demo
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.MapRoute(
            //    "CarsDefault",
            //    "Cars/{action}/{make}/{model}",
            //    new { controller = "Cars", action = "Model", make = "Holden", model = "Camaro" }
            //    );

            routes.MapRoute(
                "Default",                                             
                "{controller}/{action}/{id}",                          
                new { controller = "Home", action = "Index", id = "" } 
            );
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }
}