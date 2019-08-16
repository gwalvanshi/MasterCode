using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class QualificatonModel : BaseEntity
    {
        public int Qualificaton_ID { get; set; }
        public string QualificationCode { get; set; }
        public string QualificationDetail { get; set; }
       

    }
}
