using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Model.Admin;
namespace GEE.Business.Interface.Admin
{
    public interface IAspNetUser :IService<AspNetUserModel>
    {
        List<AspNetUserModel> GetUserDetailsWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder);
        AspNetUserModel GetUserDetailById(int id);
        bool DeActivateUser(int id);
        int GetUserDetailByUserId(string id);
    }
}
