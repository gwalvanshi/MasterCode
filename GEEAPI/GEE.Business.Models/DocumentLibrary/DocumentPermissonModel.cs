using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.DocumentLibrary
{
    public class DocumentPermissionModel
    {
        public int DocumentPermission_Id { get; set; }
        public Nullable<int> IdType { get; set; }
        public string ID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public Nullable<int> SubCategoryID { get; set; }
        public Nullable<int> TypeID { get; set; }
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
