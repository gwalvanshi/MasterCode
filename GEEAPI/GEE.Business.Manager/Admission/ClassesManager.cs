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
    public class ClassesManager : IClasses
    {
        IMyDataAccess<ClassMaster> _classesDataAccess = new MyDataAccess<ClassMaster>();
        public void Delete(ClassesModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(ClassesModel entity)
        {
            throw new NotImplementedException();
        }

        public List<ClassesModel> GetAll()
        {
            var classesList = _classesDataAccess.GetAll();
            List<ClassesModel> classesModellList = new List<ClassesModel>();
            foreach (var item in classesList)
            {
                classesModellList.Add(Mapper.Map<ClassesModel>(item));

            }
            return classesModellList;
        }

        public Task<List<ClassesModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public ClassesModel GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<ClassesModel> GetByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public ClassesModel Save(ClassesModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<ClassesModel> SaveAsync(ClassesModel entity)
        {
            throw new NotImplementedException();
        }

        public ClassesModel Update(ClassesModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<ClassesModel> UpdateAsync(ClassesModel entity)
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
        // ~ClassesManager() {
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
