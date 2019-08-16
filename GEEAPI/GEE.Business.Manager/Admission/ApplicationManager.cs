using AutoMapper;
using GEE.Business.Interface.Admission;
using GEE.Business.Models.Admission;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GEE.Business.Manager.Admission
{
   public class ApplicationManager : IApplication
    {
        IMyDataAccess<Application> _CandidateDetailDataAccess = new MyDataAccess<Application>();

        public ApplicationModel Save(ApplicationModel entity)
        {
            var candidatedet = _CandidateDetailDataAccess.Save(Mapper.Map<Application>(entity));
            return new ApplicationModel { Application_ID = candidatedet.Application_ID };
        }

        public async Task<ApplicationModel> SaveAsync(ApplicationModel entity)
        {
            var candidatedet = await _CandidateDetailDataAccess.SaveAsync(Mapper.Map<Application>(entity));
            return new ApplicationModel { Application_ID = candidatedet.Application_ID };
        }

        public void Delete(ApplicationModel entity)
        {
            _CandidateDetailDataAccess.Delete(entity.Application_ID);
        }

        public async Task DeleteAsync(ApplicationModel entity)
        {
            await _CandidateDetailDataAccess.DeleteAsync(entity.Application_ID);
        }

        public List<ApplicationModel> GetAll()
        {
            try
            {
                var candidatedetList = _CandidateDetailDataAccess.GetAll();
                List<ApplicationModel> candidatedetListModelList = new List<ApplicationModel>();
                foreach (var item in candidatedetList)
                {
                    candidatedetListModelList.Add(Mapper.Map<ApplicationModel>(item));
                }
                return candidatedetListModelList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<ApplicationModel>> GetAllAsync()
        {
            var candidatedetList = await _CandidateDetailDataAccess.GetAllAsync();
            List<ApplicationModel> candidatedeModelList = new List<ApplicationModel>();
            foreach (var item in candidatedetList)
            {
                candidatedeModelList.Add(Mapper.Map<ApplicationModel>(item));

            }
            return candidatedeModelList;
        }

        public async Task<ApplicationModel> GetByIdAsync(int id)
        {
            return Mapper.Map<ApplicationModel>(await _CandidateDetailDataAccess.GetByIdAsync(id));
        }

        public ApplicationModel GetById(int id)
        {
            var candidatede = _CandidateDetailDataAccess.GetById(id);
            return Mapper.Map<ApplicationModel>(candidatede);
        }

        public ApplicationModel Update(ApplicationModel entity)
        {
            var candidatede = _CandidateDetailDataAccess.Update(Mapper.Map<Application>(entity));
            return new ApplicationModel { Application_ID = candidatede.Application_ID };
        }

        public async Task<ApplicationModel> UpdateAsync(ApplicationModel entity)
        {
            var candidatede = await _CandidateDetailDataAccess.UpdateAsync(Mapper.Map<Application>(entity));
            return new ApplicationModel { Application_ID = candidatede.Application_ID };
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
        // ~candidatedeManager() {
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
