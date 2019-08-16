using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.Admin;
using GEE.Business.Model.Admin;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
namespace GEE.API.Controllers.Admin
{
    [Authorize]
    public class UserGroupNavigationMenuMappingController : BaseController
    {
        IUserGroupNavigationMenuMapping _local;

        public UserGroupNavigationMenuMappingController(IUserGroupNavigationMenuMapping localVar)
        {
            _local = localVar;
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = "UserGroupNavigationMenuMapping_GET")]
        public JsonResult<List<UserGroupNavigationMenuMappingModel>> GetAll()
        {
            try
            {
                var objList = _local.GetAll();
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = "UserGroupNavigationMenuMapping_GET")]
        public async Task<JsonResult<UserGroupNavigationMenuMappingModel>> GetById(int id)
        {
            try
            {
                var record = await _local.GetByIdAsync(id);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = "UserGroupNavigationMenuMapping_POST")]
        public async Task<HttpResponseMessage> Save(UserGroupNavigationMenuMappingModel data)
        {
            try
            {
                await _local.SaveAsync(data);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        [AcceptVerbs("PUT")]
        [HttpPut]
        [Authorize(Roles = "UserGroupNavigationMenuMapping_PUT")]
        public async Task<HttpResponseMessage> Update(UserGroupNavigationMenuMappingModel data)
        {
            try
            {
                await _local.UpdateAsync(data);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }

        [AcceptVerbs("DELETE")]
        [HttpPut]
        [Authorize(Roles = "UserGroupNavigationMenuMapping_DELETE")]
        public async Task<HttpResponseMessage> Delete(UserGroupNavigationMenuMappingModel data)
        {
            try
            {
                await _local.DeleteAsync(data);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }

    }
}
