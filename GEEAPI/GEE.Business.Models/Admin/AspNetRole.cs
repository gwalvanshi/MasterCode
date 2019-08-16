using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class AspNetRole: BaseEntity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AspNetRole()
        {
            this.AspNetUserRoles = new HashSet<AspNetUserRole>();
        }

        public string Id { get; set; }
        public string Name { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        //public System.DateTime CreatedDate { get; set; }
        //public Nullable<int> CreatedBy_ID { get; set; }
        //public Nullable<System.DateTime> ModifiedDate { get; set; }
        //public Nullable<int> ModifiedBy_ID { get; set; }
        //public Nullable<int> SchoolID { get; set; }
        //public Nullable<int> GroupID { get; set; }
        //public Nullable<bool> ISDeleted { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AspNetUserRole> AspNetUserRoles { get; set; }
    }
}
