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
    
    public partial class EmployeeIDdetail
    {
        public int EmployeeIDdetail_ID { get; set; }
        public Nullable<int> IDcardTypeID { get; set; }
        public Nullable<int> EmpcodeID { get; set; }
        public string Idnumber { get; set; }
        public Nullable<System.DateTime> validFrom { get; set; }
        public Nullable<System.DateTime> ValidTo { get; set; }
        public Nullable<int> IssueCityID { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int Createdby_ID { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> Modifiedby_ID { get; set; }
        public Nullable<int> School_ID { get; set; }
        public Nullable<int> Group_ID { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
