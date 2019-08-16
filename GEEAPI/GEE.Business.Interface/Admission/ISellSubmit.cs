using GEE.Business.Model.Admission;
using GEE.Business.Models.Admission;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.Admission
{
   public interface ISellSubmit
    {
        List<SellSubmitModel> GetSellSubmitwithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder);

        bool GetIsApplicationSold(int enquiryId);

       ApplicationModel UpdateApplicationNo(ApplicationModel entity);
        RegistrationModel UpdateRegistrationNo(RegistrationModel entity);

    }
}
