using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;
using GEE.Web.ViewModel.Admin;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.Admin
{
   public class UserGroupService
    {
        public async Task<List<UserGroupViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.USERGROUP_API_GET_ALL);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<UserGroupViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
    }
}
