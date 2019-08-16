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
    public class DocumentSubmissionController : BaseController
    {

        IDocumentSubmission _documentSubmission;
        IDocumentType _documentType;

        public DocumentSubmissionController(IDocumentSubmission documentSubmission, IDocumentType documentType)
        {
            _documentSubmission = documentSubmission;
            _documentType = documentType;
        }

        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = AdminConstants.DocumentSubmission_POST_ROLE)]
        public async Task<DocumentSubmissionModel> Save(DocumentSubmissionModel data)
        {
            DocumentSubmissionModel objDocsub = new DocumentSubmissionModel();
            try
            {
                return await _documentSubmission.SaveAsync(data);
              
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
            
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_GET_ROLE)]
        public JsonResult<List<DocumentSubmissionModel>> GetAll()
        {
            try
            {
                var objList = _documentSubmission.GetAll();
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_GET_ROLE)]
        public async Task<JsonResult<List<DocumentPortalModel>>> FetchDocumentFor(int EnqId)
        {
            try
            {
                List<DocumentPortalModel> objList = await _documentSubmission.GetDocumentByEnqId(EnqId);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_GET_ROLE)]
        public async Task<JsonResult<List<DocumentPortalModel>>> FetchPermittedDocument(int userId)
        {
            try
            {
                List<DocumentPortalModel> objList = await _documentSubmission.FetchPermittedDocument(userId);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_GET_ROLE)]
        public async Task<JsonResult<List<DocumentPortalModel>>> FetchSelectedDocument(int category = 0, int subCategory = 0, int documentType = 0, int userId=0, bool IsForAll = false)
        {
            try
            {
                List<DocumentPortalModel> objList = await _documentSubmission.FetchSelectedDocument(category, subCategory, documentType, userId, IsForAll);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_GET_ROLE)]
        public async Task<JsonResult<List<DocumentPermissionModel>>> GetDocumentPermission(int userId)
        {
            try
            {
                List<DocumentPermissionModel> objList = await _documentSubmission.GetDocumentPermission(userId);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_POST_ROLE)]
        public async Task<JsonResult<bool>> ReportCorrect(int submissionId, bool isCorrect)
        {
            try
            {
                bool status = await _documentSubmission.ReportCorrect(submissionId, isCorrect);
                return Json(status);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_GET_ROLE)]
        public async Task<JsonResult<DocumentSubmissionModel>> GetById(int id)
        {
            try
            {
                var record = await _documentSubmission.GetByIdAsync(id);
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
        [Authorize(Roles = AdminConstants.DocumentSubmission_PUT_ROLE)]
        public async Task<HttpResponseMessage> Update(DocumentSubmissionModel data)
        {
            try
            {
                await _documentSubmission.UpdateAsync(data);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }
        
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.DocumentSubmission_GET_ROLE)]
        public async Task<JsonResult<List<DocumentSubmissionModel>>> GetDocumentSubmissionData(int category = 0, string studentEmpId = null)
        {
            try
            {
                List<DocumentSubmissionModel> documentSubmissionList = new List<DocumentSubmissionModel>();

                var documentType = await _documentType.GetAllByCategoryAsync(category);
                var record = await _documentSubmission.GetDocumentSubmissionData(studentEmpId);
                foreach (var item in documentType)
                {
                    DocumentSubmissionModel obj = null;
                    obj = record.Find(x => x.DocumentTypeID == item.DocumentTypeID);
                    if(obj==null)
                    {
                        obj = new DocumentSubmissionModel();
                        obj.CreatedDate = DateTime.Now;
                        obj.CreatedBy_ID = 1;
                        obj.DocumentTypeID = item.DocumentTypeID;
                        obj.Enquiry_Id = Convert.ToInt32(studentEmpId);
                        obj.DocumentType = item;
                        await _documentSubmission.SaveAsync(obj);
                    }                    
                }
                if(record.Count == 0)
                {
                    record = await _documentSubmission.GetDocumentSubmissionData(studentEmpId);
                }                
                foreach (var item in documentType)
                {
                    DocumentSubmissionModel obj = null;
                    obj = record.Find(x => x.DocumentTypeID == item.DocumentTypeID);
                    documentSubmissionList.Add(obj);
                }
                return Json(documentSubmissionList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        
    }
}