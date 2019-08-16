using GEE.Web.Service.CommonWebService;
using GEE.Web.ViewModel.Admin;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Web.Utility;
using System.Net.Http;
using GEE.Web.ViewModel.Admission;

namespace GEE.Web.Service.Admission
{ 

    public class AssessmentTypeService
    {
        ///
        ///Created By: Amit Gajera on 05/05/2019 
        ///

        /// <summary>
        ///  Save Data
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<bool> Save(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.ASSESSMENTTYPE_API_SAVE, collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        /// <summary>
        ///  Update Data
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public async Task<bool> Update(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PutAsync(AdminConstants.ASSESSMENTTYPE_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// GetBy Id 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<AssessmentTypeViewModel> GetById(int id)
        {
            var masterTable = new AssessmentTypeViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.ASSESSMENTTYPE_API_GET + "?id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<AssessmentTypeViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        /// <summary>
        /// Delete Data
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> Delete(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.DeleteAsync(AdminConstants.ASSESSMENTTYPE_API_DELETE + id);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// All Book Master Data
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<AssessmentTypeGridViewModel>> GetAllAssessmentTypeData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.ASSESSMENTTYPE_API_GETALL_DATA, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<AssessmentTypeGridViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
