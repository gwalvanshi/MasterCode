using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GEE.API.Models
{
    public class ApplicationRoleManager : RoleManager<IdentityRole>
    {
        
        public int? Sessionyear { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int? CreatedBy_ID { get; set; }
        public System.DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy_ID { get; set; }
        public int? SchoolID { get; set; }
        public int? GroupID { get; set; }
        public bool? ISDeleted { get; set; }

        public ApplicationRoleManager(IRoleStore<IdentityRole, string> roleStore)
            : base(roleStore)
        {
        }

        public static ApplicationRoleManager Create(IdentityFactoryOptions<ApplicationRoleManager> options, IOwinContext context)
        {
            var appRoleManager = new ApplicationRoleManager(new RoleStore<IdentityRole>(context.Get<ApplicationDbContext>()));

            return appRoleManager;
        }
    }
}