using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using GEE.Web.Utility;
using GEE_Web.WebLibrary;
namespace GEE_Web.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            StringBuilder sr = new StringBuilder();
            
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult ChangeLanguage(string lang)
        {
            new LanguageAvailable().SetLanguage(lang);
            //return RedirectToAction("Index", "Home");
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}