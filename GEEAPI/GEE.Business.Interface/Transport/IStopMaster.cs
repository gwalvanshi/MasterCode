using GEE.Business.Model.Transport;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.Transport
{
   public interface IStopMaster : IService<StopMasterModel>
    {
        bool DeleteStopMaster(StopMasterModel StopMasterModel);
        List<StopMasterModel> GetAllStopMasterData(int pageNo, int pageSize, string sortOrder, string sortColumn);
    }
}
