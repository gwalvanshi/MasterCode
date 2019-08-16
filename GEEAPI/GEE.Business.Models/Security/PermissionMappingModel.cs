using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Security
{
   public class PermissionMappingModel
    {
       
        public string NavigationMenuName { get; set; }
        public int NavigationMenu_Id { get; set; }
        public int Permission_Id { get; set; }
        public int Navrolepermisisonmapping_ID { get; set; }
        public string Permission { get; set; }
        public int IsPermission { get; set; }
        
        
    }
 

   

    
}
