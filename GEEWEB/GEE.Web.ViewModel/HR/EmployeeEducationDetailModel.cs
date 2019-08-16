using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.HR
{
   public class EmployeeEducationDetailModel
    {
        public int EmployeeEducationDetail_ID { get; set; }
        public Nullable<int> EmpCode { get; set; }
        public Nullable<int> Degree_ID { get; set; }
        public string Subjects { get; set; }
        public Nullable<System.DateTime> FromDate { get; set; }
        public Nullable<System.DateTime> ToDate { get; set; }
        public string InstituteName { get; set; }
        public string City { get; set; }
        public Nullable<int> EmpDegreeModeid { get; set; }
        public Nullable<int> Percent_Marks { get; set; }
        public string Division { get; set; }
        public string Remarks { get; set; }
    }
}
