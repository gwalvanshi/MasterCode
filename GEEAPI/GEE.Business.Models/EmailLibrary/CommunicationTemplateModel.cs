using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.EmailLibrary
{ 
   public class CommunicationTemplateModel : BaseEntity
    {
        public int Temp_Id { get; set; }
        public string TempCode { get; set; }
        public string TemplateName { get; set; }
        public int ? CommunicationType { get; set; }
        public string MailSMSBody { get; set; }
        public string Subject { get; set; }
    }
}
