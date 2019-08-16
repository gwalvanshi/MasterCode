using GEE.Business.Interface.HR;
using GEE.Business.Model.Configuration;
using GEE.Business.Model.HR;
using GEE.Common;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace GEE.API.Controllers.HR
{
    // [EnableCors(origins: "*", headers: "*", methods: "*")]
    //[Authorize]
    public class EmployeeMasterController : BaseController
    {
        IEmployeeMaster _employee;
       

        public EmployeeMasterController(IEmployeeMaster employee)
        {
            _employee = employee;            
        }
       /// <summary>
       /// This method used to get employee detail to bind the grid.
       /// </summary>
       /// <param name="IndexScreenParameterModel"></param>
       /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
       // [Authorize(Roles = HRConstant.EMPLOYEE_GET_ROLE)]
        public JsonResult<List<EmployeeMasterModel>> GetUserDetailsWithPagingSorting(IndexScreenParameterModel IndexScreenParameterModel)
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
                        SearchValue = "AND ";
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
                var objList = _employee.GetEmployeeWithPagingSorting(SelectColumn.Substring(0, SelectColumn.Length - 1), SearchValue, IndexScreenParameterModel.PageNo, IndexScreenParameterModel.PageSize, IndexScreenParameterModel.SortColumn, IndexScreenParameterModel.SortOrder);

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
       // [Authorize(Roles = HRConstant.EMPLOYEE_POST_ROLE)]
        public HttpResponseMessage Save(EmployeeDetailsSaveSchemaModel data)
        {
            try
            {

                if( _employee.SaveEmployeeDetails(data)>0)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
                }
                else
                {
                    Common.MyLogger.Error("data not saved return value is " + _employee.SaveEmployeeDetails(data).ToString());
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
                }
               
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
           
        }
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = HRConstant.EMPLOYEE_PUT_ROLE)]
        public HttpResponseMessage Update(EmployeeDetailsSaveSchemaModel data)
        {
            try
            {

                if (_employee.UpdateEmployeeDetails(data) > 0)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
                }
                else
                {
                    Common.MyLogger.Error("data not saved return value is " + _employee.SaveEmployeeDetails(data).ToString());
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
                }

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }

        }
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = HRConstant.EMPLOYEE_DELETE_ROLE)]
        public HttpResponseMessage Delete(EmployeeMasterModel data)
        {
            try
            {

                if (_employee.DeleteEmployeeDetails(data) > 0)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
                }
                else
                {
                    Common.MyLogger.Error("data not saved return value is " + _employee.DeleteEmployeeDetails(data).ToString());
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
                }

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }

        }
        /// <summary>
        /// This method is used to bind the the data in employee details page
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
       // [Authorize(Roles = HRConstant.EMPLOYEE_GET_ROLE)]
        public JsonResult<EmployeeMasterModel> GetEmployeeDetails(int id)
        {
            try
            {

                return Json(_employee.GetEmployeeDetails(id));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }



    }
}