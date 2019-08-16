using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Model.Admin;
namespace GEE.Business.Interface.Admin
{
    public interface INavigationMenu : IService<NavigationMenuModel>
    {
        List<NavigationMenuModel> GetMenuList(string userName, byte ActionID);
    }
}
