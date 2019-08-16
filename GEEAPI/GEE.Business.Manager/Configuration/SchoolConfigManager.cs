using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using GEE.Business.Model.Admission;
using GEE.Business.Interface.Configuration;
using GEE.DataAccess;
using static GEE.Common.Enums.SchoolConfigEnum;
using GEE.Business.Models.Admission;
using System.Reflection;
using GEE.Business.Model.Configuration;
using System.Data.SqlClient;

namespace GEE.Business.Manager.Configuration
{
    public class SchoolConfigManager : ISchoolConfig
    {
        IMyDataAccess<SchoolConfig> _SchoolConfigDataAccess = new MyDataAccess<SchoolConfig>();
        IMyDataAccess<NumberGenScheme> _NumberGenSchemeDataAccess = new MyDataAccess<NumberGenScheme>();
        /// <summary>
        /// This method is used for generate the auto numbers
        /// </summary>
        /// <param name="navigationId"></param>
        /// <returns></returns>
        public EnquiryModel GetAutoGeneraedNo(int navigationMenuCode)
        {
            string s = SchoolConfigNoGeneEnum.IsSystemGenerated.ToString();

            EnquiryModel enquiryModel = new EnquiryModel();
            var schoolConfigs = _SchoolConfigDataAccess.GetAll();
            schoolConfigs = schoolConfigs.Where(a => a.NavigationMenuCode == navigationMenuCode && a.configKey == "IsSystemGenerated" && a.configvalue == "True").ToList();
            foreach (var item in schoolConfigs)
            {
                var numberschme = _NumberGenSchemeDataAccess.GetAll().Where(a=>a.SchoolConfig_Id == item.SchoolConfig_id).FirstOrDefault();
                string autogenNo = genearateno(numberschme);
                string lastFragment = item.tablecolumn.Split('.').Last();

                var propertyInfo = enquiryModel.GetType().GetRuntimeProperty(lastFragment);
                propertyInfo.SetValue(enquiryModel, autogenNo, null);
            }
            return enquiryModel;
        }

        public string genearateno(NumberGenScheme numberGenScheme)
        {
            string genearteNo = "";

            if (numberGenScheme != null)
            {
                string[] a = numberGenScheme.Sequece.Split(',');
                foreach (var item in a)
                {
                    bool flag = false;
                    foreach (PropertyInfo property in numberGenScheme.GetType().GetProperties())
                    {
                        if (property.Name == item)
                        {
                            string strNo = property.GetValue(numberGenScheme)?.ToString();
                            if (strNo != null && strNo != "")
                                genearteNo += strNo;
                            flag = true;
                            break;

                        }
                    }
                    if (flag) continue;


                }
                genearteNo += numberGenScheme.NextNumber?.ToString();
            }
            return genearteNo;
        }

        /// <summary>
        /// For Update Next Number in School Config
        /// </summary>
        /// <param name="navigationId"></param>
        /// <returns></returns>
        public bool UpdateNextNumber(int navigationMenuCode)
        {
            bool res = false;
            var schoolConfigs = _SchoolConfigDataAccess.GetAll();
            schoolConfigs = schoolConfigs.Where(a => a.NavigationMenuCode== navigationMenuCode && a.configKey == "IsSystemGenerated" && a.configvalue == "True").ToList();
            foreach (var item in schoolConfigs)
            {
                var numberGenScheme = _NumberGenSchemeDataAccess.GetAll().Where(a => a.SchoolConfig_Id == item.SchoolConfig_id).FirstOrDefault();
                int? nextNumber = numberGenScheme.NextNumber + 1;
                numberGenScheme.NextNumber = nextNumber;
                _NumberGenSchemeDataAccess.Update(numberGenScheme);
                res = true;
            }
            return true;
        }

        /// <summary>
        /// This method is used for get school config by navigation id.
        /// </summary>
        /// <param name="navigationId"></param>
        /// <returns></returns>
        public List<SchoolConfigModel> GetSchoolConfigListByNavigation(int navigationId)
        {
            List<SchoolConfigModel> getSchoolConfigList = new List<SchoolConfigModel>();
            try
            {
                var schoolConfigs = _SchoolConfigDataAccess.GetAll().Where(a => a.Navigationmenu_id == navigationId).ToList(); ;
                foreach (var item in schoolConfigs)
                {
                    getSchoolConfigList.Add(Mapper.Map<SchoolConfigModel>(item));
                }
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return getSchoolConfigList;
        }
        /// <summary>
        /// This method is used for get school config by scholl config id.
        /// </summary>
        /// <param name="configId"></param>
        /// <returns></returns>
        public SchoolConfigModel GetSchoolConfig(int configId)
        {
            var enquiry = _SchoolConfigDataAccess.GetAll();
            var data = enquiry.Where(a => a.SchoolConfig_id == configId).FirstOrDefault();
            return Mapper.Map<SchoolConfigModel>(data);
        }
        /// <summary>
        /// This methods is used for get all school config.
        /// </summary>
        /// <returns></returns>
        public List<SchoolConfigModel> GetAllSchoolConfig()
        {
            List<SchoolConfigModel> getSchoolConfigList = new List<SchoolConfigModel>();
            try
            {

                var schoolConfigs = _SchoolConfigDataAccess.GetAll();
                foreach (var item in schoolConfigs)
                {
                    getSchoolConfigList.Add(Mapper.Map<SchoolConfigModel>(item));
                }
            }
            catch (Exception ex)
            {

                string str = ex.ToString();
            }
            return getSchoolConfigList;

        }

        public bool CheckIsAppNumEqualsRegiNum(int navigationMenuCode)
        {
            var isResult = false;
            var schoolConfigs = _SchoolConfigDataAccess.GetAll();
            schoolConfigs = schoolConfigs.Where(a => a.NavigationMenuCode == navigationMenuCode && a.configKey == "AppNumEqualsRegiNum" && a.configvalue == "True").ToList();
            if (schoolConfigs != null && schoolConfigs.Count > 0)
                isResult = true;
            return isResult;
        }
    }
}
