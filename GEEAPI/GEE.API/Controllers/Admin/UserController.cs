using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.Admin;
using GEE.Business.Model.Admin;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using GEE.Common;
using GEE.Business.Model.Configuration;

namespace GEE.API.Controllers.Admin
{
    public class UserController:BaseController
    {
        IAspNetUser _iAspNetUser;
        public UserController(IAspNetUser iAspNetUser)
        {
            _iAspNetUser = iAspNetUser;            
        }
        /// <summary>
        /// This method is used to save user data in to database
        /// Authorize(Roles = AdminConstants.ASPNETUSER_POST_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = AdminConstants.ASPNETUSER_POST_ROLE)]       
        public async Task<HttpResponseMessage> Save(AspNetUserModel data)
        {
            try
            {
              
                await _iAspNetUser.SaveAsync(data);
               
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Saved");
        }

        /// <summary>
        /// This is generic method to get record from database with paging sorting and searching.       
        /// Authorize(Roles = AdminConstants.ASPNETUSER_GET_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// <param name="IndexScreenParameterModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        [Authorize(Roles = AdminConstants.ASPNETUSER_GET_ROLE)]
        public JsonResult<List<AspNetUserModel>> GetUserDetailsWithPagingSorting(IndexScreenParameterModel IndexScreenParameterModel)
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
                var objList = _iAspNetUser.GetUserDetailsWithPagingSorting(SelectColumn.Substring(0, SelectColumn.Length - 1), SearchValue, IndexScreenParameterModel.PageNo, IndexScreenParameterModel.PageSize, IndexScreenParameterModel.SortColumn, IndexScreenParameterModel.SortOrder);

                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        /// <summary>
        /// This method will used to get user based on user cID.   
        /// Authorize(Roles = AdminConstants.ASPNETUSER_GET_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]
        [Authorize(Roles = AdminConstants.ASPNETUSER_GET_ROLE)]
        public JsonResult<AspNetUserModel> GetUserDetailById(int id)
        {
            try
            {

                return Json( _iAspNetUser.GetUserDetailById(id));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }           
        }
        [AcceptVerbs("GET")]
        [HttpGet]     
        public JsonResult<int> GetUserDetailByUserId(string id)
        {
            try
            {

                return Json(_iAspNetUser.GetUserDetailByUserId(id));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }      

        /// <summary>
        /// This method will used to deactivate the user based on user cID.   
        /// Authorize(Roles = AdminConstants.ASPNETUSER_DELETE_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AcceptVerbs("DELETE")]
        [HttpDelete]
        [Authorize(Roles = AdminConstants.ASPNETUSER_DELETE_ROLE)]
        public  HttpResponseMessage Delete(int id)
        {
            try
            {

                 _iAspNetUser.DeActivateUser(id);

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Error");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "Data Deleted");
        }
        /// <summary>
        /// This method will used to Update  the user data based on user id.   
        /// Authorize(Roles = AdminConstants.ASPNETUSER_DELETE_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [AcceptVerbs("PUT")]
        [HttpPut]
        [Authorize(Roles = AdminConstants.ASPNETUSER_PUT_ROLE)]
        public  HttpResponseMessage Update(AspNetUserModel data)
        {
            try
            {

                 _iAspNetUser.Update(data);

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