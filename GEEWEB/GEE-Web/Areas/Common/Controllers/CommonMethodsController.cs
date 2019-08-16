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
using GEE.Web.Service.Security;
using GEE.Web.Utility;
using GEE.Web.Service.Configuration;
using GEE.Web.Service.CommonWebService;
using GEE.Web.ViewModel.Admin;
using GEE.Web.ViewModel.Common;
using GEE.Web.ViewModel.Security;
using GEE.Business.Model.PopupLookup;
using System.Data;
using System.Dynamic;
using GEE.Web.Utility.Enums;
using static GEE.Web.Utility.Enums.PopupLookupEnum;

namespace GEE_Web.Areas.Common.Controllers
{
    public class CommonMethodsController:BaseController
    {
        NavigationPermissionService objNavigationPermissionService = new NavigationPermissionService();
        MenuViewService objMenuViewService = new MenuViewService();
        LookupService objLookupService = new LookupService();
        [HttpPost]
        public async Task<JsonResult> GetMenuList(FormCollection collection)
        {
            var list = await objNavigationPermissionService.GetMenuList(collection.Get("UserName"),Convert.ToInt32(collection.Get("Action")));
            RootObject objRootObject = new RootObject();
            foreach (var item in list.Where(x=>x.NavigationMenuParentId==0).ToList())
            {              
                List<MenusCTE2> objMenusCTE2List = new List<MenusCTE2>();
               
               
                objRootObject.Name = item.NavigationMenuName; 
                var firstLevelMenu = list.Where(a => a.NavigationMenuParentId == item.NavigationMenuId).ToList();
                foreach (var item1 in firstLevelMenu)
                {
                    List<MenusCTE3> objMenusCTE3List = new List<MenusCTE3>();
                    MenusCTE2 objMenusCTE2 = new MenusCTE2();
                    objMenusCTE2.MenuID = item1.NavigationMenuId;
                    objMenusCTE2.Name = item1.NavigationMenuName;
                    objMenusCTE2.MenuCode = item1.NavigationMenuCode.Trim();
                    objMenusCTE2.menuurl =string.IsNullOrEmpty(item1.MenuURL)==true?"#": item1.MenuURL;
                    objMenusCTE2List.Add(objMenusCTE2);
                    var secondLevelMenu = list.Where(b => b.NavigationMenuParentId == item1.NavigationMenuId).ToList();
                    foreach ( var item2 in secondLevelMenu)
                    {
                        List<MenusCTE4> objMenusCTE4List = new List<MenusCTE4>();
                        MenusCTE3 objMenusCTE3 = new MenusCTE3();
                        objMenusCTE3.MenuID = item2.NavigationMenuId;
                        objMenusCTE3.Name = item2.NavigationMenuName;
                        objMenusCTE3.MenuCode = item2.NavigationMenuCode.Trim();
                        objMenusCTE3.menuurl = string.IsNullOrEmpty(item2.MenuURL) == true ? "#":item2.MenuURL;
                        objMenusCTE3List.Add(objMenusCTE3);
                        var thirdLevelMenu = list.Where(c => c.NavigationMenuParentId == item2.NavigationMenuId).ToList();
                        foreach (var item3 in thirdLevelMenu)
                        {
                            MenusCTE4 objMenusCTE4 = new MenusCTE4();
                            objMenusCTE4.MenuID = item3.NavigationMenuId;
                            objMenusCTE4.Name = item3.NavigationMenuName;
                            objMenusCTE4.MenuCode = item3.NavigationMenuCode.Trim();
                            objMenusCTE4.menuurl = string.IsNullOrEmpty(item3.MenuURL) == true ? "#" : item3.MenuURL;
                            objMenusCTE4List.Add(objMenusCTE4);
                        }
                        objMenusCTE3.Menus_CTE4 = objMenusCTE4List;
                    }
                    objMenusCTE2.Menus_CTE3 = objMenusCTE3List;
                }
                objRootObject.Menus_CTE2 = objMenusCTE2List;
            }
            return new JsonResult { Data = objRootObject, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        public async Task<JsonResult> GetKeyForValidation(string Id)
        {
            CommonWebLibrary objCommoWebLib = new CommonWebLibrary();
            var record = await Task.FromResult(objCommoWebLib.GetMandotoryValues(Id));//sending navigation id
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }
        public async Task<JsonResult> GetIndexScreenDetailByNavigation(int MenuId)
        {
            IndexScreenDetailService objCommoWebLib = new IndexScreenDetailService();
            var record = await objCommoWebLib.GetIndexScreenDetailByNavigation(MenuId);           
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }      

        public async Task<JsonResult> GetPermission(int userGroup, int menuId)
        {
            var list = await objNavigationPermissionService.GetNavigationPermission(userGroup, menuId);
            return new JsonResult { Data = list, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        /// <summary>
        /// This method is used to get value from rex file based on Key
        /// Added by Jiya
        /// Addded when 09-April-2018
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public async Task<JsonResult> GetKeyValueFromResx(string keys)
        {
            CommonWebLibrary objCommoWebLib = new CommonWebLibrary();
            var record = await Task.FromResult(objCommoWebLib.GetKeyValueFromResx(keys));//sending navigation id
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }        
        public ActionResult Details()
        {
            return PartialView("~/Areas/Common/Views/CommonMethods/ModelPopup.cshtml");
            
        }
        /// <summary>
        /// This is common method for look up popup
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> PupupLookupData(int PopupType, string SearchValue)
        {
           
            PopupLookupRequestModel collection = new PopupLookupRequestModel();
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
           // var searchValue = SearchValue;// Request.Form["search[value]"];
            if(string.IsNullOrWhiteSpace(SearchValue) || string.IsNullOrEmpty(SearchValue))
            {
                SearchValue = string.Empty;
            }
            //Paging Size (10,20,50,100)
            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;           
            collection.PageNo = skip;
            collection.PageSize = pageSize;
            collection.SortOrder = sortColumnDirection;
            collection.SortColumn = sortColumn;
            collection.SearchValue = SearchValue;
            collection.LookType = PopupType;
            var stringContent = new StringContent(JsonConvert.SerializeObject(collection).ToString(), Encoding.UTF8, "application/json");
            var list = await objLookupService.GetPoupupLookupData(stringContent);           

            return ReturnData(list.DataList, (PopLookupTypes)collection.LookType, list.TotalRecord, draw);

        }
        
        public JsonResult ReturnData(DataTable dt, PopLookupTypes obj, int TotalRecord, char draw)
        {           
            switch (obj)
            {
                case PopLookupTypes.CandidateDetails:
                    {
                        List<CandidateDetailViewModel> CandidateListDetails = new List<CandidateDetailViewModel>();                       
                        CandidateListDetails = (from DataRow dr in dt.Rows
                                       select new CandidateDetailViewModel()
                                       {                                         
                                           CandidateDetail_ID = Convert.ToInt32(dr["CandidateDetail_ID"]),
                                           FirstName = dr["FirstName"].ToString(),
                                           Lastname = dr["Lastname"].ToString(),
                                           FatheFirstName = dr["FatheFirstName"].ToString(),                                          
                                           ContactMobileNo = dr["ContactMobileNo"].ToString()
                                         
                                       }).ToList();                      
                        return Json(new { draw = draw, recordsFiltered = TotalRecord, recordsTotal = TotalRecord, data = CandidateListDetails });
                    }


            }

            return Json(null);
        }



    }
}