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
    public class EmployeeIDdetailManager : IEmployeeIDdetail
    {
        IMyDataAccess<EmployeeIDdetail> _EmployeeIDdetail = new MyDataAccess<EmployeeIDdetail>();

        public void Delete(EmployeeIDdetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(EmployeeIDdetailModel entity)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<EmployeeIDdetailModel> GetAll()
        {
            var classesList = _EmployeeIDdetail.GetAll();
            List<EmployeeIDdetailModel> classMasterModellList = new List<EmployeeIDdetailModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<EmployeeIDdetailModel>(item));

            }
            return classMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public async Task<List<EmployeeIDdetailModel>> GetAllAsync()
        {
            var classesList = await _EmployeeIDdetail.GetAllAsync();
            List<EmployeeIDdetailModel> classMasterModellList = new List<EmployeeIDdetailModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<EmployeeIDdetailModel>(item));
            }
            return classMasterModellList;
            //throw new NotImplementedException();
        }

        public EmployeeIDdetailModel GetById(int id)
        {
            var empMaster = _EmployeeIDdetail.GetById(id);
            return Mapper.Map<EmployeeIDdetailModel>(empMaster);
        }

        public async Task<EmployeeIDdetailModel> GetByIdAsync(int id)
        {
            return Mapper.Map<EmployeeIDdetailModel>(await _EmployeeIDdetail.GetByIdAsync(id));
        }

        public EmployeeIDdetailModel Save(EmployeeIDdetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<EmployeeIDdetailModel> SaveAsync(EmployeeIDdetailModel entity)
        {
            throw new NotImplementedException();
        }

        public EmployeeIDdetailModel Update(EmployeeIDdetailModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<EmployeeIDdetailModel> UpdateAsync(EmployeeIDdetailModel entity)
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
        // ~EmployeeIDdetailManager() {
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
