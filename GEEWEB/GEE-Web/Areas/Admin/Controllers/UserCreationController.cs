using GEE_Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GEE.Web.ViewModel.Admin;
using System.Threading.Tasks;
using System.Net.Http;
using GEE.Web.Service.Admin;
using Newtonsoft.Json;
using System.Text;
using GEE.Web.ViewModel.Configuration;
using GEE_Web.WebLibrary;
using GEE.Web.Utility;

namespace GEE_Web.Areas.Admin.Controllers
{
    public class UserCreationController:BaseController
    {
        UserService service = new UserService();
        CommonWebLibrary objCommoWebLib = new CommonWebLibrary();
        public ActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// This is method is used to generate the user creation view.
        /// Added by jiya
        /// Date 21-Apr-2019
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<JsonResult> Edit(AspNetUserViewModel collection)
        {
            try
            {
                //Demo-Implementing Permission  
                //We aresending three parameter to check the permission
                //GroupID-This is coming from session object(collection)
                //Menu Code: From constants file MenuCodePermissionConstants.each action have its menu code.
                //PERMISSION: from constant file MenuCodePermissionConstants. each permission have name same as database permission name.
                bool isValid = await objCommoWebLib.IsValidPermission(Convert.ToInt32(collection.GroupID), MenuCodePermissionConstants.USER_CREATION_ADDUSER_MENUCODE, MenuCodePermissionConstants.PERMISSION_UPDATE);
                if (isValid)
                {
                    int cUserId = Convert.ToInt32(collection.CUserId);
                    var record = await service.GetById(cUserId);
                    record.Email = collection.Email;
                    record.Password = collection.Password;
                    record.ConfirmPassword = collection.ConfirmPassword;
                    record.PhoneNumber = collection.PhoneNumber;
                    record.UserName = collection.UserName;
                    record.FirstName = collection.FirstName;
                    record.LastName = collection.LastName;
                    record.UserGroupId = collection.UserGroupId;
                    record.StuStaffTypeId = collection.StuStaffTypeId;
                    record.ModifiedBy_ID = collection.ModifiedBy_ID;
                    collection.ModifiedDate = DateTime.Now;
                    var stringContent = new StringContent(JsonConvert.SerializeObject(record).ToString(), Encoding.UTF8, "application/json");
                    var status = await service.Update(stringContent);
                    return new JsonResult { Data = new { status = status, IsSaved = true, Message = "Successfully Saved." } };
                }
                else
                {
                    return new JsonResult { Data = new { status = true, IsSaved = false, Message = "You don't have sufficient permission to this action." } };
                }
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = true, IsSaved = false, Message = "Error." } };
            }
        }
        [HttpPost]
        public async Task<JsonResult> Create(AspNetUserViewModel collection)
        {
            try
            {   //Demo-Implementing Permission  
                //We aresending three parameter to check the permission
                //GroupID-This is coming from session object(collection)
                //Menu Code: From constants file MenuCodePermissionConstants.each action have its menu code.
                //PERMISSION: from constant file MenuCodePermissionConstants. each permission have name same as database permission name.

                    bool isValid = await objCommoWebLib.IsValidPermission(Convert.ToInt32(collection.GroupID), MenuCodePermissionConstants.USER_CREATION_ADDUSER_MENUCODE, MenuCodePermissionConstants.PERMISSION_ADD);
                    if (isValid)
                    {
                        Guid gdnewKey = Guid.NewGuid();
                        collection.Id = gdnewKey.ToString();
                        collection.CreatedDate = DateTime.Now;

                        // var token = Request.Headers["Authorization"];
                        var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                        var status = await service.Save(stringContent);
                        return new JsonResult { Data = new { status = status, IsSaved = true, Message = "Successfully Saved." } };
                    }
                    else
                    {
                        return new JsonResult { Data = new { status = true, IsSaved = false, Message = "You don't have sufficient permission to this action." } };
                    }
               
               
               
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = false } };
            }
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
                var record = await service.GetUserDetailsWithPagingSorting(stringContent);


                //total number of rows count 
                if (record != null)
                    if(record.Count>0)
                        recordsTotal = record[0].MaxRows;             //Paging 
                                                              // var data = customerData.Skip(skip).Take(pageSize).ToList();
                                                              //Returning Json Data
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = record });


            }
            catch (Exception ex)
            {
                return null;
            }
        }
        [HttpGet]
        public  ActionResult Edit(int id)
        {
            TempData["CUserId"] = id;          
            return View();
            //var record = await service.GetById(id);

            //return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> EditData(int id)
        {
           
            var record = await service.GetById(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
        public async Task<JsonResult> GetUserDetailByUserId(string id)
        {

            var record = await service.GetUserDetailByUserId(id);
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