using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class GetMenuModel
    {
        public int NavigationMenuId { get; set; }
        public string NavigationMenuCode { get; set; }
        public string NavigationMenuName { get; set; }
        public int NavigationTypeId { get; set; }
        public int NavigationMenuParentId { get; set; }
        public string MenuURL { get; set; }
        public string IPAddress { get; set; }
        public string MACAddress { get; set; }
        public string RoleId { get; set; }
        public string RoleName { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedBy_ID { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> ModifiedBy_ID { get; set; }
        public Nullable<int> SchoolID { get; set; }
        public Nullable<int> GroupID { get; set; }
        public Nullable<bool> ISDeleted { get; set; }
        public string NavigationTypeName { get; set; }
    }
}
