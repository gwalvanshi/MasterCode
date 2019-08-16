using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Configuration
{
   public class NumberGenSchemeModel
    {
        public int NumberGenScheme_id { get; set; }
        public int? NumGenForm_ID { get; set; }
        public string Prefix { get; set; }
        public string Postfix { get; set; }
        public string DateDisplayformat { get; set; }
        public int? NumberStart { get; set; }
        public string Delimeter { get; set; }
        public int? IncludeDate { get; set; }
        public string Sequece { get; set; }
    }
}
