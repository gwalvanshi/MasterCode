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

namespace GEE_Web.Areas.SchoolSetup.Controllers
{
    public class RoomController : BaseController
    {
        RoomService service = new RoomService();

        /// <summary>
        /// Method to Get All Data for Room Master
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Index()
        {
            RoomViewModel roomViewModel = new RoomViewModel();

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

            roomViewModel.PageNo = skip;
            roomViewModel.PageSize = pageSize;
            roomViewModel.SortOrder = sortColumnDirection;
            roomViewModel.SortColumn = sortColumn;
            var stringContent = new StringContent(JsonConvert.SerializeObject(roomViewModel).ToString(), Encoding.UTF8, "application/json");

            var list = await service.GetAllRoomData(stringContent);
            ///Updated by jiya 10--Aug-2019
            ///Cause: Code breaking while data not available.
            if (list.Count>0)
             recordsTotal = list[0].RowCount;

            var data = list.Skip(skip).Take(pageSize).ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = list });
        }

        public ActionResult RoomIndex()
        {
            return View();
        }

        /// <summary>
        /// Method to Add Room
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Create(RoomViewModel roomViewModel)
        {
            try
            {
               
                roomViewModel.CreatedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(roomViewModel).ToString(), Encoding.UTF8, "application/json");

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
        /// Method to Update Room
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> Edit(RoomViewModel roomViewModel)
        {
            try
            {
               
                roomViewModel.ModifiedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(roomViewModel).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Update(stringContent);

                return new JsonResult { Data = new { status = status } };
            }
            catch
            {
                return View();
            }
        }

        /// <summary>
        /// Method to Delete Room Record
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult> Delete(RoomViewModel roomViewModel)
        {
            roomViewModel.ModifiedDate = DateTime.Now;
            var stringContent = new StringContent(JsonConvert.SerializeObject(roomViewModel).ToString(), Encoding.UTF8, "application/json");
            var status = await service.Delete(stringContent);
            return new JsonResult { Data = status, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
    }
}