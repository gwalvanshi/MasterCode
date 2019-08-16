using GEE.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Transport
{
   public class StopMasterModel:BaseEntity
    {
        public int StopMasterID { get; set; }
        public string StopCode { get; set; }
        public string StopName { get; set; }
        public string Locality { get; set; }
        public string StopAddress { get; set; }
        public string PinCode { get; set; }
        public string GeoCoordinates { get; set; }

        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }

    }
}
