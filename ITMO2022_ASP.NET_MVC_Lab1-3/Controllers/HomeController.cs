using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ITMO2022_ASP.NET_MVC_Lab1.Models;


namespace ITMO2022_ASP.NET_MVC_Lab1.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home

        //public ActionResult Index()
        //{
        //    return View();
        //}

        //public string Index(string hel) 
        //{ 
        //    //int hour = DateTime.Now.Hour; 
        //    //string Greeting = hour < 12 ? "Доброе утро" : "Добрый день" + ", " + hel; ; 
        //    //return Greeting;

        //    string Greeting = ModelClass.ModelHello() + ", " + hel; 
        //    return Greeting;
        //}

        private static PersonRepository db = new PersonRepository();
        public ViewResult Index() 
        { 
            int hour = DateTime.Now.Hour; 
            ViewBag.Greeting = hour < 12 ? "Доброе утро" : "Добрый день"; 
            ViewData["Mes"] = "хорошего настроения"; 
            return View(); 
        }

        [HttpGet] //это означает, что данный метод должен использоваться только для GET запросов
        public ViewResult InputData() 
        { 
            return View(); 
        }

        [HttpPost] //это означает, что новый метод будет иметь дело с POST запросами
        public ViewResult InputData(Person p)
        {
            db.AddResponse(p);
            return View("Hello", p);
        }

        public ViewResult OutputData() 
        { 
            ViewBag.Pers = db.GetAllResponses; 
            ViewBag.Count = db.NumberOfPerson; 
            return View("ListPerson"); 
        }
    }
}