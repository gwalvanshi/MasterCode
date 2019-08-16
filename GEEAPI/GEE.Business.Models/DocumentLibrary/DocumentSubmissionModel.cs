using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.DocumentLibrary
{
   public class DocumentSubmissionModel:BaseEntity
    {
        public int DocumentSubmission_ID { get; set; }
        public int ? DocumentTypeID { get; set; }
        public int ? Enquiry_Id { get; set; }
        public string AdmissionNumber { get; set; }
        public string EmployeeID { get; set; }
        public DateTime ? SubmissionDate { get; set; }
        public string DigitalPathofDocument { get; set; }
        public string PhysicalFileLocaiton { get; set; }
        public bool ? onlinesubmitted { get; set; }
        public bool ? OnlineDocumentVerified { get; set; }
         
        
        public DocumentTypeModel DocumentType { get; set; }
    }
}
