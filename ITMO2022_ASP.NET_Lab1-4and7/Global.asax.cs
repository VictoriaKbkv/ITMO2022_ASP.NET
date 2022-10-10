using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace ITMO2022_ASP.NET_Lab1_Ex1_2
{

    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application["Visitors"] = 0;
        }

        void Session_Start(object sender, EventArgs e)
        { 
            // Код, выполняемый при запуске нового сеанса 
            // Increment Visitors counter
            Application["Visitors"] = long.Parse(Application["Visitors"].ToString()) + 1; }
        }
}