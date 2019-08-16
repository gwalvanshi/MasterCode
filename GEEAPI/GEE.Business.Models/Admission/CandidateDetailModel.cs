using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class CandidateDetailModel:BaseEntity
    {
        public int CandidateDetail_ID { get; set; }
        public int ? Enquiry_ID { get; set; }
        public string EnquiryNo { get; set; }
        public int ? AdmissionClass_id { get; set; }
        public int ? LastPassClass_ID { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string Lastname { get; set; }
        public DateTime ? DOB { get; set; }
        public string Email { get; set; }
        public int ? StudentType_ID { get; set; }
        public string ContactMobileNo { get; set; }
        public string HomePhone { get; set; }
        public string Gender { get; set; }
        public string Nationality { get; set; }
        public bool ? hasSibiling { get; set; }
        public string SiblingAdmNumber_ID { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public int ? City_ID { get; set; }
        public int ? State_ID { get; set; }
        public int ? Country_ID { get; set; }
        public string PinCode { get; set; }
        public string Landmark { get; set; }
        public string DistanceFromSchool { get; set; }
        public int ? Caste_ID { get; set; }
        public int ? Religon_ID { get; set; }
        public string FatheFirstName { get; set; }
        public string FatherMiddleName { get; set; }
        public string FatherLasttName { get; set; }
        public int ? FatherQualificaiton_ID { get; set; }
        public string FatherQualificaitonText { get; set; }
        public string FatherOccupation { get; set; }
        public string FatherOfficeAddres { get; set; }
        public string FatherOrgnisation { get; set; }
        public string FatherDesignation { get; set; }
        public string MotherFirstName { get; set; }
        public string MotherMiddleName { get; set; }
        public string MotherLasttName { get; set; }
        public int ? MotherQualificaiton_Id { get; set; }
        public string MotherQualificaitonText { get; set; }
        public string MotherOccupation { get; set; }
        public string MotherOfficeAddres { get; set; }
        public string MotherOrgnisation { get; set; }
        public string MotherDesignation { get; set; }
        public string CurrentSchool { get; set; }
        public string CurrentSchoolCity { get; set; }
        public string IsGovtTransfer { get; set; }
        public string Remarks { get; set; }
        public string CommunicationMode { get; set; }
      
        public int? SubjectId { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }
        public string SearchValue { get; set; }
        public int? MotherPhoneNumber { get; set; }
        public int? FatherPhoneNumber { get; set; }

    }
}
