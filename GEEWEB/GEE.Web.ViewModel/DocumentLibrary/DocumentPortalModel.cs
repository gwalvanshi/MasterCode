using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.DocumentLibrary
{

   public class DocumentPortalModel 
    {
        public int Id { get; set; }

        public string DocumentType { get; set; }
        public string Subcategory { get; set; }
        public string Category { get; set; }
        public string DigitalPath { get; set; }
        public string PhysicalPath { get; set; }
    }
}
