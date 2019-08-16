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
    public class StartAdmissionController : BaseController
    {
        IStartAdmission _startAdmission;
        ISchoolConfig _schoolConfig;

        public StartAdmissionController(IStartAdmission startAdmission, ISchoolConfig schoolConfig)
        {
            _startAdmission = startAdmission;
            _schoolConfig = schoolConfig;
        }


        /// <summary>
        /// This is generic method to get record from database with paging sorting and searching.
        /// </summary>
        /// <param name="IndexScreenParameterModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpGet]
        //[Authorize(Roles = AdmissionConstants.STARTADMISSION_GET_ROLE)]
        public JsonResult<List<StartAdmissionModel>> GetStartAdmissionDetailsWithPagingSorting(IndexScreenParameterModel IndexScreenParameterModel)
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
                        SearchValue = "and ";
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
                var objList = _startAdmission.GetStartAdmissionDetailsWithPagingSorting(SelectColumn.Substring(0, SelectColumn.Length - 1), SearchValue, IndexScreenParameterModel.PageNo, IndexScreenParameterModel.PageSize, IndexScreenParameterModel.SortColumn, IndexScreenParameterModel.SortOrder,IndexScreenParameterModel.SchoolId,IndexScreenParameterModel.GroupId);

                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }


        [AcceptVerbs("POST")]
        [HttpPost]
        public async Task<HttpResponseMessage> Update(List<StartAdmissionModel> startAdmissionModels)
        {
            try
            {
                _startAdmission.UpdateStartAdmissionList(startAdmissionModels);
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