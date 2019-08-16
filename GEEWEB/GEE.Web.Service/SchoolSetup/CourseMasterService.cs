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
    public class CourseMasterService
    {
        /// <summary>
        /// Save All RowData
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<bool> SaveAllRow(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.COURSEMASTER_API_SAVEALLROW, collection);
                    return Response.IsSuccessStatusCode ? true : false;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        public async Task<bool> UpdateCourceTableAllRow(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.COURSEMASTER_API_UPDATEALLROW, collection);
                    return Response.IsSuccessStatusCode ? true : false;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        /// <summary>
        /// Get All Course Master with ClsssId
        /// </summary>         
        /// <returns></returns>
        public async Task<List<CourseMasterModel>> GetAllCourseWithClass(int classId)
        {
            var masterTable = new CourseMasterModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.COURSEMASTER_API_GETALLCOURSEWITHCLASS + "Id=" + classId);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<CourseMasterModel>>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }
    }
}
