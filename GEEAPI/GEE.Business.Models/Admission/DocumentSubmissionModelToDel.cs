using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.Admission
{
   public class DocumentSubmissionModelToDel:BaseEntity
    {
        public int DocumentSub_ID { get; set; }
        public int ? Document_ID { get; set; }
        public int ? Enquiry_Id { get; set; }
        public int ? Application_ID { get; set; }
        public DateTime ? SubmissionDate { get; set; }
        public string PathofDocument { get; set; }
        public string PhysicalFileLocaiton { get; set; }
        public int ? SumissionMethod { get; set; }
        public bool ? OnlineDocumentVerified { get; set; }
       
    }
}
