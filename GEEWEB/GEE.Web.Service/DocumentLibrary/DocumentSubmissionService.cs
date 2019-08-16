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

namespace GEE.Web.Service.DocumentLibrary
{
   public class DocumentSubmissionService
    {
        public async Task<List<DocumentSubmissionViewModel>> GetAll()
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/documentSubmission/GetAll");
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<List<DocumentSubmissionViewModel>>(Response.Content.ReadAsStringAsync().Result);
                }
            }
            return null;
        }
        private void CreateDirectoryIfNotExists(string NewDirectory)
        {
            try
            {
                // Checking the existance of directory
                if (!Directory.Exists(NewDirectory))
                {
                    //If No any such directory then creates the new one
                    Directory.CreateDirectory(NewDirectory);
                }
            }
            catch (Exception ex)
            {
               
            }
               

       }
            
        public async Task<string> UploadDocuments(DocumentSubmissionViewModel documentDetails)
        {
            string returrMessage = string.Empty;
            try
            {
                bool isValid = true;
                if (documentDetails.MaxFileSize < documentDetails.CurrentFileSize)
                {
                    returrMessage = "Max file size should be " + documentDetails.MaxFileSize.ToString();
                    isValid = false;
                }
                else if (isValid == true && documentDetails.AllowedFileFormat !=null && !string.IsNullOrEmpty(documentDetails.FileFormat) && documentDetails.AllowedFileFormat.Contains(documentDetails.FileFormat.ToLower()) == false)
                {
                    returrMessage = "Please upload documents in proper format.";
                    isValid = false;
                }
                if (isValid)
                {
                    var stringContent = new StringContent("") ;//= new StringContent(JsonConvert.SerializeObject(documentDetails).ToString(), Encoding.UTF8, "application/json");
                    DocumentSubmissionViewModel objDocumentSubmissionViewModel = documentDetails;  //(DocumentSubmissionViewModel)(await Save(stringContent));
                    if (objDocumentSubmissionViewModel.IsRecordSaved)
                    {
                        string fileName = System.IO.Path.GetFileName(documentDetails.PhysicalFileLocaiton);
                        string newFile = documentDetails.DocumentType.DocumentTypeName + "_UserID_" + documentDetails.Enquiry_Id.ToString() + "_DocumentID_" + objDocumentSubmissionViewModel.DocumentSubmission_ID.ToString();
                        string[] splString = fileName.Split('.');
                        string uploadNewFileName = newFile +"."+ splString[1];
                        string filePathTobeSaved = "";
                        string createDir = string.Empty;
                        string digitalPathofDocument = string.Empty;
                        string baseurl = HttpContext.Current.Server.MapPath("~/UploadDocuments");
                        //Create Document directory according to employee and there documents.
                        if (documentDetails.UserType == "Employee")
                        {
                            //Create documents for employee
                            documentDetails.DigitalPathofDocument = baseurl + "/Employees";
                            createDir = documentDetails.DigitalPathofDocument + "/" + documentDetails.DocumentType.DocumentTypeName;
                            CreateDirectoryIfNotExists(createDir);
                            filePathTobeSaved = createDir + "/" + uploadNewFileName;
                            digitalPathofDocument = "~/UploadDocuments/Employees/" + documentDetails.DocumentType.DocumentTypeName + "/" + uploadNewFileName;

                            returrMessage = "Document uploaded successfully.";
                        }
                        else if (documentDetails.UserType == "Student")
                        {

                            //Create documents for Student
                            documentDetails.DigitalPathofDocument = baseurl + "/Students";
                            createDir = documentDetails.DigitalPathofDocument + "/" + documentDetails.DocumentType.DocumentTypeName;
                            CreateDirectoryIfNotExists(createDir);
                            filePathTobeSaved = createDir + "/" + uploadNewFileName;
                           
                            digitalPathofDocument = "~/UploadDocuments/Students/" + documentDetails.DocumentType.DocumentTypeName + "/" + uploadNewFileName;

                            returrMessage = "Document uploaded successfully.";
                        }
                        else if (documentDetails.UserType == "School")
                        {
                            //Create documents for School
                            documentDetails.DigitalPathofDocument = baseurl + "/Schools";
                            createDir = documentDetails.DigitalPathofDocument + "/" + documentDetails.DocumentType.DocumentTypeName;
                            CreateDirectoryIfNotExists(createDir);
                            filePathTobeSaved = createDir + "/" + uploadNewFileName;
                            digitalPathofDocument = "~/UploadDocuments/Schools/" + documentDetails.DocumentType.DocumentTypeName + "/" + uploadNewFileName;

                            returrMessage = "Document uploaded successfully.";
                        }
                        Upload(filePathTobeSaved);
                        documentDetails.DigitalPathofDocument = digitalPathofDocument;
                        documentDetails.DocumentSubmission_ID = objDocumentSubmissionViewModel.DocumentSubmission_ID;
                        stringContent = new StringContent(JsonConvert.SerializeObject(documentDetails).ToString(), Encoding.UTF8, "application/json");
                        // var status = Update(stringContent);
                        returrMessage = digitalPathofDocument;
                    }
                    else
                    {
                        returrMessage = "We are unable to process this request due to system down.";
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }
           
            return returrMessage;
        }

       
        public async Task<string> UpdateRecord(List<DocumentSubmissionViewModel> record)
        {
            foreach (var item in record)
            {
                item.CreatedDate = DateTime.Now;
                item.CreatedBy_ID = 1;
                if(item.DigitalPathofDocument != null && item.DigitalPathofDocument != "null")
                {
                    item.onlinesubmitted = true;
                }
                else
                {
                    item.onlinesubmitted = false;
                }
                HttpContent stringContent = new StringContent(JsonConvert.SerializeObject(item).ToString(), Encoding.UTF8, "application/json");
                if (item.DocumentSubmission_ID == 0)
                {
                    using (var client = Common.GetHttpClient())
                    {
                        var Response = await client.PostAsync("api/documentSubmission/Save", stringContent);                       
                    }
                }
                else
                {
                    using (var client = Common.GetHttpClient())
                    {
                        var Response = await client.PutAsync("api/documentSubmission/Update/", stringContent);                        
                    }
                }
                
            }
            return null;
        }

        public async Task<List<DocumentSubmissionViewModel>> GetDocumentSubmissionData(int category, int subCategory, string studentEmpId)
        {
            List<DocumentSubmissionViewModel> listSubmission = new List<DocumentSubmissionViewModel>();
            List<DocumentSubmissionViewModel> availableSubmissionList = new List<DocumentSubmissionViewModel>();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/DocumentType/GetAllByCategory?category=" + subCategory);
                if (Response.IsSuccessStatusCode)
                {
                    var typeList = JsonConvert.DeserializeObject<List<DocumentTypeViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    if (!string.IsNullOrEmpty(studentEmpId))
                    {
                        HttpResponseMessage ResponseSubmission = await client.GetAsync("api/DocumentSubmission/GetDocumentSubmissionData?category=" + subCategory + "&studentEmpId=" + studentEmpId);
                        availableSubmissionList = JsonConvert.DeserializeObject<List<DocumentSubmissionViewModel>>(ResponseSubmission.Content.ReadAsStringAsync().Result);
                    }
                    foreach (var item in typeList)
                    {
                        var obj = availableSubmissionList.Where(x => x.DocumentTypeID == item.DocumentTypeID).FirstOrDefault();
                        if (obj == null)
                        {
                            obj = new DocumentSubmissionViewModel();
                            obj.DocumentTypeID = item.DocumentTypeID;
                        }
                            obj.DocumentType = item;
                        
                        listSubmission.Add(obj);
                    }                   
                    return listSubmission;
                }
                return null;
            }
        }

        private void Upload(string filePathTobeSaved)
        {
            HttpContext.Current.Request.Files[0].SaveAs(filePathTobeSaved);
        }     

        public async Task<DocumentSubmissionViewModel> Save(HttpContent collection)
        {
            DocumentSubmissionViewModel objDocumentSubmissionViewModel = new DocumentSubmissionViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PostAsync("api/documentSubmission/Save", collection);
                if(Response.IsSuccessStatusCode== true)
                {
                    var  returnData = Response.Content.ReadAsStringAsync().Result;

                    objDocumentSubmissionViewModel= JsonConvert.DeserializeObject<DocumentSubmissionViewModel>(returnData);
                }
                objDocumentSubmissionViewModel.IsRecordSaved = Response.IsSuccessStatusCode;
            }
            return objDocumentSubmissionViewModel;
        }

        public async Task<bool> Update(HttpContent content)
        {
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.PutAsync("api/documentSubmission/Update/", content);
                return Response.IsSuccessStatusCode ? true : false;
            }
        }

        public async Task<DocumentSubmissionViewModel> GetById(int id)
        {
            var documentSubmission = new DocumentSubmissionViewModel();
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync("api/documentSubmission/GetById/" + id);
                if (Response.IsSuccessStatusCode)
                {
                    return JsonConvert.DeserializeObject<DocumentSubmissionViewModel>(Response.Content.ReadAsStringAsync().Result);
                }
                return null;
            }
        }

        public async Task<List<MasterTableViewModel>> GetDocumentCategoryForDD(int masterType=0, int? categoryId = null)
        {
            
            using (var client = Common.GetHttpClient())
            {
                var Response = await client.GetAsync(AdminConstants.MASTERTABLE_API_GET_ALL + "masterTableId=" +null+"&masterTypeId="+ masterType );
                if (Response.IsSuccessStatusCode)
                {
                    var resList = JsonConvert.DeserializeObject<List<MasterTableViewModel>>(Response.Content.ReadAsStringAsync().Result);
                    if (categoryId != null)
                        resList = resList.Where(x => x.Parent_id == categoryId).ToList();
                    return resList; 
                }
                return null;
            }
        }
        
    }
}
