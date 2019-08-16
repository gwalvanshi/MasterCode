using AutoMapper;
using GEE.Business.Interface.EmailLibrary;
using GEE.Business.Models.EmailLibrary;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GEE.Business.Manager.EmailLibrary
{
  public  class CommunicationTemplateManager :ICommunicationTemplate
    {
        IMyDataAccess<CommunicationTemplate> _communicationTemplate = new MyDataAccess<CommunicationTemplate>();

        public void Delete(CommunicationTemplateModel entity)
        {
            _communicationTemplate.Delete(entity.Temp_Id);
        }

        public async Task DeleteAsync(CommunicationTemplateModel entity)
        {
            await  _communicationTemplate.DeleteAsync(entity.Temp_Id);
        }

        public List<CommunicationTemplateModel> GetAll()
        {
            var tempList = _communicationTemplate.GetAll();
            List<CommunicationTemplateModel> tempModelList = new List<CommunicationTemplateModel>();
            foreach (var item in tempList)
            {
                tempModelList.Add(Mapper.Map<CommunicationTemplateModel>(item));

            }
            return tempModelList;
        }

        public async Task<List<CommunicationTemplateModel>> GetAllAsync()
        {
            var tempList = await _communicationTemplate.GetAllAsync();
            List<CommunicationTemplateModel> tempModelList = new List<CommunicationTemplateModel>();
            foreach (var item in tempList)
            {
                tempModelList.Add(Mapper.Map<CommunicationTemplateModel>(item));

            }
            return tempModelList;
        }

        public CommunicationTemplateModel GetById(int id)
        {
            return Mapper.Map<CommunicationTemplateModel>(_communicationTemplate.GetById(id));
        }

        public async Task<CommunicationTemplateModel> GetByIdAsync(int id)
        {
            return   Mapper.Map<CommunicationTemplateModel>(await _communicationTemplate.GetByIdAsync(id));
        }

        public CommunicationTemplateModel Save(CommunicationTemplateModel entity)
        {
            var commTemp = _communicationTemplate.Save(Mapper.Map<CommunicationTemplate>(entity));
            return new CommunicationTemplateModel { Temp_Id = commTemp.Temp_Id };
        }

        public async Task<CommunicationTemplateModel> SaveAsync(CommunicationTemplateModel entity)
        {
            var commTemp = await _communicationTemplate.SaveAsync(Mapper.Map<CommunicationTemplate>(entity));
            return new CommunicationTemplateModel { Temp_Id = commTemp.Temp_Id };
        }

        public CommunicationTemplateModel Update(CommunicationTemplateModel entity)
        {
            var commTemp = _communicationTemplate.Update(Mapper.Map<CommunicationTemplate>(entity));
            return new CommunicationTemplateModel { Temp_Id = commTemp.Temp_Id };
        }

        public async Task<CommunicationTemplateModel> UpdateAsync(CommunicationTemplateModel entity)
        {
            var commTemp = await _communicationTemplate.UpdateAsync(Mapper.Map<CommunicationTemplate>(entity));
            return new CommunicationTemplateModel { Temp_Id = commTemp.Temp_Id };
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
        // ~CommunicationTemplateManager() {
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
