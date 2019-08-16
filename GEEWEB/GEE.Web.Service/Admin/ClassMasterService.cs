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
    public class ClassMasterService
    {
        ///
        ///Created By: Amit Gajera on 05/01/2019 
        ///
        

        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public async Task<List<ClassMasterViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.CLASSMASTER_API_GET);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<ClassMasterViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }

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
                    var Response = await client.PostAsync(AdminConstants.CLASSMASTER_API_SAVE, collection);
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
                var Response = await client.PutAsync(AdminConstants.CLASSMASTER_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// GetBy Id 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<ClassMasterViewModel> GetById(int id)
        {
            var masterTable = new ClassMasterViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.CLASSMASTER_API_GET + "?id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<ClassMasterViewModel>(Response.Content.ReadAsStringAsync().Result);
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
                var Response = await client.DeleteAsync(AdminConstants.CLASSMASTER_API_DELETE + id);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// All ClassMaster Data
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<ClassMasterGridViewModel>> GetAllClassMasterData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.CLASSMASTER_API_GETALL_DATA, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<ClassMasterGridViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
        /// Get All  Class for Add Course Master
        /// </summary>         
        /// <returns></returns>
        public async Task<List<ClassWithCourceViewModel>> GetAllClass( )
        {
            var masterTable = new ClassWithCourceViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.CLASSMASTER_API_GETAll);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<ClassWithCourceViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        /// <summary>
        /// Get All  Class for Edit Course Master
        /// </summary>         
        /// <returns></returns>
        public async Task<List<ClassWithCourceViewModel>> GetEditClassListWithCourse()
        {
            var masterTable = new ClassWithCourceViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.CLASSMASTER_API_GETAllFOREDITCOURSE);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<ClassWithCourceViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

    }
}
