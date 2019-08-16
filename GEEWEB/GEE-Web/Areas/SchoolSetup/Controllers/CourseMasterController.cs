using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using GEE.Web.Service.SchoolSetup;
using GEE.Web.ViewModel.SchoolSetup;
using System.Linq;

namespace GEE_Web.Areas.SchoolSetup.Controllers
{
    public class CourseMasterController : BaseController
    {
        // GET: SchoolSetup/CourseMaster
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
            return View();
        }
    }
}