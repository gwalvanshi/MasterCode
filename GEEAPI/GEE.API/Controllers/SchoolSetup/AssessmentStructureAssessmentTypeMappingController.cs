using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Results;
using GEE.Business.Interface.Admin;
using GEE.Business.Interface.SchoolSetup;
using GEE.Business.Model.Admin;
using GEE.Business.Model.SchoolSetup;
using GEE.Business.Models.Admission;
using GEE.Common;
using NLog;


namespace GEE.API.Controllers.SchoolSetup
{
    public class AssessmentStructureAssessmentTypeMappingController : BaseController
    {
        // GET: AssessmentStructure AssessmentType Mapping
        ///
        ///Created By: Amit Gajera on 05/25/2019 
        ///

        IAssessmentStructureAssessmentTypeMapping _iAssessmentStructureAssessmentTypeMapping;
        public AssessmentStructureAssessmentTypeMappingController(IAssessmentStructureAssessmentTypeMapping iAssessmentStructureAssessmentTypeMapping)
        {
            _iAssessmentStructureAssessmentTypeMapping = iAssessmentStructureAssessmentTypeMapping;
        }

        /// <summary>
        /// Get Detail ById
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPINGTABLE_GET_ROLE)]
        public JsonResult<AssessmentStructureAssessmentTypeMappingModel> GetDetailById(int id)
        {
            try
            {
                return Json(_iAssessmentStructureAssessmentTypeMapping.GetById(id));

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
        [Authorize(Roles = AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPINGTABLE_POST_ROLE)]
        public HttpResponseMessage Save(AssessmentStructureAssessmentTypeMappingModel data)
        {
            try
            {
                _iAssessmentStructureAssessmentTypeMapping.Save(data);

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        /// <summary>
        ///  Save All Row
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPINGTABLE_POST_ROLE)]
        public HttpResponseMessage SaveAllRow(List<AssessmentStructureAssessmentTypeMappingModel> dataModel)
        {
            try
            {
                var _data = _iAssessmentStructureAssessmentTypeMapping.GetAllAssessmentStructureWithASId(Convert.ToInt32(dataModel.FirstOrDefault().AssessmentStructureID));
                foreach (var itemRow in dataModel)
                {
                    var _model = _data.Where(f => f.AssessmentTypeID == itemRow.AssessmentTypeID && f.ISDeleted == false);
                    if (_model == null || _model.Count() == 0)
                    {
                        itemRow.CreatedDate = DateTime.Now;
                        itemRow.ModifiedDate = DateTime.Now;
                        itemRow.ISDeleted = false;
                        _iAssessmentStructureAssessmentTypeMapping.Save(itemRow);
                    }
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
        ///  Delete
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("DELETE")]
        [HttpDelete]
        [Authorize(Roles = AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPINGTABLE_DELETE_ROLE)]
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                _iAssessmentStructureAssessmentTypeMapping.DeActivate(id);

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
        [Authorize(Roles = AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPINGTABLE_PUT_ROLE)]
        public HttpResponseMessage Update(AssessmentStructureAssessmentTypeMappingModel data)
        {
            try
            {
                if (data.AssessmentStructureAssessmentTypeMapping_Id > 0)
                {
                    _iAssessmentStructureAssessmentTypeMapping.Update(data);
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
        ///  Get All AssessmentStructure AssessmentType Mapping Data
        /// </summary>
        /// <param name="objAssessmentStructureAssessmentTypeMappingViewModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPINGTABLE_GET_ROLE)]
        public JsonResult<List<AssessmentStructureAssessmentTypeMappingViewModel>> GetAssessmentStructureData(AssessmentStructureAssessmentTypeMappingViewModel objAssessmentStructureAssessmentTypeMappingViewModel)
        {
            try
            {
                var record = _iAssessmentStructureAssessmentTypeMapping.GetAssessmentStructureData(objAssessmentStructureAssessmentTypeMappingViewModel);
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