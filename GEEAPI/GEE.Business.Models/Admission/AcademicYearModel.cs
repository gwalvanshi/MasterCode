using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class AcademicYearModel: BaseEntity
    {
        public int AcademicYear_ID { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public DateTime ? FromDate { get; set; }
        public DateTime ? ToDate { get; set; }
        public bool Active { get; set; }
        
    }
}
