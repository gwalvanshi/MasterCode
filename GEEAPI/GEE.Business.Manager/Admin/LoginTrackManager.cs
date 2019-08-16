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

namespace GEE.Business.Manager.Admin
{
   public  class LoginTrackManager : ILoginTrack
    {
        IMyDataAccess<LoginTrack> _db = new MyDataAccess<LoginTrack>();

        public void Delete(LoginTrackModel entity)
        {
            _db.Delete(entity.Track_ID);
        }

        public async Task DeleteAsync(LoginTrackModel entity)
        {
            await _db.DeleteAsync(entity.Track_ID);
        }

        public List<LoginTrackModel> GetAll()
        {
            try
            {
                var _local = _db.GetAll();
                List<LoginTrackModel> localList = new List<LoginTrackModel>();
                foreach (var item in _local)
                {
                    localList.Add(Mapper.Map<LoginTrackModel>(item));
                }
                return localList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public async Task<List<LoginTrackModel>> GetAllAsync()
        {
            var _local = await _db.GetAllAsync();
            List<LoginTrackModel> localList = new List<LoginTrackModel>();
            foreach (var item in _local)
            {
                localList.Add(Mapper.Map<LoginTrackModel>(item));

            }
            return localList;
        }

        public LoginTrackModel GetById(int id)
        {
            var _local = _db.GetById(id);
            return Mapper.Map<LoginTrackModel>(_local);
        }

        public async Task<LoginTrackModel> GetByIdAsync(int id)
        {
            return Mapper.Map<LoginTrackModel>(await _db.GetByIdAsync(id));
        }

        public LoginTrackModel Save(LoginTrackModel entity)
        {
            var _local = _db.Save(Mapper.Map<LoginTrack>(entity));
            return new LoginTrackModel { Track_ID = entity.Track_ID };
        }

        public async Task<LoginTrackModel> SaveAsync(LoginTrackModel entity)
        {
            var _local = await _db.SaveAsync(Mapper.Map<LoginTrack>(entity));
            return new LoginTrackModel { Track_ID = entity.Track_ID };
        }

        public LoginTrackModel Update(LoginTrackModel entity)
        {
            var _local = _db.Update(Mapper.Map<LoginTrack>(entity));
            return new LoginTrackModel { Track_ID = entity.Track_ID };
        }

        public async Task<LoginTrackModel> UpdateAsync(LoginTrackModel entity)
        {
            var _local = await _db.UpdateAsync(Mapper.Map<LoginTrack>(entity));
            return new LoginTrackModel { Track_ID = entity.Track_ID };
        }

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
        public void Dispose()
        {
            Dispose(true);
        }
    }
}
