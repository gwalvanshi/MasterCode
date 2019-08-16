using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.SchoolSetup;
using GEE.Business.Model.SchoolSetup;
using GEE.Common;

namespace GEE.API.Controllers.DocumentLibrary
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SubjectMasterController : BaseController
    {
        ISubjectMaster _subjectMaster;

        public SubjectMasterController(ISubjectMaster subjectMaster)
        {
            _subjectMaster = subjectMaster;
        }

        /// <summary>
        /// Get All Subject Master
        /// </summary>
        /// <param name="objSubjectMasterModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = SubjectMasterConstants.SubjectMaster_GET)]
        public JsonResult<List<SubjectMasterModel>> GetAllSubjectMasterData(SubjectMasterModel objSubjectMasterModel)
        {
            try
            {
                var record = _subjectMaster.GetAllSubjectMasterData(objSubjectMasterModel.PageNo, objSubjectMasterModel.PageSize, objSubjectMasterModel.SortOrder, objSubjectMasterModel.SortColumn);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        /// Added Subject Master
        /// </summary>
        /// <param name="SubjectMasterModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = SubjectMasterConstants.SubjectMaster_POST)]
        public async Task<HttpResponseMessage> Save(SubjectMasterModel SubjectMasterModel)
        {
            try
            {
                await _subjectMaster.SaveAsync(SubjectMasterModel);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        /// <summary>
        /// Get single Subject Master
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = SubjectMasterConstants.SubjectMaster_GET)]
        public async Task<JsonResult<SubjectMasterModel>> GetById(int id)
        {
            try
            {
                var record = await _subjectMaster.GetByIdAsync(id);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        /// For Update Subject Master
        /// </summary>
        /// <param name="subjectMaster"></param>
        /// <returns></returns>
        [AcceptVerbs("PUT")]
        [HttpPut]
        [Authorize(Roles = SubjectMasterConstants.SubjectMaster_PUT)]
        public async Task<HttpResponseMessage> Update(SubjectMasterModel subjectMaster)
        {
            try
            {
                await _subjectMaster.UpdateAsync(subjectMaster);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }

        /// <summary>
        /// For Delete Subject Master
        /// </summary>
        /// <param name="subjectMaster"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpDelete]
        [Authorize(Roles = SubjectMasterConstants.SubjectMaster_DELETE)]
        public HttpResponseMessage Delete(SubjectMasterModel subjectMaster)
        {
            try
            {
                _subjectMaster.DeleteSubjectMaster(subjectMaster);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Delete Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }


        /// <summary>
        /// Get all Subject Master
        /// </summary>        
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        //[Authorize(Roles = SubjectMasterConstants.SubjectMaster_GET)]
        public async Task<JsonResult<List<SubjectMasterModel>>> GetAll()
        {
            try
            {
                var record = await _subjectMaster.GetAllAsync();
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