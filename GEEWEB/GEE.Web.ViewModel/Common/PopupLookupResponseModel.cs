using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.PopupLookup
{
   public class PopupLookupResponseModel
    {
        public  int TotalRecord { get; set; }
        public string  JsonResponse { get; set; }
        public string StrColumnList { get; set; }
        public DataTable DataList { get; set; }
    }
}
