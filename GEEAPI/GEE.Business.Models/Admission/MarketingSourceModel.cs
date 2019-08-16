using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;

namespace GEE.Business.Models.Admission
{
    public class MarketingSourceModel : BaseEntity
    {
        public int MarketingSource_ID { get; set; }
        public string MarketingCode { get; set; }
        public string MarketingDetails { get; set; }
       
    }
}


