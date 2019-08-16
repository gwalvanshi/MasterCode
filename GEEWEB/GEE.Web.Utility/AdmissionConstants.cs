using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Utility
{
   public class AdmissionConstants
    {
        #region [ Admission Enquiry Constants ]
        public const string ENQUIRY_API_GET_ALL = "api/enquiry/GetAll/";
        public const string ENQUIRY_API_SAVE = "api/enquiry/Save/";
        public const string ENQUIRY_API_UPDATE = "api/enquiry/Update/";
        public const string ENQUIRY_API_GET_BY_ID = "api/enquiry/GetById/";
        public const string ENQUIRY_API_GET_AUTO_GENERATED_NO = "api/enquiry/GetAutoGeneraedNo/";
        public const string ENQUIRY_API_GETENQUIRYDETAILSWITHPAGINGSORTING = "api/enquiry/GetEnquiryDetailsWithPagingSorting/";
        public const string ENQUIRY_API_DELETE = "api/enquiry/Delete/";


        public const string CANDIDATE_API_GETPOPUPDATA = "api/CandidateDetail/GetPopupData/";
        public const string CANDIDATE_API_GETALL = "api/CandidateDetail/GetAll/";
        public const string CANDIDATE_API_SAVE = "api/CandidateDetail/Save/";
        public const string CANDIDATE_API_UPDATE = "api/CandidateDetail/update/";
        public const string CANDIDATE_API_GETCANDIDATEBYENQUIRY = "api/CandidateDetail/GetCandidateDetailsByEnquiryId/";
        public const string CANDIDATE_API_GETBYID = "api/CandidateDetail/GetById/";
        public const string CANDIDATE_API_GETCANDIDATEDETAILSWITHPAGINGSORTING = "api/CandidateDetail/GetCandidateDetailsWithPagingSorting/";


        public const string ENQUIRY_API_GETSTATEBYCITY = "api/enquiry/GetStateByCity/";

        #endregion

        #region [ Admission Sell And Submit Constants ]
        public const string SELLSUBMIT_API_GETDETAILSWITHPAGINGSORTING = "api/SellSubmit/GetSellSubmitDetailsWithPagingSorting/";
        public const string SELLSUBMIT_API_GETISAPPSOLD = "api/SellSubmit/GetIsApplicationSold/";
        public const string SELLSUBMIT_API_UPDATEAPPNO = "api/SellSubmit/UpdateApplicationNo/";
        public const string SELLSUBMIT_API_CheckIsAppNumEqualsRegiNum = "api/SellSubmit/CheckIsAppNumEqualsRegiNum/";
        public const string SELLSUBMIT_API_UpdateRegistrationNo = "api/SellSubmit/UpdateRegistrationNo/";


        #endregion

        #region [ Admission Start Amission Constants ]
        public const string STARTADMISSION_API_GETDETAILSWITHPAGINGSORTING = "api/StartAdmission/GetStartAdmissionDetailsWithPagingSorting/";
        public const string STARTADMISSION_API_UPDATE = "api/StartAdmission/Update/";

        #endregion
    }
}
