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
   public  class NavigationTypeManager : INavigationType
    {
        IMyDataAccess<NavigationType> _db = new MyDataAccess<NavigationType>();

        public void Delete(NavigationTypeModel entity)
        {
            _db.Delete(entity.NavigationTypeId);
        }

        public async Task DeleteAsync(NavigationTypeModel entity)
        {
            await _db.DeleteAsync(entity.NavigationTypeId);
        }

        public List<NavigationTypeModel> GetAll()
        {
            try
            {
                var _local = _db.GetAll();
                List<NavigationTypeModel> localList = new List<NavigationTypeModel>();
                foreach (var item in _local)
                {
                    localList.Add(Mapper.Map<NavigationTypeModel>(item));
                }
                return localList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<NavigationTypeModel>> GetAllAsync()
        {
            var _local = await _db.GetAllAsync();
            List<NavigationTypeModel> localList = new List<NavigationTypeModel>();
            foreach (var item in _local)
            {
                localList.Add(Mapper.Map<NavigationTypeModel>(item));

            }
            return localList;
        }

        public NavigationTypeModel GetById(int id)
        {
            var _local = _db.GetById(id);
            return Mapper.Map<NavigationTypeModel>(_local);
        }

        public async Task<NavigationTypeModel> GetByIdAsync(int id)
        {
            return Mapper.Map<NavigationTypeModel>(await _db.GetByIdAsync(id));
        }

        public NavigationTypeModel Save(NavigationTypeModel entity)
        {
            var _local = _db.Save(Mapper.Map<NavigationType>(entity));
            return new NavigationTypeModel { NavigationTypeId = entity.NavigationTypeId };
        }

        public async Task<NavigationTypeModel> SaveAsync(NavigationTypeModel entity)
        {
            var _local = await _db.SaveAsync(Mapper.Map<NavigationType>(entity));
            return new NavigationTypeModel { NavigationTypeId = entity.NavigationTypeId };
        }

        public NavigationTypeModel Update(NavigationTypeModel entity)
        {
            var _local = _db.Update(Mapper.Map<NavigationType>(entity));
            return new NavigationTypeModel { NavigationTypeId = entity.NavigationTypeId };
        }

        public async Task<NavigationTypeModel> UpdateAsync(NavigationTypeModel entity)
        {
            var _local = await _db.UpdateAsync(Mapper.Map<NavigationType>(entity));
            return new NavigationTypeModel { NavigationTypeId = entity.NavigationTypeId };
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