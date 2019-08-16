using GEE.Business.Model.SchoolSetup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.SchoolSetup
{
    public interface IAssessmentStructureAssessmentTypeMapping : IService<AssessmentStructureAssessmentTypeMappingModel>
    {
        bool DeActivate(int id);
        List<AssessmentStructureAssessmentTypeMappingViewModel> GetAssessmentStructureData(AssessmentStructureAssessmentTypeMappingViewModel objModel);
        List<AssessmentStructureAssessmentTypeMappingModel> GetAllAssessmentStructureWithASId(int Id);
    }
}
