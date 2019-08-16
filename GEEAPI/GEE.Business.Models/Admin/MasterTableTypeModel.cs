using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
   public class MasterTableTypeModel:BaseEntity
    {
        public MasterTableTypeModel()
        {
            this.MasterTables = new List<MasterTableModel>();
        }

        public int Mastertabletype_id { get; set; }
        public string MastertableName { get; set; }
       
        public int? ParentId { get; set; }

        public virtual List<MasterTableModel> MasterTables { get; set; }
    }
}
