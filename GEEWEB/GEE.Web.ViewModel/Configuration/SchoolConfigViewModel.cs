using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Configuration
{
   public class SchoolConfigViewModel
    {
        public int SchoolConfig_id { get; set; }
        public int? Navigationmenu_id { get; set; }
        public string tablecolumn { get; set; }
        public string configKey { get; set; }
        public string configvalue { get; set; }
        public string Remark { get; set; }
        public bool ISDeleted { get; set; }
    }
}
