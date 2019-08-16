using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Results;
using GEE.Business.Interface.Security;
using GEE.Business.Model.Admin;
using GEE.Business.Model.Security;
namespace GEE.API.Controllers.Security
{
    public class NavigationPermissionController : BaseController
    {
        INavigationPermission _navigationPermission;      

        public NavigationPermissionController(INavigationPermission navigationPermission)
        {
            _navigationPermission = navigationPermission;
            
        }
      /// <summary>
      /// This methos is used to get navigation permission for action based on user group and  menu id
      /// added by jiya 
      /// </summary>
      /// <param name="userGroupid"></param>
      /// <param name="menuid"></param>
      /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        public JsonResult<List<NavigationPermissionModel>> GetNavigationPermission(int userGroupid, int menuid)
        {
            try
            {

                return Json(_navigationPermission.GetNavigationPermission(userGroupid, menuid));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        /// <summary>
        /// This methos is used to get navigation permission for menu based on user group and  menu id
        /// added by jiya 
        /// </summary>
        /// <param name="userGroupid"></param>
        /// <param name="menuid"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        public JsonResult<List<PermissionMappingModel>> GeMenuPermission(int userGroupid, int menuid)
        {
            try
            {

                return Json(_navigationPermission.GeMenuPermission(userGroupid, menuid));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        /// <summary>
        /// This methos is used to get navigation permission for module based on user group and  menu id
        /// added by jiya 
        /// </summary>
        /// <param name="userGroupid"></param>
        /// <param name="menuid"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        public JsonResult<List<PermissionParentModel>> GetModuleList(int userGroupid, int menuid)
        {
            try
            {

                return Json(_navigationPermission.GetModuleList(userGroupid, menuid));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        [AcceptVerbs("GET")]
        [HttpGet]
        public JsonResult<List<PermissionParentModel>> GetMenu(int moduleId, int userGroupId)
        {
            try
            {

                return Json(_navigationPermission.GetMenu(moduleId, userGroupId));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        [AcceptVerbs("POST")]        
        [HttpPost]
        public HttpResponseMessage Save([FromBody] PermissionParentModel data)
        {
            try
            {

                _navigationPermission.Save(data);

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }
    }
}