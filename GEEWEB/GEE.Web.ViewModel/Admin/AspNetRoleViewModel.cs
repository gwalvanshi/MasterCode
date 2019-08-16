using GEE.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admin
{
    public class AspNetRoleViewModel: BaseViewModel
    {
        public AspNetRoleViewModel()
        {
           
        }

        public string Id { get; set; }
        public string Name { get; set; }
        
        
        public  List<AspNetUserRoleViewModel> AspNetUserRoles { get; set; }
    }
}
