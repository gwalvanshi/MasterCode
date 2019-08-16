using GEE.Web.Service;
using GEE.Web.ViewModel;
using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using GEE_Web.WebLibrary;
using GEE.Web.Service.Admission;
using GEE.Web.ViewModel.Configuration;
using GEE.Web.Service.Configuration;
using System.Web.Script.Serialization;
using System.Data;
using System.Reflection;
using GEE.Web.Service.DocumentLibrary;
using GEE.Web.ViewModel.Admin;
using GEE.Web.ViewModel.DocumentLibrary;
using System.Web;
using GEE.Web.Service.Admin;
using GEE_Web;
using GEE.Web.Utility;

namespace GEE_Web.Areas.Document.Controllers
{
    public class DocumentPortalController : BaseController
    {
        DocumentSubmissionService service = new DocumentSubmissionService();
        DocumentPortalService servicePortal = new DocumentPortalService();
        DocumentTypeService serviceType = new DocumentTypeService();
        CandidateDetailService serviceCandidate = new CandidateDetailService();
        MasterTableService serviceMaster = new MasterTableService();

        public async Task<ActionResult> Index()
        {
            var list = await service.GetAll();
            return View(list);
        }

        public async Task<JsonResult> FetchOwnDocument(int userId = 0)
        {
           List<DocumentPortalModel> documents = null;
            CandidateDetailViewModel record = await serviceCandidate.GetById(2);
            if(record != null)
            {
               documents = await servicePortal.FetchDocumentFor(record.Enquiry_ID.Value);
            }
            return new JsonResult { Data = documents, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> FetchPermittedDocument(int userId = 0)
        {
            List<DocumentPortalModel> documents = null;
            
                documents = await servicePortal.FetchPermittedDocument(userId);
           
            return new JsonResult { Data = documents, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> GetDocuments(int category = 0, int subCategory = 0, int documentType = 0, int userId=0, bool IsForAll = false)
        {
            List<DocumentPortalModel> documents = null;

            documents = await servicePortal.GetDocuments(category, subCategory, documentType, userId, IsForAll);

            return new JsonResult { Data = documents, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> ReportCorrect(bool isCorrect , int submissionId = 0)
        {
            Boolean documents = false;

            documents = await servicePortal.ReportCorrect(isCorrect, submissionId);

            return new JsonResult { Data = documents, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
        

        public async Task<JsonResult> GetDocumentTypeByCategory( int subCategory = 0)
        {
            List<DocumentTypeViewModel> documents = null;

            documents = await servicePortal.GetDocumentTypeByCategory(subCategory);

            return new JsonResult { Data = documents, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> GetDocumentPermission(int userId = 0)
        {
            DocumentPortalViewModel res = new DocumentPortalViewModel();
            List<DocumentPermissionModel> documents = null;
            List<MasterTableViewModel> category = new List<MasterTableViewModel>();
            List<MasterTableViewModel> subCategory = new List<MasterTableViewModel>();
            List<DocumentTypeViewModel> documentType = new List<DocumentTypeViewModel>();

            List<int> categoryList = new List<int>();
            List<int> subCategoryList = new List<int>();
            List<int> documentTypeList = new List<int>();
            documents = await servicePortal.GetDocumentPermission(userId);
            if(documents.Count > 0)
            {
                foreach (var item in documents)
                {
                    if (item.CategoryID.HasValue)
                    {
                        categoryList.Add(item.CategoryID.Value);
                        category.Add(await serviceMaster.GetById(item.CategoryID.Value));
                    }
                    if (item.SubCategoryID.HasValue)
                    {
                        subCategoryList.Add(item.SubCategoryID.Value);
                        subCategory.Add(await serviceMaster.GetById(item.SubCategoryID.Value));
                    }
                    if (item.TypeID.HasValue)
                    {
                        documentTypeList.Add(item.TypeID.Value);
                        documentType.Add(await serviceType.GetById(item.TypeID.Value));
                    }
                }
            }

            foreach (var item in documentType)
            {
                if(!subCategoryList.Contains(item.DocumentCategoryID.Value))
                {
                    subCategory.Add(await serviceMaster.GetById(item.DocumentCategoryID.Value));
                }
            }

            res.Category = category;
            res.SubCategory = subCategory;
            res.Type = documentType;
            res.permission = documents;
            return new JsonResult { Data =  res , JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }


    }
}
