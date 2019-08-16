using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GEE.Web.ViewModel.Admin
{
    public class ClassMasterViewModel : BaseViewModel
    {
        public int ClassMaster_ID { get; set; }
        public int? ClassClassification_Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int? Sequence { get; set; }
        public int? TotalSections { get; set; }
        
    }

    public class ClassMasterGridViewModel
    {

        public int ClassMaster_ID { get; set; }
        public string ClassClassification { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int? Sequence { get; set; }
        public int? TotalSections { get; set; }

        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }
        public string ParentName { get; set; }
        public string DefaultValue { get; set; }
    }
    public class ClassWithCourceViewModel
    {
        public int ClassMaster_ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int CountCourseRecord { get; set; }
    }
}
