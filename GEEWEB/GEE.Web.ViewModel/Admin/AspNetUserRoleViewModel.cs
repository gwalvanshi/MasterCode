using GEE.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admin
{
    public class AspNetUserRoleViewModel: BaseViewModel
    {
        public string UserId { get; set; }
        public string RoleId { get; set; }
           

        public virtual AspNetRoleViewModel AspNetRole { get; set; }
        public virtual AspNetUserViewModel AspNetUser { get; set; }
    }
}
