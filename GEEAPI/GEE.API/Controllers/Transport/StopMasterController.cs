using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.Transport;
using GEE.Business.Model.Transport;
using GEE.Common;

namespace GEE.API.Controllers.Transport
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class StopMasterController : BaseController
    {
        IStopMaster _StopMaster;

        public StopMasterController(IStopMaster StopMaster)
        {
            _StopMaster = StopMaster;
        }

        /// <summary>
        /// Get All Stop Master
        /// </summary>
        /// <param name="objStopMasterModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = StopMasterConstants.StopMaster_GET)]
        public JsonResult<List<StopMasterModel>> GetAllStopMasterData(StopMasterModel objStopMasterModel)
        {
            try
            {
                var record = _StopMaster.GetAllStopMasterData(objStopMasterModel.PageNo, objStopMasterModel.PageSize, objStopMasterModel.SortOrder, objStopMasterModel.SortColumn);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        /// Added Stop Master
        /// </summary>
        /// <param name="StopMasterModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = StopMasterConstants.StopMaster_POST)]
        public async Task<HttpResponseMessage> Save(StopMasterModel StopMasterModel)
        {
            try
            {
                await _StopMaster.SaveAsync(StopMasterModel);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        /// <summary>
        /// Get single Stop Master
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = StopMasterConstants.StopMaster_GET)]
        public async Task<JsonResult<StopMasterModel>> GetById(int id)
        {
            try
            {
                var record = await _StopMaster.GetByIdAsync(id);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        /// For Update Stop Master
        /// </summary>
        /// <param name="StopMaster"></param>
        /// <returns></returns>
        [AcceptVerbs("PUT")]
        [HttpPut]
        [Authorize(Roles = StopMasterConstants.StopMaster_PUT)]
        public async Task<HttpResponseMessage> Update(StopMasterModel StopMaster)
        {
            try
            {
                await _StopMaster.UpdateAsync(StopMaster);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }

        /// <summary>
        /// For Delete Stop Master
        /// </summary>
        /// <param name="StopMaster"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpDelete]
        [Authorize(Roles = StopMasterConstants.StopMaster_DELETE)]
        public HttpResponseMessage Delete(StopMasterModel StopMaster)
        {
            try
            {
                _StopMaster.DeleteStopMaster(StopMaster);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Delete Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }


        /// <summary>
        /// Get all Stop Master
        /// </summary>        
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = StopMasterConstants.StopMaster_GET)]
        public async Task<JsonResult<List<StopMasterModel>>> GetAll()
        {
            try
            {
                var record = await _StopMaster.GetAllAsync();
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

    }
}