using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.Admission;
using GEE.Business.Manager.Admission;
using GEE.Business.Models.Admission;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using GEE.Business.Interface.Configuration;
using GEE.Business.Model.Configuration;
using GEE.Common;
using System.Linq;

namespace GEE.API.Controllers.Configuration
{
    public class IndexScreenDetailController : BaseController
    {
        IIndexScreenDetail _iIndexScreenDetail;

        public IndexScreenDetailController(IIndexScreenDetail iIndexScreenDetail)
        {
            _iIndexScreenDetail = iIndexScreenDetail;
        }
        /// <summary>
        /// This method is used to get index screen details.
        /// Added by Jiya
        /// date 07-Apr-2019
        /// </summary>
        /// <param name="menuid"></param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [HttpGet]       
        public JsonResult<List<IndexScreenDetailModel>> GetIndexScreenDetailByNavigation(int menuid)
        {
            try
            {
                var objList = _iIndexScreenDetail.GetAllIncludeSearch(menuid);
                return Json(objList);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }        
    }
   
}