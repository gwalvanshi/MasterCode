using GEE.Web.Service.Admission;
using GEE.Web.ViewModel;
using GEE.Web.ViewModel.Admission;
using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace GEE_Web.Areas.Admission.Controllers
{
    public class AssessmentTypeController : BaseController
    {
        ///
        ///Created By: Amit Gajera on 05/05/2019 
        ///

        AssessmentTypeService service = new AssessmentTypeService();

        /// <summary>
        ///  Index
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Index()
        {
            AssessmentTypeGridViewModel collection = new AssessmentTypeGridViewModel();
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
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var list = await service.GetAllAssessmentTypeData(stringContent);
            if (list.Count > 0)
            {
                recordsTotal = list[0].RowCount;
            }
            // var data = list.Skip(skip).Take(pageSize).ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = list });

        }

        /// <summary>
        ///  Details 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<ActionResult> Details(int id)
        {
            var record = await service.GetById(id);
            return View(record);
        }

        /// <summary>
        /// GetData To Edit
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<JsonResult> GetDataToEdit(int id)
        {
            var record = await service.GetById(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        /// <summary>
        /// Create
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            return View();
        }

        /// <summary>
        ///  Create
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Create(AssessmentTypeViewModel collection)
        {
            try
            {
                collection.CreatedDate = DateTime.Now;
                collection.ModifiedDate = DateTime.Now;
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
        ///  Editasy
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<JsonResult> Editasy(int id)
        {
            ViewBag.MasterTableId = id;
            var record = await service.GetById(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        /// <summary>
        ///  Edit Data
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> Edit(AssessmentTypeViewModel collection)
        {
            try
            {
                collection.ModifiedDate = DateTime.Now;
                collection.CreatedDate = DateTime.Now;
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
        /// Delete Data
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> Delete(string ID)
        {
            try
            {
                var status = await service.Delete(Convert.ToInt32(ID));

                return Json(data: status);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}