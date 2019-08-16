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
using GEE.Common;
namespace GEE.API.Controllers.Admin
{
    public class MasterTableController:BaseController
    {
        IMasterTable _iMasterTable;
        public MasterTableController(IMasterTable iMasterTable)
        {
            _iMasterTable = iMasterTable;
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.MASTERTABLE_GET_ROLE)]
        [Route("api/MasterTable/GetAll/{masterTableId=masterTableId}/{masterTypeId=masterTypeId}/{schoolId=schoolId}/{groupId=groupId}/{sessionYear=sessionYear}/{isDeleted=isDeleted}")]
        public JsonResult<List<MasterTableModel>> GetAll(int? masterTableId, int? masterTypeId, int? schoolId, int? groupId, int? sessionYear, bool? isDeleted)
        {
            try
            {
                var objList = _iMasterTable.GetMasterData(masterTableId, masterTypeId, schoolId, groupId, sessionYear, isDeleted);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = AdminConstants.MASTERTABLE_POST_ROLE)]
        public async Task<HttpResponseMessage> Save(MasterTableModel masterTable)
        {
            try
            {
                
                await _iMasterTable.SaveAsync(masterTable);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }


        [AcceptVerbs("GET")]
        [HttpGet]
        public JsonResult<MasterTableTypeModel> GetParentValues(int masterTableTypeId)
        {
            try
            {
                var record = _iMasterTable.GetParentValues(masterTableTypeId);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        public bool ChechIsDefaultInMasterTable(int schoolId, int groupId)
        {
            try
            {
                var record =  _iMasterTable.ChechIsDefaultInMasterTable(schoolId,groupId);
                return record;
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return false;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.MASTERTABLE_GET_ROLE)] 
        public async Task<JsonResult<MasterTableModel>> GetById(int id)
        {
            try
            {
                var record = await _iMasterTable.GetByIdAsync(id);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.MASTERTABLE_GET_ROLE)]
        public JsonResult<List<MasterTableModel>> GetAllForIndex()
        {
            try
            {
                var record = _iMasterTable.GetAll();
                record.ForEach(a => a.MasterTabletype.MasterTables = null);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        /// <summary>
        /// This method is used to bind the master datatable (jquery)
        /// Added by Jiya
        /// Added When 30 april
        /// </summary>
        /// <param name="objMasterTableModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.MASTERTABLE_GET_ROLE)]
        public JsonResult<List<MasterTableModel>> GetAllMasterData(MasterTableModel objMasterTableModel)
        {
            try
            {
                var record = _iMasterTable.GetAllMasterData(objMasterTableModel);
                //record.ForEach(a => a.MasterTabletype.MasterTables = null);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("PUT")]
        [HttpPut]
        [Authorize(Roles = AdminConstants.MASTERTABLE_PUT_ROLE)]
        public async Task<HttpResponseMessage> Update(MasterTableModel masterTable)
        {
            try
            {
               await _iMasterTable.UpdateAsync(masterTable);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }

        [AcceptVerbs("POST")]
        [HttpDelete]
        [Authorize(Roles = AdminConstants.MASTERTABLE_DELETE_ROLE)]
        public HttpResponseMessage Delete(MasterTableModel entity)
        {
            try
            {
                _iMasterTable.DeleteMaster(entity);
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