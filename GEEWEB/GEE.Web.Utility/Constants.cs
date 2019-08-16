using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
namespace GEE.Web.Utility
{
   public class Constants
    {
               #region [ Common Constants ]     
        public static string BASE_URL = ConfigurationManager.AppSettings["ServiceURL"];
        public const string POPUPLOOKUP_URL = "api/CommonPopupLookup/GetData";
       

       
        #endregion


    }
}
