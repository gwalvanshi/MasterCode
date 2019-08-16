using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.SchoolSetup
{
    public class BookMasterViewModel : BaseViewModel
    {
        public int BookMaster_Id { get; set; }
        public string Code { get; set; }
        public string name { get; set; }
        public string Publisher { get; set; }
        public string ISBN { get; set; }
        public string Version { get; set; }
        public double? MRP { get; set; }
        public double? Discount { get; set; }
    }


    public class BookMasterGridViewModel
    {

        public int BookMaster_Id { get; set; }
        public string Code { get; set; }
        public string name { get; set; }
        public string Publisher { get; set; }
        public string ISBN { get; set; }
        public string Version { get; set; }
        public double? MRP { get; set; }
        public double? Discount { get; set; }

        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }
        public string ParentName { get; set; }
        public string DefaultValue { get; set; }
    }
}
