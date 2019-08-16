using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GEE.DataAccess;
using GEE.Business.Interface.Admission;
using GEE.Business.Models.Admission;
using AutoMapper;
using System.Linq;
using GEE.Business.Interface;

namespace GEE.Business.Manager.Admission
{
    public class AcademicYearManager : IAcademicYear
    {
        IMyDataAccess<AcademicYear> _academicYearDataAccess = new MyDataAccess<AcademicYear>();
        public void Delete(AcademicYearModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(AcademicYearModel entity)
        {
            throw new NotImplementedException();
        }

        public List<AcademicYearModel> GetAll()
        {
            var academicYearList = _academicYearDataAccess.GetAll();
            List<AcademicYearModel> academicYearModellList = new List<AcademicYearModel>();
            foreach (var item in academicYearList)
            {
                academicYearModellList.Add(Mapper.Map<AcademicYearModel>(item));

            }
            return academicYearModellList;
        }

        public Task<List<AcademicYearModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public AcademicYearModel GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<AcademicYearModel> GetByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public AcademicYearModel Save(AcademicYearModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<AcademicYearModel> SaveAsync(AcademicYearModel entity)
        {
            throw new NotImplementedException();
        }

        public AcademicYearModel Update(AcademicYearModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<AcademicYearModel> UpdateAsync(AcademicYearModel entity)
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
        // ~AcademicManager() {
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
