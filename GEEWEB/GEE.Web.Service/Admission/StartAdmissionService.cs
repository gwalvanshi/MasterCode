using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;
using GEE.Web.ViewModel.Admission;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.Admission
{
   public class StartAdmissionService
    {
        /// <summary>
        /// This is generic method to get record from database with paging sorting and searching.       
        /// <param name="IndexScreenParameterModel"></param>
        /// <returns></returns>
        public async Task<List<StartAdmissionViewModel>> GetStartAdmissionWithPagingSorting(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.STARTADMISSION_API_GETDETAILSWITHPAGINGSORTING, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<StartAdmissionViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    }
                    return null;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }


        public async Task<bool> UpdateStartAdmission(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.STARTADMISSION_API_UPDATE, collection);
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
