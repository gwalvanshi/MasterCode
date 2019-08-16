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
using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;
using GEE.Web.ViewModel.Admission;

namespace GEE.Web.Service.Admission
{
    public class EnquiryService
    {
        public async Task<List<QualificationViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdmissionConstants.ENQUIRY_API_GET_ALL);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<QualificationViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }

        public async Task<bool> Save(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.ENQUIRY_API_SAVE,collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        public async Task<List<EnquiryViewModel>> GetEnquiryDetailsWithPagingSorting(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdmissionConstants.ENQUIRY_API_GETENQUIRYDETAILSWITHPAGINGSORTING, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<EnquiryViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    }
                    return null;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        
        public async Task<bool> Update(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PutAsync(AdmissionConstants.ENQUIRY_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        public async Task<EnquiryViewModel> GetById(int id)
        {
            var enquiry = new EnquiryViewModel();
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.GetAsync(AdmissionConstants.ENQUIRY_API_GET_BY_ID + id);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<EnquiryViewModel>(Response.Content.ReadAsStringAsync().Result);
                    }
                }
                catch (Exception ex)
                {

                    throw ex;
                }
                
                return null;
            }
        }

        public async Task<EnquiryViewModel> GetAutoGeneraedNo(int id)
        {
            var enquiry = new EnquiryViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdmissionConstants.ENQUIRY_API_GET_AUTO_GENERATED_NO+ id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<EnquiryViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }


        public async Task<CityStateCountryModel> GetStatByCityId(int id)
        {
            var enquiry = new CityStateCountryModel();
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.GetAsync(AdmissionConstants.ENQUIRY_API_GETSTATEBYCITY + id);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<CityStateCountryModel>(Response.Content.ReadAsStringAsync().Result);
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
        /// Delete Data
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> Delete(int Id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.DeleteAsync(AdmissionConstants.ENQUIRY_API_DELETE + Id);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }
    }
}
