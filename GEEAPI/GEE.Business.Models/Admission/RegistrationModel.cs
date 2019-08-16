using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class RegistrationModel:BaseEntity
    {
        public int Registration_ID { get; set; }
        public int ? Enquiry_ID { get; set; }
        public string RegistrationNo { get; set; }
       
    }
}
