using GEE.Web.Service.Admin;
using GEE.Web.Service.SchoolSetup;
using GEE.Web.ViewModel;
using GEE.Web.ViewModel.Admin;
using GEE.Web.ViewModel.SchoolSetup;
using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace GEE_Web.Areas.Admin.Controllers
{
    public class AssessmentStructureAssessmentTypeMappingController : Controller
    {
        ///
        ///Created By: Amit Gajera on 05/04/2019 
        ///

        AssessmentStructureAssessmentTypeMappingService service = new AssessmentStructureAssessmentTypeMappingService();
        MasterTableService masterService = new MasterTableService();

        /// <summary>
        ///  Index
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> Index(int Id = 0)
        {
            AssessmentStructureAssessmentTypeMappingViewModel collection = new AssessmentStructureAssessmentTypeMappingViewModel();
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
            collection.AssessmentStructureID = Id;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var list = await service.GetAssessmentStructureData(stringContent);
            if (list.Count > 0)
            {
                recordsTotal = list[0].RowCount;
            }
            // var data = list.Skip(skip).Take(pageSize).ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = list });

        }

        /// <summary>
        /// Create
        /// </summary>
        /// <returns></returns>
        public async Task<ActionResult> Create(int Id = 0)
        {
            var _list = await masterService.GetMasterDropdownData(null, 2016, null, null, null, null);
            var _assessmentStructureList = new SelectList(_list, "MasterTable_id", "Name", Id);
            ViewData["AssessmentStructure"] = _assessmentStructureList;

            ViewBag.grpId = Id;
            return View();
        }        
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

        [HttpPost]
        public async Task<ActionResult> SaveTableData(string strJsonData = "")
        {
            try
            {
                if (strJsonData != "")
                {
                    List<AssessmentStructureAssessmentTypeMappingModel> _list = new List<AssessmentStructureAssessmentTypeMappingModel>();
                    _list = JsonConvert.DeserializeObject<List<AssessmentStructureAssessmentTypeMappingModel>>(strJsonData);

                    var stringContent = new StringContent(JsonConvert.SerializeObject(_list).ToString(), Encoding.UTF8, "application/json");
                    var status = await service.Save(stringContent);
                    return Json(data: status);
                }
                return Json(data: "");
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}