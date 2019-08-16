using GEE.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Admin
{
    public class SecGroupDetailModel : BaseEntity
    {
        public int SecGroupDetailId { get; set; }
        public string SecGroupDetailName { get; set; }
        public int SecGroupId { get; set; }
    }
}
