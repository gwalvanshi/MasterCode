using GEE.Business.Interface.Admission;
using GEE.Business.Model.Admission;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Manager.Admission
{
    public class StartAdmissionManager : IStartAdmission
    {
        public void Delete(StartAdmissionModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(StartAdmissionModel entity)
        {
            throw new NotImplementedException();
        }

        public List<StartAdmissionModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task<List<StartAdmissionModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public StartAdmissionModel GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<StartAdmissionModel> GetByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// This is the generic methos to get data from StartAdmissionDetails and relevent table.
        /// Added by jiya
        /// Date: 07 Apr 2019
        /// </summary>
        /// <param name="SelectColumn"></param>
        /// <param name="SearchValue"></param>
        /// <param name="PageNo"></param>
        /// <param name="PageSize"></param>
        /// <param name="SortColumn"></param>
        /// <param name="SortOrder"></param>
        /// <returns></returns>
        public List<StartAdmissionModel> GetStartAdmissionDetailsWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder,int SchoolId,int GroupId)
        {
            List<StartAdmissionModel> StartAdmissionModelList = new List<StartAdmissionModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var P1 = new SqlParameter("@SelectColumn", SelectColumn);
                    var P2 = new SqlParameter("@SearchValue", SearchValue);
                    var P3 = new SqlParameter("@PageNo", PageNo);
                    var P4 = new SqlParameter("@PageSize", PageSize);
                    var P5 = new SqlParameter("@SortColumn", SortColumn);
                    var P6 = new SqlParameter("@SortOrder", SortOrder);
                    var P7 = new SqlParameter("@SchoolId", SchoolId);
                    var P8 = new SqlParameter("@GroupId", GroupId);
                    StartAdmissionModelList = context.Database.SqlQuery<StartAdmissionModel>("GetStartAdmissiondetails @SelectColumn, @SearchValue,@PageNo,@PageSize,@SortColumn,@SortOrder,@SchoolId,@GroupId", P1, P2, P3, P4, P5, P6,P7,P8).ToList();

                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return StartAdmissionModelList;
        }

        public List<StartAdmissionModel> UpdateStartAdmissionList(List<StartAdmissionModel> startAdmissionModels)
        {
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    foreach (var item in startAdmissionModels)
                    {


                        AdmissionStatu admissionStatus = context.AdmissionStatus.Where(a => a.AdmissionStatus_id == item.AdmissionStatus_id).FirstOrDefault();
                        if (admissionStatus != null)
                        {
                            admissionStatus.AdmissionCode = item.AdmissionCode;
                            admissionStatus.AdmissionStatus = item.AdmissionStatus;
                            admissionStatus.Startdate = item.Startdate;
                            admissionStatus.FromDOB = item.FromDOB;
                            admissionStatus.TODOB = item.TODOB;
                            admissionStatus.ApplicaitonFees = item.ApplicaitonFees;
                            admissionStatus.RegistrationFees = item.RegistrationFees;

                            context.Entry(admissionStatus).State = EntityState.Modified;
                            context.SaveChanges();
                        }
                    }
                }
                return null;
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }

        public StartAdmissionModel Save(StartAdmissionModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<StartAdmissionModel> SaveAsync(StartAdmissionModel entity)
        {
            throw new NotImplementedException();
        }

        public StartAdmissionModel Update(StartAdmissionModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<StartAdmissionModel> UpdateAsync(StartAdmissionModel entity)
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
        // ~EnquiryManager() {
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
