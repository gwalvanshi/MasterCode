using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.Admission;
using GEE.Business.Model.Configuration;
using GEE.Business.Models.Admission;
using GEE.Common;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace GEE.API.Controllers.Admission
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CandidateDetailController : BaseController
    {
        ICandidateDetail _candidatedetail;

        public CandidateDetailController(ICandidateDetail candidatedetail)
        {
            _candidatedetail = candidatedetail;
        }

        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = AdmissionConstants.CANDIDATEDETAIL_POST_ROLE)]
        public async Task<HttpResponseMessage> Save(CandidateDetailModel data)
        {
            try
            {
                await _candidatedetail.SaveAsync(data);
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
        //[Authorize(Roles = AdmissionConstants.CANDIDATEDETAIL_GET_ROLE)]
        public JsonResult<List<CandidateDetailModel>> GetAll()
        {
            try
            {
                var objList = _candidatedetail.GetAll();
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
        //[Authorize(Roles = AdmissionConstants.CANDIDATEDETAIL_GET_ROLE)]
        public async Task<JsonResult<CandidateDetailModel>> GetById(int id)
        {
            try
            {
                var record = await _candidatedetail.GetByIdAsync(id);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        //[Authorize(Roles = AdmissionConstants.CANDIDATEDETAIL_GET_ROLE)]
        public async Task<JsonResult<CandidateDetailModel>> GetCandidateDetailsByEnquiryId(int id)
        {
            try
            {
                var record = await _candidatedetail.GetCandidateDetailsByEnquiryId(id);
                return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("PUT")]
        [HttpPut]
        //[Authorize(Roles = AdmissionConstants.CANDIDATEDETAIL_PUT_ROLE)]
        public async Task<HttpResponseMessage> Update(CandidateDetailModel data)
        {
            try
            {
                data.CreatedDate = DateTime.Now;
                data.ModifiedDate = DateTime.Now;
                await _candidatedetail.UpdateAsync(data);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Update Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Updated");
        }
        [AcceptVerbs("POST")]
        [HttpGet]
        /// <summary>
        /// This method is used to get a data for popup and search text box auto lookup.
        /// </summary>
        /// <param name="objCandidateDetailModel"></param>
        /// <returns></returns>
        public JsonResult<List<CandidateDetailModel>> GetPopupData(CandidateDetailModel objCandidateDetailModel)
        {
            try
            {
                var objList = _candidatedetail.GetPopupData(objCandidateDetailModel);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

        [AcceptVerbs("POST")]
        [HttpGet]
        public JsonResult<List<CandidateDetailModel>> GetCandidateDetailsWithPagingSorting(IndexScreenParameterModel IndexScreenParameterModel)
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
                var objList = _candidatedetail.GetCandidateDetailsWithPagingSorting(SelectColumn.Substring(0, SelectColumn.Length - 1), SearchValue, IndexScreenParameterModel.PageNo, IndexScreenParameterModel.PageSize, IndexScreenParameterModel.SortColumn, IndexScreenParameterModel.SortOrder);

                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }

    }
}
