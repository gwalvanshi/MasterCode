using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.HR
{
   public class EmployeeIDdetailModel
    {
        public int EmployeeIDdetail_ID { get; set; }
        public Nullable<int> IDcardTypeID { get; set; }
        public Nullable<int> EmpcodeID { get; set; }
        public string Idnumber { get; set; }
        public Nullable<System.DateTime> validFrom { get; set; }
        public Nullable<System.DateTime> ValidTo { get; set; }
        public Nullable<int> IssueCityID { get; set; }
    }
}
