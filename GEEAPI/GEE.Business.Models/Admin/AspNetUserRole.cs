using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class AspNetUserRole:BaseEntity
    {
        public string UserId { get; set; }
        public string RoleId { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        //public System.DateTime CreatedDate { get; set; }
        //public Nullable<int> CreatedBy_ID { get; set; }
        //public Nullable<System.DateTime> ModifiedDate { get; set; }
        //public Nullable<int> ModifiedBy_ID { get; set; }
        //public Nullable<int> SchoolID { get; set; }
        //public Nullable<int> GroupID { get; set; }
        //public Nullable<bool> ISDeleted { get; set; }

        public virtual AspNetRole AspNetRole { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
    }
}
