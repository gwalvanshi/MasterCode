using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.DocumentLibrary
{
   public class DocumentSubmissionViewModel : BaseViewModel
    {
        public int DocumentSubmission_ID { get; set; }
        public int? DocumentTypeID { get; set; }
        public int? Enquiry_Id { get; set; }
        public string AdmissionNumber { get; set; }
        public string EmployeeID { get; set; }
        public DateTime? SubmissionDate { get; set; }
        public string DigitalPathofDocument { get; set; }
        public string PhysicalFileLocaiton { get; set; }
        public bool? onlinesubmitted { get; set; }
        public bool? OnlineDocumentVerified { get; set; }
       
        public int MaxFileSize { get; set; }
        public int CurrentFileSize { get; set; }
        public string FileFormat { get; set; }
        public string [] AllowedFileFormat { get; set; }
        public string UserType { get; set; }
        //public string DocumentType { get; set; }
        public bool IsRecordSaved   { get; set; }

        public DocumentTypeViewModel DocumentType { get; set; }
    }
}
