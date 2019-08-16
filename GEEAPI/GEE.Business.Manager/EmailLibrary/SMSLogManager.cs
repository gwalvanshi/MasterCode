using AutoMapper;
using GEE.Business.Interface.EmailLibrary;
using GEE.Business.Models.EmailLibrary;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GEE.Business.Manager.EmailLibrary
{
  public  class SMSLogManager:ISMSLog
    {
        IMyDataAccess<SMSLog> _sMSLog = new MyDataAccess<SMSLog>();

        public void Delete(SMSLogModel entity)
        {
            _sMSLog.Delete(entity.SmsLogId);
        }

        public async Task DeleteAsync(SMSLogModel entity)
        {
           await _sMSLog.DeleteAsync(entity.SmsLogId);
        }

        public List<SMSLogModel> GetAll()
        {
            var smsLog = _sMSLog.GetAll();
            List<SMSLogModel> smsLogModelList = new List<SMSLogModel>();
            foreach (var item in smsLog)
            {
                smsLogModelList.Add(Mapper.Map<SMSLogModel>(item));

            }
            return smsLogModelList;
        }

        public async Task<List<SMSLogModel>> GetAllAsync()
        {
            var smsLog = await _sMSLog.GetAllAsync();
            List<SMSLogModel> smsLogModelList = new List<SMSLogModel>();
            foreach (var item in smsLog)
            {
                smsLogModelList.Add(Mapper.Map<SMSLogModel>(item));

            }
            return smsLogModelList;
        }

        public SMSLogModel GetById(int id)
        {
            return Mapper.Map<SMSLogModel>(_sMSLog.GetById(id));
        }

        public async Task<SMSLogModel> GetByIdAsync(int id)
        {
            return Mapper.Map<SMSLogModel>( await _sMSLog.GetByIdAsync(id));
        }

        public SMSLogModel Save(SMSLogModel entity)
        {
            var smsLog = _sMSLog.Save(Mapper.Map<SMSLog>(entity));
            return new SMSLogModel { SmsLogId = smsLog.SmsLogId };
        }

        public async Task<SMSLogModel> SaveAsync(SMSLogModel entity)
        {
            var smsLog = await _sMSLog.SaveAsync(Mapper.Map<SMSLog>(entity));
            return new SMSLogModel { SmsLogId = smsLog.SmsLogId };
        }

        public SMSLogModel Update(SMSLogModel entity)
        {
            var smsLog = _sMSLog.Update(Mapper.Map<SMSLog>(entity));
            return new SMSLogModel { SmsLogId = smsLog.SmsLogId };
        }

        public async Task<SMSLogModel> UpdateAsync(SMSLogModel entity)
        {
            var smsLog = await _sMSLog.SaveAsync(Mapper.Map<SMSLog>(entity));
            return new SMSLogModel { SmsLogId = smsLog.SmsLogId };
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
        // ~SMSLogManager() {
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
