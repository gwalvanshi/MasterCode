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

namespace GEE.Business.Manager.Admin
{
   public  class UserGroupNavigationMenuMappingManager : IUserGroupNavigationMenuMapping
    {
        IMyDataAccess<UserGroupNavigationMenuMapping> _db = new MyDataAccess<UserGroupNavigationMenuMapping>();

        public void Delete(UserGroupNavigationMenuMappingModel entity)
        {
            _db.Delete(entity.UserGroupNavigationMenuMappingId);
        }

        public async Task DeleteAsync(UserGroupNavigationMenuMappingModel entity)
        {
            await _db.DeleteAsync(entity.UserGroupNavigationMenuMappingId);
        }

        public List<UserGroupNavigationMenuMappingModel> GetAll()
        {
            try
            {
                var _local = _db.GetAll();
                List<UserGroupNavigationMenuMappingModel> localList = new List<UserGroupNavigationMenuMappingModel>();
                foreach (var item in _local)
                {
                    localList.Add(Mapper.Map<UserGroupNavigationMenuMappingModel>(item));
                }
                return localList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<UserGroupNavigationMenuMappingModel>> GetAllAsync()
        {
            var _local = await _db.GetAllAsync();
            List<UserGroupNavigationMenuMappingModel> localList = new List<UserGroupNavigationMenuMappingModel>();
            foreach (var item in _local)
            {
                localList.Add(Mapper.Map<UserGroupNavigationMenuMappingModel>(item));

            }
            return localList;
        }

        public UserGroupNavigationMenuMappingModel GetById(int id)
        {
            var _local = _db.GetById(id);
            return Mapper.Map<UserGroupNavigationMenuMappingModel>(_local);
        }

        public async Task<UserGroupNavigationMenuMappingModel> GetByIdAsync(int id)
        {
            return Mapper.Map<UserGroupNavigationMenuMappingModel>(await _db.GetByIdAsync(id));
        }

        public UserGroupNavigationMenuMappingModel Save(UserGroupNavigationMenuMappingModel entity)
        {
            var _local = _db.Save(Mapper.Map<UserGroupNavigationMenuMapping>(entity));
            return new UserGroupNavigationMenuMappingModel { UserGroupNavigationMenuMappingId = entity.UserGroupNavigationMenuMappingId };
        }

        public async Task<UserGroupNavigationMenuMappingModel> SaveAsync(UserGroupNavigationMenuMappingModel entity)
        {
            var _local = await _db.SaveAsync(Mapper.Map<UserGroupNavigationMenuMapping>(entity));
            return new UserGroupNavigationMenuMappingModel { UserGroupNavigationMenuMappingId = entity.UserGroupNavigationMenuMappingId };
        }

        public UserGroupNavigationMenuMappingModel Update(UserGroupNavigationMenuMappingModel entity)
        {
            var _local = _db.Update(Mapper.Map<UserGroupNavigationMenuMapping>(entity));
            return new UserGroupNavigationMenuMappingModel { UserGroupNavigationMenuMappingId = entity.UserGroupNavigationMenuMappingId };
        }

        public async Task<UserGroupNavigationMenuMappingModel> UpdateAsync(UserGroupNavigationMenuMappingModel entity)
        {
            var _local = await _db.UpdateAsync(Mapper.Map<UserGroupNavigationMenuMapping>(entity));
            return new UserGroupNavigationMenuMappingModel { UserGroupNavigationMenuMappingId = entity.UserGroupNavigationMenuMappingId };
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