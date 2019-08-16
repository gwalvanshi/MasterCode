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
    public class SecGroupDetailManager : ISecGroupDetail
    {
        IMyDataAccess<SecGroupDetail> _db = new MyDataAccess<SecGroupDetail>();

        public void Delete(SecGroupDetailModel entity)
        {
            _db.Delete(entity.SecGroupDetailId);
        }

        public async Task DeleteAsync(SecGroupDetailModel entity)
        {
            await _db.DeleteAsync(entity.SecGroupDetailId);
        }

        public List<SecGroupDetailModel> GetAll()
        {
            try
            {
               

                var _local = _db.GetAll();
                List<SecGroupDetailModel> localList = new List<SecGroupDetailModel>();
                foreach (var item in _local)
                {
                    localList.Add(Mapper.Map<SecGroupDetailModel>(item));
                }
                return localList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<SecGroupDetailModel>> GetAllAsync()
        {
            var _local = await _db.GetAllAsync();
            List<SecGroupDetailModel> localList = new List<SecGroupDetailModel>();
            foreach (var item in _local)
            {
                localList.Add(Mapper.Map<SecGroupDetailModel>(item));

            }
            return localList;
        }

        public SecGroupDetailModel GetById(int id)
        {
            var _local = _db.GetById(id);
            return Mapper.Map<SecGroupDetailModel>(_local);
        }

        public async Task<SecGroupDetailModel> GetByIdAsync(int id)
        {
            return Mapper.Map<SecGroupDetailModel>(await _db.GetByIdAsync(id));
        }

        public SecGroupDetailModel Save(SecGroupDetailModel entity)
        {
            var _local = _db.Save(Mapper.Map<SecGroupDetail>(entity));
            return new SecGroupDetailModel { SecGroupDetailId = entity.SecGroupDetailId };
        }

        public async Task<SecGroupDetailModel> SaveAsync(SecGroupDetailModel entity)
        {
            var _local = await _db.SaveAsync(Mapper.Map<SecGroupDetail>(entity));
            return new SecGroupDetailModel { SecGroupDetailId = entity.SecGroupDetailId };
        }

        public SecGroupDetailModel Update(SecGroupDetailModel entity)
        {
            var _local = _db.Update(Mapper.Map<SecGroupDetail>(entity));
            return new SecGroupDetailModel { SecGroupDetailId = entity.SecGroupDetailId };
        }

        public async Task<SecGroupDetailModel> UpdateAsync(SecGroupDetailModel entity)
        {
            var _local = await _db.UpdateAsync(Mapper.Map<SecGroupDetail>(entity));
            return new SecGroupDetailModel { SecGroupDetailId = entity.SecGroupDetailId };
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
