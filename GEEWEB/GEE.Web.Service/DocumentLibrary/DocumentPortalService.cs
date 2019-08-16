using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using GEE.Web.ViewModel.DocumentLibrary;
using Newtonsoft.Json;
using System.Configuration;
using Newtonsoft.Json.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using GEE.Web.Service.CommonWebService;
using GEE.Web.ViewModel.Admin;
using GEE.Web.Utility;
using GEE.Web.ViewModel;

namespace GEE.Web.Service.DocumentLibrary
{
    public class DocumentPortalService
    {
        public async Task<List<DocumentPortalModel>> FetchDocumentFor(int EnqId)
        {

            List<DocumentPortalModel> availableSubmissionList = new List<DocumentPortalModel>();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/DocumentSubmission/FetchDocumentFor?EnqId=" + EnqId);
                if (Response.IsSuccessStatusCode)
                {
                    availableSubmissionList = JsonConvert.DeserializeObject<List<DocumentPortalModel>>(Response.Content.ReadAsStringAsync().Result);

                    return availableSubmissionList;
                }
                return null;
            }
        }

        public async Task<List<DocumentPermissionModel>> GetDocumentPermission(int userId)
        {
            List<DocumentPermissionModel> PermissionList = null;
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/DocumentSubmission/GetDocumentPermission?UserId=" + userId);
                if (Response.IsSuccessStatusCode)
                {
                    PermissionList = JsonConvert.DeserializeObject<List<DocumentPermissionModel>>(Response.Content.ReadAsStringAsync().Result);

                    return PermissionList;
                }
                return null;
            }
        }

        public async Task<List<DocumentPortalModel>> FetchPermittedDocument(int userId)
        {
            List<DocumentPortalModel> availableSubmissionList = new List<DocumentPortalModel>();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/DocumentSubmission/FetchPermittedDocument?userId=" + userId);
                if (Response.IsSuccessStatusCode)
                {
                    availableSubmissionList = JsonConvert.DeserializeObject<List<DocumentPortalModel>>(Response.Content.ReadAsStringAsync().Result);

                    return availableSubmissionList;
                }
                return null;
            }
        }

        public async Task<List<DocumentPortalModel>> GetDocuments(int category, int subCategory, int documentType, int userId, bool IsForAll)
        {
            List<DocumentPortalModel> availableSubmissionList = new List<DocumentPortalModel>();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/DocumentSubmission/FetchSelectedDocument?category=" + category + "&subCategory=" + subCategory + "&documentType=" + documentType + "&userId="+ userId + "&IsForAll=" + IsForAll);
                if (Response.IsSuccessStatusCode)
                {
                    availableSubmissionList = JsonConvert.DeserializeObject<List<DocumentPortalModel>>(Response.Content.ReadAsStringAsync().Result);

                    return availableSubmissionList;
                }
                return null;
            }
        }

        public async Task<Boolean> ReportCorrect(bool isCorrect, int submissionId)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/DocumentSubmission/ReportCorrect?submissionId=" + submissionId + "&isCorrect=" + isCorrect );
                if (Response.IsSuccessStatusCode)
                {                    
                    return true;
                }
                return false;
            }
        }

        public async Task<List<DocumentTypeViewModel>> GetDocumentTypeByCategory(int subCategory)
        {
            List<DocumentTypeViewModel> availableSubmissionList = new List<DocumentTypeViewModel>();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/DocumentType/GetAllByCategory?category=" + subCategory);
                if (Response.IsSuccessStatusCode)
                {
                    availableSubmissionList = JsonConvert.DeserializeObject<List<DocumentTypeViewModel>>(Response.Content.ReadAsStringAsync().Result);

                    return availableSubmissionList;
                }
                return null;
            }


        }
    }
}
