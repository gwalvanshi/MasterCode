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
    public class BookMasterManager : IBookMaster
    {
        IMyDataAccess<BookMaster> _bookDataAccess = new MyDataAccess<BookMaster>();

        ///
        ///Created By: Amit Gajera on 05/04/2019 
        ///


        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<BookMasterModel> GetAll()
        {
            var booksList = _bookDataAccess.GetAll();
            List<BookMasterModel> bookMasterModellList = new List<BookMasterModel>();
            foreach (var item in booksList)
            {
                bookMasterModellList.Add(Mapper.Map<BookMasterModel>(item));

            }
            return bookMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public Task<List<BookMasterModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        ///  Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public BookMasterModel GetById(int id)
        {
            var booksMaster = _bookDataAccess.GetById(id);
            return Mapper.Map<BookMasterModel>(booksMaster);
        }

        /// <summary>
        ///  Get ById Async
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<BookMasterModel> GetByIdAsync(int id)
        {
            return Mapper.Map<BookMasterModel>(await _bookDataAccess.GetByIdAsync(id));
        }

        /// <summary>
        /// Save
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public BookMasterModel Save(BookMasterModel entity)
        {
            var booksMaster = _bookDataAccess.Save(Mapper.Map<BookMaster>(entity));
            return new BookMasterModel { BookMaster_Id = booksMaster.BookMaster_Id };
        }

        /// <summary>
        ///  Save Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<BookMasterModel> SaveAsync(BookMasterModel entity)
        {
            var booksMaster = await _bookDataAccess.SaveAsync(Mapper.Map<BookMaster>(entity));
            return new BookMasterModel { BookMaster_Id = booksMaster.BookMaster_Id };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public BookMasterModel Update(BookMasterModel entity)
        {
            var booksMaster = _bookDataAccess.Update(Mapper.Map<BookMaster>(entity));
            return new BookMasterModel { BookMaster_Id = booksMaster.BookMaster_Id };
        }

        /// <summary>
        /// Update Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<BookMasterModel> UpdateAsync(BookMasterModel entity)
        {
            var booksMaster = await _bookDataAccess.UpdateAsync(Mapper.Map<BookMaster>(entity));
            return new BookMasterModel { BookMaster_Id = booksMaster.BookMaster_Id };
        }


        /// <summary>
        /// Delete 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeActivateBook(int id)
        {

            bool isDelete = false;
            try
            {
                GEEDbContext objGEEDbContext = new GEEDbContext();
                var UserData = objGEEDbContext.BookMasters.Where(a => a.BookMaster_Id == id).FirstOrDefault();
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
        public void Delete(BookMasterModel entity)
        {
            _bookDataAccess.Delete(entity.BookMaster_Id);
        }

        /// <summary>
        ///  Delete Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task DeleteAsync(BookMasterModel entity)
        {
            await _bookDataAccess.DeleteAsync(entity.BookMaster_Id);
        }

        /// <summary>
        /// Get All RoomMaster Data
        /// </summary>
        /// <param name="objBookMasterTableModel"></param>
        /// <returns></returns>
        public List<BookMasterViewModel> GetAllBookMasterData(BookMasterViewModel objBookMasterModel)        
        {
            List<BookMasterViewModel> getRoomMasterTableModelList = new List<BookMasterViewModel>();

            GEEDbContext context = new GEEDbContext();


            var _roomMasterTableData = (from mstTbl in context.BookMasters                                         
                                         where mstTbl.IsDeleted != true
                                         select new
                                         {
                                             mstTbl.BookMaster_Id,
                                             mstTbl.Code,
                                             mstTbl.name,
                                             mstTbl.Publisher,
                                             mstTbl.ISBN,
                                             mstTbl.MRP,
                                             mstTbl.Version,
                                             mstTbl.Discount
                                         });


            //Sorting
            if (!(string.IsNullOrEmpty(objBookMasterModel.SortColumn) && string.IsNullOrEmpty(objBookMasterModel.SortOrder)))
            {
                _roomMasterTableData = _roomMasterTableData.OrderBy(objBookMasterModel.SortColumn + " " + objBookMasterModel.SortOrder);
            }
            int recordsTotal = _roomMasterTableData.Count();
            var data = _roomMasterTableData.Skip(objBookMasterModel.PageNo).Take(objBookMasterModel.PageSize).ToList();

            foreach (var item in data)
            {
                BookMasterViewModel objBookMaster= new BookMasterViewModel();
                objBookMaster.BookMaster_Id = item.BookMaster_Id;
                objBookMaster.Code = item.Code;
                objBookMaster.name = item.name;
                objBookMaster.Publisher = item.Publisher;
                objBookMaster.ISBN = item.ISBN;
                objBookMaster.MRP = item.MRP;
                objBookMaster.Version = item.Version;
                objBookMaster.Discount = item.Discount;

                objBookMaster.RowCount = recordsTotal;
                getRoomMasterTableModelList.Add(objBookMaster);

            }

            return getRoomMasterTableModelList;
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
        // ~RoomsManager() {
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
