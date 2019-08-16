using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel
{
    public abstract class BaseViewModel
    {
        public DateTime? CreatedDate { get; set; }
        public int CreatedBy_ID { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy_ID { get; set; }
        public int? SchoolID { get; set; }
        public int? GroupID { get; set; }
        public bool? ISDeleted { get; set; }
        public int? Sessionyear { get; set; }
        

    }
}
