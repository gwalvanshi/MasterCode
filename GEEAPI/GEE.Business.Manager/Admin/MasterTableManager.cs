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
using System.Data.SqlClient;
using GEE.Business.Model.Security;
using System.Linq.Dynamic;
namespace GEE.Business.Manager.Admin
{
    public class MasterTableManager : IMasterTable
    {
        IMyDataAccess<MasterTable> _masterTableDataAccess = new MyDataAccess<MasterTable>();
        IMyDataAccess<MasterTabletype> _masterTableType = new MyDataAccess<MasterTabletype>();

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
        // ~MasterTableManager() {
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

        public List<MasterTableModel> GetMasterData(int ? masterTableId,int? masterTypeId, int? schoolId, int? groupId, int? sessionYear, bool? isDeleted)
        {
            List<MasterTableModel> getMasterTableModelList = new List<MasterTableModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var P1 = masterTableId != null ? new SqlParameter("@MasterTableId", masterTableId) : new SqlParameter("@MasterTableId", DBNull.Value);
                    var P2 = masterTypeId != null ? new SqlParameter("@MasterTypeId", masterTypeId): new SqlParameter("@MasterTypeId", DBNull.Value);
                    var P3 = schoolId != null ? new SqlParameter("@SchoolId", schoolId) : new SqlParameter("@SchoolId", DBNull.Value);
                    var P4 = groupId != null ? new SqlParameter("@GroupId", groupId) : new SqlParameter("@GroupId", DBNull.Value);
                    var P5 = sessionYear != null ? new SqlParameter("@SessionYear", sessionYear) : new SqlParameter("@SessionYear", DBNull.Value);
                    var P6 = isDeleted != null ? new SqlParameter("@IsDeleted", isDeleted) : new SqlParameter("@IsDeleted", DBNull.Value);

                    getMasterTableModelList = context.Database.SqlQuery<MasterTableModel>("GetMasterTableRecord @MasterTableId, @MasterTypeId,@SchoolId,@GroupId,@SessionYear,@IsDeleted", P1,P2,P3,P4,P5,P6).ToList();
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return getMasterTableModelList;
        }

        public MasterTableModel Save(MasterTableModel entity)
        {
            var masterTable = _masterTableDataAccess.Save(Mapper.Map<MasterTable>(entity));
            return new MasterTableModel { MasterTable_id = masterTable.MasterTable_id };
        }

        public async Task<MasterTableModel> SaveAsync(MasterTableModel entity)
        {
            var isExist = ChechIsDefaultInMasterTable((int)entity.SchoolID, (int)entity.GroupID);
            if ((bool)entity.IsDefault && isExist)
                UpdateIsDefault((int)entity.SchoolID, (int)entity.GroupID);
            var masterTable = await _masterTableDataAccess.SaveAsync(Mapper.Map<MasterTable>(entity));
            return new MasterTableModel { MasterTable_id = masterTable.MasterTable_id };
        }

        public bool UpdateIsDefault(int schoolId, int grouupId)
        {
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    //var P1 = schoolId != 0 ? new SqlParameter("@SchoolId", schoolId) : new SqlParameter("@SchoolId", DBNull.Value);
                    //var P2 = grouupId != 0 ? new SqlParameter("@GroupId", grouupId) : new SqlParameter("@GroupId", DBNull.Value);

                    //var res = context.Database.SqlQuery<int>("UpdateMasterTable @SchoolId, @GroupId", P1, P2);
                    var mastertable = context.MasterTables.Where(a => a.SchoolID == schoolId && a.GroupID == grouupId && a.IsDefault == true).FirstOrDefault();
                    mastertable.IsDefault = false;
                    if (mastertable != null)
                        _masterTableDataAccess.UpdateAsync(mastertable);
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return true;
        }

        public void Delete(MasterTableModel entity)
        {
            _masterTableDataAccess.Delete(entity.MasterTable_id);
        }

        public async Task DeleteAsync(MasterTableModel entity)
        {
            await _masterTableDataAccess.DeleteAsync(entity.MasterTable_id);
        }
        public bool DeleteMaster(MasterTableModel entity)
        {
            bool result = false;
            var objentity = _masterTableDataAccess.GetById(entity.MasterTable_id);
            if (objentity != null)
            {
                objentity.ISDeleted = true;
                objentity.ModifiedBy_ID = entity.ModifiedBy_ID;
                objentity.ModifiedDate = entity.ModifiedDate;
                 _masterTableDataAccess.UpdateAsync(objentity);
                result = true;
            }
            return result;
        }

        public List<MasterTableModel> GetAll()
        {
            try
            {
                var masterTableList = _masterTableDataAccess.GetAll().Where(a=>a.ISDeleted==false);
                List<MasterTableModel> MasterTableModelList = new List<MasterTableModel>();
                foreach (var item in masterTableList)
                {
                    MasterTableModelList.Add(Mapper.Map<MasterTableModel>(item));
                }
                return MasterTableModelList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }
       
        public async Task<List<MasterTableModel>> GetAllAsync()
        {
            var enquiryList = await _masterTableDataAccess.GetAllAsync();
            List<MasterTableModel> MasterTableModelList = new List<MasterTableModel>();
            foreach (var item in enquiryList)
            {
                MasterTableModelList.Add(Mapper.Map<MasterTableModel>(item));

            }
            return MasterTableModelList;
        }

        public async Task<MasterTableModel> GetByIdAsync(int id)
        {
            var masterTable = await _masterTableDataAccess.GetByIdAsync(id);
            if (masterTable != null && masterTable.MasterTabletype != null)
            {
                while (masterTable.MasterTabletype.MasterTables != null)
                {
                    masterTable.MasterTabletype.MasterTables = null;
                }

            }
            return Mapper.Map<MasterTableModel>(masterTable);
        }

        public MasterTableModel GetById(int id)
        {
            var masterTable = _masterTableDataAccess.GetById(id);
            return Mapper.Map<MasterTableModel>(masterTable);
        }

        public MasterTableModel Update(MasterTableModel entity)
        {
            var masterTable = _masterTableDataAccess.Update(Mapper.Map<MasterTable>(entity));
            return new MasterTableModel { MasterTable_id = masterTable.MasterTable_id };
        }

        public async Task<MasterTableModel> UpdateAsync(MasterTableModel entity)
        {
            var isExist = ChechIsDefaultInMasterTable((int)entity.SchoolID, (int)entity.GroupID);
            if ((bool)entity.IsDefault && isExist)
                UpdateIsDefault((int)entity.SchoolID, (int)entity.GroupID);

            entity.CreatedDate = DateTime.Now;
            entity.ModifiedDate = DateTime.Now;
            var masterTable = await _masterTableDataAccess.UpdateAsync(Mapper.Map<MasterTable>(entity));
            return new MasterTableModel { MasterTable_id = masterTable.MasterTable_id };
        }

        public MasterTableTypeModel GetParentValues(int masterTypeId)
        {
            MasterTableTypeModel masterTableTypeModel = new MasterTableTypeModel();
            masterTableTypeModel.MasterTables = new List<MasterTableModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var ParentId = context.MasterTabletypes.Find(masterTypeId)?.ParentId;
                    var getParentmasterTabletype = context.MasterTabletypes.Where(a => a.Mastertabletype_id == ParentId).FirstOrDefault();
                    masterTableTypeModel = Mapper.Map<MasterTableTypeModel>(getParentmasterTabletype);
                    if (masterTableTypeModel != null)
                        masterTableTypeModel.MasterTables.ForEach(a => a.MasterTabletype = null);

                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return masterTableTypeModel;
        }
       
        public bool ChechIsDefaultInMasterTable(int schoolId,int grouupId)
        {
            bool isExist = false;
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var P1 = schoolId != null ? new SqlParameter("@SchoolId", schoolId) : new SqlParameter("@SchoolId", DBNull.Value);
                    var P2 = grouupId != null ? new SqlParameter("@GroupId", grouupId) : new SqlParameter("@GroupId", DBNull.Value);

                    var Count = context.Database.SqlQuery<int>("CheckIsDefault @SchoolId, @GroupId", P1, P2).FirstOrDefault();
                    if (Count != null && Convert.ToInt32(Count) > 0)
                        isExist = true;
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return isExist;
        }
        /// <summary>
        /// This method is used to get Master data to bind datagrid table
        /// Added by Jiya
        /// Date: 30 April 2019
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <param name="sortOrder"></param>
        /// <param name="sortColumn"></param>
        /// <returns></returns>
       public List<MasterTableModel> GetAllMasterData(MasterTableModel objMasterTableModel)
        {
            List<MasterTableModel> getMasterTableModelList = new List<MasterTableModel>();

            GEEDbContext context = new GEEDbContext();
          

            var masterTableData = (from mstTbl in context.MasterTables
                                   join mng in context.MasterTables on mstTbl.Parent_id equals mng.MasterTable_id into tempJoin
                                   from t2 in tempJoin.DefaultIfEmpty()
                                   where mstTbl.ISDeleted!=true && mstTbl.Mastertabletype_id== objMasterTableModel.Mastertabletype_id
                                   select new {
                                       mstTbl.MasterTable_id,
                                       mstTbl.Mastertabletype_id,
                                       mstTbl.Code,
                                       mstTbl.Name,
                                       mstTbl.Parent_id,
                                       mstTbl.Remark,
                                       mstTbl.Sessionyear,
                                       mstTbl.IsDefault,                                  
                                       ParentName = (t2.Name == null ? String.Empty : t2.Name),
                                       DefaultValue = mstTbl.IsDefault == true ? "Yes" : "No"
                                       });
          

            //Sorting
            if (!(string.IsNullOrEmpty(objMasterTableModel.SortColumn) && string.IsNullOrEmpty(objMasterTableModel.SortOrder)))
            {
                masterTableData = masterTableData.OrderBy(objMasterTableModel.SortColumn + " " + objMasterTableModel.SortOrder);
            }
           int recordsTotal = masterTableData.Count();
            var data = masterTableData.Skip(objMasterTableModel.PageNo).Take(objMasterTableModel.PageSize).ToList();
           
            foreach (var item in data)
            {
                MasterTableModel objMasterModel = new MasterTableModel();
                objMasterModel.MasterTable_id = item.MasterTable_id;
                objMasterModel.Mastertabletype_id = item.Mastertabletype_id;
                objMasterModel.Code = item.Code;
                objMasterModel.Name = item.Name;
                objMasterModel.Parent_id = item.Parent_id;
                objMasterModel.Remark = item.Remark;
                objMasterModel.Sessionyear = item.Sessionyear;
                objMasterModel.IsDefault = item.IsDefault;
                objMasterModel.ParentName = item.ParentName;
                objMasterModel.DefaultValue = item.DefaultValue;
                objMasterModel.RowCount = recordsTotal;
                getMasterTableModelList.Add(objMasterModel);

            }          
           
            return getMasterTableModelList;
        }

    }
}
