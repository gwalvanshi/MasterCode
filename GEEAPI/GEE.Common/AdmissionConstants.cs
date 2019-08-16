using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Common
{
  public  class AdmissionConstants
    {
        #region [ Admission Enquiry Constants ]
        public const string ENQUIRY_GET_ROLE = "Enquiry_GET";
        public const string ENQUIRY_PUT_ROLE = "Enquiry_PUT";
        public const string ENQUIRY_POST_ROLE = "Enquiry_POST";
        public const string ENQUIRY_DELETE_ROLE = "Enquiry_DELETE";

        #endregion

        #region [Admission Candidate Details Constant]
        public const string CANDIDATEDETAIL_GET_ROLE = "CandidateDetail_GET";
        public const string CANDIDATEDETAIL_PUT_ROLE = "CandidateDetail_PUT";
        public const string CANDIDATEDETAIL_POST_ROLE = "CandidateDetail_POST";
        public const string CANDIDATEDETAIL_DELETE_ROLE = "CandidateDetail_DELETE";
        #endregion

        #region [Admission Start Admission Details Constant]
        public const string STARTADMISSION_GET_ROLE = "AdmissionStatus_GET";
        public const string STARTADMISSION_PUT_ROLE = "AdmissionStatus_PUT";
        public const string STARTADMISSION_POST_ROLE = "AdmissionStatus_POST";
        public const string STARTADMISSION_DELETE_ROLE = "AdmissionStatus_DELETE";
        #endregion
    }
}
