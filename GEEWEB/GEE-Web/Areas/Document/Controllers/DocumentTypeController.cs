using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using GEE.Web.Service.DocumentLibrary;
using GEE.Web.ViewModel.DocumentLibrary;
using System.Linq;

namespace GEE_Web.Areas.Document.Controllers
{
    public class DocumentTypeController : BaseController
    {
        DocumentTypeService service = new DocumentTypeService();

        /// <summary>
        /// Get All Data for Document Type
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Index(string id)
        {
            int docCatId;
            int.TryParse(id, out docCatId);

            DocumentTypeViewModel collection = new DocumentTypeViewModel();
            var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
            // Skiping number of Rows count
            var start = Request.Form["start"];
            // Paging Length 10,20
            var length = Request.Form["length"];
            // Sort Column Name
            var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"];
            // Sort Column Direction ( asc ,desc)
            var sortColumnDirection = Request.Form["order[0][dir]"];
            // Search Value from (Search box)
            // var searchValue = Request.Form["search[value]"];

            //Paging Size (10,20,50,100)
            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;

            collection.PageNo = skip;
            collection.PageSize = pageSize;
            collection.SortOrder = sortColumnDirection;
            collection.SortColumn = sortColumn;
            collection.DocumentCategoryID = docCatId;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var list = await service.GetAllMDocumenTypeData(stringContent);
            ///Updated by jiya 10--Aug-2019
            ///Cause: Code breaking while data not available.
            foreach (var item in list)
            {
                    recordsTotal = list[0].RowCount;
                    item.DocumentCategoryName= item.MasterTable?.Name;
            }
            var data = list.Skip(skip).Take(pageSize).ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = list });

        }

        public ActionResult DocumentIndex()
        {
            return View();
        }

        /// <summary>
        /// For Added New Document
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Create(DocumentTypeViewModel collection)
        {
            try
            {
                collection.CreatedBy = 1;
                collection.CreatedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Save(stringContent);
                return new JsonResult { Data = new { status = status } };
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = false } };
            }
        }
        
        /// <summary>
        /// Get data for Edit
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<JsonResult> GetDataToEdit(int id)
        {
            var record = await service.GetById(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        /// <summary>
        /// For Update Document Type
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> Edit(DocumentTypeViewModel collection)
        {
            try
            {
                collection.ModifiedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Update(stringContent);
                return new JsonResult { Data = new { status = status } };
            }
            catch
            {
                return View();
            }
        }

        /// <summary>
        /// For Delete Record
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<ActionResult> Delete(DocumentTypeViewModel collection)
        {
            collection.ModifiedDate = DateTime.Now;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var status = await service.Delete(stringContent);
            return new JsonResult { Data = status, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
    }
}