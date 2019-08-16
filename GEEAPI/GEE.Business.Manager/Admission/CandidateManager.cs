using AutoMapper;
using GEE.Business.Interface.Admission;
using GEE.Business.Models.Admission;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq.Dynamic;
using System.Data.SqlClient;
using System.Linq;
namespace GEE.Business.Manager.Admission
{
    public class CandidateManager : ICandidateDetail
    {
        IMyDataAccess<CandidateDetail> _CandidateDetailDataAccess = new MyDataAccess<CandidateDetail>();

        public CandidateDetailModel Save(CandidateDetailModel entity)
        {
            var candidatedet = _CandidateDetailDataAccess.Save(Mapper.Map<CandidateDetail>(entity));
            return new CandidateDetailModel { CandidateDetail_ID = candidatedet.CandidateDetail_ID };
        }

        public async Task<CandidateDetailModel> SaveAsync(CandidateDetailModel entity)
        {
            var candidatedet = await _CandidateDetailDataAccess.SaveAsync(Mapper.Map<CandidateDetail>(entity));
            return new CandidateDetailModel { CandidateDetail_ID = candidatedet.CandidateDetail_ID };
        }

        public void Delete(CandidateDetailModel entity)
        {
            _CandidateDetailDataAccess.Delete(entity.CandidateDetail_ID);
        }

        public async Task DeleteAsync(CandidateDetailModel entity)
        {
            await _CandidateDetailDataAccess.DeleteAsync(entity.CandidateDetail_ID);
        }

        public List<CandidateDetailModel> GetAll()
        {
            try
            {
                var candidatedetList = _CandidateDetailDataAccess.GetAll();
                List<CandidateDetailModel> candidatedetListModelList = new List<CandidateDetailModel>();
                foreach (var item in candidatedetList)
                {
                    candidatedetListModelList.Add(Mapper.Map<CandidateDetailModel>(item));
                }
                return candidatedetListModelList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();
                
            }
            return null;
        }

        public async Task<List<CandidateDetailModel>> GetAllAsync()
        {
            var candidatedetList = await _CandidateDetailDataAccess.GetAllAsync();
            List<CandidateDetailModel> candidatedeModelList = new List<CandidateDetailModel>();
            foreach (var item in candidatedetList)
            {
                candidatedeModelList.Add(Mapper.Map<CandidateDetailModel>(item));

            }
            return candidatedeModelList;
        }

        public async Task<CandidateDetailModel> GetByIdAsync(int id)
        {
            return Mapper.Map<CandidateDetailModel>(await _CandidateDetailDataAccess.GetByIdAsync(id));
        }

        public CandidateDetailModel GetById(int id)
        {
            var candidatede = _CandidateDetailDataAccess.GetById(id);
            return Mapper.Map<CandidateDetailModel>(candidatede);
        }

        public async Task<CandidateDetailModel> GetCandidateDetailsByEnquiryId(int enquiryId)
        {
            GEEDbContext context = new GEEDbContext();
            var candidatedetails = context.CandidateDetails.Where(a => a.Enquiry_ID == enquiryId).FirstOrDefault();
            return Mapper.Map<CandidateDetailModel>(candidatedetails);
        }

        public CandidateDetailModel Update(CandidateDetailModel entity)
        {
            var candidatede = _CandidateDetailDataAccess.Update(Mapper.Map<CandidateDetail>(entity));
            return new CandidateDetailModel { CandidateDetail_ID = candidatede.CandidateDetail_ID };
        }

        public async Task<CandidateDetailModel> UpdateAsync(CandidateDetailModel entity)
        {
            var candidatede = await _CandidateDetailDataAccess.UpdateAsync(Mapper.Map<CandidateDetail>(entity));
            return new CandidateDetailModel { CandidateDetail_ID = candidatede.CandidateDetail_ID };
        }
       
        /// <summary>
        /// This method is used to get a data for popup and search text box auto lookup.
        /// </summary>
        /// <param name="objCandidateDetailModel"></param>
        /// <returns></returns>
        public List<CandidateDetailModel> GetPopupData(CandidateDetailModel objCandidateDetailModel)
        {
          
            GEEDbContext context = new GEEDbContext();           
            var cadDetailList = (from candDet in context.CandidateDetails
                                   select candDet);        
            //Sorting
            if (!(string.IsNullOrEmpty(objCandidateDetailModel.SortColumn) && string.IsNullOrEmpty(objCandidateDetailModel.SortOrder)))
            {
                cadDetailList = cadDetailList.OrderBy(objCandidateDetailModel.SortColumn + " " + objCandidateDetailModel.SortOrder);
            }
            //Search
            if (!string.IsNullOrEmpty(objCandidateDetailModel.SearchValue))
            {
                cadDetailList = cadDetailList.Where(m => m.FirstName.ToLower().Contains(objCandidateDetailModel.SearchValue.ToLower()) 
                || m.Lastname.ToLower().Contains(objCandidateDetailModel.SearchValue.ToLower()) 
                || m.FatheFirstName.ToLower().Contains(objCandidateDetailModel.SearchValue.ToLower()));
            }
            int recordsTotal = cadDetailList.Count();
            var data = cadDetailList.Skip(objCandidateDetailModel.PageNo).Take(objCandidateDetailModel.PageSize).ToList();
            List<CandidateDetailModel> candidatedeModelList = new List<CandidateDetailModel>();
            foreach (var item in data)
            {             
              
                candidatedeModelList.Add(Mapper.Map<CandidateDetailModel>(item));             

            }
            if(candidatedeModelList.Count>0)
            {
                candidatedeModelList[0].RowCount = recordsTotal;
            }
            return candidatedeModelList;
           
        }

        /// <summary>
        /// This is the generic methos to get data from candidate and relevent table.
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
        public List<CandidateDetailModel> GetCandidateDetailsWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder)
        {
            List<CandidateDetailModel> candidateModellList = new List<CandidateDetailModel>();
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
                    candidateModellList = context.Database.SqlQuery<CandidateDetailModel>("GetCandidateDetails @SelectColumn, @SearchValue,@PageNo,@PageSize,@SortColumn,@SortOrder", P1, P2, P3, P4, P5, P6).ToList();

                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return candidateModellList;
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
