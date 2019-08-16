using AutoMapper;
using GEE.Business.Interface.HR;
using GEE.Business.Model.HR;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Manager.HR
{
    public class EmployeeExperienceManager : IEmployeeExperience
    {
        IMyDataAccess<EmployeeExperience> _EmployeeExperience = new MyDataAccess<EmployeeExperience>();

        public void Delete(EmployeeExperienceModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(EmployeeExperienceModel entity)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<EmployeeExperienceModel> GetAll()
        {
            var classesList = _EmployeeExperience.GetAll();
            List<EmployeeExperienceModel> classMasterModellList = new List<EmployeeExperienceModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<EmployeeExperienceModel>(item));

            }
            return classMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public async Task<List<EmployeeExperienceModel>> GetAllAsync()
        {
            var classesList = await _EmployeeExperience.GetAllAsync();
            List<EmployeeExperienceModel> classMasterModellList = new List<EmployeeExperienceModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<EmployeeExperienceModel>(item));
            }
            return classMasterModellList;
            //throw new NotImplementedException();
        }

        public EmployeeExperienceModel GetById(int id)
        {
            var empMaster = _EmployeeExperience.GetById(id);
            return Mapper.Map<EmployeeExperienceModel>(empMaster);
        }

        public async Task<EmployeeExperienceModel> GetByIdAsync(int id)
        {
            return Mapper.Map<EmployeeExperienceModel>(await _EmployeeExperience.GetByIdAsync(id));
        }
        public EmployeeExperienceModel Save(EmployeeExperienceModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<EmployeeExperienceModel> SaveAsync(EmployeeExperienceModel entity)
        {
            throw new NotImplementedException();
        }

        public EmployeeExperienceModel Update(EmployeeExperienceModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<EmployeeExperienceModel> UpdateAsync(EmployeeExperienceModel entity)
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
        // ~EmployeeExperienceManager() {
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
