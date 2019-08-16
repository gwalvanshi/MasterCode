
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.HR
{
   public class EmployeeMasterEditViewModel : BaseViewModel
    {
        
        public int EmployeeMasterID { get; set; }
        public int MaxRows { get; set; }
        public string EmpStatus { get; set; }
        public string Gender { get; set; }
        public string EmpCode { get; set; }
        public Nullable<int> EmpCategoryID { get; set; }
        public Nullable<int> StaffDesignationID { get; set; }
        public Nullable<int> VendorID { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string Lastname { get; set; }
        public string Email { get; set; }
        public string ContactMobileNo { get; set; }
        public string HomePhone { get; set; }
        public string CurrentAddress { get; set; }
        public Nullable<int> CurrentCityID { get; set; }
        public Nullable<int> CurrentStateID { get; set; }
        public Nullable<int> CurrentCountryID { get; set; }
        public string CurrentPinCode { get; set; }
        public string CurrentLandmark { get; set; }
        public Nullable<bool> Is_also_Permanent { get; set; }
        public string PermenentAddress { get; set; }
        public Nullable<int> PermenentCity_ID { get; set; }
        public Nullable<int> PermenentState_ID { get; set; }
        public Nullable<int> PermenentCountry_ID { get; set; }
        public string PinCode { get; set; }
        public string Landmark { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public Nullable<int> GenderID { get; set; }
        public string Nationality { get; set; }
        public Nullable<bool> Married { get; set; }
        public string Remarks { get; set; }
        public string FatheFirstName { get; set; }
        public string FatherMiddleName { get; set; }
        public string FatherLasttName { get; set; }
        public string MotherFirstName { get; set; }
        public string MotherMiddleName { get; set; }
        public string MotherLasttName { get; set; }
        public Nullable<int> Caste_ID { get; set; }
        public Nullable<int> Religon_ID { get; set; }
        public string Create_Login { get; set; }
        public string selectUsergroup { get; set; }
        public Nullable<int> EmpStatusId { get; set; }
        public List<EmployeeEducationDetailModel> EmployeeEducationDetailModelList { get; set; }
        public List<EmployeeExperienceModel> EmployeeExperienceModelList { get; set; }
        public List<EmployeeIDdetailModel> EmployeeIDdetailModelList { get; set; }

    }
}
