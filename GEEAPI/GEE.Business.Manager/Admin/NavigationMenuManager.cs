using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.DataAccess;
using GEE.Business.Interface.Admin;
using GEE.Business.Model.Admin;
using AutoMapper;
using GEE.Business.Interface;
using System.Data.SqlClient;

namespace GEE.Business.Manager.Admin
{
    public class NavigationMenuManager : INavigationMenu
    {
        IMyDataAccess<NavigationMenu> _db = new MyDataAccess<NavigationMenu>();

        public List<NavigationMenuModel> GetMenuList(string userName, byte ActionID)
        {
            //GEEDbContext objGEEDbContext = new GEEDbContext();
            //var navMenuList = objGEEDbContext.NavigationMenu1.Where(a => a.NaviVisible == true);
            //List<NavigationMenuModel> listGetMenuModel = new List<NavigationMenuModel>();

            //using (GEEDbContext context = new GEEDbContext())
            //{
            //    var Param1 = new SqlParameter("@userName", userName);
            //    var Param2 = new SqlParameter("@ActionID", ActionID);
            //    listGetMenuModel = context.Database.SqlQuery<NavigationMenuModel>("GetMenu @userName, @ActionID", Param1, Param2).ToList();

            //}

            //return listGetMenuModel;
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var navMenuList = objGEEDbContext.NavigationMenu1.Where(a => a.NaviVisible == true);
            List<NavigationMenuModel> listGetMenuModel = new List<NavigationMenuModel>();
            foreach (var item in navMenuList)
            {
                listGetMenuModel.Add(Mapper.Map<NavigationMenuModel>(item));
            }
            return listGetMenuModel;
        }
        public void Delete(NavigationMenuModel entity)
        {
            _db.Delete(entity.NavigationMenuId);
        }

        public async Task DeleteAsync(NavigationMenuModel entity)
        {
            await _db.DeleteAsync(entity.NavigationMenuId);
        }

        public List<NavigationMenuModel> GetAll()
        {
            try
            {
                var _local = _db.GetAll();
                List<NavigationMenuModel> localList = new List<NavigationMenuModel>();
                foreach (var item in _local)
                {
                    localList.Add(Mapper.Map<NavigationMenuModel>(item));
                }
                return localList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<NavigationMenuModel>> GetAllAsync()
        {
            var _local = await _db.GetAllAsync();
            List<NavigationMenuModel> localList = new List<NavigationMenuModel>();
            foreach (var item in _local)
            {
                localList.Add(Mapper.Map<NavigationMenuModel>(item));

            }
            return localList;
        }

        public NavigationMenuModel GetById(int id)
        {
            var _local = _db.GetById(id);
            return Mapper.Map<NavigationMenuModel>(_local);
        }

        public async Task<NavigationMenuModel> GetByIdAsync(int id)
        {
            return Mapper.Map<NavigationMenuModel>(await _db.GetByIdAsync(id));
        }

        public NavigationMenuModel Save(NavigationMenuModel entity)
        {
            var _local = _db.Save(Mapper.Map<NavigationMenu>(entity));
            return new NavigationMenuModel { NavigationMenuId = entity.NavigationMenuId };
        }

        public async Task<NavigationMenuModel> SaveAsync(NavigationMenuModel entity)
        {
            var _local = await _db.SaveAsync(Mapper.Map<NavigationMenu>(entity));
            return new NavigationMenuModel { NavigationMenuId = entity.NavigationMenuId };
        }

        public NavigationMenuModel Update(NavigationMenuModel entity)
        {
            var _local = _db.Update(Mapper.Map<NavigationMenu>(entity));
            return new NavigationMenuModel { NavigationMenuId = entity.NavigationMenuId };
        }

        public async Task<NavigationMenuModel> UpdateAsync(NavigationMenuModel entity)
        {
            var _local = await _db.UpdateAsync(Mapper.Map<NavigationMenu>(entity));
            return new NavigationMenuModel { NavigationMenuId = entity.NavigationMenuId };
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.

                disposedValue = true;
            }
        }
        public void Dispose()
        {
            Dispose(true);
        }
    }
}