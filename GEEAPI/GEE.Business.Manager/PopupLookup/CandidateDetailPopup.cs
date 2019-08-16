using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.DataAccess;
using System.Linq.Dynamic;
using System.Data.SqlClient;
using System.Reflection;
using GEE.Business.Model.PopupLookup;
namespace GEE.Business.Manager.PopupLookup
{
    #region Candidate Details Popup
    /// <summary>
    /// Candidate Details Popup 
    /// </summary>
    public class CandidateDetailPopup : CommonPopupLookupManager
    {
        public override PopupLookupResponseModel GetAllData(PopupLookupRequestModel objPopupLookupModel)
        {
            PopupLookupResponseModel objPopupLookupResponseModel = new PopupLookupResponseModel();
            GEEDbContext context = new GEEDbContext();
            var cadDetailList = (from candDet in context.CandidateDetails
                                 select new
                                 {
                                     candDet.CandidateDetail_ID,
                                     candDet.FirstName,
                                     candDet.Lastname,
                                     candDet.FatheFirstName,
                                     candDet.FatherLasttName,
                                     candDet.ContactMobileNo,
                                     candDet.Email

                                 });


            //This should replace with resex Key.
            objPopupLookupResponseModel.StrColumnList = "CandidateDetail_ID,FirstName,Lastname,FatheFirstName,FatherLasttName,ContactMobileNo,Email";
            //Sorting
            if (!(string.IsNullOrEmpty(objPopupLookupModel.SortColumn) && string.IsNullOrEmpty(objPopupLookupModel.SortOrder)))
            {
                cadDetailList = cadDetailList.OrderBy(objPopupLookupModel.SortColumn + " " + objPopupLookupModel.SortOrder);
            }
            //Search
            if (!string.IsNullOrEmpty(objPopupLookupModel.SearchValue))
            {
                cadDetailList = cadDetailList.Where(m => m.FirstName.ToLower().Contains(objPopupLookupModel.SearchValue.ToLower())
                || m.Lastname.ToLower().Contains(objPopupLookupModel.SearchValue.ToLower())
                || m.FatheFirstName.ToLower().Contains(objPopupLookupModel.SearchValue.ToLower()));
            }
            int recordsTotal = cadDetailList.Count();
            var data = cadDetailList.Skip(objPopupLookupModel.PageNo).Take(objPopupLookupModel.PageSize).ToList();
            objPopupLookupResponseModel.DataList = ToDataTable(data);
            objPopupLookupResponseModel.TotalRecord = recordsTotal;

            return objPopupLookupResponseModel;
        }
    }
    #endregion
}
