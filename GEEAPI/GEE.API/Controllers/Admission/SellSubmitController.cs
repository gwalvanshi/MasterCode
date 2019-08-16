using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Results;
using GEE.Business.Interface.Admission;
using GEE.Business.Models.Admission;
using GEE.Business.Interface.Configuration;
using GEE.Business.Model.Configuration;
using GEE.Business.Model.Admission;
using GEE.Common;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net;

namespace GEE.API.Controllers.Admission
{
    // [EnableCors(origins: "*", headers: "*", methods: "*")]
    //[Authorize]
    public class SellSubmitController : BaseController
    {
        ISellSubmit _sellSubmit;
        ISchoolConfig _schoolConfig;

        public SellSubmitController(ISellSubmit sellSubmit, ISchoolConfig schoolConfig)
        {
            _sellSubmit = sellSubmit;
            _schoolConfig = schoolConfig;
        }


        /// <summary>
        /// This is generic method to get record from database with paging sorting and searching.
        /// </summary>
        /// <param name="IndexScreenParameterModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        //[Authorize(Roles = SellSubmitConstants.SellSubmit_GET_ROLE)]
        public JsonResult<List<SellSubmitModel>> GetSellSubmitDetailsWithPagingSorting(IndexScreenParameterModel IndexScreenParameterModel)
        {
            try
            {
                string SelectColumn = string.Empty, SearchValue = string.Empty;
                string searchColumn = string.Empty;
                foreach (var item in IndexScreenParameterModel.IndexScreenSelectParameterModel)
                {
                    SelectColumn += item.SelectParameter + ",";
                }
                if (IndexScreenParameterModel.IndexScreenSearchParameterModel != null)
                {
                    if (IndexScreenParameterModel.IndexScreenSearchParameterModel.Count > 0)
                    {
                        SearchValue = "Where ";
                        foreach (var itemSearch in IndexScreenParameterModel.IndexScreenSearchParameterModel)
                        {
                            if (!string.IsNullOrEmpty(searchColumn))
                            {
                                searchColumn += " AND ";
                            }
                            if (itemSearch.SearchParameterDataType.ToLower() == "string")
                            {
                                searchColumn += itemSearch.SearchParameter + " LIKE '%" + itemSearch.SearchParameterValue + "%' ";
                            }
                            else
                            {
                                searchColumn += itemSearch.SearchParameter + "=" + itemSearch.SearchParameterValue;
                            }

                        }
                    }
                }
                SearchValue = SearchValue + searchColumn;
                var objList = _sellSubmit.GetSellSubmitwithPagingSorting(SelectColumn.Substring(0, SelectColumn.Length - 1), SearchValue, IndexScreenParameterModel.PageNo, IndexScreenParameterModel.PageSize, IndexScreenParameterModel.SortColumn, IndexScreenParameterModel.SortOrder);

                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }


        [AcceptVerbs("GET")]
        [HttpGet]
        public JsonResult<bool> GetIsApplicationSold(int ID)
        {
            try
            {
                var res = _sellSubmit.GetIsApplicationSold(ID);
                return Json(res);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("POST")]
        [HttpPost]
        public async Task<HttpResponseMessage> UpdateApplicationNo(ApplicationModel application)
        {
            try
            {
                _sellSubmit.UpdateApplicationNo(application);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        public JsonResult<bool> CheckIsAppNumEqualsRegiNum(int id)
        {
            try
            {
                var res = _schoolConfig.CheckIsAppNumEqualsRegiNum(id);
                return Json(res);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }


        [AcceptVerbs("POST")]
        [HttpPost]
        public async Task<HttpResponseMessage> UpdateRegistrationNo(RegistrationModel registration)
        {
            try
            {
                _sellSubmit.UpdateRegistrationNo(registration);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

    }
}