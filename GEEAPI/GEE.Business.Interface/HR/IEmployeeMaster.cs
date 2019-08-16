
using GEE.Business.Model.HR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.HR
{    
    public interface IEmployeeMaster : IService<EmployeeMasterModel>
    {
        List<EmployeeMasterModel> GetEmployeeWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder);
        int SaveEmployeeDetails(EmployeeDetailsSaveSchemaModel entity);     
        EmployeeMasterModel GetEmployeeDetails(int employeeMasterId);
        int UpdateEmployeeDetails(EmployeeDetailsSaveSchemaModel entity);
        int DeleteEmployeeDetails(EmployeeMasterModel entity);
    }
}
