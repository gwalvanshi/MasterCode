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
   public  class UserGroupAspUserMappingManager : IUserGroupAspUserMapping
    {
        IMyDataAccess<UserGroupAspUserMapping> _db = new MyDataAccess<UserGroupAspUserMapping>();

        public void Delete(UserGroupAspUserMappingModel entity)
        {
            _db.Delete(entity.UserGroupAspUserMappingId);
        }

        public async Task DeleteAsync(UserGroupAspUserMappingModel entity)
        {
            await _db.DeleteAsync(entity.UserGroupAspUserMappingId);
        }

        public List<UserGroupAspUserMappingModel> GetAll()
        {
            try
            {
                var _local = _db.GetAll();
                List<UserGroupAspUserMappingModel> localList = new List<UserGroupAspUserMappingModel>();
                foreach (var item in _local)
                {
                    localList.Add(Mapper.Map<UserGroupAspUserMappingModel>(item));
                }
                return localList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<UserGroupAspUserMappingModel>> GetAllAsync()
        {
            var _local = await _db.GetAllAsync();
            List<UserGroupAspUserMappingModel> localList = new List<UserGroupAspUserMappingModel>();
            foreach (var item in _local)
            {
                localList.Add(Mapper.Map<UserGroupAspUserMappingModel>(item));

            }
            return localList;
        }

        public UserGroupAspUserMappingModel GetById(int id)
        {
            var _local = _db.GetById(id);
            return Mapper.Map<UserGroupAspUserMappingModel>(_local);
        }

        public async Task<UserGroupAspUserMappingModel> GetByIdAsync(int id)
        {
            return Mapper.Map<UserGroupAspUserMappingModel>(await _db.GetByIdAsync(id));
        }

        public UserGroupAspUserMappingModel Save(UserGroupAspUserMappingModel entity)
        {
            var _local = _db.Save(Mapper.Map<UserGroupAspUserMapping>(entity));
            return new UserGroupAspUserMappingModel { UserGroupAspUserMappingId = entity.UserGroupAspUserMappingId };
        }

        public async Task<UserGroupAspUserMappingModel> SaveAsync(UserGroupAspUserMappingModel entity)
        {
            var _local = await _db.SaveAsync(Mapper.Map<UserGroupAspUserMapping>(entity));
            return new UserGroupAspUserMappingModel { UserGroupAspUserMappingId = entity.UserGroupAspUserMappingId };
        }

        public UserGroupAspUserMappingModel Update(UserGroupAspUserMappingModel entity)
        {
            var _local = _db.Update(Mapper.Map<UserGroupAspUserMapping>(entity));
            return new UserGroupAspUserMappingModel { UserGroupAspUserMappingId = entity.UserGroupAspUserMappingId };
        }

        public async Task<UserGroupAspUserMappingModel> UpdateAsync(UserGroupAspUserMappingModel entity)
        {
            var _local = await _db.UpdateAsync(Mapper.Map<UserGroupAspUserMapping>(entity));
            return new UserGroupAspUserMappingModel { UserGroupAspUserMappingId = entity.UserGroupAspUserMappingId };
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