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
    
    public partial class EmployeeExperience
    {
        public int EmployeeExperience_Id { get; set; }
        public Nullable<int> EmpCode { get; set; }
        public string Company_Name { get; set; }
        public string WorkCity { get; set; }
        public Nullable<System.DateTime> From_Date { get; set; }
        public Nullable<System.DateTime> To_Date { get; set; }
        public Nullable<int> Last_salary { get; set; }
        public string joining_Designation { get; set; }
        public string Last_Designation { get; set; }
        public string Reason_To_leave { get; set; }
        public Nullable<bool> IsRelevant { get; set; }
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
