using GEE.Business.Model.PopupLookup;
using GEE.Web.Utility;
using GEE.Web.ViewModel.Admission;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.CommonWebService
{
   public class LookupService
    {
        /// <summary>
        /// This method is used for get dropdown values.
        /// </summary>
        /// <param name="tblName"></param>
        /// <param name="fName"></param>
        /// <param name="code"></param>
        /// <param name="cond"></param>
        /// <returns></returns>
        public async Task<List<DdlViewModel>> GetCombo(string tblName,string fName, string code,string cond)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/Lookups/GetCombo/" + tblName + '/' + fName + '/' + code + '/' + cond);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<DdlViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
       
        /// <summary>
        /// this is common method to show the popup lookup
        /// Added by Jiya
        /// Added when 05 May-2019
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<PopupLookupResponseModel> GetPoupupLookupData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(Constants.POPUPLOOKUP_URL, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<PopupLookupResponseModel>(Response.Content.ReadAsStringAsync().Result);
                    }
                    return null;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
    }
}
