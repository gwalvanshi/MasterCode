using GEE.Business.Model.SchoolSetup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.SchoolSetup
{
    public interface IBookMaster : IService<BookMasterModel>
    {
        bool DeActivateBook(int id);
        List<BookMasterViewModel> GetAllBookMasterData(BookMasterViewModel objBookMasterModel);
    }
}
