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
    
    public partial class EmployeeEducationDetail
    {
        public int EmployeeEducationDetail_ID { get; set; }
        public Nullable<int> EmpCode { get; set; }
        public Nullable<int> Degree_ID { get; set; }
        public string Subjects { get; set; }
        public Nullable<System.DateTime> FromDate { get; set; }
        public Nullable<System.DateTime> ToDate { get; set; }
        public string InstituteName { get; set; }
        public string City { get; set; }
        public Nullable<int> EmpDegreeModeid { get; set; }
        public Nullable<int> Percent_Marks { get; set; }
        public string Division { get; set; }
        public string Remarks { get; set; }
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
