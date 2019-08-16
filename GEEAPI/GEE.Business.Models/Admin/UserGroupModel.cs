using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class UserGroupModel:BaseEntity
    {
        public UserGroupModel()
        {
            this.UserGroupAspUserMappings = new List<UserGroupAspUserMappingModel>();
            this.UserGroupNavigationMenuMappings = new List<UserGroupNavigationMenuMappingModel>();
        }

        public int UserGroupId { get; set; }
        public string UserGroupCode { get; set; }
        public string UserGroupName { get; set; }
       
      

        public  List<UserGroupAspUserMappingModel> UserGroupAspUserMappings { get; set; }
        public  List<UserGroupNavigationMenuMappingModel> UserGroupNavigationMenuMappings { get; set; }
    }
}
