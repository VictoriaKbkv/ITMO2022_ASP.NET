using System.Web;
using System.Web.Mvc;

namespace ITMO2022_ASP.NET_MVC_Lab4
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
