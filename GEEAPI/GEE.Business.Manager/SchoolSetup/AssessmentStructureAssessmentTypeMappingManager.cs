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
using GEE.Business.Interface.SchoolSetup;
using GEE.Business.Model.SchoolSetup;


namespace GEE.Business.Manager.SchoolSetup
{
     
    public class AssessmentStructureAssessmentTypeMappingManager : IAssessmentStructureAssessmentTypeMapping
    {
        IMyDataAccess<AssessmentStructureAssessmentTypeMapping> _AssessmentStructureAssessmentTypeMappingDataAccess = new MyDataAccess<AssessmentStructureAssessmentTypeMapping>();

        ///
        ///Created By: Amit Gajera on 05/04/2019 
        ///


        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<AssessmentStructureAssessmentTypeMappingModel> GetAll()
        {
            var AssessmentStructureAssessmentTypeMappingList = _AssessmentStructureAssessmentTypeMappingDataAccess.GetAll();
            List<AssessmentStructureAssessmentTypeMappingModel> AssessmentStructureAssessmentTypeMappingModellList = new List<AssessmentStructureAssessmentTypeMappingModel>();
            foreach (var item in AssessmentStructureAssessmentTypeMappingList)
            {
                AssessmentStructureAssessmentTypeMappingModellList.Add(Mapper.Map<AssessmentStructureAssessmentTypeMappingModel>(item));
            }
            return AssessmentStructureAssessmentTypeMappingModellList;
        }

        public List<AssessmentStructureAssessmentTypeMappingModel> GetAllAssessmentStructureWithASId(int Id)
        {
            GEEDbContext context = new GEEDbContext();

            var _data = context.AssessmentStructureAssessmentTypeMappings.Where(w => w.AssessmentStructureID == Id && w.IsDeleted == false);            
            List<AssessmentStructureAssessmentTypeMappingModel> AssessmentStructureAssessmentTypeMappingModellList = new List<AssessmentStructureAssessmentTypeMappingModel>();
            if (_data != null && _data.Count() > 0)
            {
                foreach (var item in _data)
                {
                    AssessmentStructureAssessmentTypeMappingModellList.Add(Mapper.Map<AssessmentStructureAssessmentTypeMappingModel>(item));
                }
            }
            return AssessmentStructureAssessmentTypeMappingModellList;
        }


        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public Task<List<AssessmentStructureAssessmentTypeMappingModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        ///  Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public AssessmentStructureAssessmentTypeMappingModel GetById(int id)
        {
            var AssessmentStructureAssessmentTypeMappingMaster = _AssessmentStructureAssessmentTypeMappingDataAccess.GetById(id);
            return Mapper.Map<AssessmentStructureAssessmentTypeMappingModel>(AssessmentStructureAssessmentTypeMappingMaster);
        }

        /// <summary>
        ///  Get ById Async
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<AssessmentStructureAssessmentTypeMappingModel> GetByIdAsync(int id)
        {
            return Mapper.Map<AssessmentStructureAssessmentTypeMappingModel>(await _AssessmentStructureAssessmentTypeMappingDataAccess.GetByIdAsync(id));
        }

        /// <summary>
        /// Save
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public AssessmentStructureAssessmentTypeMappingModel Save(AssessmentStructureAssessmentTypeMappingModel entity)
        {
            var AssessmentStructureAssessmentTypeMappingMaster = _AssessmentStructureAssessmentTypeMappingDataAccess.Save(Mapper.Map<AssessmentStructureAssessmentTypeMapping>(entity));
            return new AssessmentStructureAssessmentTypeMappingModel { AssessmentStructureAssessmentTypeMapping_Id = AssessmentStructureAssessmentTypeMappingMaster.AssessmentStructureAssessmentTypeMapping_Id };
        }

        /// <summary>
        ///  Save Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<AssessmentStructureAssessmentTypeMappingModel> SaveAsync(AssessmentStructureAssessmentTypeMappingModel entity)
        {
            var AssessmentStructureAssessmentTypeMappingMaster = await _AssessmentStructureAssessmentTypeMappingDataAccess.SaveAsync(Mapper.Map<AssessmentStructureAssessmentTypeMapping>(entity));
            return new AssessmentStructureAssessmentTypeMappingModel { AssessmentStructureAssessmentTypeMapping_Id = AssessmentStructureAssessmentTypeMappingMaster.AssessmentStructureAssessmentTypeMapping_Id };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public AssessmentStructureAssessmentTypeMappingModel Update(AssessmentStructureAssessmentTypeMappingModel entity)
        {
            var AssessmentStructureAssessmentTypeMappingMaster = _AssessmentStructureAssessmentTypeMappingDataAccess.Update(Mapper.Map<AssessmentStructureAssessmentTypeMapping>(entity));
            return new AssessmentStructureAssessmentTypeMappingModel { AssessmentStructureAssessmentTypeMapping_Id = AssessmentStructureAssessmentTypeMappingMaster.AssessmentStructureAssessmentTypeMapping_Id };
        }

        /// <summary>
        /// Update Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<AssessmentStructureAssessmentTypeMappingModel> UpdateAsync(AssessmentStructureAssessmentTypeMappingModel entity)
        {
            var AssessmentStructureAssessmentTypeMappingMaster = await _AssessmentStructureAssessmentTypeMappingDataAccess.UpdateAsync(Mapper.Map<AssessmentStructureAssessmentTypeMapping>(entity));
            return new AssessmentStructureAssessmentTypeMappingModel { AssessmentStructureAssessmentTypeMapping_Id = AssessmentStructureAssessmentTypeMappingMaster.AssessmentStructureAssessmentTypeMapping_Id };
        }


        /// <summary>
        /// Delete 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeActivate(int id)
        {

            bool isDelete = false;
            try
            {
                GEEDbContext objGEEDbContext = new GEEDbContext();
                var UserData = objGEEDbContext.AssessmentStructureAssessmentTypeMappings.Where(a => a.AssessmentStructureAssessmentTypeMapping_Id == id).FirstOrDefault();
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
        public void Delete(AssessmentStructureAssessmentTypeMappingModel entity)
        {
            _AssessmentStructureAssessmentTypeMappingDataAccess.Delete(entity.AssessmentStructureAssessmentTypeMapping_Id);
        }

        /// <summary>
        ///  Delete Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task DeleteAsync(AssessmentStructureAssessmentTypeMappingModel entity)
        {
            await _AssessmentStructureAssessmentTypeMappingDataAccess.DeleteAsync(entity.AssessmentStructureAssessmentTypeMapping_Id);
        }

        /// <summary>
        /// Get All RoomMaster Data
        /// </summary>
        /// <param name="objAssessmentStructureAssessmentTypeMappingModel"></param>
        /// <returns></returns>
        public List<AssessmentStructureAssessmentTypeMappingViewModel> GetAssessmentStructureData(AssessmentStructureAssessmentTypeMappingViewModel objAssessmentStructureAssessmentTypeModel)
        {
            List<AssessmentStructureAssessmentTypeMappingViewModel> TableModelList = new List<AssessmentStructureAssessmentTypeMappingViewModel>();

            GEEDbContext context = new GEEDbContext();

            List<AssessmentStructureAssessmentTypeMappingViewModel> _roomMasterTableData = new List<AssessmentStructureAssessmentTypeMappingViewModel>();

            var _data = (from ast in context.AssessmentTYPEs                         
                         join mtl in context.MasterTables on ast.AssessmentGroup_ID equals mtl.MasterTable_id
                         where ast.IsDeleted != true 
                         select new 
                         {                             
                             AssessmentType_Id = ast.AssessmentType_Id,
                             AssessmentType_code = ast.AssessmentType_code,
                             AssessmentType_Name = ast.AssessmentType_Name,
                             MinMarks = ast.MinMarks,
                             MaxMarks = ast.MaxMarks,
                             PassingMarks = ast.PassingMarks,
                             Weightage = ast.Weightage,
                             AssessmentGroup = mtl.Name
                         }).ToList();                          

            var _allddata = context.AssessmentStructureAssessmentTypeMappings.Where(f => f.IsDeleted == false && f.AssessmentStructureID == objAssessmentStructureAssessmentTypeModel.AssessmentStructureID);
            foreach (var itm in _data)
            {
                AssessmentStructureAssessmentTypeMappingViewModel model = new AssessmentStructureAssessmentTypeMappingViewModel();
                
                model.AssessmentType_Id = itm.AssessmentType_Id;
                model.AssessmentType_code = itm.AssessmentType_code;
                model.AssessmentType_Name = itm.AssessmentType_Name;
                model.MinMarks = itm.MinMarks;
                model.MaxMarks = itm.MaxMarks;
                model.PassingMarks = itm.PassingMarks;
                model.Weightage = itm.Weightage;
                model.AssessmentGroup = itm.AssessmentGroup;

                var _modelcheck = _allddata.Where(g => g.AssessmentTypeID == itm.AssessmentType_Id);
                if (_modelcheck != null && _modelcheck.Count() > 0)
                {
                    if (_modelcheck != null && _modelcheck.Count() > 0)
                        model.AssessmentStructureAssessmentTypeMapping_Id = _modelcheck.FirstOrDefault().AssessmentStructureAssessmentTypeMapping_Id;
                }                 
                _roomMasterTableData.Add(model);
            }             
             
            //Sorting
            if (!(string.IsNullOrEmpty(objAssessmentStructureAssessmentTypeModel.SortColumn) && string.IsNullOrEmpty(objAssessmentStructureAssessmentTypeModel.SortOrder)))
            {
                _roomMasterTableData = _roomMasterTableData.OrderBy(objAssessmentStructureAssessmentTypeModel.SortColumn + " " + objAssessmentStructureAssessmentTypeModel.SortOrder).ToList();
            }
            int recordsTotal = _roomMasterTableData.Count();
            var data = _roomMasterTableData.Skip(objAssessmentStructureAssessmentTypeModel.PageNo).Take(objAssessmentStructureAssessmentTypeModel.PageSize).ToList();

            foreach (var item in data)
            {
                AssessmentStructureAssessmentTypeMappingViewModel AssessmentStructureAssessmentTypeModel = new AssessmentStructureAssessmentTypeMappingViewModel();
                AssessmentStructureAssessmentTypeModel.AssessmentStructureAssessmentTypeMapping_Id = item.AssessmentStructureAssessmentTypeMapping_Id;
                AssessmentStructureAssessmentTypeModel.AssessmentType_Id = item.AssessmentType_Id;                
                AssessmentStructureAssessmentTypeModel.AssessmentType_code = item.AssessmentType_code;
                AssessmentStructureAssessmentTypeModel.AssessmentType_Name = item.AssessmentType_Name;
                AssessmentStructureAssessmentTypeModel.MinMarks = item.MinMarks;
                AssessmentStructureAssessmentTypeModel.MaxMarks = item.MaxMarks;
                AssessmentStructureAssessmentTypeModel.PassingMarks = item.PassingMarks;
                AssessmentStructureAssessmentTypeModel.Weightage = item.Weightage;
                AssessmentStructureAssessmentTypeModel.AssessmentGroup = item.AssessmentGroup;
                AssessmentStructureAssessmentTypeModel.RowCount = recordsTotal;
                TableModelList.Add(AssessmentStructureAssessmentTypeModel);

            }

            return TableModelList;
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
        // ~AssessmentStructureAssessmentTypeMappingManager() {
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
