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
    public class EmployeeEducationDetailManager : IEmployeeEducationDetail
    {
        IMyDataAccess<EmployeeEducationDetail> _EmployeeEducationDetail = new MyDataAccess<EmployeeEducationDetail>();

        public void Delete(EmployeeEducationDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(EmployeeEducationDetailModel entity)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<EmployeeEducationDetailModel> GetAll()
        {
            var classesList = _EmployeeEducationDetail.GetAll();
            List<EmployeeEducationDetailModel> classMasterModellList = new List<EmployeeEducationDetailModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<EmployeeEducationDetailModel>(item));

            }
            return classMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public async Task<List<EmployeeEducationDetailModel>> GetAllAsync()
        {
            var classesList = await _EmployeeEducationDetail.GetAllAsync();
            List<EmployeeEducationDetailModel> classMasterModellList = new List<EmployeeEducationDetailModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<EmployeeEducationDetailModel>(item));
            }
            return classMasterModellList;
            //throw new NotImplementedException();
        }

        public EmployeeEducationDetailModel GetById(int id)
        {
            var empMaster = _EmployeeEducationDetail.GetById(id);
            return Mapper.Map<EmployeeEducationDetailModel>(empMaster);
        }

        public async Task<EmployeeEducationDetailModel> GetByIdAsync(int id)
        {
            return Mapper.Map<EmployeeEducationDetailModel>(await _EmployeeEducationDetail.GetByIdAsync(id));
        }

        public EmployeeEducationDetailModel Save(EmployeeEducationDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<EmployeeEducationDetailModel> SaveAsync(EmployeeEducationDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public EmployeeEducationDetailModel Update(EmployeeEducationDetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<EmployeeEducationDetailModel> UpdateAsync(EmployeeEducationDetailModel entity)
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
        // ~EmployeeEducationDetailManager() {
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
