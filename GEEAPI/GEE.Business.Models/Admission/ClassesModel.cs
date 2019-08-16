using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
  public  class ClassesModel : BaseEntity
    {
        public int Class_ID { get; set; }
        public string ClassCode { get; set; }
        public int ? ClassSeq { get; set; }
        public string ClassName { get; set; }
        public int ? TotalSections { get; set; }
        public string SectionsSequence { get; set; }
       
    }
}
