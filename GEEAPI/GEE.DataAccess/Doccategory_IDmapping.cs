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
    
    public partial class Doccategory_IDmapping
    {
        public int DoccategoryIDmapping_id { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public string IDtablename { get; set; }
        public string IDcolumnname { get; set; }
        public string SearchColumn { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int Createdby_ID { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> Modifiedby_ID { get; set; }
        public int School_ID { get; set; }
        public int Group_ID { get; set; }
        public bool IsDeleted { get; set; }
    }
}
