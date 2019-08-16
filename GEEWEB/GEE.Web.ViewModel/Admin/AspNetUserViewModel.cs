using GEE.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace GEE.Web.ViewModel.Admin
{
    public  class AspNetUserViewModel: BaseViewModel
    {
       
        public string UserGroupName { get; set; }
        public string Name { get; set; }
        public int MaxRows { get; set; }       
        public string Email { get; set; }
       
        public string Password { get; set; }
       
        public string ConfirmPassword { get; set; }
        public string UserName { get; set; }
        public string PhoneNumber { get; set; }
        
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int? StuStaffTypeId { get; set; }
        public int? UserGroupId { get; set; }
        public int? CUserId { get; set; }
        public string Id { get; set; }
        public bool EmailConfirmed { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
      
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public DateTime? LockoutEndDateUtc { get; set; }
        public bool LockoutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        
    }
}
