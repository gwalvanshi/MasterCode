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
using GEE.Web.ViewModel.SchoolSetup;

namespace GEE.Web.Service.SchoolSetup
{
    public class BookMasterService
    {
        ///
        ///Created By: Amit Gajera on 05/04/2019 
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
                    var Response = await client.PostAsync(AdminConstants.BOOKMASTER_API_SAVE, collection);
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
                var Response = await client.PutAsync(AdminConstants.BOOKMASTER_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// GetBy Id 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<BookMasterViewModel> GetById(int id)
        {
            var masterTable = new BookMasterViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.BOOKMASTER_API_GET + "?id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<BookMasterViewModel>(Response.Content.ReadAsStringAsync().Result);
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
                var Response = await client.DeleteAsync(AdminConstants.BOOKMASTER_API_DELETE + id);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// All Book Master Data
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<BookMasterGridViewModel>> GetAllBookMasterData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.BOOKMASTER_API_GETALL_DATA, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<BookMasterGridViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
