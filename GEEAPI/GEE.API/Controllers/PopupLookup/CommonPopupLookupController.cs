using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using GEE.Business.Manager.PopupLookup;
using GEE.Business.Model.PopupLookup;

namespace GEE.API.Controllers.PopupLookup
{
    public class CommonPopupLookupController : BaseController
    {
        CommonPopupLookupManager _iCommonPopupLookup;

        /// <summary>
        /// This is common method api for look up popup.
        /// Added by Jiya
        /// Added When 5 May 2019
        /// </summary>
        /// <param name="objPopupLookupModel"></param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [HttpPost]
        public PopupLookupResponseModel GetData(PopupLookupRequestModel objPopupLookupModel)
        {
            _iCommonPopupLookup = CommonPopupLookupManager.CreatePopLookup((CommonPopupLookupManager.PopLookupTypes)objPopupLookupModel.LookType);           
            return _iCommonPopupLookup.GetAllData(objPopupLookupModel);         
           
        }
    }
}