
using GEE.Business.Model.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.DocumentLibrary
{
   public class DocumentTypeModel : BaseEntity
    {
        
        public int DocumentTypeID { get; set; }
        public string DocumentTypeCode { get; set; }
        public string DocumentTypeName { get; set; }
        public int ? DocumentCategoryID { get; set; }
        public bool ? Digitalallowed { get; set; }
        public bool ? IsMandatory { get; set; }
        public bool ? ToFollow { get; set; }
        public string FollowupTypeCode { get; set; }
        public string SessionYear { get; set; }
        public string Remarks { get; set; }
        public int CreatedBy { get; set; }

        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }

        public MasterTableModel MasterTable { get; set; }

    }
}
