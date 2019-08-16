using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.HR
{
   public class EmployeeIDdetailModel: BaseEntity
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
