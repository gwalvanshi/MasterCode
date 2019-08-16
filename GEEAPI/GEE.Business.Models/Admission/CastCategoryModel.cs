using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class CastCategoryModel :BaseEntity
    {
        public int CastCategory_ID { get; set; }
        public string CategoryCode { get; set; }
        public string CategoryDetail { get; set; }
       
    }
}
