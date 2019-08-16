using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.PopupLookup
{
   public class PopupLookupRequestModel
    {
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string  SortColumn { get; set; }
        public string SortOrder { get; set; }
        public string SearchValue { get; set; }
        public int LookType { get; set; }
        
    }
}
