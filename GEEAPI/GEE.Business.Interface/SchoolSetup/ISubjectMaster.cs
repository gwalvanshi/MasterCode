using GEE.Business.Model.SchoolSetup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.SchoolSetup
{
   public interface ISubjectMaster : IService<SubjectMasterModel>
    {
        bool DeleteSubjectMaster(SubjectMasterModel subjectMasterModel);
        List<SubjectMasterModel> GetAllSubjectMasterData(int pageNo, int pageSize, string sortOrder, string sortColumn);
    }
}
