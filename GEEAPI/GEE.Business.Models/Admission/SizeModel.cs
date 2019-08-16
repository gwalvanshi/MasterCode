using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class SizeModel
    {
        public int SizeID { get; set; }
        public string SizeName { get; set; }
        public string SizeDescription { get; set; }
        public int ? UnitID { get; set; }
        public bool IsActive { get; set; }
        public DateTime ? CreatedOn { get; set; }
        public DateTime ? UpdatedOn { get; set; }
        public int ? CreatedBy { get; set; }
        public int ? UpdatedBy { get; set; }
        public  UnitModel UnitModel { get; set; }
    }
}
