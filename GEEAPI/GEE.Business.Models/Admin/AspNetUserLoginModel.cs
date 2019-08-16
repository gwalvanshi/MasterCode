using GEE.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Admin
{
   public class AspNetUserLoginModel : BaseEntity
    {
        public string LoginProvider { get; set; }
        public string ProviderKey { get; set; }
        public string UserId { get; set; }
       
       

        public virtual AspNetUserModel AspNetUser { get; set; }
    }
}
