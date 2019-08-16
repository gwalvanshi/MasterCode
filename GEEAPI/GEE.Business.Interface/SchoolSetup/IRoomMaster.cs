using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models.SchoolSetup;

namespace GEE.Business.Interface.SchoolSetup
{
    public interface IRoomMaster: IService<RoomModel>
    {
        bool DeleteRoom(RoomModel model);

        List<RoomModel> GetAllRooms(int pageNo, int pageSize, string sortOrder, string sortColumn);
    }
}
