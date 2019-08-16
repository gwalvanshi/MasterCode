using GEE.Web.ViewModel.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.DocumentLibrary
{

    public class DocumentPortalViewModel
    {
        public List<MasterTableViewModel> Category { get; set; }
        public List<MasterTableViewModel> SubCategory { get; set; }
        public List<DocumentTypeViewModel> Type { get; set; }

        public List<DocumentPermissionModel> permission {get; set;}


    }
}
