using AutoMapper;
using GEE.Business.Interface.HR;
using GEE.Business.Model.HR;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Manager.HR
{
    public class EmployeeMasterManager : IEmployeeMaster
    {
        IMyDataAccess<EmployeeMaster> _EmployeeMaster = new MyDataAccess<EmployeeMaster>();
        /// <summary>
        /// This is the generic methos to get data from user  and relevent table.
        /// Added by jiya
        /// Date: 22 Apr 2019
        /// </summary>
        /// <param name="SelectColumn"></param>
        /// <param name="SearchValue"></param>
        /// <param name="PageNo"></param>
        /// <param name="PageSize"></param>
        /// <param name="SortColumn"></param>
        /// <param name="SortOrder"></param>
        /// <returns></returns>
        public List<EmployeeMasterModel> GetEmployeeWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder)
        {
            List<EmployeeMasterModel> enquirModelList = new List<EmployeeMasterModel>();
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
                    enquirModelList = context.Database.SqlQuery<EmployeeMasterModel>("GetEmployeeDetails @SelectColumn, @SearchValue,@PageNo,@PageSize,@SortColumn,@SortOrder", P1, P2, P3, P4, P5, P6).ToList();

                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return enquirModelList;
        }
        public void Delete(EmployeeMasterModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(EmployeeMasterModel entity)
        {
            throw new NotImplementedException();
        }

        public List<EmployeeMasterModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task<List<EmployeeMasterModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public EmployeeMasterModel GetById(int id)
        {
            var empMaster = _EmployeeMaster.GetById(id);
            return Mapper.Map<EmployeeMasterModel>(empMaster);
        }

        public async Task<EmployeeMasterModel> GetByIdAsync(int id)
        {
            return Mapper.Map<EmployeeMasterModel>(await  _EmployeeMaster.GetByIdAsync(id));
        }

        public EmployeeMasterModel Save(EmployeeMasterModel entity)
        {
            var empMaster = _EmployeeMaster.Save(Mapper.Map<EmployeeMaster>(entity));
            return new EmployeeMasterModel { EmployeeMasterID = empMaster.EmployeeMasterID };
        }

        public async Task<EmployeeMasterModel> SaveAsync(EmployeeMasterModel entity)
        {
            var empMaster = await _EmployeeMaster.SaveAsync( Mapper.Map<EmployeeMaster>(entity));
            return new EmployeeMasterModel { EmployeeMasterID = empMaster.EmployeeMasterID };
        }

        public EmployeeMasterModel Update(EmployeeMasterModel entity)
        {
            throw new NotImplementedException();
        }

        public Task<EmployeeMasterModel> UpdateAsync(EmployeeMasterModel entity)
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
        // ~EmployeeMasterManager() {
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
        /// <summary>
        /// This methoda is used for sav the employee details with education experince and ids.
        /// Added by Jiya 
        /// addedWehn 28 July 2019
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int SaveEmployeeDetails(EmployeeDetailsSaveSchemaModel entity)
        {
            int returnValue = 0;
            using (GEEDbContext context = new GEEDbContext())
            {    
              
                var P1 = new SqlParameter("@EmployeeDetailsXML", entity.EmployeeDetailsXML);
                var P2 = new SqlParameter("@EducationItemXML", entity.EducationItemXML);
                var P3 = new SqlParameter("@ExperinceItemXML", entity.ExperinceItemXML);
                var P4 = new SqlParameter("@EmployeeIdItemXML", entity.EmployeeIdItemXML);
                var P5 = new SqlParameter("@modifiedBy", entity.ModifiedBy);
                var P6 = new SqlParameter("@EmployeeMasterID", entity.EmployeeMasterID);
                returnValue = context.Database.ExecuteSqlCommand("InsertEmployeeDetails @EmployeeDetailsXML, @EducationItemXML,@ExperinceItemXML,@EmployeeIdItemXML,@modifiedBy,@EmployeeMasterID", P1,P2,P3,P4,P5,P6);
            }
            return returnValue;
        }

        /// <summary>
        /// This method is used for get employee details with edution experince and ids data.
        /// Added by Jiya 
        /// addedWehn 28 July 2019
        /// </summary>
        /// <param name="employeeMasterId"></param>
        /// <returns></returns>
        public EmployeeMasterModel GetEmployeeDetails(int employeeMasterId)
        {
            EmployeeMasterModel objEmployeeMasterModel = new EmployeeMasterModel();
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var EmployeeData = objGEEDbContext.EmployeeMasters.Where(a => a.EmployeeMasterID == employeeMasterId).SingleOrDefault();
            objEmployeeMasterModel = Mapper.Map<EmployeeMasterModel>(EmployeeData);

            List<EmployeeEducationDetailModel> eduList = new List<EmployeeEducationDetailModel>();
            List<EmployeeExperienceModel> expList = new List<EmployeeExperienceModel>();
            List<EmployeeIDdetailModel> idList = new List<EmployeeIDdetailModel>();
            var educationList = objGEEDbContext.EmployeeEducationDetails.Where(a => a.EmpCode == EmployeeData.EmployeeMasterID).ToList();
            foreach (var item in educationList)
            {
                eduList.Add(Mapper.Map<EmployeeEducationDetailModel>(item));

            }
            var experinceList = objGEEDbContext.EmployeeExperiences.Where(a => a.EmpCode == EmployeeData.EmployeeMasterID).ToList();
            foreach (var item2 in experinceList)
            {
                expList.Add(Mapper.Map<EmployeeExperienceModel>(item2));

            }

            var IdList = objGEEDbContext.EmployeeIDdetails.Where(a => a.EmpcodeID == EmployeeData.EmployeeMasterID).ToList();
            foreach (var item3 in IdList)
            {
                idList.Add(Mapper.Map<EmployeeIDdetailModel>(item3));
            }
            objEmployeeMasterModel.EmployeeEducationDetailModelList = eduList;
            objEmployeeMasterModel.EmployeeExperienceModelList = expList;
            objEmployeeMasterModel.EmployeeIDdetailModelList = idList;
            return objEmployeeMasterModel;
        }
        /// <summary>
        /// This methoda is used for sav the employee details with education experince and ids.
        /// Added by Jiya 
        /// addedWehn 28 July 2019
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public int UpdateEmployeeDetails(EmployeeDetailsSaveSchemaModel entity)
        {
            int returnValue = 0;
            using (GEEDbContext context = new GEEDbContext())
            {

                var P1 = new SqlParameter("@EmployeeDetailsXML", entity.EmployeeDetailsXML);
                var P2 = new SqlParameter("@EducationItemXML", entity.EducationItemXML);
                var P3 = new SqlParameter("@ExperinceItemXML", entity.ExperinceItemXML);
                var P4 = new SqlParameter("@EmployeeIdItemXML", entity.EmployeeIdItemXML);
                var P5 = new SqlParameter("@modifiedBy", entity.ModifiedBy);
                var P6 = new SqlParameter("@EmployeeMasterID", entity.EmployeeMasterID);
                returnValue = context.Database.ExecuteSqlCommand("InsertEmployeeDetails @EmployeeDetailsXML, @EducationItemXML,@ExperinceItemXML,@EmployeeIdItemXML,@modifiedBy,EmployeeMasterID", P1, P2, P3, P4, P5, P6);
            }
            return returnValue;
        }
        /// <summary>
        /// This methoda is used for update is deleted column  
        /// Added by Jiya 
        /// addedWehn 28 July 2019
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>

        public int DeleteEmployeeDetails(EmployeeMasterModel entity)
        {
           
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var EmployeeData = objGEEDbContext.EmployeeMasters.Where(a => a.EmployeeMasterID == entity.EmployeeMasterID).SingleOrDefault();
            EmployeeData.Modifiedby_ID = entity.ModifiedBy_ID;
            EmployeeData.ModifiedDate = DateTime.Now;
            EmployeeData.IsDeleted = true;
            objGEEDbContext.Entry(EmployeeData).State = System.Data.Entity.EntityState.Modified;
            return objGEEDbContext.SaveChanges();
           
        }
        #endregion
    }
}
