using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.HR
{
   public class EmployeeDetailsSaveSchemaModel
    {
        public string EmployeeDetailsXML { get; set; }
        public string EducationItemXML { get; set; }
        public string ExperinceItemXML { get; set; }
        public string EmployeeIdItemXML { get; set; }
        public int ModifiedBy { get; set; }
        public int EmployeeMasterID { get; set; }
      
    }
}
