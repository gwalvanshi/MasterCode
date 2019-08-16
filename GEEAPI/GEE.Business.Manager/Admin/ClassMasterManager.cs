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

namespace GEE.Business.Manager.Admin
{
    public class ClassMasterManager : IClassMaster
    {
        IMyDataAccess<ClassMaster> _classesDataAccess = new MyDataAccess<ClassMaster>();

        ///
        ///Created By: Amit Gajera on 05/01/2019 
        ///


        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<ClassMasterModel> GetAll()
        {
            var classesList = _classesDataAccess.GetAll();
            List<ClassMasterModel> classMasterModellList = new List<ClassMasterModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<ClassMasterModel>(item));

            }
            return classMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public async Task<List<ClassMasterModel>> GetAllAsync()
        {
            var classesList = await _classesDataAccess.GetAllAsync();
            List<ClassMasterModel> classMasterModellList = new List<ClassMasterModel>();
            foreach (var item in classesList)
            {
                classMasterModellList.Add(Mapper.Map<ClassMasterModel>(item));
            }
            return classMasterModellList;
            //throw new NotImplementedException();
        }

        /// <summary>
        ///  Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ClassMasterModel GetById(int id)
        {
            var classesMaster = _classesDataAccess.GetById(id);
            return Mapper.Map<ClassMasterModel>(classesMaster);
        }

        /// <summary>
        ///  Get ById Async
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<ClassMasterModel> GetByIdAsync(int id)
        {
            return Mapper.Map<ClassMasterModel>(await _classesDataAccess.GetByIdAsync(id));
        }

        /// <summary>
        /// Save
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public ClassMasterModel Save(ClassMasterModel entity)
        {
            var classesMaster = _classesDataAccess.Save(Mapper.Map<ClassMaster>(entity));
            return new ClassMasterModel { ClassMaster_ID = classesMaster.ClassMaster_ID };
        }

        /// <summary>
        ///  Save Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<ClassMasterModel> SaveAsync(ClassMasterModel entity)
        {
            var classesMaster = await _classesDataAccess.SaveAsync(Mapper.Map<ClassMaster>(entity));
            return new ClassMasterModel { ClassMaster_ID = classesMaster.ClassMaster_ID };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public ClassMasterModel Update(ClassMasterModel entity)
        {
            var classesMaster = _classesDataAccess.Update(Mapper.Map<ClassMaster>(entity));
            return new ClassMasterModel { ClassMaster_ID = classesMaster.ClassMaster_ID };
        }

        /// <summary>
        /// Update Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<ClassMasterModel> UpdateAsync(ClassMasterModel entity)
        {
            var classesMaster = await _classesDataAccess.UpdateAsync(Mapper.Map<ClassMaster>(entity));
            return new ClassMasterModel { ClassMaster_ID = classesMaster.ClassMaster_ID };
        }


        /// <summary>
        /// Delete 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeActivateClass(int id)
        {

            bool isDelete = false;
            try
            {
                GEEDbContext objGEEDbContext = new GEEDbContext();
                var UserData = objGEEDbContext.ClassMasters.Where(a => a.ClassMaster_ID == id).FirstOrDefault();
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
        public void Delete(ClassMasterModel entity)
        {
            _classesDataAccess.Delete(entity.ClassMaster_ID);
        }

        /// <summary>
        ///  Delete Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task DeleteAsync(ClassMasterModel entity)
        {
            await _classesDataAccess.DeleteAsync(entity.ClassMaster_ID);
        }

        /// <summary>
        /// Get All ClassMaster Data
        /// </summary>
        /// <param name="objClassMasterTableModel"></param>
        /// <returns></returns>
        public List<ClassMasterViewModel> GetAllClassMasterData(ClassMasterViewModel objClassMasterTableModel)
        {
            List<ClassMasterViewModel> getClassMasterTableModelList = new List<ClassMasterViewModel>();

            GEEDbContext context = new GEEDbContext();


            var _classMasterTableData = (from mstTbl in context.ClassMasters
                                         join mng in context.MasterTables on mstTbl.ClassClassification_Id equals mng.MasterTable_id
                                         where mstTbl.IsDeleted != true
                                         select new
                                         {
                                             mstTbl.ClassMaster_ID,
                                             mstTbl.Code,
                                             mstTbl.Name,
                                             mstTbl.Sequence,
                                             mstTbl.TotalSections,
                                             ClassClassification = mng.Name
                                         });


            //Sorting
            if (!(string.IsNullOrEmpty(objClassMasterTableModel.SortColumn) && string.IsNullOrEmpty(objClassMasterTableModel.SortOrder)))
            {
                _classMasterTableData = _classMasterTableData.OrderBy(objClassMasterTableModel.SortColumn + " " + objClassMasterTableModel.SortOrder);
            }
            int recordsTotal = _classMasterTableData.Count();
            var data = _classMasterTableData.Skip(objClassMasterTableModel.PageNo).Take(objClassMasterTableModel.PageSize).ToList();

            foreach (var item in data)
            {
                ClassMasterViewModel objMasterModel = new ClassMasterViewModel();
                objMasterModel.ClassMaster_ID = item.ClassMaster_ID;
                objMasterModel.ClassClassification = item.ClassClassification;
                objMasterModel.Code = item.Code;
                objMasterModel.Name = item.Name;
                objMasterModel.Sequence = item.Sequence;
                objMasterModel.TotalSections = item.TotalSections;
                objMasterModel.RowCount = recordsTotal;
                getClassMasterTableModelList.Add(objMasterModel);

            }

            return getClassMasterTableModelList;
        }

        public async Task<List<ClassWithCourceViewModel>> GetAllClassWithCourceCheck()
        {
            GEEDbContext _db = new GEEDbContext();
            var classesList = await _classesDataAccess.GetAllAsync();
            List<ClassWithCourceViewModel> classMasterModellList = new List<ClassWithCourceViewModel>();
            foreach (var item in classesList.Where(f => f.IsDeleted == false))
            {
                ClassWithCourceViewModel _model = new ClassWithCourceViewModel();

                var _data = _db.CourseMasters.Where(f => f.ClassMaster_ID == item.ClassMaster_ID && f.IsDeleted == false);
                if (_data != null && _data.Count() > 0)
                {
                    _model.CountCourseRecord = _data.Count();
                }
                _model.ClassMaster_ID = item.ClassMaster_ID;
                _model.Name = item.Name;
                _model.Code = item.Code;

                classMasterModellList.Add(_model);
            }
            return classMasterModellList;
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
