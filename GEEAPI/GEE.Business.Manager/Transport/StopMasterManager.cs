using AutoMapper;
using GEE.Business.Interface.Transport;
using GEE.Business.Model.Transport;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Dynamic;

namespace GEE.Business.Manager.Transport
{

    public class StopMasterManager: IStopMaster
    {
        IMyDataAccess<StopMaster> _StopMasterDataAccess = new MyDataAccess<StopMaster>();

        ///
        ///Created By: Shivani on 29/07/2019 
        ///


        /// <summary>
        ///  Get All
        /// </summary>
        /// <returns></returns>
        public List<StopMasterModel> GetAll()
        {
            var StopMasterList = _StopMasterDataAccess.GetAll();
            List<StopMasterModel> StopMasterModellList = new List<StopMasterModel>();
            foreach (var item in StopMasterList)
            {
                StopMasterModellList.Add(Mapper.Map<StopMasterModel>(item));

            }
            return StopMasterModellList;
        }

        /// <summary>
        ///  Get All Async
        /// </summary>
        /// <returns></returns>
        public async Task<List<StopMasterModel>> GetAllAsync()
        {
            var StopMasterList = await _StopMasterDataAccess.GetAllAsync();
            List<StopMasterModel> StopMasterModellList = new List<StopMasterModel>();
            foreach (var item in StopMasterList)
            {
                StopMasterModellList.Add(Mapper.Map<StopMasterModel>(item));

            }
            return StopMasterModellList;

        }

        /// <summary>
        ///  Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public StopMasterModel GetById(int id)
        {
            var StopMasterMaster = _StopMasterDataAccess.GetById(id);
            return Mapper.Map<StopMasterModel>(StopMasterMaster);
        }

        /// <summary>
        ///  Get ById Async
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<StopMasterModel> GetByIdAsync(int id)
        {
            return Mapper.Map<StopMasterModel>(await _StopMasterDataAccess.GetByIdAsync(id));
        }

        /// <summary>
        /// Save
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public StopMasterModel Save(StopMasterModel entity)
        {
            var StopMasterMaster = _StopMasterDataAccess.Save(Mapper.Map<StopMaster>(entity));
            return new StopMasterModel { StopMasterID = StopMasterMaster.StopMasterID };
        }

        /// <summary>
        ///  Save Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<StopMasterModel> SaveAsync(StopMasterModel entity)
        {
            var StopMasterMaster = await _StopMasterDataAccess.SaveAsync(Mapper.Map<StopMaster>(entity));
            return new StopMasterModel { StopMasterID = StopMasterMaster.StopMasterID };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public StopMasterModel Update(StopMasterModel entity)
        {
            var StopMasterMaster = _StopMasterDataAccess.Update(Mapper.Map<StopMaster>(entity));
            return new StopMasterModel { StopMasterID = StopMasterMaster.StopMasterID };
        }

        /// <summary>
        /// Update Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<StopMasterModel> UpdateAsync(StopMasterModel entity)
        {

            var StopMasterMaster = await _StopMasterDataAccess.UpdateAsync(Mapper.Map<StopMaster>(entity));
            return new StopMasterModel { StopMasterID = StopMasterMaster.StopMasterID };

        }


        /// <summary>
        /// Delete 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteStopMaster(StopMasterModel entity)
        {

            bool isDelete = false;
            try
            {
                var objentity = _StopMasterDataAccess.GetById(entity.StopMasterID);
                if (objentity != null)
                {
                    objentity.IsDeleted = true;
                    objentity.Modifiedby_ID = (int)entity.ModifiedBy_ID;
                    objentity.ModifiedDate = (DateTime)entity.ModifiedDate;
                    _StopMasterDataAccess.UpdateAsync(objentity);
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
        public void Delete(StopMasterModel entity)
        {
            _StopMasterDataAccess.Delete(entity.StopMasterID);
        }

        /// <summary>
        ///  Delete Async
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task DeleteAsync(StopMasterModel entity)
        {
            await _StopMasterDataAccess.DeleteAsync(entity.StopMasterID);
        }

        /// <summary>
        /// Get All stop Master Data
        /// </summary>
        /// <param name="objStopMasterTableModel"></param>
        /// <returns></returns>
        public List<StopMasterModel> GetAllStopMasterData(int pageNo, int pageSize, string sortOrder, string sortColumn)
        {
            List<StopMasterModel> getstopModelList = new List<StopMasterModel>();
            GEEDbContext context = new GEEDbContext();

            var masterTableData = (from stopmstrTbl in context.StopMasters.Where(a => a.IsDeleted == false)
                                   select new
                                   {
                                       stopmstrTbl.StopMasterID,
                                       stopmstrTbl.StopCode,
                                       stopmstrTbl.StopName,
                                       stopmstrTbl.Locality,
                                       stopmstrTbl.StopAddress,
                                       stopmstrTbl.PinCode,
                                       stopmstrTbl.GeoCoordinates,
                                       stopmstrTbl.Sessionyear,
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
                StopMasterModel stopmstrTbl = new StopMasterModel();
                stopmstrTbl.StopMasterID = item.StopMasterID;
                stopmstrTbl.StopCode = item.StopCode;
                stopmstrTbl.StopName = item.StopName;
                stopmstrTbl.Locality = item.Locality;
                stopmstrTbl.StopAddress = item.StopAddress;
                stopmstrTbl.PinCode = item.PinCode;
                stopmstrTbl.GeoCoordinates = item.GeoCoordinates;
                stopmstrTbl.Sessionyear = item.Sessionyear;
                getstopModelList.Add(stopmstrTbl);

            }
            if (getstopModelList.Count>0)
                getstopModelList[0].RowCount = recordsTotal;
            return getstopModelList;
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
