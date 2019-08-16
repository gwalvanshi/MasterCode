using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;
using GEE.Web.ViewModel.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.Configuration
{
   public class IndexScreenDetailService
    {
        /// <summary>
        /// This method is used for get Index ScreenDetail By Navigation 
        /// </summary>
        /// <param name="menuid"></param>
        /// <returns></returns>
        public async Task<List<IndexScreenDetailViewModel>> GetIndexScreenDetailByNavigation(int menuid)
        {
            using (var client = Common.GetHttpClient())
            {

                var Response = await client.GetAsync(ConfigurationConstrants.INDEXSCREENDETAIL_GET_API + "menuid=" + menuid);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<IndexScreenDetailViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
    }
}
