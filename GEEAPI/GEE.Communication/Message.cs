using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Communication;
namespace GEE.Communication
{
    public abstract  class Message
    {
        public Int64 _messgId; public string _fromMailId; public string _toMailId;
        public string _ccToEmailId; public string _bccToEmailId;
        public string _subject; public string _messageBody;
        public string _mailAttachments;
        public string _isSSLEnable;
        public bool _isBodyHtml;
        public string _hostName;
        public string _frmEmailPwd;
        public int _port;
        public static Message CreateMessageObject(string commType)
        {
            switch (commType)
            {
                case "SMTPEMAIL":
                    return new SMTPEmail();
                case "POP3EMAIL":
                    return new POP3Email();
                case "IMAPEMAIL":
                    return new IMAPEmail();
                case "SMS":
                    return new SMS();
            }
            throw new System.NotSupportedException("CommunicationType: " + commType + " is not recognized.");
        }
        public abstract string Send();
    }
}
