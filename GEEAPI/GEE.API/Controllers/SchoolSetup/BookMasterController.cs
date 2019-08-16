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
    public class BookMasterController : BaseController
    {
        // GET: BookMaster
        ///
        ///Created By: Amit Gajera on 05/01/2019 
        ///

        IBookMaster _iBookMaster;
        public BookMasterController(IBookMaster iBookMaster)
        {
            _iBookMaster = iBookMaster;
        }         

        /// <summary>
        /// Get Detail ById
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.BOOKMASTERTABLE_GET_ROLE)]
        public JsonResult<BookMasterModel> GetDetailById(int id)
        {
            try
            {
                return Json(_iBookMaster.GetById(id));

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
        [Authorize(Roles = AdminConstants.BOOKMASTERTABLE_POST_ROLE)]
        public HttpResponseMessage Save(BookMasterModel data)
        {
            try
            {
                _iBookMaster.Save(data);

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
        [Authorize(Roles = AdminConstants.BOOKMASTERTABLE_DELETE_ROLE)]
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                _iBookMaster.DeActivateBook(id);

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
        [Authorize(Roles = AdminConstants.BOOKMASTERTABLE_PUT_ROLE)]
        public HttpResponseMessage Update(BookMasterModel data)
        {
            try
            {
                if (data.BookMaster_Id > 0)
                {
                    _iBookMaster.Update(data);
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
        ///  Get All Book Master Data
        /// </summary>
        /// <param name="objMasterBookModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.BOOKMASTERTABLE_GET_ROLE)]
        public JsonResult<List<BookMasterViewModel>> GetAllBookMasterData(BookMasterViewModel objMasterBookModel)
        {
            try
            {
                var record = _iBookMaster.GetAllBookMasterData(objMasterBookModel);                 
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