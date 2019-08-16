using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models.DocumentLibrary;

namespace GEE.Business.Interface.DocumentLibrary
{
    public interface IDocumentSubmission : IService<DocumentSubmissionModel>
    {
        Task<List<DocumentSubmissionModel>> GetDocumentSubmissionData(string studentEmpId);
        Task<List<DocumentPortalModel>> GetDocumentByEnqId(int enqId);
        Task<List<DocumentPermissionModel>> GetDocumentPermission(int userId);
        Task<List<DocumentPortalModel>> FetchPermittedDocument(int userId);
        Task<List<DocumentPortalModel>> FetchSelectedDocument(int category, int subCategory, int documentType, int userId, bool IsForAll);
        Task<bool> ReportCorrect(int submissionId, bool isCorrect);
    }
}
