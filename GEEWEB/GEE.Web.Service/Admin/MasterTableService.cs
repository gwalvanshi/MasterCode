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

namespace GEE.Web.Service.Admin
{
    public class MasterTableService
    {
      
        /// <summary>
        /// Description :This method is used for bind the all master data dropdown .
        /// Auther: Jiya
        /// Created Date:13-Mar-2019       
        /// </summary>
        /// <param name="masterTableId">Nullable parameter will match the master table key</param>
        /// <param name="masterTypeId">nullable paramter will match with type i.e. city , state</param>
        /// <param name="schoolId">nullable admin school id</param>
        /// <param name="groupId">nullable admin group id</param>
        /// <param name="sessionYear">nullable school serssion year</param>
        /// <param name="isDeleted">nullable deleted or not</param>
        /// <returns></returns>
        public async Task<List<MasterTableViewModel>> GetMasterDropdownData(int? masterTableId, int? masterTypeId, int? schoolId, int? groupId, int? sessionYear, bool? isDeleted)
        {

            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.MASTERTABLE_API_GET_ALL+ "masterTableId=" + masterTableId+ "&masterTypeId=" + masterTypeId + "&schoolId="+ schoolId + "&groupId=" + groupId + "&sessionYear=" + sessionYear + "&isDeleted=" + isDeleted);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<MasterTableViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }

        public async Task<List<MasterTableViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.MASTERTABLE_API_GET);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<MasterTableViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
                    var Response = await client.PostAsync(AdminConstants.MASTERTABLE_API_SAVE, collection);
                    return Response.IsSuccessStatusCode ? true : false;

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
                var Response = await client.PutAsync(AdminConstants.MASTERTABLE_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        public async Task<MasterTableViewModel> GetById(int id)
        {
            var masterTable = new MasterTableViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.MASTERTABLE_API_GET_BY_ID + "id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<MasterTableViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

      

        public async Task<bool> Delete(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PostAsync(AdminConstants.MASTERTABLE_API_DELETE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        public async Task<MasterTableTypeViewModel> GetParentValues(int masterTableTypeId)
        {
            var masterTable = new MasterTableTypeViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.MASTERTABLE_API_GET_PARENTVALUES + "masterTableTypeId="+ masterTableTypeId);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<MasterTableTypeViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }

        }

        public async Task<bool> ChecKIsDefault(int schoolId,int groupId)
        {
            var masterTable = new MasterTableTypeViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.MASTERTABLE_API_GET_CHECKISDEFAULT + "schoolId=" + schoolId + "&groupId=" + groupId);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<bool>(Response.Content.ReadAsStringAsync().Result);
                }
                return false;
            }

        }
        /// <summary>
        /// This method is used to bind data to html table (Grid).
        /// Added by jiya
        /// Added when 30 April
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<MasterTableViewModel>> GetAllMasterData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.MASTERTABLE_API_GETALL_MASTER_DATA, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<MasterTableViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
