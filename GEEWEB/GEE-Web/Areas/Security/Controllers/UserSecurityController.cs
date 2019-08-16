using GEE.Web.Service;
using GEE.Web.Service.Security;
using GEE.Web.ViewModel.Security;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
namespace GEE_Web.Areas.Security.Controllers
{
    public class UserSecurityController:Controller
    {
        UserLoginDetailService _userLoginDetailService = new UserLoginDetailService();
        public async Task<JsonResult> GetAll()
        {
           
            var record = await _userLoginDetailService.GetAll();
            return new JsonResult { Data = record, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

        }

        [HttpPost]
        public async Task<JsonResult> Token(TokenViewModel collection)
        {
            try
            {
                var pairs = new List<KeyValuePair<string, string>>
                    {
                        new KeyValuePair<string, string>( "grant_type", "password" ),
                        new KeyValuePair<string, string>( "username", collection.UserName ),
                        new KeyValuePair<string, string> ( "Password", collection.Password )
                    };
                var content = new FormUrlEncodedContent(pairs);
                var status = await _userLoginDetailService.Token(content);
                Session["Access_Token"] = status.Access_Token;
                return new JsonResult { Data = new { status = status } };
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { status = false } };
            }
        }
    }
}