using AutoMapper;
using GEE.Business.Interface.Configuration;
using GEE.Business.Model.Configuration;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Manager.Configuration
{
    public class IndexScreenDetailManager : IIndexScreenDetail
    {
        IMyDataAccess<IndexScreenDetail> _IndexScreenDetailDataAccess = new MyDataAccess<IndexScreenDetail>();
        public void Delete(IndexScreenDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(IndexScreenDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public List<IndexScreenDetailModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task<List<IndexScreenDetailModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public IndexScreenDetailModel GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IndexScreenDetailModel> GetByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public IndexScreenDetailModel Save(IndexScreenDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<IndexScreenDetailModel> SaveAsync(IndexScreenDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public IndexScreenDetailModel Update(IndexScreenDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<IndexScreenDetailModel> UpdateAsync(IndexScreenDetailModel entity)
        {
            throw new NotImplementedException();
        }

        #region IDisposable Support
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

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        // ~IndexScreenDetailManager() {
        //   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //   Dispose(false);
        // }

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }
       
        public List<IndexScreenDetailModel> GetAllIncludeSearch(int menuId)
        {
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var IndexScreenDetailDataAccessList = objGEEDbContext.IndexScreenDetails.Where(a => a.Nav_menu_ID == menuId).OrderBy(a=>a.Sequence);
            List<IndexScreenDetailModel> IndexScreenDetailModelList = new List<IndexScreenDetailModel>();
            foreach (var item in IndexScreenDetailDataAccessList)
            {
                IndexScreenDetailModelList.Add(Mapper.Map<IndexScreenDetailModel>(item));
            }
            return IndexScreenDetailModelList;
           
        }

        public async Task<List<IndexScreenDetailModel>> GetAllIncludeSearchAsync(int menuId)
        {
            var IndexScreenDetailDataAccessList = await _IndexScreenDetailDataAccess.GetAllAsync(a => a.Nav_menu_ID == menuId);
            List<IndexScreenDetailModel> IndexScreenDetailModelList = new List<IndexScreenDetailModel>();
            foreach (var item in IndexScreenDetailDataAccessList)
            {
                IndexScreenDetailModelList.Add(Mapper.Map<IndexScreenDetailModel>(item));
            }
            return IndexScreenDetailModelList;
        }
        #endregion
    }
}
