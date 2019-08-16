using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admin
{
    public class MasterTableTypeViewModel:BaseViewModel
    {
        public int Mastertabletype_id { get; set; }
        public string MastertableName { get; set; }
        

        public virtual List<MasterTableViewModel> MasterTables { get; set; }
    }
}
