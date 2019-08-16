using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Model.Admin;
using GEE.Business.Model.Security;
namespace GEE.Business.Interface.Security
{
    public interface INavigationPermission
    {
        List<NavigationPermissionModel> GetNavigationPermission(int userGroupId, int menuId);       
        List<PermissionParentModel> GetModuleList(int userGroupId, int menuId);      
        int Save(PermissionParentModel entity);
        List<PermissionMappingModel> GeMenuPermission(int userGroupId, int menuId);
        List<PermissionParentModel> GetMenu(int moduleId, int userGroupId);
    }
}
