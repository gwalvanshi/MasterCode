using GEE.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admin
{
  public  class AspNetUserClaimViewModel: BaseViewModel
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string ClaimType { get; set; }
        public string ClaimValue { get; set; }
      
       

        public virtual AspNetUserViewModel AspNetUser { get; set; }
    }
}
