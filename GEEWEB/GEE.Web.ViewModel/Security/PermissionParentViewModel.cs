using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Security
{
   public class PermissionParentViewModel : BaseViewModel
    {
        public int NavigationMenuId { get; set; }
        public string NavigationMenuName { get; set; }
        public int IsPermission { get; set; }
        public int Group_Id { get; set; }
        public PermissionParentViewModel PermissionParent { get; set; }
        public List<PermissionMappingViewModel> PermissionChildModelList { get; set; }
    }
}
