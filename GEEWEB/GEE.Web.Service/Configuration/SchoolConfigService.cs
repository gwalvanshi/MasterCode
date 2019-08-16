using GEE.Web.Service.CommonWebService;
using GEE.Web.ViewModel.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.Configuration
{
   public class SchoolConfigService
    {
        /// <summary>
        /// This method is used for get all scholl config.
        /// </summary>
        /// <returns></returns>
        public async Task<List<SchoolConfigViewModel>> GetAllSchoolConfig()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/SchoolConfig/GetAllSchoolConfig");
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<SchoolConfigViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        /// <summary>
        /// This method is used for get school config according to navigation id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<List<SchoolConfigViewModel>> GetSchoolConfigListByNavigation(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/SchoolConfig/GetSchoolConfigListByNavigation?id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<SchoolConfigViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        /// <summary>
        /// This method is used for get school confog according to school config id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<SchoolConfigViewModel> GetSchoolConfig(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/SchoolConfig/GetSchoolConfig?id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<SchoolConfigViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
    }
}
