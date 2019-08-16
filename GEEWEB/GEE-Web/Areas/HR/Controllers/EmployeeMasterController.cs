using GEE.Web.Service.HR;
using GEE.Web.Utility;
using GEE.Web.ViewModel.Configuration;
using GEE.Web.ViewModel.HR;
using GEE_Web.Controllers;
using GEE_Web.WebLibrary;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace GEE_Web.Areas.HR.Controllers
{
    public class EmployeeMasterController : BaseController
    {
        EmployeeMasterService service = new EmployeeMasterService();
        CommonWebLibrary objCommoWebLib = new CommonWebLibrary();
        public ActionResult Create()
        {
            return View();
        }

      
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<JsonResult> Edit(EmployeeMasterModel collection)
        {
            try
            {
                //Demo-Implementing Permission  
                //We aresending three parameter to check the permission
                //GroupID-This is coming from session object(collection)
                //Menu Code: From constants file MenuCodePermissionConstants.each action have its menu code.
                //PERMISSION: from constant file MenuCodePermissionConstants. each permission have name same as database permission name.
                bool isValid = await objCommoWebLib.IsValidPermission(Convert.ToInt32(collection.GroupID), MenuCodePermissionConstants.EMPLOYEE_MASTER_MENUCODE, MenuCodePermissionConstants.PERMISSION_UPDATE);
                if (isValid)
                {
                    collection.ModifiedDate = DateTime.Now;
                    var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
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
        public async Task<JsonResult> Create(EmployeeDetailsSchemaModel collection)
        {
            try
            {

                //Demo-Implementing Permission  
                //We aresending three parameter to check the permission
                //GroupID-This is coming from session object(collection)
                //Menu Code: From constants file MenuCodePermissionConstants.each action have its menu code.
                //PERMISSION: from constant file MenuCodePermissionConstants. each permission have name same as database permission name.
                bool isValid = true;//await objCommoWebLib.IsValidPermission(Convert.ToInt32(collection.EmployeeMasterModel.GroupID), MenuCodePermissionConstants.EMPLOYEE_MASTER_MENUCODE, MenuCodePermissionConstants.PERMISSION_ADD);
                if (isValid)
                {
                    List<EmployeeMasterModel> objMasterList = new List<EmployeeMasterModel>();
                    objMasterList.Add(collection.EmployeeMasterModel);
                    CommonWebLibrary objCommon = new CommonWebLibrary();
                    EmployeeDetailsSaveSchemaModel objSchema = new EmployeeDetailsSaveSchemaModel();
                    objSchema.EmployeeDetailsXML = objCommon.ToListTOTableString(objMasterList);
                    objSchema.EducationItemXML = objCommon.ToListTOTableString(collection.EmployeeEducationDetailModelList);
                    objSchema.ExperinceItemXML= objCommon.ToListTOTableString(collection.EmployeeExperienceModelList);
                    objSchema.EmployeeIdItemXML = objCommon.ToListTOTableString(collection.EmployeeIDdetailModelList);
                    objSchema.EmployeeMasterID = collection.EmployeeMasterModel.EmployeeMasterID;
                    objSchema.ModifiedBy = collection.EmployeeMasterModel.CreatedBy_ID;
                    // var token = Request.Headers["Authorization"];
                    var stringContent = new StringContent(JsonConvert.SerializeObject(objSchema).ToString(), Encoding.UTF8, "application/json");
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
                var record = await service.GetEmployeeDetailsWithPagingSorting(stringContent);


                //total number of rows count 
                if (record != null)
                    if (record.Count > 0)
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
        public ActionResult Edit(int id)
        {
            TempData["EmployeeMasterID"] = id;
            return View();
            //var record = await service.GetById(id);

            //return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        public async Task<JsonResult> EditData(int id)
        {

            var record = await service.GetById(id);
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
        [HttpPost]
        public async Task<ActionResult> Delete(int  ID, int ? groupId, int ? sessionId, int ? schoolId, int? deletedBy)
        {
            try
            {   //Demo-Implementing Permission  
                //We aresending three parameter to check the permission
                //GroupID-This is coming from session object(collection)
                //Menu Code: From constants file MenuCodePermissionConstants.each action have its menu code.
                //PERMISSION: from constant file MenuCodePermissionConstants. each permission have name same as database permission name.

                EmployeeMasterModel collection = new EmployeeMasterModel();
                collection.EmployeeMasterID = ID;
                collection.Sessionyear = sessionId;
                collection.GroupID = groupId;
                collection.ModifiedBy_ID = deletedBy;
                collection.SchoolID = schoolId;
                bool isValid = await objCommoWebLib.IsValidPermission(Convert.ToInt32(collection.GroupID), MenuCodePermissionConstants.EMPLOYEE_MASTER_MENUCODE, MenuCodePermissionConstants.PERMISSION_DELETE);
                if (isValid)
                {
                                       
                    var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
                    var status = await service.Delete(stringContent);
                    return new JsonResult { Data = new { status = status, IsSaved = true, Message = "Successfully Deleted." } };
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
    }
}