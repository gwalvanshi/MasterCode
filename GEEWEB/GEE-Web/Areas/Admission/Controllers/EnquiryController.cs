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

namespace GEE_Web.Areas.Admission.Controllers
{
    public class EnquiryController : BaseController
    {
        EnquiryService service = new EnquiryService();

        public async Task<ActionResult> Index()
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

        public async Task<ActionResult> Edit(int id)
        {
            TempData["EnquiryId"] = id;          
            return View();
            //ViewBag.EnquiryId = id;
            //var record = await service.GetById(id);
            //return View(record);
        }


        public async Task<JsonResult> Editasy(int id)
        {
            var record = await service.GetById(id);
            foreach (var item in record.CandidateDetails)
            {
                item.CDB = Convert.ToDateTime(item.DOB).ToString("dd/MM/yyyy").ToString();
            }
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        [HttpPost]
        public async Task<ActionResult> Edit(EnquiryViewModel collection)
        {
            try
            {

                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Update(stringContent);
                return new JsonResult { Data = new { status = status } };


            }
            catch
            {
                return View();
            }
        }


        public async Task<JsonResult> GetAutoGeneraedNo(int id)
        {
            var record = await service.GetAutoGeneraedNo(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> GetKeyForValidation(string Id)
        {           
            CommonWebLibrary objCommoWebLib = new CommonWebLibrary();
            var record = await Task.FromResult(objCommoWebLib.GetMandotoryValues(Id));//sending navigation id
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
     
        /// <summary>
        /// This action method is return the Index screen data with passing the paramters
        /// Added by jiya
        /// Date 07-Apr-2019
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
                for (int i = 0; i < strSelectParameterSplit.Length-1; i++)
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
                var record = await service.GetEnquiryDetailsWithPagingSorting(stringContent);
  

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
        /// This is method is used to generate the enquiry view.
        /// Added by jiya
        /// Date 07-Apr-2019
        /// </summary>
        /// <returns></returns>
        public ActionResult EnquiryIndex()
        {
            return View();
        }

        public ActionResult GetStateBycity(int Id)
        {
            var record =  service.GetStatByCityId(Id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

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
