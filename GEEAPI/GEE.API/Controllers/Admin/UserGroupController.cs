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
    public class UserGroupController : BaseController
    {
        IUserGroup _local;

        public UserGroupController(IUserGroup localVar)
        {
            _local = localVar;
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = "UserGroup_GET")]
        public JsonResult<List<UserGroupModel>> GetAll()
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
        [Authorize(Roles = "UserGroup_GET")]
        public async Task<JsonResult<UserGroupModel>> GetById(int id)
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
        [Authorize(Roles = "UserGroup_POST")]
        [AuthorizeIPAddress]
        public async Task<HttpResponseMessage> Save(UserGroupModel data)
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
        [Authorize(Roles = "UserGroup_PUT")]
        public async Task<HttpResponseMessage> Update(UserGroupModel data)
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
        [Authorize(Roles = "UserGroup_DELETE")]
        public async Task<HttpResponseMessage> Delete(UserGroupModel data)
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
