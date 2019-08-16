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
    public class SecGroupManager:  ISecGroup
    {
        IMyDataAccess<SecGroup> _db = new MyDataAccess<SecGroup>();

        public void Delete(SecGroupModel entity)
        {
            _db.Delete(entity.SecGroupId);
        }

        public async Task DeleteAsync(SecGroupModel entity)
        {
            await _db.DeleteAsync(entity.SecGroupId);
        }

        

        public List<SecGroupModel> GetAll()
        {
            try
            {
                // List<SecGroup> secGroupList = _db.GetAll();
                //// IList<Destination> ilistDest = Mapper.Map<Source[], IList<Destination>>(sources);
                // List<SecGroupModel> SecGroupModelList = Mapper.Map<SecGroup[], List<SecGroupModel>>(secGroupList);
                // //foreach (var item in secGroupList)
                // //{
                // //    SecGroupModelList.Add(Mapper.Map<SecGroupModel>(item));
                // //}

                var secGroupList = _db.GetAll();                
                List<SecGroupModel> SecGroupModelList = new List<SecGroupModel>();
                foreach (var item in secGroupList)
                {
                    SecGroupModelList.Add(Mapper.Map<SecGroupModel>(item));
                }
                return SecGroupModelList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<SecGroupModel>> GetAllAsync()
        {
            var SecGroupList = await _db.GetAllAsync();
            List<SecGroupModel> SecGroupModelList = new List<SecGroupModel>();
            foreach (var item in SecGroupList)
            {
                SecGroupModelList.Add(Mapper.Map<SecGroupModel>(item));

            }
            return SecGroupModelList;
        }

        public SecGroupModel GetById(int id)
        {
            var enquiry = _db.GetById(id);
            return Mapper.Map<SecGroupModel>(enquiry);
        }

        public async Task<SecGroupModel> GetByIdAsync(int id)
        {
            return Mapper.Map<SecGroupModel>(await _db.GetByIdAsync(id));
        }

        public SecGroupModel Save(SecGroupModel entity)
        {
            var secGroup = _db.Save(Mapper.Map<SecGroup>(entity));
            return new SecGroupModel { SecGroupId = entity.SecGroupId };
        }

        public async Task<SecGroupModel> SaveAsync(SecGroupModel entity)
        {
            var secGroup = await _db.SaveAsync(Mapper.Map<SecGroup>(entity));
            return new SecGroupModel { SecGroupId = entity.SecGroupId };
        }

        public SecGroupModel Update(SecGroupModel entity)
        {
            var secGroup = _db.Update(Mapper.Map<SecGroup>(entity));
            return new SecGroupModel { SecGroupId = entity.SecGroupId };
        }

        public async Task<SecGroupModel> UpdateAsync(SecGroupModel entity)
        {
            var secGroup = await _db.UpdateAsync(Mapper.Map<SecGroup>(entity));
            return new SecGroupModel { SecGroupId = entity.SecGroupId };
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
