using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
  public  class CustomDataResponseModel
    {
        public string type { get; set; }
        public string message { get; set; }
        public object data { get; set; }
    }
}
