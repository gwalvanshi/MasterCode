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
    
    public partial class RoomMaster
    {
        public int RoomMaster_ID { get; set; }
        public string Building_ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public Nullable<int> SeatingCapicity { get; set; }
        public string GeoCoordinates { get; set; }
        public string Remarks { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int Createdby_ID { get; set; }
        public System.DateTime ModifiedDate { get; set; }
        public int Modifiedby_ID { get; set; }
        public Nullable<int> School_ID { get; set; }
        public Nullable<int> Group_ID { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
