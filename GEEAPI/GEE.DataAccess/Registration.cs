//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GEE.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Registration
    {
        public int Registration_ID { get; set; }
        public Nullable<int> Enquiry_ID { get; set; }
        public string RegistrationNo { get; set; }
        public Nullable<bool> Issubmitted { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedBy_ID { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> ModifiedBy_ID { get; set; }
        public Nullable<int> SchoolID { get; set; }
        public Nullable<int> GroupID { get; set; }
        public Nullable<bool> ISDeleted { get; set; }
        public Nullable<System.DateTime> IsSubmitedDate { get; set; }
    
        public virtual Enquiry Enquiry { get; set; }
    }
}
