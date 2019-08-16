using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using GEE.Business.Interface.Security;
using GEE.Business.Model.Admin;
using GEE.Business.Model.Security;
using GEE.DataAccess;

namespace GEE.Business.Manager.Security
{
    public class NavigationPermissionManager : INavigationPermission
    {
        /// <summary>
        /// this method is used to get menu permission from database according to user group and menu id
        /// Added by jiya 8 june 2019
        /// </summary>
        /// <param name="userGroupId"></param>
        /// <param name="menuId"></param>
        /// <returns></returns>
        public List<PermissionMappingModel> GeMenuPermission(int userGroupId, int menuId)
        {
            List<PermissionMappingModel> getNavigationPermissionModelList = new List<PermissionMappingModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var UId = new SqlParameter("@UserGroupID", userGroupId);
                    var MId = new SqlParameter("@NavigationId", menuId);

                    getNavigationPermissionModelList = context.Database.SqlQuery<PermissionMappingModel>("MenuPermission @UserGroupID, @NavigationId", UId, MId).ToList();
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return getNavigationPermissionModelList;
        }
        /// <summary>
        /// This method is used to check in case module permission is exists or not
        /// </summary>
        /// <param name="userGroupId"></param>
        /// <param name="menuId"></param>
        /// <returns></returns>

        public List<PermissionParentModel> GetModuleList(int userGroupId, int menuId)
        {
            List<PermissionParentModel> getNavigationPermissionModelList = new List<PermissionParentModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var UId = new SqlParameter("@UserGroupID", userGroupId);
                    var MId = new SqlParameter("@NavigationId", menuId);

                    getNavigationPermissionModelList = context.Database.SqlQuery<PermissionParentModel>("CheckMenuPermissionForModule @UserGroupID, @NavigationId", UId, MId).ToList();
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return getNavigationPermissionModelList;
        }

        /// <summary>
        /// This method is used for get user permission to user.
        /// </summary>
        /// <param name="userID"></param>
        /// <param name="menuId"></param>
        /// <returns></returns>
        public List<NavigationPermissionModel> GetNavigationPermission(int userGroupId, int menuId)
        {
            List<NavigationPermissionModel> getNavigationPermissionModelList = new List<NavigationPermissionModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var UId = new SqlParameter("@UserGroupID", userGroupId);
                    var MId = new SqlParameter("@NavigationId", menuId);

                    getNavigationPermissionModelList = context.Database.SqlQuery<NavigationPermissionModel>("GetNavigationPermission @UserGroupID, @NavigationId", UId, MId).ToList();
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return getNavigationPermissionModelList;
        }
        public List<PermissionParentModel> GetMenu(int moduleId, int userGroupId)
        {
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var navMenuList = objGEEDbContext.NavigationMenu1.Where(a => a.NavigationMenuParentId == moduleId & a.NaviVisible == true);
            List<PermissionParentModel> listGetMenuModel = new List<PermissionParentModel>();
            List<PermissionMappingModel> listPermissionMappingModel = new List<PermissionMappingModel>();
            foreach (var item in navMenuList)
            {
                PermissionParentModel objPermissionParentModel = new PermissionParentModel();
                objPermissionParentModel.NavigationMenuId = item.NavigationMenuId;
                objPermissionParentModel.NavigationMenuName = item.NavigationMenuName;
                objPermissionParentModel.PermissionChildModelList = GeMenuPermission(userGroupId, item.NavigationMenuId);

                var navSecondMenuList = objGEEDbContext.NavigationMenu1.Where(a => a.NavigationMenuParentId == item.NavigationMenuId & a.NaviVisible == true);

                foreach (var item1 in navSecondMenuList)
                {
                    PermissionParentModel objPermissionParentModelSeondLevel = new PermissionParentModel();
                    objPermissionParentModelSeondLevel.NavigationMenuId = item1.NavigationMenuId;
                    objPermissionParentModelSeondLevel.NavigationMenuName = item1.NavigationMenuName;
                    objPermissionParentModelSeondLevel.PermissionChildModelList = GeMenuPermission(userGroupId, item1.NavigationMenuId);
                    objPermissionParentModel.PermissionParent = objPermissionParentModelSeondLevel;
                }

                listGetMenuModel.Add(objPermissionParentModel);

            }
            return listGetMenuModel;
        }
        /// <summary>
        /// This method is used to save the data for user group permission.
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int Save(PermissionParentModel entity)
        {
            int isSave = 0;
            GEEDbContext objGEEDbContext = new GEEDbContext();

            int menuid = 0;
            foreach (var item in entity.PermissionChildModelList)
            {
                Navmenu_asprole_permisison_UserGroup_mapping objPermission = new Navmenu_asprole_permisison_UserGroup_mapping();
                var _pMapping = objGEEDbContext.Navmenu_asprole_permisison_UserGroup_mapping.Where(a => a.Navrolepermisisonmapping_ID == item.Navrolepermisisonmapping_ID && a.UserGroup_ID == entity.Group_Id).SingleOrDefault();
                if (_pMapping != null)
                {
                    bool isPermisssion = item.IsPermission == 1 ? false : true;
                    if (_pMapping.ISDeleted != isPermisssion)
                    {
                        _pMapping.ISDeleted = item.IsPermission == 1 ? false : true;
                        _pMapping.AcitiveEdit = true;//This flag is for user role maaping procedure.
                        _pMapping.ModifiedBy_ID = entity.CreatedBy_ID;
                        entity.ModifiedDate = DateTime.Now;
                        objGEEDbContext.Entry(_pMapping).State = System.Data.Entity.EntityState.Modified;
                        isSave = objGEEDbContext.SaveChanges();
                    }

                }
                else
                {

                    objPermission.Navrolepermisisonmapping_ID = item.Navrolepermisisonmapping_ID;
                    objPermission.SchoolID = entity.SchoolID;
                    objPermission.CreatedDate = DateTime.Now;
                    objPermission.ISDeleted = item.IsPermission == 1 ? false : true;
                    objPermission.UserGroup_ID = entity.Group_Id;
                    objPermission.CreatedBy_ID = entity.CreatedBy_ID;
                    objPermission.AcitiveEdit = true;//This flag is for user role maaping procedure.
                    objGEEDbContext.Navmenu_asprole_permisison_UserGroup_mapping.Add(objPermission);
                    isSave = objGEEDbContext.SaveChanges();

                }
                if (menuid != item.NavigationMenu_Id)
                {
                    menuid = item.NavigationMenu_Id;
                    var data = entity.PermissionChildModelList.Where(a => a.NavigationMenu_Id == menuid & a.IsPermission == 1).ToList();
                    UserGroupNavigationMenuMapping objUserGroupNavigationMenuMapping = new UserGroupNavigationMenuMapping();
                    var checkDataExists = objGEEDbContext.UserGroupNavigationMenuMappings.Where(a => a.NavigationMenuId == menuid && a.UserGroupId == entity.Group_Id).SingleOrDefault();

                    if (checkDataExists != null)
                    {
                        checkDataExists.UserGroupId = entity.Group_Id;
                        checkDataExists.NavigationMenuId = menuid;
                        checkDataExists.SchoolID = entity.SchoolID;
                        checkDataExists.GroupID = entity.GroupID;
                        if (data.Count > 0)
                        {
                            checkDataExists.ISDeleted = false;
                        }
                        else
                        {
                            checkDataExists.ISDeleted = true;
                        }

                        checkDataExists.ModifiedBy_ID = entity.CreatedBy_ID;
                        checkDataExists.ModifiedDate = DateTime.Now;
                        objGEEDbContext.Entry(checkDataExists).State = System.Data.Entity.EntityState.Modified;
                        isSave = objGEEDbContext.SaveChanges();
                    }
                    else
                    {
                        if (data.Count > 0)
                        {
                            objUserGroupNavigationMenuMapping.UserGroupId = entity.Group_Id;
                            objUserGroupNavigationMenuMapping.NavigationMenuId = menuid;
                            objUserGroupNavigationMenuMapping.SchoolID = entity.SchoolID;
                            objUserGroupNavigationMenuMapping.GroupID = entity.GroupID;
                            objUserGroupNavigationMenuMapping.CreatedBy_ID = entity.CreatedBy_ID;
                            objUserGroupNavigationMenuMapping.CreatedDate = DateTime.Now;
                            objGEEDbContext.UserGroupNavigationMenuMappings.Add(objUserGroupNavigationMenuMapping);
                            isSave = objGEEDbContext.SaveChanges();
                        }
                    }
                }

            }
            using (GEEDbContext context = new GEEDbContext())
            {
                byte ActionID = 1;
                var UId = new SqlParameter("@CUserId", entity.CreatedBy_ID);
                var MId = new SqlParameter("@Action", ActionID);
                context.Database.ExecuteSqlCommand("RoleMappingToAspNetUserRole @CUserId, @Action", UId, MId);
            }


            return isSave;
        }
    }
}
