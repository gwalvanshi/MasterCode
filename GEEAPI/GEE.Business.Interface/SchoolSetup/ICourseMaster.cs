using GEE.Business.Model.SchoolSetup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.SchoolSetup
{
    public interface ICourseMaster : IService<CourseMasterModel>
    {
        bool DeActivateCourse(int id);
    }
}
