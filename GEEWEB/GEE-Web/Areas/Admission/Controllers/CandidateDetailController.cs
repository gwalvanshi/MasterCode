using GEE.Web.Service;
using GEE.Web.Service.Admission;
using GEE.Web.ViewModel;
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
    public class CandidateDetailController : BaseController
    {

        CandidateDetailService service = new CandidateDetailService();
        // GET: Admission/CandidateDetail
        public async Task<ActionResult> Index()
        {
            var list = await service.GetAll();
            return View(list);
        }
        public async Task<ActionResult> Index1()
        {
            var list = await service.GetAll();
            return View(list);
        }
        public async Task<ActionResult> partialview()
        {
            var list = await service.GetAll();
            return PartialView("Index1",list);
        }

        // GET: Admission/CandidateDetail/Details/5
        public async Task<ActionResult> Details(int id)
        {
            var record = await service.GetById(id);
            return View(record);
        }


        // GET: Admission/CandidateDetail/Create
        public async Task<ActionResult> Create()
        {
            var list = await service.GetAll();
            return View(list);
        }

        // POST: Admission/CandidateDetail/Create
        [HttpPost]
        public async Task<JsonResult> Create(CandidateDetailViewModel collection)
        {
            try
            {
                var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                var status = await service.Save(stringContent);
                return new JsonResult { Data = new { status = status } };

            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = false } };
            }
        }
        // GET: Admission/CandidateDetail/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            TempData["CandidateId"] = id;
            return View();
        }

        public async Task<JsonResult> Editasy(int id)
        {
            var record = await service.GetById(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

            //var record = await service.GetById(id);
            //foreach (var item in record.CandidateDetails)
            //{
            //    item.CDB = Convert.ToDateTime(item.DOB).ToString("dd/MM/yyyy").ToString();
            //}
            //return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public async Task<JsonResult> GetCandidateDetailsByEnquiryId(int id)
        {
            var record = await service.GetCandidateDetailsByEnquiryId(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public async Task<JsonResult> GetAllRecordsForFilter(int categoryId = 0 )
        {
            var record = await service.GetAll();

            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
        // POST: Admission/CandidateDetail/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(CandidateDetailViewModel collection)
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
        [HttpPost]
        public async Task<JsonResult> AutoComplete(string prefix, int UserType)
        {
            var list = await service.GetAll();
           

            var studentList = (from loc in list
                               where loc.FirstName.StartsWith(prefix, StringComparison.OrdinalIgnoreCase) 
                               select new
                            {
                                label =Convert.ToString(loc.FirstName).Trim() + "-" + Convert.ToString(loc.Lastname).Trim()+ "("+ Convert.ToString(loc.ContactMobileNo).Trim()+")",
                                val = loc.CandidateDetail_ID
                            }).ToList();
            return Json(studentList);
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
                var record = await service.GetCandidateDetailsWithPagingSorting(stringContent);


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

        //// GET: Admission/CandidateDetail/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        //// POST: Admission/CandidateDetail/Delete/5
        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}
