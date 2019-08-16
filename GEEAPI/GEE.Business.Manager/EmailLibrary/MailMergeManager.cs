using AutoMapper;
using GEE.Business.Interface.EmailLibrary;
using GEE.Business.Models.EmailLibrary;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GEE.Business.Manager.EmailLibrary
{
  public  class MailMergeManager:IMailMerge
    {
        IMyDataAccess<MailMerge> _mailMerge = new MyDataAccess<MailMerge>();

        public void Delete(MailMergeModel entity)
        {
            _mailMerge.Delete(entity.MergeId);
        }

        public async Task DeleteAsync(MailMergeModel entity)
        {
           await  _mailMerge.DeleteAsync(entity.MergeId);
        }

        public List<MailMergeModel> GetAll()
        {
            var mailMergeList = _mailMerge.GetAll();
            List<MailMergeModel> mailMergeModelList = new List<MailMergeModel>();
            foreach (var item in mailMergeList)
            {
                mailMergeModelList.Add(Mapper.Map<MailMergeModel>(item));

            }
            return mailMergeModelList;
        }

        public async Task<List<MailMergeModel>> GetAllAsync()
        {
            var mailMergeList = await _mailMerge.GetAllAsync();
            List<MailMergeModel> mailMergeModelList = new List<MailMergeModel>();
            foreach (var item in mailMergeList)
            {
                mailMergeModelList.Add(Mapper.Map<MailMergeModel>(item));

            }
            return mailMergeModelList;
        }

        public MailMergeModel GetById(int id)
        {
            return Mapper.Map<MailMergeModel>(_mailMerge.GetById(id));
        }

        public async Task<MailMergeModel> GetByIdAsync(int id)
        {
            return  Mapper.Map<MailMergeModel>(await _mailMerge.GetByIdAsync(id));
        }

        public MailMergeModel Save(MailMergeModel entity)
        {
            var mailMerge = _mailMerge.Save(Mapper.Map<MailMerge>(entity));
            return new MailMergeModel { MergeId = mailMerge.MergeId };
        }

        public async Task<MailMergeModel> SaveAsync(MailMergeModel entity)
        {
            var mailMerge =  await _mailMerge.SaveAsync(Mapper.Map<MailMerge>(entity));
            return new MailMergeModel { MergeId = mailMerge.MergeId };
        }

        public MailMergeModel Update(MailMergeModel entity)
        {
            var mailMerge = _mailMerge.Update(Mapper.Map<MailMerge>(entity));
            return new MailMergeModel { MergeId = mailMerge.MergeId };
        }

        public async Task<MailMergeModel> UpdateAsync(MailMergeModel entity)
        {
            var mailMerge = await _mailMerge.UpdateAsync(Mapper.Map<MailMerge>(entity));
            return new MailMergeModel { MergeId = mailMerge.MergeId };
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
        // ~MailMergeManager() {
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
        #endregion
    }
}
