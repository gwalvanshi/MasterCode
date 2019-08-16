using GEE.Web.ViewModel.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Web.Service.CommonWebService;
using GEE.Web.ViewModel.Security;
using System.Net.Http;

namespace GEE.Web.Service.Security
{
   public class UserLoginDetailService
    {
        public async Task<List<LoginTrackViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/logintrack/GetAll");
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<LoginTrackViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        public async Task<TokenViewModel> Token(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync("Token", collection);
                    if(Response.IsSuccessStatusCode )
                    {
                        return JsonConvert.DeserializeObject<TokenViewModel>(Response.Content.ReadAsStringAsync().Result);
                    }

                }
                catch (Exception ex)
                {

                    throw ex;
                }
                return null;
            }
        }
    }
}
