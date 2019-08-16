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
    public class SecGroupController : BaseController
    {
        ISecGroup _secGroup;

        public SecGroupController(ISecGroup secGroup)
        {
            _secGroup = secGroup;
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = "SecGroup_GET")]
        public JsonResult<List<SecGroupModel>> GetAll()
        {
            try
            {
                var objList = _secGroup.GetAll();
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
        [Authorize(Roles = "SecGroup_GET")]
        public async Task<JsonResult<SecGroupModel>> GetById(int id)
        {
            try
            {
                var record = await _secGroup.GetByIdAsync(id);
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
        [Authorize(Roles = "SecGroup_POST")]
        public async Task<HttpResponseMessage> Save(SecGroupModel data)
        {
            try
            {
                await _secGroup.SaveAsync(data);
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
        [Authorize(Roles = "SecGroup_PUT")]
        public async Task<HttpResponseMessage> Update(SecGroupModel data)
        {
            try
            {
                await _secGroup.UpdateAsync(data);
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
        [Authorize(Roles = "SecGroup_DELETE")]
        public async Task<HttpResponseMessage> Delete(SecGroupModel data)
        {
            try
            {
                await _secGroup.DeleteAsync(data);
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
