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
  public  class UserService
    {
        /// <summary>
        /// This method is used to save user data in to database
        /// Authorize(Roles = AdminConstants.ASPNETUSER_POST_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public async Task<bool> Save(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.USER_API_SAVE, collection);
                    return Response.IsSuccessStatusCode ? true : false;

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
        /// <summary>
        /// This is generic method to get record from database with paging sorting and searching.       
        /// Authorize(Roles = AdminConstants.ASPNETUSER_GET_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// <param name="IndexScreenParameterModel"></param>
        /// <returns></returns>
        public async Task<List<AspNetUserViewModel>> GetUserDetailsWithPagingSorting(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(AdminConstants.USER_API_GETUSERDETAILSWITHPAGINGSORTING, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<AspNetUserViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
        /// This method will used to Update  the user data based on user id.   
        /// Authorize(Roles = AdminConstants.ASPNETUSER_DELETE_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public async Task<bool> Update(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PostAsync(AdminConstants.USER_API_UPDATE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }
        /// <summary>
        /// This method will used to deactivate the user based on user cID.   
        /// Authorize(Roles = AdminConstants.ASPNETUSER_DELETE_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> Delete(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.DeleteAsync(AdminConstants.USER_API_DELETE+ id);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }
        /// <summary>
        /// This method will used to get user based on user cID.   
        /// Authorize(Roles = AdminConstants.ASPNETUSER_GET_ROLE) this is mapped in to database for logged in user.
        /// in case not matched it will not given permission to access this method to logged in user.
        /// Added by jiya
        /// Added  when 23 April 2019
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<AspNetUserViewModel> GetById(int id)
        {         
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.USER_API_GET + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<AspNetUserViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        public async Task<int> GetUserDetailByUserId(string id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.USER_API_GETUID + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<int>(Response.Content.ReadAsStringAsync().Result);
                }
                return 0;
            }
        }
    }
}
