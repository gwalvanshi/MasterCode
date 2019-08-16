using GEE.Business.Model.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.Admin
{    
    public interface IClassMaster : IService<ClassMasterModel>
    {
        bool DeActivateClass(int id);
        List<ClassMasterViewModel> GetAllClassMasterData(ClassMasterViewModel objMasterTableModel);
        Task<List<ClassWithCourceViewModel>> GetAllClassWithCourceCheck();
    }
}
