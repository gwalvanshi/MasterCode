using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using GEE.Web.ViewModel;
using Newtonsoft.Json;
using System.Configuration;
using Newtonsoft.Json.Linq;
using GEE.Web.ViewModel.Common;
using GEE.Web.Utility;

namespace GEE.Web.Service.CommonWebService
{
   public class Common:BaseAuthorizationToken
    {      

        public static HttpClient GetHttpClient()
        {
          
            var client = new HttpClient();
            client.BaseAddress = new Uri(Constants.BASE_URL);  
            client.DefaultRequestHeaders.Clear();         
            client.DefaultRequestHeaders.Add("Authorization", "Bearer " + AuthorizationToken);
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            return client;
        }



    }
}
