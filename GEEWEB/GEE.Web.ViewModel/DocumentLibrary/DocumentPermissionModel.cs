using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.DocumentLibrary
{

    public class DocumentPermissionModel : BaseViewModel
    {
        public int DocumentPermission_Id { get; set; }
        public Nullable<int> IdType { get; set; }
        public string ID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public Nullable<int> SubCategoryID { get; set; }
        public Nullable<int> TypeID { get; set; }
        public Nullable<int> Sessionyear { get; set; }
        
    }
}
