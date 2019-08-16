using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class UserGroupNavigationMenuMappingModel:BaseEntity
    {
        public int UserGroupNavigationMenuMappingId { get; set; }
        public int UserGroupId { get; set; }
        public int NavigationMenuId { get; set; }
       
      
    }
}
