using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
    public class UnitModel : BaseEntity
    {
        //Sam
        public UnitModel()
        {
            tblSizes = new List<SizeModel>();
        }
        // Sam Ends

        public int UnitID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public int? CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public List<SizeModel> tblSizes { get; set; }

    }
}
