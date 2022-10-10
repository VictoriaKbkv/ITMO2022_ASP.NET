using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITMO2022_ASP.NET_Lab1_Ex1_2
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            long numVisitors = 0;
            if (Application["Visitors"] != null) 
            { 
                numVisitors = long.Parse(Application["Visitors"].ToString()); 
            }
            VisitorLiteral.Text = "Число посещений: " + numVisitors.ToString();
        }
    }
}