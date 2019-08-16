using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.EmailLibrary
{
   public class MailMergeModel : BaseEntity
    {
        public int MergeId { get; set; }
        public string MergeCode { get; set; }
        public string VariableName { get; set; }
        public string MergeVariable { get; set; }
        public int ? CommunicationType { get; set; }
    }
}
