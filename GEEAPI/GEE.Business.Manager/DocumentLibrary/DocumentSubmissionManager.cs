using AutoMapper;
using GEE.Business.Interface.DocumentLibrary;
using GEE.Business.Models.DocumentLibrary;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace GEE.Business.Manager.DocumentLibrary
{
   public class DocumentSubmissionManager:IDocumentSubmission
    {
        IMyDataAccess<DocumentSubmissionDetail> _documentSubDataAccess = new MyDataAccess<DocumentSubmissionDetail>();
        IMyDataAccess<DocumentAuditlog> _documentAuditDataAccess = new MyDataAccess<DocumentAuditlog>();

        public void Delete(DocumentSubmissionModel entity)
        {
            _documentSubDataAccess.Delete(entity.DocumentSubmission_ID);
        }

        public async Task DeleteAsync(DocumentSubmissionModel entity)
        {
           await _documentSubDataAccess.DeleteAsync(entity.DocumentSubmission_ID);
        }

        public List<DocumentSubmissionModel> GetAll()
        {
            var documentSubList =  _documentSubDataAccess.GetAll();
            List<DocumentSubmissionModel> documentSubModelList = new List<DocumentSubmissionModel>();
            foreach (var item in documentSubList)
            {
                documentSubModelList.Add(Mapper.Map<DocumentSubmissionModel>(item));

            }
            return documentSubModelList;
        }

        public  async Task<List<DocumentSubmissionModel>> GetAllAsync()
        {
            var documentSubList = await _documentSubDataAccess.GetAllAsync();
            List<DocumentSubmissionModel> documentSubModelList = new List<DocumentSubmissionModel>();
            foreach (var item in documentSubList)
            {
                documentSubModelList.Add(Mapper.Map<DocumentSubmissionModel>(item));

            }
            return documentSubModelList;
        }

        public DocumentSubmissionModel GetById(int id)
        {
            return Mapper.Map<DocumentSubmissionModel>(_documentSubDataAccess.GetById(id));
        }

        public async Task<DocumentSubmissionModel> GetByIdAsync(int id)
        {
            return Mapper.Map<DocumentSubmissionModel>(await  _documentSubDataAccess.GetByIdAsync(id));
        }

        public async Task<List<DocumentSubmissionModel>> GetDocumentSubmissionData(string studentEmpId)
        {
            var documentSubList = await _documentSubDataAccess.GetAllAsync();
            List<DocumentSubmissionModel> documentSubModelList = new List<DocumentSubmissionModel>();
            foreach (var item in documentSubList)
            {
                if(item.AdmissionNumber == studentEmpId || item.EmployeeID == studentEmpId || item.Enquiry_Id == Convert.ToInt32(studentEmpId))
                {
                    documentSubModelList.Add(Mapper.Map<DocumentSubmissionModel>(item));
                }                
            }
            return documentSubModelList;
        }

        public DocumentSubmissionModel Save(DocumentSubmissionModel entity)
        {
            var documentSub =  _documentSubDataAccess.Save(Mapper.Map<DocumentSubmissionDetail>(entity));
            return new DocumentSubmissionModel { DocumentSubmission_ID = documentSub.DocumentSubmission_ID };
        }

        public async Task<DocumentSubmissionModel> SaveAsync(DocumentSubmissionModel entity)
        {
            var documentSub = await _documentSubDataAccess.SaveAsync(Mapper.Map<DocumentSubmissionDetail>(entity));
            return new DocumentSubmissionModel { DocumentSubmission_ID = documentSub.DocumentSubmission_ID };
        }

        public DocumentSubmissionModel Update(DocumentSubmissionModel entity)
        {
            var documentSub = _documentSubDataAccess.Update(Mapper.Map<DocumentSubmissionDetail>(entity));
            return new DocumentSubmissionModel { DocumentSubmission_ID = documentSub.DocumentSubmission_ID };
        }

        public async Task<DocumentSubmissionModel> UpdateAsync(DocumentSubmissionModel entity)
        {
            var documentSub = await _documentSubDataAccess.UpdateAsync(Mapper.Map<DocumentSubmissionDetail>(entity));
            return new DocumentSubmissionModel { DocumentSubmission_ID = documentSub.DocumentSubmission_ID };
        }

        public async Task<List<DocumentPortalModel>> GetDocumentByEnqId(int enqId)
        {
            List<DocumentPortalModel> documentList = new List<DocumentPortalModel>();

            GEEDbContext context = new GEEDbContext();

            var docList = (from ds in context.DocumentSubmissionDetails
                           join dt in context.DocumentTypes on ds.DocumentTypeID equals dt.DocumentTypeID
                           join ms in context.MasterTables on dt.DocumentCategoryID equals ms.MasterTable_id
                           join m in context.MasterTables on ms.Parent_id equals m.MasterTable_id
                           where ds.Enquiry_Id == enqId
                           select new {
                              DocumentType = dt.DocumentTypeName,
                              Subcategory = ms.Name,
                              Category = m.Name,
                              DigitalPath = ds.DigitalPathofDocument,
                              PhysicalPath = ds.PhysicalFileLocaiton,
                              Id = ds.DocumentSubmission_ID
                           });
            foreach (var item in docList)
            {                
                    documentList.Add(Mapper.Map<DocumentPortalModel>(item));               
            }            
            return documentList;
        }

        public async Task<List<DocumentPortalModel>> FetchPermittedDocument(int userId)
        {
            List<DocumentPortalModel> documentList = new List<DocumentPortalModel>();
            List<DocumentPermissionModel> permissionList = new List<DocumentPermissionModel>();
            List<int> categoryList = new List<int>();
            List<int> subCategoryList = new List<int>();
            List<int> documentTypeList = new List<int>();

            GEEDbContext context = new GEEDbContext();

            var permissions = (from dp in context.DocumentPermissions
                               where dp.IdType == userId
                               select dp);
            foreach (var item in permissions)
            {
                permissionList.Add(Mapper.Map<DocumentPermissionModel>(item));
            }
            foreach (var item in permissionList)
            {
                if (item.CategoryID.HasValue)
                {
                    categoryList.Add(item.CategoryID.Value);
                }
                if (item.SubCategoryID.HasValue)
                {
                    subCategoryList.Add(item.SubCategoryID.Value);
                }
                if (item.TypeID.HasValue)
                {
                    documentTypeList.Add(item.TypeID.Value);
                }
            }

            var docList = (from ds in context.DocumentSubmissionDetails
                           join dt in context.DocumentTypes on ds.DocumentTypeID equals dt.DocumentTypeID
                           join ms in context.MasterTables on dt.DocumentCategoryID equals ms.MasterTable_id
                           join m in context.MasterTables on ms.Parent_id equals m.MasterTable_id
                           where categoryList.Contains(m.MasterTable_id) ||
                           subCategoryList.Contains(ms.MasterTable_id) ||
                           categoryList.Contains(dt.DocumentTypeID) 
                           select new
                           {
                               DocumentType = dt.DocumentTypeName,
                               Subcategory = ms.Name,
                               Category = m.Name,
                               DigitalPath = ds.DigitalPathofDocument,
                               PhysicalPath = ds.PhysicalFileLocaiton,
                               Id = ds.DocumentSubmission_ID
                           });
            foreach (var item in docList)
            {
                documentList.Add(Mapper.Map<DocumentPortalModel>(item));
            }
            return documentList;
        }

        public async Task<List<DocumentPermissionModel>> GetDocumentPermission(int userId)
        {
            List<DocumentPermissionModel> permissionList = new List<DocumentPermissionModel>();
            GEEDbContext context = new GEEDbContext();

            var docList = (from dp in context.DocumentPermissions                          
                           where dp.IdType == userId
                           select dp);
            foreach (var item in docList)
            {
                permissionList.Add(Mapper.Map<DocumentPermissionModel>(item));
            }
            return permissionList;
        }

        public async Task<bool> ReportCorrect(int submissionId, bool isCorrect)
        {
            try
            {
                DocumentAuditlog docAudit = new DocumentAuditlog();
                docAudit.documentSubmisisonID = submissionId;
                docAudit.CreatedDate = DateTime.Now;
                docAudit.Createdby_ID = 1;
                if (isCorrect)
                {
                    docAudit.ReportedCorrect = true;
                }
                else
                {
                    docAudit.Reportedincorrect = true;
                }
                docAudit.School_ID = 1;
                docAudit.Group_ID = 1;

                _documentAuditDataAccess.Save(docAudit);
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }            
        }

        public async Task<List<DocumentPortalModel>> FetchSelectedDocument(int category, int subCategory, int documentType, int userId, bool IsForAll)
        {
            List<DocumentPortalModel> documentList = new List<DocumentPortalModel>();
            GEEDbContext context = new GEEDbContext();

            var docList = (from ds in context.DocumentSubmissionDetails
                           join dt in context.DocumentTypes on ds.DocumentTypeID equals dt.DocumentTypeID
                           join ms in context.MasterTables on dt.DocumentCategoryID equals ms.MasterTable_id
                           join m in context.MasterTables on ms.Parent_id equals m.MasterTable_id
                           where  ( m.MasterTable_id == category ||
                           ms.MasterTable_id == subCategory ||
                           dt.DocumentTypeID == documentType ) && (IsForAll || ds.Enquiry_Id == userId)
                           select new
                           {
                               DocumentType = dt.DocumentTypeName,
                               Subcategory = ms.Name,
                               Category = m.Name,
                               DigitalPath = ds.DigitalPathofDocument,
                               PhysicalPath = ds.PhysicalFileLocaiton,
                               Id = ds.DocumentSubmission_ID
                           });
            foreach (var item in docList)
            {
                documentList.Add(Mapper.Map<DocumentPortalModel>(item));
            }
            return documentList;
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
        // ~DocumentSubmissionManager() {
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
