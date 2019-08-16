using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class NavigationMenuModel:BaseEntity
    {
        public int NavigationMenuId { get; set; }
        public string NavigationMenuCode { get; set; }
        public string NavigationMenuName { get; set; }
        public int NavigationTypeId { get; set; }
        public int NavigationMenuParentId { get; set; }
        public string MenuURL { get; set; }
        public Nullable<bool> NaviVisible { get; set; }
        public string IconClass { get; set; }
        public string Resxkey { get; set; }
        public string IPAddress { get; set; }
        public string MACAddress { get; set; }
        public string RoleId { get; set; }
        public string RoleName { get; set; }
        public string PermisionName { get; set; }
        public Nullable<int> MenuGroupId { get; set; }
       
       
        


    }
}
