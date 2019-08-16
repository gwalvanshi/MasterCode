using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
    public class EnquiryModel : BaseEntity
    {
        public int Enquiry_ID { get; set; }
        public string EnquiryNo { get; set; }
        public int? MarketSource_ID { get; set; }
        public int? EnquiryType_ID { get; set; }
        public string Status { get; set; }
      
        public int ? MaxRows { get; set; }
        public EnquiryTypeModel EnquiryType { get; set; }
        public MarketingSourceModel MarketingSource { get; set; }


        //public ICollection<ApplicationModel> Applications { get; set; }
        //public ICollection<CandidateDetailModel> CandidateDetails { get; set; }
        //public ICollection<DocumentSubmissionModel> DocumentSubmissions { get; set; }
        //public ICollection<RegistrationModel> Registrations { get; set; }

        #region  properties For Application Entiy
        public int Application_ID { get; set; }
        public string ApplicaitonNo { get; set; }
        public bool IsSubmitted { get; set; }
        public bool Applicationsold { get; set; }

        #endregion

        #region properties For Candidate Details Entiy
        //Enquiry_ID = enquiry.Enquiry_ID,
        public string EnquiryName { get; set; }
        public string RegistrationNo { get; set; }
        public string Gender { get; set; }
        public string Nationality { get; set; }
        public string FatherDesignation { get; set; }
        public int CandidateDetail_ID { get; set; }
        public int? SubjectId { get; set; }
        public int? AdmissionClass_id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string Lastname { get; set; }
        public DateTime ? DOB { get; set; }
        public string Email { get; set; }
        public int? StudentType_ID { get; set; }
        public string ContactMobileNo { get; set; }
        public int HomePhone { get; set; }
        public bool hasSibiling { get; set; }
        public string SiblingAdmNumber_ID { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public int? City_ID { get; set; }
        public int? State_ID { get; set; }
        public int? Country_ID { get; set; }
        public string FatheFirstName { get; set; }
        public string FatherMiddleName { get; set; }
        public string FatherLasttName { get; set; }
        public string MotherFirstName { get; set; }
        public string MotherMiddleName { get; set; }
        public string MotherLasttName { get; set; }
        public string DateofBirth { get; set; }
        public int? MotherPhoneNumber { get; set; }
        public int? FatherPhoneNumber { get; set; }

        public List<ApplicationModel> Applications { get; set; }
        public List<CandidateDetailModel> CandidateDetails { get; set; }
        public List<RegistrationModel> Registrations { get; set; }
        #endregion

        public int NavigationId { get; set; }

    }
}