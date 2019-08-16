using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.HR
{
   public class EmployeeDetailsSchemaModel
    {
        public EmployeeMasterModel EmployeeMasterModel { get; set; }
        public List<EmployeeEducationDetailModel> EmployeeEducationDetailModelList { get; set; }
        public List<EmployeeExperienceModel> EmployeeExperienceModelList { get; set; }
        public List<EmployeeIDdetailModel> EmployeeIDdetailModelList { get; set; }
    }
}
