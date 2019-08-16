using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GEE.DataAccess;
using AutoMapper;
using GEE.Business.Interface.SchoolSetup;
using GEE.Business.Models.SchoolSetup;
using System.Linq.Dynamic;
using System.Linq;

namespace GEE.Business.Manager.SchoolSetup
{
    public class RoomManager : IRoomMaster
    {
        IMyDataAccess<RoomMaster> _roomMasterDataAccess = new MyDataAccess<RoomMaster>();

        #region All get Methods

        public List<RoomModel> GetAll()
        {
            var roomList = _roomMasterDataAccess.GetAll();

            List<RoomModel> roomModelList = new List<RoomModel>();
            foreach (var item in roomList)
            {
                if (!(bool)item.IsDeleted)
                {
                    roomModelList.Add(Mapper.Map<RoomModel>(item));
                }
            }
            return roomModelList;
        }

        public async Task<List<RoomModel>> GetAllAsync()
        {
            var roomList = await _roomMasterDataAccess.GetAllAsync();
            List<RoomModel> roomModelList = new List<RoomModel>();

            if (roomList.Count > 0)
            {
                foreach (var item in roomList)
                {
                    roomModelList.Add(Mapper.Map<RoomModel>(item));
                }
            }
            return roomModelList;
        }
    
        public async Task<RoomModel> GetByIdAsync(int id)
        {
            var roomTable = await _roomMasterDataAccess.GetByIdAsync(id);
            var roomModel = Mapper.Map<RoomModel>(roomTable);

            return roomModel;
        }

        public List<RoomModel> GetAllRooms(int pageNo, int pageSize, string sortOrder, string sortColumn)
        {
            RoomModel roomModel;
            List<RoomModel> getRoomModelList = new List<RoomModel>();
            GEEDbContext context = new GEEDbContext();

           

            var masterTableData = from RM in context.RoomMasters.AsEnumerable()
                                  join BM in context.MasterTables.AsEnumerable()
                                   on Convert.ToInt32(RM.Building_ID) 
                                   equals BM.MasterTable_id
                                  where RM.IsDeleted.Equals(false)
                                  where BM.ISDeleted.Equals(false)
                                  select new {
                                                RM.RoomMaster_ID,
                                                RM.Building_ID,
                                                BuildingName=BM.Name,
                                                RM.Code,
                                                RM.Name,
                                                RM.SeatingCapicity,
                                                RM.GeoCoordinates,
                                                RM.Remarks,
                                                RM.Sessionyear,
                                   };


            //var masterTableData = (from mstTbl in context.RoomMasters.Where(a => a.IsDeleted == false)
            //                       select new
            //                       {
            //                           mstTbl.RoomMaster_ID,
            //                           mstTbl.Building_ID,
            //                           mstTbl.Code,
            //                           mstTbl.Name,
            //                           mstTbl.SeatingCapicity,
            //                           mstTbl.GeoCoordinates,
            //                           mstTbl.Remarks,
            //                           mstTbl.Sessionyear,
            //                       });

            //Sorting
            if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortOrder)))
            {
                masterTableData = masterTableData.OrderBy(sortColumn + " " + sortOrder);
            }
            int recordsTotal = masterTableData.Count();
            var data = masterTableData.Skip(pageNo).Take(pageSize).ToList();

            if (recordsTotal > 0)
            {
                foreach (var item in data)
                {
                    roomModel = new RoomModel();
                    roomModel.RoomMaster_ID = item.RoomMaster_ID;
                    roomModel.Building_ID = item.Building_ID;
                    roomModel.BuildingName = item.BuildingName;
                    roomModel.Code = item.Code;
                    roomModel.Name = item.Name;
                    roomModel.SeatingCapicity = item.SeatingCapicity;
                    roomModel.GeoCoordinates = item.GeoCoordinates;
                    roomModel.Remarks = item.Remarks;
                    roomModel.Sessionyear = item.Sessionyear;
                    getRoomModelList.Add(roomModel);
                }
                ///Updated by jiya 10--Aug-2019
                ///Cause: Code breaking while data not available.
                if (recordsTotal>0)
                getRoomModelList[0].RowCount = recordsTotal;
            }
            return getRoomModelList;
        }

        public RoomModel GetById(int id)
        {
            throw new NotImplementedException();
        }

        #endregion

        #region Save
        public RoomModel Save(RoomModel entity)
        {
            entity.CreatedDate = DateTime.Now;
            entity.ModifiedDate = DateTime.Now;

            var roomModel = _roomMasterDataAccess.Save(Mapper.Map<RoomMaster>(entity));
            return new RoomModel { RoomMaster_ID = roomModel.RoomMaster_ID };
        }

        public async Task<RoomModel> SaveAsync(RoomModel entity)
        {
            entity.CreatedDate = DateTime.Now;
            entity.ModifiedDate = DateTime.Now;

            var roomModel = await _roomMasterDataAccess.SaveAsync(Mapper.Map<RoomMaster>(entity));
            return new RoomModel { RoomMaster_ID = roomModel.RoomMaster_ID };
        }
        #endregion

        #region Update
        public RoomModel Update(RoomModel entity)
        {
            ///Updated by jiya 10--Aug-2019
            ///Cause: Code breaking while data not available.
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var roomMaster = objGEEDbContext.RoomMasters.Where(a => a.RoomMaster_ID == entity.RoomMaster_ID).FirstOrDefault();
            roomMaster.Building_ID = entity.Building_ID;
            roomMaster.Modifiedby_ID =Convert.ToInt32(entity.ModifiedBy_ID);
            roomMaster.ModifiedDate = DateTime.Now;
            roomMaster.Name = entity.Name;
            roomMaster.Code = entity.Code;
            roomMaster.SeatingCapicity = entity.SeatingCapicity;
            roomMaster.Remarks = entity.Remarks;
            roomMaster.GeoCoordinates = entity.GeoCoordinates;
            objGEEDbContext.Entry(roomMaster).State = System.Data.Entity.EntityState.Modified;
            objGEEDbContext.SaveChanges();
            

                return new RoomModel { RoomMaster_ID = roomMaster.RoomMaster_ID };
        }

        public async Task<RoomModel> UpdateAsync(RoomModel entity)
        {
            ///Updated by jiya 10--Aug-2019
            ///Cause: Code breaking while data not available.
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var roomMaster = objGEEDbContext.RoomMasters.Where(a => a.RoomMaster_ID == entity.RoomMaster_ID).FirstOrDefault();
            roomMaster.Building_ID = entity.Building_ID;
            roomMaster.Modifiedby_ID = Convert.ToInt32(entity.ModifiedBy_ID);
            roomMaster.ModifiedDate = DateTime.Now;
            roomMaster.Name = entity.Name;
            roomMaster.Code = entity.Code;
            roomMaster.SeatingCapicity = entity.SeatingCapicity;
            roomMaster.Remarks = entity.Remarks;
            roomMaster.GeoCoordinates = entity.GeoCoordinates;
            objGEEDbContext.Entry(roomMaster).State = System.Data.Entity.EntityState.Modified;
            int x=await  objGEEDbContext.SaveChangesAsync();
            return new RoomModel { RoomMaster_ID = roomMaster.RoomMaster_ID };           
        }

        #endregion

        #region Delete

        public bool DeleteRoom(RoomModel entity)
        {
            bool result = false;
            var objentity = _roomMasterDataAccess.GetById(entity.RoomMaster_ID);
            if (objentity != null)
            {
                objentity.IsDeleted = true;
                objentity.Modifiedby_ID = Convert.ToInt32(entity.ModifiedBy_ID);
                objentity.ModifiedDate = DateTime.Now;
                _roomMasterDataAccess.UpdateAsync(objentity);
                result = true;
            }
            return result;
        }

        public void Delete(RoomModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(RoomModel entity)
        {
            throw new NotImplementedException();
        }

        #endregion

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
