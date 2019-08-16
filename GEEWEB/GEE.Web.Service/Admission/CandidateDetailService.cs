using GEE.Web.ViewModel;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;
using System;

namespace GEE.Web.Service.Admission
{
    public class CandidateDetailService
    {
        public async Task<List<CandidateDetailViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdmissionConstants.CANDIDATE_API_GETALL);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<CandidateDetailViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }


        public async Task<bool> Save(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PostAsync(AdmissionConstants.CANDIDATE_API_SAVE, collection);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        public async Task<bool> Update(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PutAsync(AdmissionConstants.CANDIDATE_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        public async Task<CandidateDetailViewModel> GetById(int id)
        {
            var candidateDetail = new CandidateDetailViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdmissionConstants.CANDIDATE_API_GETBYID + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<CandidateDetailViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        public async Task<CandidateDetailViewModel> GetCandidateDetailsByEnquiryId(int id)
        {
            var candidateDetail = new CandidateDetailViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdmissionConstants.CANDIDATE_API_GETCANDIDATEBYENQUIRY+ id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<CandidateDetailViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        /// <summary>
        /// This method is used to get popup data.
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<CandidateDetailViewModel>> GetPopupData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.CANDIDATE_API_GETPOPUPDATA, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<CandidateDetailViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    }
                    return null;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        public async Task<List<CandidateDetailViewModel>> GetCandidateDetailsWithPagingSorting(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.CANDIDATE_API_GETCANDIDATEDETAILSWITHPAGINGSORTING, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<CandidateDetailViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
