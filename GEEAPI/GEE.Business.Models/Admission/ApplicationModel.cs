using GEE.Business.Models.DocumentLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
    public class ApplicationModel : BaseEntity
    {
        public int Application_ID { get; set; }
        public int? Enquiry_ID { get; set; }
        public string ApplicaitonNo { get; set; }
        public bool IsSubmitted { get; set; }
        public DateTime? SubmitDate { get; set; }
        public bool IsOnline { get; set; }
       
        public DocumentSubmissionModel DocumentSubmissions { get; set; }
        public EnquiryModel Enquiry { get; set; }
    }
}
