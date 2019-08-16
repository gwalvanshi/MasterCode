using GEE.Business.Interface.Admin;
using GEE.Business.Model.Admin;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Results;

namespace GEE.API.Controllers.Admin
{
    [RoutePrefix("api/GetMenu")]
    public class GetMenuController : BaseController
    {
        // GET: EnquiryType
        IGetMenu _entity;
       
       
        public GetMenuController(IGetMenu entity)
        {
            _entity = entity;
           
        }

        // GET api/Account/ManageInfo?userName=&ActionID=1
        [Route("GetMenuList")]
        [AcceptVerbs("GET")]
        [HttpGet]
        //public HttpResponseMessage GetMenuList(string userName, byte ActionID)
        //{
        //    try
        //    {
        //        var res = new HttpResponseMessage
        //        {
        //            Content = new StringContent(_entity.GetMenuListstring(userName, ActionID))
        //        };
        //        res.Content.Headers.ContentType = new MediaTypeHeaderValue("application/javascript");
        //        return res;


        //    }
        //    catch (Exception ex)
        //    {
        //        Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
        //        return null;
        //    }
        //}
        public List<GetMenuModel> GetMenuList(string userName, byte ActionID)
        {
            return _entity.GetMenuList(userName, ActionID);
        }
    }
}
