using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Common
{
   public class MenuViewModel:BaseViewModel
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
             
        public string NavigationTypeName { get; set; }
    }

    public class MenusCTE6
    {
        public string Name { get; set; }
        public string menuurl { get; set; }
        public int MenuID { get; set; }
        public string MenuCode { get; set; }
    }

    public class MenusCTE5
    {
        public string Name { get; set; }
        public string menuurl { get; set; }
        public int MenuID { get; set; }
        public string MenuCode { get; set; }
        public List<MenusCTE6> Menus_CTE6 { get; set; }
    }

    public class MenusCTE4
    {
        public string Name { get; set; }
        public string menuurl { get; set; }
        public int MenuID { get; set; }
        public string MenuCode { get; set; }
        public List<MenusCTE5> Menus_CTE5 { get; set; }
    }

    public class MenusCTE3
    {
        public string Name { get; set; }
        public string menuurl { get; set; }
        public int MenuID { get; set; }
        public string MenuCode { get; set; }
        public List<MenusCTE4> Menus_CTE4 { get; set; }
    }

    public class MenusCTE2
    {
        public string Name { get; set; }
        public int MenuID { get; set; }
        public string MenuCode { get; set; }
        public List<MenusCTE3> Menus_CTE3 { get; set; }
        public string menuurl { get; set; }
    }

    public class RootObject
    {
        public string Name { get; set; }
        public int MenuID { get; set; }
        public string MenuCode { get; set; }
        public List<MenusCTE2> Menus_CTE2 { get; set; }
    }
}
