using GEE.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Security
{
    public class PermissionParentModel:BaseEntity
    {
        public int NavigationMenuId { get; set; }       
        public string NavigationMenuName { get; set; }
        public int IsPermission { get; set; }
        public int Group_Id { get; set; }
        public PermissionParentModel PermissionParent { get; set; }        
        public List<PermissionMappingModel> PermissionChildModelList { get; set; }
    }
}
