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
    public class CourseMasterManager : ICourseMaster
    {
        IMyDataAccess<CourseMaster> _courseMasterAccess = new MyDataAccess<CourseMaster>();
        ///
        ///Created By: Amixa on 11 may,2019        
        ///

        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<CourseMasterModel> GetAll()
        {
            var courseMasterList = _courseMasterAccess.GetAll();
            List<CourseMasterModel> courseMasterModellList = new List<CourseMasterModel>();
            foreach (var item in courseMasterList)
            {
                courseMasterModellList.Add(Mapper.Map<CourseMasterModel>(item));

            }
            return courseMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public Task<List<CourseMasterModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        ///  Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CourseMasterModel GetById(int id)
        {
            var courseMaster = _courseMasterAccess.GetById(id);
            return Mapper.Map<CourseMasterModel>(courseMaster);
        }

        /// <summary>
        ///  Get ById Async
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<CourseMasterModel> GetByIdAsync(int id)
        {
            return Mapper.Map<CourseMasterModel>(await _courseMasterAccess.GetByIdAsync(id));
        }

        /// <summary>
        /// Save
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public CourseMasterModel Save(CourseMasterModel entity)
        {
            var courseMaster = _courseMasterAccess.Save(Mapper.Map<CourseMaster>(entity));
            return new CourseMasterModel { CourseMaster_ID = courseMaster.CourseMaster_ID };
        }

        /// <summary>
        ///  Save Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<CourseMasterModel> SaveAsync(CourseMasterModel entity)
        {
            var courseMaster = await _courseMasterAccess.SaveAsync(Mapper.Map<CourseMaster>(entity));
            return new CourseMasterModel { CourseMaster_ID = courseMaster.CourseMaster_ID };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public CourseMasterModel Update(CourseMasterModel entity)
        {
            var courseMaster = _courseMasterAccess.Update(Mapper.Map<CourseMaster>(entity));
            return new CourseMasterModel { CourseMaster_ID = courseMaster.CourseMaster_ID };
        }

        /// <summary>
        /// Update Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<CourseMasterModel> UpdateAsync(CourseMasterModel entity)
        {
            var courseMaster = await _courseMasterAccess.UpdateAsync(Mapper.Map<CourseMaster>(entity));
            return new CourseMasterModel { CourseMaster_ID = courseMaster.CourseMaster_ID };
        }


        /// <summary>
        /// Delete 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeActivateCourse(int id)
        {

            bool isDelete = false;
            try
            {
                GEEDbContext objGEEDbContext = new GEEDbContext();
                var _Data = objGEEDbContext.CourseMasters.Where(a => a.CourseMaster_ID == id).FirstOrDefault();
                _Data.IsDeleted = true;
                objGEEDbContext.Entry(_Data).State = System.Data.Entity.EntityState.Modified;
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
        public void Delete(CourseMasterModel entity)
        {
            _courseMasterAccess.Delete(entity.CourseMaster_ID);
        }

        /// <summary>
        ///  Delete Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task DeleteAsync(CourseMasterModel entity)
        {
            await _courseMasterAccess.DeleteAsync(entity.CourseMaster_ID);
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
        // ~CourceManager() {
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
