using GEE.Web.Service;
using GEE.Web.Service.Admin;
using GEE.Web.Service.CommonWebService;
using GEE_Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace GEE_Web.Areas.Admission.Controllers
{
    public class LookupsController : BaseController
    {
        LookupService service = new LookupService();
        MasterTableService masterService = new MasterTableService();

        public async Task<JsonResult> GetDdl(string tbName, string fname, string code, string cond)
        {
            var list = await service.GetCombo(tbName, fname, code, cond);

            return new JsonResult { Data = list, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            
        }

        public async Task<JsonResult> GetMasterDropdownData(int? masterTableId, int? masterTypeId, int? schoolId, int? groupId, int? sessionYear, bool? isDeleted)        
        {          
            var list = await masterService.GetMasterDropdownData(masterTableId, masterTypeId, schoolId, groupId, sessionYear, isDeleted);
            return new JsonResult { Data = list, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
    }
}