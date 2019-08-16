using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
   public class MasterTableModel:BaseEntity
    {
        public MasterTableModel()
        {
           
        }
        public int MasterTable_id { get; set; }
        public int ? Mastertabletype_id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int ? Parent_id { get; set; }
        public string Remark { get; set; }
      
        public bool? IsDefault { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }
        public string ParentName { get; set; }
        public string DefaultValue { get; set; }
        public virtual MasterTableTypeModel MasterTabletype { get; set; }
       
    }
}
