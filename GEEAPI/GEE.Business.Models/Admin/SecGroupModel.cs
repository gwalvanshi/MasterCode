using GEE.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Admin
{
    public class SecGroupModel : BaseEntity
    {
        public int SecGroupId { get; set; }
        public string SecGroupName { get; set; }
        
    }
}
