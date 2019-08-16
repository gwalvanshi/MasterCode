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
    public class SellSubmitController : BaseController
    {
        SellSubmitService service = new SellSubmitService();

        // GET: Admission/SellSubmit
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
                var record = await service.GetSellSubmitDetailsWithPagingSorting(stringContent);


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

        /// <summary>
        /// check application is sold = true against EnquiryId 
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<JsonResult> GetIsApplicationSold(string ID)
        {
            try
            {
                var record = await service.GetIsApplicationSold(Convert.ToInt32(ID));
                return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

            }
            catch (Exception ex)
            {

                return null;
            }
        }

        /// <summary>
        /// Update Application No Against Enquiry Id
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> UpdateApplicationNo(ApplicationViewModel collection)
        {
            try
            {
                collection.ModifiedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.UpdateApplicationNo(stringContent);
                return new JsonResult { Data = new { status = status } };
            }
            catch
            {
                return View();
            }
        }

        
        [HttpGet]
        public async Task<JsonResult> CheckIsAppNumEqualsRegiNum(string Id)
        {
            try
            {
                var record = await service.CheckIsAppNumEqualsRegiNum(Convert.ToInt32(Id));
                return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

            }
            catch (Exception ex)
            {

                return null;
            }
        }

        [HttpPost]
        public async Task<ActionResult> UpdateRegistrationNo(RegistrationViewModel collection)
        {
            try
            {
                collection.ModifiedDate = DateTime.Now;
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.UpdateRegistrationNo(stringContent);
                return new JsonResult { Data = new { status = status } };
            }
            catch
            {
                return View();
            }
        }
    }
}