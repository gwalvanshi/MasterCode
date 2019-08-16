using GEE.Business.Interface.Admission;
using GEE.Business.Model.Admission;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;

namespace GEE.API.Controllers.Admission
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LookupsController : BaseController
    {
        // GET: EnquiryType
        IFillCombo _fillCombo;
        public LookupsController(IFillCombo fillCombo)
        {
            _fillCombo = fillCombo;
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        public string get()
        {
            return "Santosh";
        }

        [AcceptVerbs("GET")]
        [HttpGet]
        public async Task<JsonResult<List<DdlViewModel>>> GetComboDetails()
        {
            try
            {

                return Json(_fillCombo.GetDDl("tbName", "fname", "code", "cond"));

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
        [Route("api/Lookups/GetCombo/{tbName}/{fname}/{code}/{cond}")]
        [AcceptVerbs("GET")]
        [HttpGet]
        public async Task<JsonResult<List<DdlViewModel>>>  GetCombo(string tbName, string fname, string code, string cond)
        {
            try
            {

                  return  Json(_fillCombo.GetDDl(tbName, fname, code, cond));
                
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }
        }
    }
}
