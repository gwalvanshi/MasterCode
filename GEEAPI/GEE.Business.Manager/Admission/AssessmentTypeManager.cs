using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.DataAccess;
using GEE.Business.Interface.Admin;
using GEE.Business.Model.Admin;
using AutoMapper;
using GEE.Business.Interface;
using System.Linq.Dynamic;
using GEE.Business.Interface.Admission;
using GEE.Business.Model.Admission;

namespace GEE.Business.Manager.Admission
{
    public class AssessmentTypeManager : IAssessmentType
    {
        IMyDataAccess<AssessmentTYPE> _assessmentTypeDataAccess = new MyDataAccess<AssessmentTYPE>();
        ///
        ///Created By: Amit Gajera on 05/05/2019 
        ///


        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<AssessmentTypeModel> GetAll()
        {
            var assessmentTypeList = _assessmentTypeDataAccess.GetAll();
            List<AssessmentTypeModel> assessmentTypeModellList = new List<AssessmentTypeModel>();
            foreach (var item in assessmentTypeList)
            {
                assessmentTypeModellList.Add(Mapper.Map<AssessmentTypeModel>(item));

            }
            return assessmentTypeModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public Task<List<AssessmentTypeModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        ///  Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public AssessmentTypeModel GetById(int id)
        {
            var assessmentTypeMaster = _assessmentTypeDataAccess.GetById(id);
            return Mapper.Map<AssessmentTypeModel>(assessmentTypeMaster);
        }

        /// <summary>
        ///  Get ById Async
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<AssessmentTypeModel> GetByIdAsync(int id)
        {
            return Mapper.Map<AssessmentTypeModel>(await _assessmentTypeDataAccess.GetByIdAsync(id));
        }

        /// <summary>
        /// Save
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public AssessmentTypeModel Save(AssessmentTypeModel entity)
        {
            var assessmentTypeMaster = _assessmentTypeDataAccess.Save(Mapper.Map<AssessmentTYPE>(entity));
            return new AssessmentTypeModel { AssessmentType_Id = assessmentTypeMaster.AssessmentType_Id };
        }

        /// <summary>
        ///  Save Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<AssessmentTypeModel> SaveAsync(AssessmentTypeModel entity)
        {
            var assessmentTypeMaster = await _assessmentTypeDataAccess.SaveAsync(Mapper.Map<AssessmentTYPE>(entity));
            return new AssessmentTypeModel { AssessmentType_Id = assessmentTypeMaster.AssessmentType_Id };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public AssessmentTypeModel Update(AssessmentTypeModel entity)
        {
            var assessmentTypeMaster = _assessmentTypeDataAccess.Update(Mapper.Map<AssessmentTYPE>(entity));
            return new AssessmentTypeModel { AssessmentType_Id = assessmentTypeMaster.AssessmentType_Id };
        }

        /// <summary>
        /// Update Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<AssessmentTypeModel> UpdateAsync(AssessmentTypeModel entity)
        {
            var assessmentTypeMaster = await _assessmentTypeDataAccess.UpdateAsync(Mapper.Map<AssessmentTYPE>(entity));
            return new AssessmentTypeModel { AssessmentType_Id = assessmentTypeMaster.AssessmentType_Id };
        }


        /// <summary>
        /// Delete 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeActivateAssessmentType(int id)
        {

            bool isDelete = false;
            try
            {
                GEEDbContext objGEEDbContext = new GEEDbContext();
                var UserData = objGEEDbContext.AssessmentTYPEs.Where(a => a.AssessmentType_Id == id).FirstOrDefault();
                UserData.IsDeleted = true;
                objGEEDbContext.Entry(UserData).State = System.Data.Entity.EntityState.Modified;
                //objGEEDbContext.Entry(UserData).Property(x => x.CUserId).IsModified = false;
                if (objGEEDbContext.SaveChanges() > 0)
                {
                    isDelete = true;
                }
            }
            catch (Exception)
            {
                isDelete = false;
            }
            return isDelete;
        }

        /// <summary>
        /// Delete
        /// </summary>
        /// <param name="entity"></param>
        public void Delete(AssessmentTypeModel entity)
        {
            _assessmentTypeDataAccess.Delete(entity.AssessmentType_Id);
        }

        /// <summary>
        ///  Delete Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task DeleteAsync(AssessmentTypeModel entity)
        {
            await _assessmentTypeDataAccess.DeleteAsync(entity.AssessmentType_Id);
        }

        /// <summary>
        /// Get All AssessmentType Data
        /// </summary>
        /// <param name="objAssessmentTypeModel"></param>
        /// <returns></returns>
        public List<AssessmentTypeViewModel> GetAllAssessmentTypeData(AssessmentTypeViewModel objAssessmentTypeModel)
        {
            List<AssessmentTypeViewModel> getAssessmentTypeModelList = new List<AssessmentTypeViewModel>();

            GEEDbContext context = new GEEDbContext();


            var _assessmentTypeData = (from mstTbl in context.AssessmentTYPEs
                                         //join mng in context.MasterTables on mstTbl.AssessmentGroup_ID equals mng.MasterTable_id
                                         where mstTbl.IsDeleted != true
                                         select new
                                         {
                                             mstTbl.AssessmentType_Id,
                                             mstTbl.AssessmentType_code,
                                             mstTbl.AssessmentType_Name,
                                             mstTbl.MinMarks,
                                             mstTbl.MaxMarks,
                                             mstTbl.PassingMarks,
                                             mstTbl.Weightage
                                         });


            //Sorting
            if (!(string.IsNullOrEmpty(objAssessmentTypeModel.SortColumn) && string.IsNullOrEmpty(objAssessmentTypeModel.SortOrder)))
            {
                _assessmentTypeData = _assessmentTypeData.OrderBy(objAssessmentTypeModel.SortColumn + " " + objAssessmentTypeModel.SortOrder);
            }
            int recordsTotal = _assessmentTypeData.Count();
            var data = _assessmentTypeData.Skip(objAssessmentTypeModel.PageNo).Take(objAssessmentTypeModel.PageSize).ToList();

            foreach (var item in data)
            {
                AssessmentTypeViewModel objMasterModel = new AssessmentTypeViewModel();
                objMasterModel.AssessmentType_Id = item.AssessmentType_Id;
                objMasterModel.AssessmentType_code = item.AssessmentType_code;
                objMasterModel.AssessmentType_Name = item.AssessmentType_Name;
                objMasterModel.MinMarks = item.MinMarks;
                objMasterModel.MaxMarks = item.MaxMarks;
                objMasterModel.PassingMarks = item.PassingMarks;
                objMasterModel.Weightage = item.Weightage;
                objMasterModel.RowCount = recordsTotal;
                getAssessmentTypeModelList.Add(objMasterModel);

            }

            return getAssessmentTypeModelList;
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
        // ~AssessmentTypeManager() {
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
