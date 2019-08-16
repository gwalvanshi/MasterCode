using GEE.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admin
{
   public class AspNetUserLoginViewModel: BaseViewModel
    {
        public string LoginProvider { get; set; }
        public string ProviderKey { get; set; }
        public string UserId { get; set; }
       
      

        public virtual AspNetUserViewModel AspNetUser { get; set; }
    }
}
