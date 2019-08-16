using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Models.EmailLibrary
{
   public class SMSLogModel : BaseEntity
    {
        public int SmsLogId { get; set; }
        public string SmsLogCode { get; set; }
        public string ContactNumber { get; set; }
        public string SMS { get; set; }
        public DateTime ? SentTime { get; set; }
        public bool ?  IsSent { get; set; }
        public int ? UserId { get; set; }
        public int ? UserType { get; set; }

    }
}
