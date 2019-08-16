using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.HR
{
   public class EmployeeExperienceModel: BaseEntity
    {
        public int EmployeeExperience_Id { get; set; }
        public Nullable<int> EmpCode { get; set; }
        public string Company_Name { get; set; }
        public string WorkCity { get; set; }
        public Nullable<System.DateTime> From_Date { get; set; }
        public Nullable<System.DateTime> To_Date { get; set; }
        public Nullable<int> Last_salary { get; set; }
        public string joining_Designation { get; set; }
        public string Last_Designation { get; set; }
        public string Reason_To_leave { get; set; }
        public Nullable<bool> IsRelevant { get; set; }
    }
}
