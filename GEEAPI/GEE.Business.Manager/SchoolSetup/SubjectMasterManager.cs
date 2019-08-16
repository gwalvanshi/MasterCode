using AutoMapper;
using GEE.Business.Interface.SchoolSetup;
using GEE.Business.Model.SchoolSetup;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Dynamic;


namespace GEE.Business.Manager.SchoolSetup
{
   public class StopMasterManager: ISubjectMaster
    {
        IMyDataAccess<SubjectMaster> _subjectMasterDataAccess = new MyDataAccess<SubjectMaster>();

        ///
        ///Created By: Shivani on 05/04/2019 
        ///


        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<SubjectMasterModel> GetAll()
        {
            var subjectmasterList = _subjectMasterDataAccess.GetAll();
            List<SubjectMasterModel> SubjectMasterModellList = new List<SubjectMasterModel>();
            foreach (var item in subjectmasterList)
            {
                SubjectMasterModellList.Add(Mapper.Map<SubjectMasterModel>(item));

            }
            return SubjectMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public async Task<List<SubjectMasterModel>> GetAllAsync()
        {
            var subjectmasterList = await _subjectMasterDataAccess.GetAllAsync();
            List<SubjectMasterModel> SubjectMasterModellList = new List<SubjectMasterModel>();
            foreach (var item in subjectmasterList)
            {
                SubjectMasterModellList.Add(Mapper.Map<SubjectMasterModel>(item));

            }
            return SubjectMasterModellList;
             
        }

        /// <summary>
        ///  Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public SubjectMasterModel GetById(int id)
        {
            var subjectMasterMaster = _subjectMasterDataAccess.GetById(id);
            return Mapper.Map<SubjectMasterModel>(subjectMasterMaster);
        }

        /// <summary>
        ///  Get ById Async
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<SubjectMasterModel> GetByIdAsync(int id)
        {
            return Mapper.Map<SubjectMasterModel>(await _subjectMasterDataAccess.GetByIdAsync(id));
        }

        /// <summary>
        /// Save
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public SubjectMasterModel Save(SubjectMasterModel entity)
        {
            var subjectMasterMaster = _subjectMasterDataAccess.Save(Mapper.Map<SubjectMaster>(entity));
            return new SubjectMasterModel { SubjectMaster_ID = subjectMasterMaster.SubjectMaster_ID };
        }

        /// <summary>
        ///  Save Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<SubjectMasterModel> SaveAsync(SubjectMasterModel entity)
        {
            var subjectMasterMaster = await _subjectMasterDataAccess.SaveAsync(Mapper.Map<SubjectMaster>(entity));
            return new SubjectMasterModel { SubjectMaster_ID = subjectMasterMaster.SubjectMaster_ID };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public SubjectMasterModel Update(SubjectMasterModel entity)
        {
            var subjectMasterMaster = _subjectMasterDataAccess.Update(Mapper.Map<SubjectMaster>(entity));
            return new SubjectMasterModel { SubjectMaster_ID = subjectMasterMaster.SubjectMaster_ID };
        }

        /// <summary>
        /// Update Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<SubjectMasterModel> UpdateAsync(SubjectMasterModel entity)
        {

            var subjectMasterMaster = await _subjectMasterDataAccess.UpdateAsync(Mapper.Map<SubjectMaster>(entity));
            return new SubjectMasterModel { SubjectMaster_ID = subjectMasterMaster.SubjectMaster_ID };

        }


        /// <summary>
        /// Delete 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteSubjectMaster(SubjectMasterModel entity)
        {

            bool isDelete = false;
            try
            {
                var objentity = _subjectMasterDataAccess.GetById(entity.SubjectMaster_ID);
                if (objentity != null)
                {
                    objentity.IsDeleted = true;
                    objentity.Modifiedby_ID = (int)entity.ModifiedBy_ID;
                    objentity.ModifiedDate = (DateTime)entity.ModifiedDate;
                    _subjectMasterDataAccess.UpdateAsync(objentity);
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
        public void Delete(SubjectMasterModel entity)
        {
            _subjectMasterDataAccess.Delete(entity.SubjectMaster_ID);
        }

        /// <summary>
        ///  Delete Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task DeleteAsync(SubjectMasterModel entity)
        {
            await _subjectMasterDataAccess.DeleteAsync(entity.SubjectMaster_ID);
        }

        /// <summary>
        /// Get All Subject Master Data
        /// </summary>
        /// <param name="objSubjectMasterTableModel"></param>
        /// <returns></returns>
        public List<SubjectMasterModel> GetAllSubjectMasterData(int pageNo, int pageSize, string sortOrder, string sortColumn)
        {
            List<SubjectMasterModel> getSubjectModelList = new List<SubjectMasterModel>();
            GEEDbContext context = new GEEDbContext();

            var masterTableData = (from subjectmstrTbl in context.SubjectMasters.Where(a => a.IsDeleted == false)
                                   select new
                                   {
                                       subjectmstrTbl.SubjectMaster_ID,
                                       subjectmstrTbl.SubjectType_Id,
                                       subjectmstrTbl.AssessmentStructure_ID,
                                       subjectmstrTbl.GradeStructure_ID,
                                       subjectmstrTbl.SubjectGroup_ID,
                                       subjectmstrTbl.Code,
                                       subjectmstrTbl.Name,
                                       subjectmstrTbl.Sessionyear,
                                       subjectmstrTbl.isOptional,
                                       subjectmstrTbl.IncludedInCGPA,
                                       subjectmstrTbl.ExculdedfromAtt,
                                       subjectmstrTbl.isScholastic
                                   });

            //Sorting
            if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortOrder)))
            {
                masterTableData = masterTableData.OrderBy(sortColumn + " " + sortOrder);
            }
            int recordsTotal = masterTableData.Count();
            var data = masterTableData.Skip(pageNo).Take(pageSize).ToList();

            foreach (var item in data)
            {
                var master = context.MasterTables.Where(a => a.MasterTable_id == item.SubjectType_Id).FirstOrDefault();
                SubjectMasterModel objSubjectMasterModel = new SubjectMasterModel();
                objSubjectMasterModel.SubjectMaster_ID = item.SubjectMaster_ID;
                objSubjectMasterModel.SubjectType_Id = item.SubjectType_Id;
                objSubjectMasterModel.AssessmentStructure_ID = item.AssessmentStructure_ID;
                objSubjectMasterModel.GradeStructure_ID = item.GradeStructure_ID;
                objSubjectMasterModel.SubjectType_Id = item.SubjectType_Id;
                objSubjectMasterModel.Code = item.Code;
                objSubjectMasterModel.Name = item.Name;
                objSubjectMasterModel.IncludedInCGPA = item.IncludedInCGPA;
                objSubjectMasterModel.ExculdedfromAtt = item.ExculdedfromAtt;
                objSubjectMasterModel.isScholastic  = item.isScholastic;
                objSubjectMasterModel.isOptional = item.isOptional;
                objSubjectMasterModel.AssessmentStructureName = item.AssessmentStructure_ID != null ? context.MasterTables.Where(a => a.MasterTable_id == item.AssessmentStructure_ID).FirstOrDefault().Name : "";
                objSubjectMasterModel.GradeStructureName = item.GradeStructure_ID != null ? context.MasterTables.Where(a => a.MasterTable_id == item.GradeStructure_ID).FirstOrDefault().Name : "";
                objSubjectMasterModel.SubjectTypeName = item.SubjectType_Id != null ? context.MasterTables.Where(a => a.MasterTable_id == item.SubjectType_Id).FirstOrDefault().Name : "";
                objSubjectMasterModel.SubjectGroupName= item.SubjectGroup_ID != null ? context.MasterTables.Where(a => a.MasterTable_id == item.GradeStructure_ID).FirstOrDefault().Name : "";
                getSubjectModelList.Add(objSubjectMasterModel);

            }
            getSubjectModelList[0].RowCount = recordsTotal;
            return getSubjectModelList;
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
