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
    public class UserGroupManager : IUserGroup
    {
        IMyDataAccess<UserGroup> _db = new MyDataAccess<UserGroup>();

        public void Delete(UserGroupModel entity)
        {
            _db.Delete(entity.UserGroupId);
        }

        public async Task DeleteAsync(UserGroupModel entity)
        {
            await _db.DeleteAsync(entity.UserGroupId);
        }

        public List<UserGroupModel> GetAll()
        {
            try
            {
                var _local = _db.GetAll();
                List<UserGroupModel> localList = new List<UserGroupModel>();
                foreach (var item in _local)
                {
                    localList.Add(Mapper.Map<UserGroupModel>(item));
                }
                return localList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<UserGroupModel>> GetAllAsync()
        {
            var _local = await _db.GetAllAsync();
            List<UserGroupModel> localList = new List<UserGroupModel>();
            foreach (var item in _local)
            {
                localList.Add(Mapper.Map<UserGroupModel>(item));

            }
            return localList;
        }

        public UserGroupModel GetById(int id)
        {
            var _local = _db.GetById(id);
            return Mapper.Map<UserGroupModel>(_local);
        }

        public async Task<UserGroupModel> GetByIdAsync(int id)
        {
            return Mapper.Map<UserGroupModel>(await _db.GetByIdAsync(id));
        }

        public UserGroupModel Save(UserGroupModel entity)
        {
            var _local = _db.Save(Mapper.Map<UserGroup>(entity));
            return new UserGroupModel { UserGroupId = entity.UserGroupId };
        }

        public async Task<UserGroupModel> SaveAsync(UserGroupModel entity)
        {
            var _local = await _db.SaveAsync(Mapper.Map<UserGroup>(entity));
            return new UserGroupModel { UserGroupId = entity.UserGroupId };
        }

        public UserGroupModel Update(UserGroupModel entity)
        {
            var _local = _db.Update(Mapper.Map<UserGroup>(entity));
            return new UserGroupModel { UserGroupId = entity.UserGroupId };
        }

        public async Task<UserGroupModel> UpdateAsync(UserGroupModel entity)
        {
            var _local = await _db.UpdateAsync(Mapper.Map<UserGroup>(entity));
            return new UserGroupModel { UserGroupId = entity.UserGroupId };
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