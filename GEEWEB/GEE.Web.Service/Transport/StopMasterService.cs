using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;
using GEE.Web.ViewModel.Transport;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.Transport
{
   public class StopMasterService
    {
        /// Added by Shivani
        /// <summary>
        /// Get All
        /// </summary>
        /// <returns></returns>
        public async Task<List<StopMasterViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.GetAsync(StopMasterConstants.StopMASTER_API_GET_ALL);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<StopMasterViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    }
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            return null;
        }

        /// Added by Shivani
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
                    var Response = await client.PostAsync(StopMasterConstants.StopMASTER_API_SAVE, collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        /// Added by Shivani
        /// <summary>
        ///  Update Data
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public async Task<bool> Update(HttpContent content)
        {

            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PutAsync(StopMasterConstants.StopMASTER_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// Added by Shivani
        /// <summary>
        /// GetBy Id 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<StopMasterViewModel> GetById(int id)
        {
            var documentType = new StopMasterViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(StopMasterConstants.StopMASTER_API_GET_BY_ID + "id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<StopMasterViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        /// Added by Shivani
        /// <summary>
        /// Delete Data
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> Delete(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PostAsync(StopMasterConstants.StopMASTER_API_DELETE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// This method is used to bind data to html table (Grid).
        /// Added by Shivani
        /// Added when 1 May
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<StopMasterViewModel>> GetAllStopMasterData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(StopMasterConstants.StopMASTER_API_GETALL_StopMASTER_DATA, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<StopMasterViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
