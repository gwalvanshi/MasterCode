using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admission
{
   public class SellSubmitViewModel
    {
        public int Enquiry_ID { get; set; }
        public string EnquiryNo { get; set; }
        public string Status { get; set; }
        public string ApplicaitonNo { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        //public DateTime? DOB { get; set; }
        public string Email { get; set; }
        public string ContactMobileNo { get; set; }
        public string FatheFirstName { get; set; }
        public string MotherFirstName { get; set; }
        public bool IsSubmitted { get; set; }
        public bool? Applicationsold { get; set; }
        public string RegistrationNo { get; set; }
        public string Gender { get; set; }
        public bool Issubmitted { get; set; }
        public string DOB { get; set; }

    }
}
