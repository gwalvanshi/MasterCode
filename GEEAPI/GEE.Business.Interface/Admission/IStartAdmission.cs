using GEE.Business.Model.Admission;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.Admission
{
    public interface IStartAdmission : IService<StartAdmissionModel>
    {
        List<StartAdmissionModel> GetStartAdmissionDetailsWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder,int SchoolId,int GroupId);

        List<StartAdmissionModel> UpdateStartAdmissionList(List<StartAdmissionModel> startAdmissionModels);
    }
}
