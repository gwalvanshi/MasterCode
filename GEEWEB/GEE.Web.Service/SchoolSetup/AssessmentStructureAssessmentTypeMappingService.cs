using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using GEE.Web.ViewModel.SchoolSetup;
using Newtonsoft.Json;
using System.Configuration;
using Newtonsoft.Json.Linq;
using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;


namespace GEE.Web.Service.SchoolSetup
{
    public class AssessmentStructureAssessmentTypeMappingService
    {
        
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
                    var Response = await client.PostAsync(AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_SAVEALLROW, collection);
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
                var Response = await client.PutAsync(AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_UPDATEALLROW, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// GetBy Id 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<SubjectMasterViewModel> GetById(int id)
        {
            var documentType = new SubjectMasterViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_GET + "id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<SubjectMasterViewModel>(Response.Content.ReadAsStringAsync().Result);
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
                var Response = await client.DeleteAsync(AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_DELETE + id);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// This method is used to bind data to html table (Grid).
        /// Added by  Amixa
        /// Added when 1 May
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<AssessmentStructureAssessmentTypeMappingViewModel>> GetAssessmentStructureData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_GETALLCOURSEWITHCLASS, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<AssessmentStructureAssessmentTypeMappingViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
