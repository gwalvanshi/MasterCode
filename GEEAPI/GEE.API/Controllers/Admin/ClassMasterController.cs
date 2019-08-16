using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Results;
using GEE.Business.Interface.Admin;
using GEE.Business.Model.Admin;
using GEE.Business.Models.Admission;
using GEE.Common;
using NLog;

namespace GEE.API.Controllers.Admin
{
    public class ClassMasterController : BaseController
    {
        ///
        ///Created By: Amit Gajera on 05/01/2019 
        ///
        
        IClassMaster _iClassMaster;
        public ClassMasterController(IClassMaster iClassMaster)
        {
            _iClassMaster = iClassMaster;
        }

        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Authorize(Roles = AdminConstants.CLASSMASTERTABLE_VIEW_ROLE)]
        public HttpResponseMessage GetAll()
        {
            CustomDataResponseModel customResponseModel = new CustomDataResponseModel();
            try
            {
                ClassMasterModel objEnquiryModel = new ClassMasterModel();
                List<ClassMasterModel> objList = new List<ClassMasterModel>();
                objList = _iClassMaster.GetAll();

                if (objList.Count > 0)
                {
                    customResponseModel.type = "success";
                    customResponseModel.message = "";
                    customResponseModel.data = objList;
                }
                else
                {
                    customResponseModel.type = "error";
                    customResponseModel.message = "No records found!";
                    customResponseModel.data = objList;
                }
            }
            catch (Exception ex)
            {
                customResponseModel.type = "error";
                customResponseModel.message = ex.Message;
                customResponseModel.data = null;
                return Request.CreateResponse(HttpStatusCode.ExpectationFailed, customResponseModel);
            }
            return Request.CreateResponse(HttpStatusCode.OK, customResponseModel);
        }

        /// <summary>
        /// Get Detail ById
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.CLASSMASTERTABLE_VIEW_ROLE)]
        public JsonResult<ClassMasterModel> GetClassDetailById(int id)
        {
            try
            {
                return Json(_iClassMaster.GetById(id));
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        ///  Save Data
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = AdminConstants.CLASSMASTERTABLE_POST_ROLE)]
        public HttpResponseMessage Save(ClassMasterModel data)
        {
            try
            {
                  _iClassMaster.Save(data);

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        /// <summary>
        ///  Delete
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("DELETE")]
        [HttpDelete]
        [Authorize(Roles = AdminConstants.CLASSMASTERTABLE_DELETE_ROLE)]
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                _iClassMaster.DeActivateClass(id);

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Deleted");
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>

        [AcceptVerbs("PUT")]
        [HttpPut]
        [Authorize(Roles = AdminConstants.CLASSMASTERTABLE_PUT_ROLE)]
        public HttpResponseMessage Update(ClassMasterModel data)
        {
            try
            {    
                if (data.ClassMaster_ID > 0)
                {                                      
                    _iClassMaster.Update(data);
                }                                

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        /// <summary>
        ///  Get All ClassMaster Data
        /// </summary>
        /// <param name="objMasterTableModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.CLASSMASTERTABLE_VIEW_ROLE)]
        public JsonResult<List<ClassMasterViewModel>> GetAllClassMasterData(ClassMasterViewModel objMasterTableModel)
        {
            try
            {
                var record = _iClassMaster.GetAllClassMasterData(objMasterTableModel);
                //record.ForEach(a => a.MasterTabletype.MasterTables = null);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }


        /// <summary>
        /// Get All
        /// </summary>        
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.CLASSMASTERTABLE_VIEW_ROLE)]       
        public async Task<JsonResult<List<ClassWithCourceViewModel>>> GetAllList()
        {
            try
            {
                var record = await _iClassMaster.GetAllClassWithCourceCheck();
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