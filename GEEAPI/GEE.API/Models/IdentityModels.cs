using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;

namespace GEE.API.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public int? Sessionyear { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int? CreatedBy_ID { get; set; }
        public System.DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy_ID { get; set; }
        public int? SchoolID { get; set; }
        public int? GroupID { get; set; }
        public bool? ISDeleted { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int? StuStaffTypeId { get; set; }
        public int? UserGroupId { get; set; }
       // public int? CUserId { get; set; }

      
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager, string authenticationType)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, authenticationType);
            // Add custom user claims here
            return userIdentity;
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
            this.Configuration.LazyLoadingEnabled = false;
            this.Configuration.ProxyCreationEnabled = false;
        }
        
        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}