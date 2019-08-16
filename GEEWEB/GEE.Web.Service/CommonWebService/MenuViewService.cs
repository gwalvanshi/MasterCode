using GEE.Web.ViewModel.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.CommonWebService
{
   public class MenuViewService
    {
        /// <summary>
        /// This method is used for get menu list according to user.
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="ActionID"></param>
        /// <returns></returns>
   
        public async Task<List<MenuViewModel>> GetMenuList(string userName, int ActionID)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/GetMenu/GetMenuList?userName=" + userName + "&ActionID=" + ActionID);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<MenuViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
    }
}
