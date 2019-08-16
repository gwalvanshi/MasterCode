using GEE_Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GEE_Web.Areas.Dashboard.Controllers
{
    public class DashboardController : BaseController
    {
        // GET: Dashboard/Dashboard
        public ActionResult Index()
        {
            return View();
        }
    }
}