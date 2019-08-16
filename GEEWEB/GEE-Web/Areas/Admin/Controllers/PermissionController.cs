using GEE.Web.Service.Admin;
using GEE.Web.Service.Security;
using GEE.Web.ViewModel;
using GEE.Web.ViewModel.Admin;
using GEE.Web.ViewModel.Common;
using GEE.Web.ViewModel.Security;
using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
namespace GEE_Web.Areas.Admin.Controllers
{
    public class PermissionController : BaseController
    {
        NavigationPermissionService objNavigationPermissionService = new NavigationPermissionService();

        public ActionResult PermissionMapping()
        {
            return View();
        }
        public async Task<JsonResult> GeMenuPermission(int userGroup, int menuId)
        {
            var list = await objNavigationPermissionService.GeMenuPermission(userGroup, menuId);
            return new JsonResult { Data = list, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public async Task<JsonResult> GeMenu(int moduleId, int userGroupId)
        {
            var list = await objNavigationPermissionService.GetMenu(moduleId, userGroupId);
            return new JsonResult { Data = list, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        public async Task<JsonResult> GetModuleList(int userGroup, int menuId)
        {
            var list = await objNavigationPermissionService.GetModuleList(userGroup, menuId);
            //if(isMapped)
            //{
            //    list = list.Where(a => a.IsPermission == true).ToList();
            //}
            //else
            //{
            //    list = list.Where(a => a.IsPermission == false).ToList();
            //}
            return new JsonResult { Data = list, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        [HttpPost]
        public async Task<JsonResult> SavePermission(PermissionParentViewModel collection)
        {
            try
            {               
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await objNavigationPermissionService.Save(stringContent);
                //return new JsonResult { Data = new { status = status } };
                return new JsonResult { Data = new { status = status, IsSaved = true, Message = "Successfully Saved." } };
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = true, IsSaved = false, Message = "Error" } };
            }
        }
    }
}