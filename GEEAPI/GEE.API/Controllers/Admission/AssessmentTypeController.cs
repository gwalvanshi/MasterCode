using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Results;
using GEE.Business.Interface.Admin;
using GEE.Business.Interface.Admission;
using GEE.Business.Model.Admin;
using GEE.Business.Model.Admission;
using GEE.Business.Models.Admission;
using GEE.Common;
using NLog;
namespace GEE.API.Controllers.Admission
{

    public class AssessmentTypeController : BaseController
    {
        // GET: Assessment Type 
        ///
        ///Created By: Amit Gajera on 05/05/2019 
        ///

        IAssessmentType _iAssessmentType;
        public AssessmentTypeController(IAssessmentType iAssessmentType)
        {
            _iAssessmentType = iAssessmentType;
        }

        /// <summary>
        /// Get Detail ById
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.ASSESSMENTTYPETABLE_GET_ROLE)]
        public JsonResult<AssessmentTypeModel> GetDetailById(int id)
        {
            try
            {
                return Json(_iAssessmentType.GetById(id));

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
        [Authorize(Roles = AdminConstants.ASSESSMENTTYPETABLE_POST_ROLE)]
        public HttpResponseMessage Save(AssessmentTypeModel data)
        {
            try
            {
                _iAssessmentType.Save(data);

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
        [Authorize(Roles = AdminConstants.ASSESSMENTTYPETABLE_DELETE_ROLE)]
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                _iAssessmentType.DeActivateAssessmentType(id);

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
        [Authorize(Roles = AdminConstants.ASSESSMENTTYPETABLE_PUT_ROLE)]
        public HttpResponseMessage Update(AssessmentTypeModel data)
        {
            try
            {
                if (data.AssessmentType_Id > 0)
                {
                    _iAssessmentType.Update(data);
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
        ///  Get All Assessment Type Data
        /// </summary>
        /// <param name="objAssessmentTypeModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.ASSESSMENTTYPETABLE_GET_ROLE)]
        public JsonResult<List<AssessmentTypeViewModel>> GetAllAssessmentTypeData(AssessmentTypeViewModel objAssessmentTypeModel)
        {
            try
            {
                var record = _iAssessmentType.GetAllAssessmentTypeData(objAssessmentTypeModel);
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