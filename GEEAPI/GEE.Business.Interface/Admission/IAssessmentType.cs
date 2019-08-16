using GEE.Business.Model.Admin;
using GEE.Business.Model.Admission;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GEE.Business.Interface.Admission
{
    public interface IAssessmentType : IService<AssessmentTypeModel>
    {
        bool DeActivateAssessmentType(int id);
        List<AssessmentTypeViewModel> GetAllAssessmentTypeData(AssessmentTypeViewModel objAssessmentTypeModel);
    }
}
