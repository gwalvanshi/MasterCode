using GEE.Business.Model.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.Admin
{
    public interface IMasterTable : IService<MasterTableModel>
    {
        List<MasterTableModel> GetMasterData(int? masterTableId, int? masterTypeId, int? schoolId, int? groupId, int? sessionYear, bool? isDeleted);

        MasterTableTypeModel GetParentValues(int masterTbaltypeId);

        bool ChechIsDefaultInMasterTable(int schoolId, int grouupId);

        bool DeleteMaster(MasterTableModel entity);

        List<MasterTableModel> GetAllMasterData(MasterTableModel objMasterTableModel);
    }
}
