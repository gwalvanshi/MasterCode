using GEE.Business.Model.Configuration;
using GEE.Business.Models.Admission;
using System;
using System.Collections.Generic;

namespace GEE.Business.Interface.Configuration
{
    public interface ISchoolConfig
    {
        EnquiryModel GetAutoGeneraedNo(int navigationId);
        List<SchoolConfigModel> GetSchoolConfigListByNavigation(int navigationId);
        SchoolConfigModel GetSchoolConfig(int configId);
        List<SchoolConfigModel> GetAllSchoolConfig();
        bool UpdateNextNumber(int navigationId);
        bool CheckIsAppNumEqualsRegiNum(int navigationMenuCode);

    }
}