using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using GEE.Web.Service.SchoolSetup;
using GEE.Web.ViewModel.SchoolSetup;
using System.Linq;
using GEE.Web.Service.Transport;
using GEE.Web.ViewModel.Transport;

namespace GEE_Web.Areas.Transport.Controllers
{
    public class StopMasterController : Controller
    {
        StopMasterService service = new StopMasterService();

        /// <summary>
        /// Get All Data for Stop Master
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Index(string Id)
        {
            int StopMasterId;
            int.TryParse(Id, out StopMasterId);

            StopMasterViewModel collection = new StopMasterViewModel();
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
            collection.StopMasterID = StopMasterId;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var list = await service.GetAllStopMasterData(stringContent);
            if(list.Count>0)
            recordsTotal = list[0].RowCount;
            
            var data = list.Skip(skip).Take(pageSize).ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = list });
        }

        public ActionResult StopMasterIndex()
        {
            return View();
        }

        /// <summary>
        /// For Added New Document
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Create(StopMasterViewModel collection)
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
        /// Get data for Edit
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<JsonResult> GetDataToEdit(int id)
        {
            try
            {
                var record = await service.GetById(id);
                return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
            catch (Exception ex)
            {
                               return new JsonResult { Data = new { status = false } };
            }
        }

        /// <summary>
        /// For Update Stop Master
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> Edit(StopMasterViewModel collection)
        {
            try
            {
                collection.CreatedDate = DateTime.Now;
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
        public async Task<ActionResult> Delete(StopMasterViewModel collection)
        {
            collection.ModifiedDate = DateTime.Now;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var status = await service.Delete(stringContent);
            return new JsonResult { Data = status, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
    }
}
