using GEE.Web.Service.Admission;
using GEE.Web.ViewModel.Admission;
using GEE.Web.ViewModel.Configuration;
using GEE_Web.Controllers;
using GEE_Web.WebLibrary;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace GEE_Web.Areas.Admission.Controllers
{
    public class StartAdmissionController : BaseController
    {
        StartAdmissionService service = new StartAdmissionService();


        // GET: Admission/StartAdmission
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// This action method is return the Index screen data with passing the paramters
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> GetIndexDataOnLoad(IndexScreenParameterModel collection)
        {
            try
            {
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

                //Paging Size (10,20,50,100)
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;

                CommonWebLibrary objCommoWebLib = new CommonWebLibrary();
                List<IndexScreenSelectParameterModel> objSelectList = new List<IndexScreenSelectParameterModel>();

                string[] strSelectParameterSplit = collection.IndexScreenSelectParameterModelCommaSeparate.Split(',');
                for (int i = 0; i < strSelectParameterSplit.Length - 1; i++)
                {
                    IndexScreenSelectParameterModel objSelect = new IndexScreenSelectParameterModel();
                    objSelect.SelectParameter = strSelectParameterSplit[i].ToString();
                    objSelectList.Add(objSelect);
                    if (strSelectParameterSplit[i].ToString().Contains(sortColumn))
                    {
                        sortColumn = strSelectParameterSplit[i].ToString();
                    }
                }
                collection.IndexScreenSelectParameterModel = objSelectList;
                collection.PageNo = skip;
                collection.PageSize = pageSize;
                collection.SortColumn = sortColumn;
                collection.SortOrder = sortColumnDirection;
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var record = await service.GetStartAdmissionWithPagingSorting(stringContent);
                foreach (var item in record)
                {
                    item.Convertedstartdate = item.Startdate?.ToString("yyyy-MM-dd");
                    item.Convertedfrmdob = item.FromDOB?.ToString("yyyy-MM-dd");
                    item.Convertedtodob = item.TODOB?.ToString("yyyy-MM-dd");
                }

                //total number of rows count 
                if (record != null)
                    recordsTotal = record.Count;              //Paging 
                                                              // var data = customerData.Skip(skip).Take(pageSize).ToList();
                                                              //Returning Json Data
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = record });

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpPost]
        public async Task<JsonResult> UpdateStartAdmission(List<StartAdmissionViewModel> startAdmissionViewModels)
        {
            try
            {
                var stringContent = new StringContent(JsonConvert.SerializeObject(startAdmissionViewModels).ToString(), Encoding.UTF8, "application/json");
                var record = await service.UpdateStartAdmission(stringContent);
                return new JsonResult { Data = new { status = record }, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

            }
            catch (Exception ex)
            {

                return null;
            }
        }

    }
}