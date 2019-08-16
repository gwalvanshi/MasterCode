using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GEE.Web.Service;
using GEE.Web.Utility;
using GEE_Web.WebLibrary;
namespace GEE_Web.Controllers
{
    public class BaseController : Controller
    {
        
        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            if (Session["Access_Token"] != null)
                BaseAuthorizationToken.AuthorizationToken =Convert.ToString(Session["Access_Token"]);
            else
                BaseAuthorizationToken.AuthorizationToken = string.Empty;

            string lang = null;
            HttpCookie langCookie = Request.Cookies["culture"];
            if (langCookie != null)
            {
                lang = langCookie.Value;
            }
            else
            {
                var userLanguage = Request.UserLanguages;
                var userLang = userLanguage != null ? userLanguage[0] : "";
                if (userLang != "")
                {
                    lang = userLang;
                }
                else
                {
                    lang = LanguageAvailable.GetDefaultLanguage();
                }
            }
            new LanguageAvailable().SetLanguage(lang);           
            return base.BeginExecuteCore(callback, state);
        }
    }
}