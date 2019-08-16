using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using GEE.Web.ViewModel.SchoolSetup;
using Newtonsoft.Json;
using GEE.Web.Service.CommonWebService;
using GEE.Web.Utility;

namespace GEE.Web.Service.SchoolSetup
{
   public class RoomService
    {
        public async Task<List<RoomViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.GetAsync(RoomConstant.ROOMMAMSTER_API_GET_ALL);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<RoomViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    }
                }
                catch (Exception ex)
                {

                    throw ex;
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
                    var Response = await client.PostAsync(RoomConstant.ROOMMAMSTER_API_SAVE, collection);
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
                    var Response = await client.PutAsync(RoomConstant.ROOMMAMSTER_API_UPDATE, content);
                    return Response.IsSuccessStatusCode ? true : false;
                }
        }

        public async Task<RoomViewModel> GetById(int id)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(RoomConstant.ROOMMAMSTER_API_GET_BY_ID + "id=" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<RoomViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        public async Task<bool> Delete(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PostAsync(RoomConstant.ROOMMAMSTER_API_DELETE, content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        /// <summary>
        /// This method is used to bind data to html table (Grid).
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        public async Task<List<RoomViewModel>> GetAllRoomData(HttpContent collection)
        {
            using (var client = Common.GetHttpClient())
            {
                try
                {
                    var Response = await client.PostAsync(RoomConstant.ROOMMAMSTER_API_GETALL_ROOM_DATA, collection);
                    if (Response.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<List<RoomViewModel>>(Response.Content.ReadAsStringAsync().Result);
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
