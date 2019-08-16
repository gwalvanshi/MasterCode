using GEE.Web.Service.Admin;
using GEE.Web.ViewModel;
using GEE.Web.ViewModel.Admin;
using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace GEE_Web.Areas.Admin.Controllers
{
    public class MasterTableController : BaseController
    {
             MasterTableService service = new MasterTableService();

        [HttpPost]
        public async Task<JsonResult> Index(string Id)
        {
            int masterTableTypeId;
            int.TryParse(Id, out masterTableTypeId);
            MasterTableViewModel collection = new MasterTableViewModel();
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
            collection.Mastertabletype_id = masterTableTypeId;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var list = await service.GetAllMasterData(stringContent);
            if (list.Count>0)
            {
                recordsTotal = list[0].RowCount;
                foreach (var item in list)
                {
                    var parentName = list.Find(a => a.MasterTable_id == item.Parent_id);
                    if (parentName != null)
                        item.ParentName = Convert.ToString(parentName.Name);
                    string defualtVal = item.IsDefault == true ? "Yes" : "No";
                    item.DefaultValue = defualtVal;
                }
            }
           // var data = list.Skip(skip).Take(pageSize).ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = list });

        }

        public async Task<ActionResult> Details(int id)
        {
            var record = await service.GetById(id);
            return View(record);
        }
        public async Task<JsonResult> GetDataToEdit(int id)
        {
           
            var record = await service.GetById(id);

            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> Create(MasterTableViewModel collection)
        {
            try
            {
                collection.CreatedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Save(stringContent);
                //return new JsonResult { Data = new { status = status } };
                return new JsonResult { Data = new { status = status, IsSaved = true, Message = "Successfully Saved." } };
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = true, IsSaved = false, Message = "Error" } };
            }
        }

        public async Task<ActionResult> Edit(int id)
        {
            ViewBag.MasterTableId = id;
            //var record = await service.GetById(id);
            return View();
        }

        public async Task<JsonResult> Editasy(int id)
        {
            ViewBag.MasterTableId = id;
            var record = await service.GetById(id);

            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        [HttpPost]
        public async Task<ActionResult> Edit(MasterTableViewModel collection)
        {
            try
            {
                collection.ModifiedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Update(stringContent);
                return new JsonResult { Data = new { status = status, IsSaved = true, Message = "Successfully Saved." } };
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = true, IsSaved = false, Message = "Error" } };
            }
        }


        public async Task<ActionResult> GetParentValues(string Id)
        {
            int masterTableTypeId = Id == "" ? 0 : Convert.ToInt32(Id);
            var record = await service.GetParentValues(masterTableTypeId);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public async Task<ActionResult> ChecKIsDefault(int schoolId,int groupId)
        {
            var record = await service.ChecKIsDefault(schoolId,groupId);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public async Task<ActionResult> Delete(MasterTableViewModel collection)
        {
            collection.ModifiedDate = DateTime.Now;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var status = await service.Delete(stringContent);
            return new JsonResult { Data = status, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
           
        }
    }
}