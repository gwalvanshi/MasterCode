using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Utility
{
   public class MenuCodePermissionConstants
    {
        #region  Permission Constants
        //Data depandancy 
        //Hard Code the string name should be same in database
        public const string PERMISSION_ADD = "add";
        public const string PERMISSION_UPDATE = "Update";
        public const string PERMISSION_DELETE = "Delete";
        public const string PERMISSION_VIEW = "View";
        public const string PERMISSION_EMAIL = "SendEmail";
        public const string PERMISSION_SMS = "SendSMS";
        public const string PERMISSION_PRINT = "PrintDocument";
        public const string PERMISSION_WORKFLOW = "WorkflowApproval";
        #endregion

        #region  User Creation page Constants
        //Hard Code this is database menu code for screen
        public const int USER_CREATION_ADDUSER_MENUCODE = 1401;

        #endregion

        #region  Employee Master menu code Constants
        //Hard Code this is database menu code for screen
        public const int EMPLOYEE_MASTER_MENUCODE = 1910;

        #endregion
    }
}
