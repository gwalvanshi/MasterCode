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
    public class CourseMasterController : BaseController
    {
        // GET: Course Master
        ///
        ///Created By:Amixa  on 11 may,2019 
        ///

        ICourseMaster _iCourseMaster;
        public CourseMasterController(ICourseMaster iCourseMaster)
        {
            _iCourseMaster = iCourseMaster;
        }

        /// <summary>
        /// Get Detail ById
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.COURSEMASTERTABLE_GET_ROLE)]
        public JsonResult<CourseMasterModel> GetDetailById(int id)
        {
            try
            {
                return Json(_iCourseMaster.GetById(id));

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
        [Authorize(Roles = AdminConstants.COURSEMASTERTABLE_POST_ROLE)]
        public HttpResponseMessage Save(CourseMasterModel data)
        {
            try
            {
                _iCourseMaster.Save(data);

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
        //[Authorize(Roles = AdminConstants.COURSEMASTERTABLE_POST_ROLE)]
        public HttpResponseMessage SaveAllRow(List<CourseMasterModel> dataModel)
        {
            try
            {                
                foreach (var itemRow in dataModel)
                {
                    itemRow.CreatedDate = DateTime.Now;
                    itemRow.ModifiedDate = DateTime.Now;
                    itemRow.ISDeleted= false;
                    _iCourseMaster.Save(itemRow);
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
        [Authorize(Roles = AdminConstants.COURSEMASTERTABLE_DELETE_ROLE)]
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                _iCourseMaster.DeActivateCourse(id);

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
        [Authorize(Roles = AdminConstants.COURSEMASTERTABLE_PUT_ROLE)]
        public HttpResponseMessage Update(CourseMasterModel data)
        {
            try
            {
                if (data.CourseMaster_ID > 0)
                {
                    _iCourseMaster.Update(data);
                }

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }
    }
}