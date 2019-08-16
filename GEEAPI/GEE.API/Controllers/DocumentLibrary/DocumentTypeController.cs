using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.DocumentLibrary;
using GEE.Business.Models.DocumentLibrary;
using GEE.Common;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace GEE.API.Controllers.DocumentLibrary
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DocumentTypeController : BaseController
    {
        IDocumentType _documentType;

        public DocumentTypeController(IDocumentType documentType)
        {
            _documentType = documentType;
        }

        /// <summary>
        /// Get All Document Type
        /// </summary>
        /// <param name="objDocumentTypeModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        [Authorize(Roles = DocumentConstants.DOCUMENTTYPE_GET_ROLE)]
        public JsonResult<List<DocumentTypeModel>> GetAllDocumentType(DocumentTypeModel objDocumentTypeModel)
        {
            try
            {
                var record = _documentType.GetAllDocumentType((int)objDocumentTypeModel.DocumentCategoryID,objDocumentTypeModel.PageNo, objDocumentTypeModel.PageSize, objDocumentTypeModel.SortOrder, objDocumentTypeModel.SortColumn);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        /// <summary>
        /// Added Document Type
        /// </summary>
        /// <param name="documentTypeModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = DocumentConstants.DOCUMENTTYPE_POST_ROLE)]
        public async Task<HttpResponseMessage> Save(DocumentTypeModel documentTypeModel)
        {
            try
            {
                await _documentType.SaveAsync(documentTypeModel);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        /// <summary>
        /// Get single Document Type
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = DocumentConstants.DOCUMENTTYPE_GET_ROLE)]
        public async Task<JsonResult<DocumentTypeModel>> GetById(int id)
        {
            try
            {
                var record = await _documentType.GetByIdAsync(id);
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
        public JsonResult<List<DocumentTypeModel>> GetAllByCategory( int category = 0)
        {
            try
            {
                var objList = _documentType.GetAllByCategory(category);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }


        /// <summary>
        /// For Update Document Type
        /// </summary>
        /// <param name="documentType"></param>
        /// <returns></returns>
        [AcceptVerbs("PUT")]
        [HttpPut]
        [Authorize(Roles = DocumentConstants.DOCUMENTTYPE_PUT_ROLE)]
        public async Task<HttpResponseMessage> Update(DocumentTypeModel documentType)
        {
            try
            {
                await _documentType.UpdateAsync(documentType);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }

        /// <summary>
        /// For Delete Document Type
        /// </summary>
        /// <param name="documentType"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpDelete]
        [Authorize(Roles = DocumentConstants.DOCUMENTTYPE_DELETE_ROLE)]
        public  HttpResponseMessage Delete(DocumentTypeModel documentType)
        {
            try
            {
                _documentType.DeleteDocumentType(documentType);
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