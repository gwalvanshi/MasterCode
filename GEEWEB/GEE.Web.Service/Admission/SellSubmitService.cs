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
   public class SellSubmitService
    {

        /// <summary>
        /// This is generic method to get record from database with paging sorting and searching.       
        /// <param name="IndexScreenParameterModel"></param>
        /// <returns></returns>
        public async Task<List<SellSubmitViewModel>> GetSellSubmitDetailsWithPagingSorting(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.SELLSUBMIT_API_GETDETAILSWITHPAGINGSORTING, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<SellSubmitViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    }
                    return null;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        /// <summary>
        /// check application is sold = true against EnquiryId       
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<bool> GetIsApplicationSold(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.GetAsync(AdmissionConstants.SELLSUBMIT_API_GETISAPPSOLD + id);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<bool>(Response.Content.ReadAsStringAsync().Result);
                    }
                    return false;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        
}

        /// <summary>
        ///  Update Application No Against Enquiry Id
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public async Task<bool> UpdateApplicationNo(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.SELLSUBMIT_API_UPDATEAPPNO, content);
                    return Response.IsSuccessStatusCode ? true : false;
                }

                catch (Exception ex)
                {

                    throw ex;
                }

            }
        }

        /// <summary>
        /// Checkn config table Is ApplicationNo is equals to Registration no
        /// </summary>
        /// <param name="nvigationMenuCode"></param>
        /// <returns></returns>
        public async Task<bool> CheckIsAppNumEqualsRegiNum(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.GetAsync(AdmissionConstants.SELLSUBMIT_API_CheckIsAppNumEqualsRegiNum + id);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<bool>(Response.Content.ReadAsStringAsync().Result);
                    }
                    return false;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        /// <summary>
        /// Update Registration No Against Enquiry Id
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public async Task<bool> UpdateRegistrationNo(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.SELLSUBMIT_API_UpdateRegistrationNo, content);
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
