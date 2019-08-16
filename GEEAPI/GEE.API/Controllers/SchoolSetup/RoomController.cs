using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.SchoolSetup;
using GEE.Business.Models.SchoolSetup;
using GEE.Common;

namespace GEE.API.Controllers.SchoolSetup
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RoomController : BaseController
    {
        IRoomMaster _roomMaster;

        public RoomController(IRoomMaster roomMaster)
        {
            _roomMaster = roomMaster;
        }

       /// <summary>
       /// Get all Room from Room master
       /// </summary>
       /// <param name="roomModel"></param>
       /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
       // [Authorize(Roles = SchoolConstants.ROOMMASTER_GET_ROLE)]
        public JsonResult<List<RoomModel>> GetAllRooms(RoomModel roomModel)
        {
            try
            {
                var record = _roomMaster.GetAllRooms(roomModel.PageNo, roomModel.PageSize, roomModel.SortOrder, roomModel.SortColumn);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        /// Add Room in RoomMaster
        /// </summary>
        /// <param name="roomModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
       // [Authorize(Roles = SchoolConstants.ROOMMASTER_POST_ROLE)]
        public async Task<HttpResponseMessage> Save(RoomModel roomModel)
        {
            try
            {
               
                await _roomMaster.SaveAsync(roomModel);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

       /// <summary>
       /// Get Room master by id
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        //[Authorize(Roles = SchoolConstants.ROOMMASTER_GET_ROLE)]
        public async Task<JsonResult<RoomModel>> GetById(int id)
        {
            try
            {
                var record = await _roomMaster.GetByIdAsync(id);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        /// For Update Room Master
        /// </summary>
        /// <param name="roomModel"></param>
        /// <returns></returns>
        [AcceptVerbs("PUT")]
        [HttpPut]
       // [Authorize(Roles = SchoolConstants.ROOMMASTER_PUT_ROLE)]
        public async Task<HttpResponseMessage> Update(RoomModel roomModel)
        {
            try
            {
                await _roomMaster.UpdateAsync(roomModel);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }

        /// <summary>
        /// For Delete Room from RoomMaster
        /// </summary>
        /// <param name="roomModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpDelete]
        //[Authorize(Roles = SchoolConstants.ROOMMASTER_DELETE_ROLE)]
        public async Task<HttpResponseMessage> Delete(RoomModel roomModel)
        {
            try
            {
                _roomMaster.DeleteRoom(roomModel);
           
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Delete Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }
        
    }
}