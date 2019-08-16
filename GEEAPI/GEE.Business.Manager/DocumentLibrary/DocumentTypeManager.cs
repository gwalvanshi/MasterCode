using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GEE.DataAccess;
using AutoMapper;
using GEE.Business.Interface.DocumentLibrary;
using GEE.Business.Models.DocumentLibrary;
using System.Linq.Dynamic;
using System.Linq;
using GEE.Business.Model.Admin;

namespace GEE.Business.Manager.DocumentLibrary
{
    public class DocumentTypeManager : IDocumentType
    {
        IMyDataAccess<DocumentType> _documentTypeDataAccess = new MyDataAccess<DocumentType>();

        #region For Delete
        public void Delete(DocumentTypeModel entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(DocumentTypeModel entity)
        {
            throw new NotImplementedException();
        }

        public bool DeleteDocumentType(DocumentTypeModel entity)
        {
            bool result = false;
            var objentity = _documentTypeDataAccess.GetById(entity.DocumentTypeID);
            if (objentity != null)
            {
                objentity.ISDeleted = true;
                objentity.ModifiedBy = entity.ModifiedBy_ID;
                objentity.ModifiedDate = entity.ModifiedDate;
                _documentTypeDataAccess.UpdateAsync(objentity);
                result = true;
            }
            return result;
        }
        #endregion

        #region This for All get Methods

        public List<DocumentTypeModel> GetAll()
        {
            var documentSubList = _documentTypeDataAccess.GetAll();
            documentSubList.ForEach(a => a.MasterTable.DocumentTypes = null);

            List<DocumentTypeModel> documentSubModelList = new List<DocumentTypeModel>();
            foreach (var item in documentSubList)
            {
                if(!(bool)item.ISDeleted)
                    documentSubModelList.Add(Mapper.Map<DocumentTypeModel>(item));

            }
            documentSubModelList.ForEach(a => a.MasterTable.MasterTabletype.MasterTables = null);

            return documentSubModelList;
        }

        public async Task<List<DocumentTypeModel>> GetAllAsync()
        {
            var documentSubList =await  _documentTypeDataAccess.GetAllAsync();
            List<DocumentTypeModel> documentSubModelList = new List<DocumentTypeModel>();
            foreach (var item in documentSubList)
            {
                documentSubModelList.Add(Mapper.Map<DocumentTypeModel>(item));

            }
            return documentSubModelList;
        }

        public DocumentTypeModel GetById(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<DocumentTypeModel> GetByIdAsync(int id)
        {
            var documentTable = await _documentTypeDataAccess.GetByIdAsync(id);
            var documentModel = Mapper.Map<DocumentTypeModel>(documentTable);
            if (documentModel != null)
            {
                documentModel.MasterTable.MasterTabletype = null;
            }
            return documentModel;
        }

        public List<DocumentTypeModel> GetAllDocumentType(int docCtId, int pageNo, int pageSize, string sortOrder, string sortColumn)
        {
            List<DocumentTypeModel> getMasterTableModelList = new List<DocumentTypeModel>();

            GEEDbContext context = new GEEDbContext();

            try
            {
                var masterTableData = (from doctype in context.DocumentTypes
                                       join mst in context.MasterTables on
doctype.DocumentCategoryID equals mst.MasterTable_id
                                       where doctype.ISDeleted != true && mst.Parent_id == docCtId
                                       select new
                                       {
                                           doctype.DocumentTypeID,
                                           doctype.DocumentCategoryID,
                                           doctype.DocumentTypeCode,
                                           doctype.DocumentTypeName,
                                           doctype.FollowupTypeCode,
                                           doctype.Remarks,
                                           doctype.SessionYear,
                                           doctype.IsMandatory,
                                           doctype.ToFollow,
                                           doctype.Digitalallowed,
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
                    var master = context.MasterTables.Where(a => a.MasterTable_id == item.DocumentCategoryID).FirstOrDefault();
                    int followcode = item.FollowupTypeCode != null ? Convert.ToInt32(item.FollowupTypeCode) : 0;
                    DocumentTypeModel objDocumentTypeModel = new DocumentTypeModel();
                    objDocumentTypeModel.DocumentTypeID = item.DocumentTypeID;
                    objDocumentTypeModel.DocumentCategoryID = item.DocumentCategoryID;
                    objDocumentTypeModel.DocumentTypeCode = item.DocumentTypeCode;
                    objDocumentTypeModel.DocumentTypeName = item.DocumentTypeName;
                    objDocumentTypeModel.FollowupTypeCode =  context.MasterTables.Where(a => a.MasterTable_id == followcode).FirstOrDefault()==null?"": context.MasterTables.Where(a => a.MasterTable_id == followcode).FirstOrDefault().Name;
                    objDocumentTypeModel.Remarks = item.Remarks;
                    objDocumentTypeModel.SessionYear = item.SessionYear;
                    objDocumentTypeModel.IsMandatory = item.IsMandatory;
                    objDocumentTypeModel.ToFollow = item.ToFollow;
                    objDocumentTypeModel.Digitalallowed = item.Digitalallowed;
                    objDocumentTypeModel.MasterTable = Mapper.Map<MasterTableModel>(master);
                    getMasterTableModelList.Add(objDocumentTypeModel);

                }
                ///Updated by jiya 10--Aug-2019
                ///Cause: Code breaking while data not available.
                if (recordsTotal > 0)
                {
                    getMasterTableModelList[0].RowCount = recordsTotal;
                    getMasterTableModelList.ForEach(a => a.MasterTable.MasterTabletype = null);
                }
            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }

            return getMasterTableModelList;
        }
        #endregion

        #region For save and Update
        public DocumentTypeModel Save(DocumentTypeModel entity)
        {
            var documentTypeModel = _documentTypeDataAccess.Save(Mapper.Map<DocumentType>(entity));
            return new DocumentTypeModel { DocumentTypeID = documentTypeModel.DocumentTypeID };
        }

        public async Task<DocumentTypeModel> SaveAsync(DocumentTypeModel entity)
        {
            var documentTypeModel = await _documentTypeDataAccess.SaveAsync(Mapper.Map<DocumentType>(entity));
            return new DocumentTypeModel { DocumentTypeID = documentTypeModel.DocumentTypeID };
        }

        public DocumentTypeModel Update(DocumentTypeModel entity)
        {
            var documentTypeModel = _documentTypeDataAccess.Update(Mapper.Map<DocumentType>(entity));
            return new DocumentTypeModel { DocumentTypeID = documentTypeModel.DocumentTypeID };
        }

        public async Task<DocumentTypeModel> UpdateAsync(DocumentTypeModel entity)
        {
            entity.CreatedDate = DateTime.Now;
            entity.ModifiedDate = DateTime.Now;
            var documentTypeModel = await _documentTypeDataAccess.UpdateAsync(Mapper.Map<DocumentType>(entity));
            return new DocumentTypeModel { DocumentTypeID = documentTypeModel.DocumentTypeID };
        }

        public List<DocumentTypeModel> GetAllByCategory(int category)
        {
          var documentSubList = _documentTypeDataAccess.GetAll().FindAll( x => x.DocumentCategoryID == category);
            List<DocumentTypeModel> documentSubModelList = new List<DocumentTypeModel>();
            foreach (var item in documentSubList)
            {
                if (!item.ISDeleted.Value)
                    documentSubModelList.Add(Mapper.Map<DocumentTypeModel>(item));
            }
            documentSubModelList.ForEach(a => a.MasterTable.MasterTabletype.MasterTables = null);
            return documentSubModelList;
        }

        public async Task<List<DocumentTypeModel>> GetAllByCategoryAsync(int category)
        {
            var documentSubList = await _documentTypeDataAccess.GetAllAsync();
            List<DocumentTypeModel> documentSubModelList = new List<DocumentTypeModel>();
            foreach (var item in documentSubList.FindAll(x => x.DocumentCategoryID == category))
            {
                if (!item.ISDeleted.Value)
                    documentSubModelList.Add(Mapper.Map<DocumentTypeModel>(item));
            }
            documentSubModelList.ForEach(a => a.MasterTable.MasterTabletype.MasterTables = null);
            return documentSubModelList;
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
