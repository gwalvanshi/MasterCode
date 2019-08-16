using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.DocumentLibrary
{
    public class DocumentCategoryModel:BaseEntity
    {
        public int DocumentCategoryID { get; set; }
        public string CategoryCode { get; set; }
        public string CategoryName { get; set; }
        public string SessionYear { get; set; }
    }
}
