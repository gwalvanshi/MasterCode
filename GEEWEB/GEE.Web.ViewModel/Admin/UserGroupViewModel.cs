using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admin
{
   public class UserGroupViewModel:BaseViewModel
    {
        public int UserGroupId { get; set; }
        public string UserGroupCode { get; set; }
        public string UserGroupName { get; set; }
       
    }
}
