using GEE.Business.Models.Admission;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.Admission
{
    public interface ICandidateDetail : IService<CandidateDetailModel>
    {
        List<CandidateDetailModel> GetPopupData(CandidateDetailModel objCandidateDetailModel);
        Task<CandidateDetailModel> GetCandidateDetailsByEnquiryId(int enquiryId);
        List<CandidateDetailModel> GetCandidateDetailsWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder);

    }
}
