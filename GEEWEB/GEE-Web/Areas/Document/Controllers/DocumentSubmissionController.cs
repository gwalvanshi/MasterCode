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

namespace GEE_Web.Areas.Document.Controllers
{
    public class DocumentSubmissionController : BaseController
    {
        DocumentSubmissionService service = new DocumentSubmissionService();
        DocumentTypeService serviceType = new DocumentTypeService();

        public async Task<ActionResult> Index()
        {

            var list = await service.GetAll();
            return View(list);
        }

        public async Task<ActionResult> DocumentIndex()
        {

            var list = await service.GetAll();
            return View(list);
        }

        public async Task<ActionResult> Details(int id)
        {
            var record = await service.GetById(id);
            return View(record);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> Create(EnquiryViewModel collection)
        {
            try
            {
                collection.SchoolID = 4;//Convert.ToInt32(Session["schoolId"]);
                collection.GroupID = 1; //Convert.ToInt32(Session["groupId"]);
                collection.Sessionyear = 2017; //Convert.ToInt32(Session["sessionYear"]);
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Save(stringContent);
                return new JsonResult { Data = new { status = status } };
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = false } };
            }
        }

        public async Task<ActionResult> Edit(int id)
        {
            ViewBag.EnquiryId = id;
            var record = await service.GetById(id);
            return View(record);
        }


        public async Task<JsonResult> Editasy(int id)
        {
            ViewBag.EnquiryId = id;
            var record = await service.GetById(id);

            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        [HttpPost]
        public async Task<ActionResult> Edit(QualificationViewModel collection)
        {
            try
            {

                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Update(stringContent);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        [HttpPost]
        public ActionResult Delete(string id)
        {
            try
            {

                int result = 0;

                if (result > 0)
                {
                    return Json(data: true);
                }
                else
                {
                    return Json(data: false);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        public async Task<JsonResult> GetDocumentCategoryForDD(int menuType = 0, int? categoryId = null)
        {
            List<MasterTableViewModel> record = await service.GetDocumentCategoryForDD(menuType, categoryId);

            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> GetDocumentSubmissionData(int category = 0, int subCategory = 0, string studentEmpId = null)
        {
            List<DocumentSubmissionViewModel> record = await service.GetDocumentSubmissionData(category, subCategory, studentEmpId);

            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
        
        [HttpPost]
        public async Task<JsonResult> UpdateRecord(List<DocumentSubmissionViewModel> record)
        {
            try
            {
                await service.UpdateRecord(record);
            }
            catch(Exception ex)
            {
                return new JsonResult { Data = false, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
            return new JsonResult { Data = true, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public async Task<JsonResult> UploadDocument(string id=null, string userType = null)
        {
            HttpFileCollectionBase files = Request.Files;
            HttpPostedFileBase file = files[0];
            string[] testfiles;
            string fname = "";
            if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
            {
                testfiles = file.FileName.Split(new char[] { '\\' });
                fname = testfiles[testfiles.Length - 1];
            }
            else
            {
                fname = file.FileName;
            }
            DocumentSubmissionViewModel obj = new DocumentSubmissionViewModel();
            obj = await service.GetById(Convert.ToInt32(id));
            obj.DocumentType = await serviceType.GetById(obj.DocumentTypeID.Value);
            obj.PhysicalFileLocaiton = fname;
            obj.UserType = userType;
            obj.DigitalPathofDocument = await service.UploadDocuments(obj);
            obj.onlinesubmitted = true;
            return new JsonResult { Data = obj , JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
    }
}
