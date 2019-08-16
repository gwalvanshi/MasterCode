using GEE.Web.ViewModel.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Web.Service.CommonWebService;
using GEE.Web.ViewModel.Security;
using GEE.Web.Utility;
using System.Net.Http;

namespace GEE.Web.Service.Security
{
   public class NavigationPermissionService
    {
       
        /// <summary>
        /// This method is used for get navigation permission.
        /// </summary>
        /// <param name="userid"></param>
        /// <param name="menuid"></param>
        /// <returns></returns>
        public async Task<List<NavigationPermissionViewModel>> GetNavigationPermission(int userGroupId, int menuid)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync( SecurityConstants.GETNAVIGATIONPERMISSION +"userGroupId=" + userGroupId.ToString() + "&menuid=" + menuid);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<NavigationPermissionViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
      
        public async Task<List<NavigationMenuViewModel>> GetMenuList(string userName, int ActionID)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(SecurityConstants.GETMENULIST+ "userName=" + userName + "&ActionID=" + ActionID);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<NavigationMenuViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        public async Task<List<PermissionParentViewModel>> GetMenu(int moduleId, int userGroupId)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(SecurityConstants.GETMENU + "moduleId=" + moduleId + "&userGroupId=" + userGroupId);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<PermissionParentViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        
        /// <summary>
        /// This method is used to check in case module permission is exists or not
        /// </summary>
        /// <param name="userGroupId"></param>
        /// <param name="menuId"></param>
        /// <returns></returns>
        public async Task<List<PermissionParentViewModel>> GetModuleList(int userGroupId, int menuid)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(SecurityConstants.GETMODULELIST + "userGroupId=" + userGroupId.ToString() + "&menuid=" + menuid);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<PermissionParentViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        /// <summary>
        /// this method is used to get menu permission from database according to user group and menu id
        /// Added by jiya 8 june 2019
        /// </summary>
        /// <param name="userGroupId"></param>
        /// <param name="menuId"></param>
        /// <returns></returns>
        public async Task<List<NavigationPermissionViewModel>> GeMenuPermission(int userGroupId, int menuid)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(SecurityConstants.GEMENUPERMISSION + "userGroupId=" + userGroupId.ToString() + "&menuid=" + menuid);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<NavigationPermissionViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        public async Task<bool> Save(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(SecurityConstants.SAVEMENUPERMISSION, collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }




    }
}
