using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;
using GEE.Web.ViewModel.HR;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service.HR
{
   public class EmployeeMasterService
    {
        /// <summary>
        /// Employee saved method
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<bool> Save(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(HRConstants.EMPLOYEE_API_SAVE, collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        /// <summary>
        /// Employee update method
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<bool> Update(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(HRConstants.EMPLOYEE_API_UPDATE, collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        /// <summary>
        /// Employee Delete method
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<bool> Delete(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(HRConstants.EMPLOYEE_API_DELETE, collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        /// <summary>
        /// Employee get method tyo bind the grid
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<EmployeeMasterModel>> GetEmployeeDetailsWithPagingSorting(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(HRConstants.EMPLOYEE_API_GETUSERDETAILSWITHPAGINGSORTING, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<EmployeeMasterModel>>(Response.Content.ReadAsStringAsync().Result);
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
        /// Employee get method to bind the employee details page.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<EmployeeMasterEditViewModel> GetById(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(HRConstants.EMPLOYEE_API_GET_BY_ID + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<EmployeeMasterEditViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }
    }
}
