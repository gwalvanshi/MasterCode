using AutoMapper;
using GEE.Business.Interface.EmailLibrary;
using GEE.Business.Models.EmailLibrary;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GEE.Business.Manager.EmailLibrary
{
  public  class EmailLogManager:IEmailLog
    {
        IMyDataAccess<EmailLog> _emailLog = new MyDataAccess<EmailLog>();

        public void Delete(EmailLogModel entity)
        {
            _emailLog.Delete(entity.LogId);
        }

        public async Task DeleteAsync(EmailLogModel entity)
        {
           await  _emailLog.DeleteAsync(entity.LogId);
        }

        public List<EmailLogModel> GetAll()
        {
            var logList = _emailLog.GetAll();
            List<EmailLogModel> logModelList = new List<EmailLogModel>();
            foreach (var item in logList)
            {
                logModelList.Add(Mapper.Map<EmailLogModel>(item));

            }
            return logModelList;
        }

        public async Task<List<EmailLogModel>> GetAllAsync()
        {
            var logList = await _emailLog.GetAllAsync();
            List<EmailLogModel> logModelList = new List<EmailLogModel>();
            foreach (var item in logList)
            {
                logModelList.Add(Mapper.Map<EmailLogModel>(item));

            }
            return logModelList;
        }

        public EmailLogModel GetById(int id)
        {
            return Mapper.Map<EmailLogModel>(_emailLog.GetById(id));
        }

        public async Task<EmailLogModel> GetByIdAsync(int id)
        {
            return Mapper.Map<EmailLogModel>(await _emailLog.GetByIdAsync(id));
        }

        public EmailLogModel Save(EmailLogModel entity)
        {
            var emailLog = _emailLog.Save(Mapper.Map<EmailLog>(entity));
            return new EmailLogModel { LogId = emailLog.LogId };
        }

        public async Task<EmailLogModel> SaveAsync(EmailLogModel entity)
        {
            var emailLog = await _emailLog.SaveAsync(Mapper.Map<EmailLog>(entity));
            return new EmailLogModel { LogId = emailLog.LogId };
        }

        public EmailLogModel Update(EmailLogModel entity)
        {
            var emailLog = _emailLog.Update(Mapper.Map<EmailLog>(entity));
            return new EmailLogModel { LogId = emailLog.LogId };
        }

        public async Task<EmailLogModel> UpdateAsync(EmailLogModel entity)
        {
            var emailLog = await _emailLog.UpdateAsync(Mapper.Map<EmailLog>(entity));
            return new EmailLogModel { LogId = emailLog.LogId };
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
        // ~EmailLogManager() {
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
