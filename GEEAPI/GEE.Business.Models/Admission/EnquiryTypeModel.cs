using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class EnquiryTypeModel : BaseEntity
    {
        public int EnquiryType_ID { get; set; }
        public string EnquiryCode { get; set; }
        public string EnquiryName { get; set; }
       
    }
}
