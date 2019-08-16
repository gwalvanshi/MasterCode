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
using GEE.Business.Model.Admission;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using GEE.Business.Interface.Configuration;
using GEE.Business.Model.Configuration;
namespace GEE.API.Controllers.Configuration
{
    public class SchoolConfigController:BaseController
    {
        ISchoolConfig _schoolConfig;

        public SchoolConfigController(ISchoolConfig schoolConfig)
        {           
            _schoolConfig = schoolConfig;
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        public  List<SchoolConfigModel> GetAllSchoolConfig()
        {
            try
            {

               return _schoolConfig.GetAllSchoolConfig();
               // return Json(record);
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        [AcceptVerbs("GET")]
        [HttpGet]
        public List<SchoolConfigModel> GetSchoolConfigListByNavigation(int id)
        {
            try
            {

                return _schoolConfig.GetSchoolConfigListByNavigation(id);
               
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        [AcceptVerbs("GET")]
        [HttpGet]
        public SchoolConfigModel GetSchoolConfig(int id)
        {
            try
            {

                return _schoolConfig.GetSchoolConfig(id);

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
    }
}