using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Utility
{
   public class AdminConstants
    {
        #region [ Admin Master Table Constants ]
        public const string MASTERTABLE_API_GET_ALL = "api/MasterTable/GetAll?";
        public const string MASTERTABLE_API_GET = "api/MasterTable/GetAllForIndex/";
        public const string MASTERTABLE_API_GET_BY_ID = "api/MasterTable/GetById?";
        public const string MASTERTABLE_API_SAVE = "api/MasterTable/Save";
        public const string MASTERTABLE_API_UPDATE = "api/MasterTable/Update/";
        public const string MASTERTABLE_API_DELETE = "api/MasterTable/Delete/";
        public const string MASTERTABLE_API_GET_PARENTVALUES = "api/MasterTable/GetParentValues?";
        public const string MASTERTABLE_API_GET_CHECKISDEFAULT = "api/MasterTable/ChechIsDefaultInMasterTable?";
        public const string MASTERTABLE_API_GETALL_MASTER_DATA = "api/MasterTable/GetAllMasterData/";
        

        #endregion

        #region [ Admin User Creation Constants ]
        public const string USER_API_SAVE = "api/Account/Register/";
        public const string USERGROUP_API_GET_ALL = "api/usergroup/GetAll/";
        public const string USER_API_GETUSERDETAILSWITHPAGINGSORTING = "api/User/GetUserDetailsWithPagingSorting/";
        public const string USER_API_DELETE = "api/User/Delete/";
        public const string USER_API_UPDATE = "api/Account/RegisterUpdate/";
        public const string USER_API_GET = "api/User/GetUserDetailById/";
        public const string USER_API_GETUID = "api/User/GetUserDetailByUserId/";
        
        #endregion


        #region [ Admin Class Master Constants ]
        public const string CLASSMASTER_API_SAVE = "api/ClassMaster/Save/";         
        public const string CLASSMASTER_API_DELETE = "api/ClassMaster/Delete/";
        public const string CLASSMASTER_API_UPDATE = "api/ClassMaster/Update/";
        public const string CLASSMASTER_API_GET = "api/ClassMaster/GetClassDetailById/";
        public const string CLASSMASTER_API_GETALL_DATA = "api/ClassMaster/GetAllClassMasterData/";
        public const string CLASSMASTER_API_GETAll = "api/ClassMaster/GetAllList";
        public const string CLASSMASTER_API_GETAllFOREDITCOURSE= "api/ClassMaster/GetEditClassListWithCourse";


        #endregion

        #region [ Admin BOOK Master Constants ]
        public const string BOOKMASTER_API_SAVE = "api/BookMaster/Save/";
        public const string BOOKMASTER_API_DELETE = "api/BookMaster/Delete/";
        public const string BOOKMASTER_API_UPDATE = "api/BookMaster/Update/";
        public const string BOOKMASTER_API_GET = "api/BookMaster/GetDetailById/";
        public const string BOOKMASTER_API_GETALL_DATA = "api/BookMaster/GetAllBookMasterData/";

        #endregion

        #region [ Admin ASSESSMENT TYPE Constants ]
        public const string ASSESSMENTTYPE_API_SAVE = "api/AssessmentType/Save/";
        public const string ASSESSMENTTYPE_API_DELETE = "api/AssessmentType/Delete/";
        public const string ASSESSMENTTYPE_API_UPDATE = "api/AssessmentType/Update/";
        public const string ASSESSMENTTYPE_API_GET = "api/AssessmentType/GetDetailById/";
        public const string ASSESSMENTTYPE_API_GETALL_DATA = "api/AssessmentType/GetAllAssessmentTypeData/";

        #endregion

        #region [ Admin Course Master Constants ]

        public const string COURSEMASTER_API_SAVEALLROW = "api/CourseMaster/SaveAllRow/";
        public const string COURSEMASTER_API_UPDATEALLROW = "api/CourseMaster/UpdateCourceAllRow/";
        public const string COURSEMASTER_API_GETALLCOURSEWITHCLASS = "api/CourseMaster/GetAllCourseWithClassId?";

        #endregion

        #region [ Admin AssessmentStructure AssessmentType Mapping Constants ]

        public const string ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_DELETE = "api/AssessmentStructureAssessmentTypeMapping/Delete/";
        public const string ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_GET = "api/AssessmentStructureAssessmentTypeMapping/GetDetailById/";
        public const string ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_SAVEALLROW = "api/AssessmentStructureAssessmentTypeMapping/SaveAllRow/";
        public const string ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_UPDATEALLROW = "api/AssessmentStructureAssessmentTypeMapping/Update/";
        public const string ASSESSMENTSTRUCTUREASSESSMENTTYPEMAPPING_API_GETALLCOURSEWITHCLASS = "api/AssessmentStructureAssessmentTypeMapping/GetAssessmentStructureData?";

        #endregion
    }
}
