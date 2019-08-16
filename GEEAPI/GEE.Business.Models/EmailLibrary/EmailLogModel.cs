using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.EmailLibrary
{
   public class EmailLogModel : BaseEntity
    {
        public int LogId { get; set; }
        public string LogCode { get; set; }
        public int ? TempId { get; set; }
        public string MailFrom { get; set; }
        public string MailTo { get; set; }
        public string MailCC { get; set; }
        public string MailBCC { get; set; }
        public string MailAttachments { get; set; }
        public string MailSMSBody { get; set; }
        public string Subject { get; set; }
        public bool ? IsSent { get; set; }
        public int ? UserId { get; set; }
        public int ? UserType { get; set; }
        public string ReturnMessage { get; set; }
    }
}
