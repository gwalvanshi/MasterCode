using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Configuration
{
   public class IndexScreenDetailViewModel:BaseViewModel
    {
        public int IndexScreenDetails_ID { get; set; }
        public int? Nav_menu_ID { get; set; }
        public string TableName { get; set; }
        public string ColName { get; set; }
        public bool? GridVisibilty { get; set; }
        public int? Sequence { get; set; }
        public int? Length { get; set; }
        public bool? Search_visible { get; set; }
        public string ColDataType { get; set; }
        public bool? DefaultSorting { get; set; }
        public string DefaultSortOrder { get; set; }
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
    }
}
