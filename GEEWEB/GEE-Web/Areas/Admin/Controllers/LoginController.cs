using GEE_Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using GEE.Web.Utility;
using GEE.Web.Service.Security;
using GEE_Web.WebLibrary;

namespace GEE_Web.Areas.Admin.Controllers
{
    public class LoginController : BaseController
    {
       
        // GET: Admin/Login
        public ActionResult Index()
        {
           // new LanguageAvailable().SetLanguage("Hi");
            return View();
        }
        public ActionResult Dashboard(string groupId, string schoolId, string sessionYear)
        {
            Session["groupId"] = groupId;
            Session["schoolId"] = schoolId;
            Session["sessionYear"] = sessionYear;
            return View();
        }
      
    }
}