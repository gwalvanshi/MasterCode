using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.Security
{
   public class NavigationPermissionModel
    {
        public int  NavigationMenu_Id { get; set; }
        public string RoleName { get; set; }

        public string RoleId { get; set; }

        public string Permission { get; set; }
    }
}
