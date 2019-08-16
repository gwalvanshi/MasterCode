using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using MailKit.Net.Imap;
using MailKit.Search;
using MailKit;
using MimeKit;
namespace GEE.Communication
{
   public class IMAPEmail:Message
    {
        private string ValidateData()
        {
            string errorMessage;
            if (_toMailId.Trim() == "")
            {
                errorMessage = "To-Email address is empty.";
            }
            else if (_fromMailId.Trim() == "")
            {
                errorMessage = "From-Email address is empty.";
            }
            else
            {
                errorMessage = "";
            }
            return errorMessage;
        }
        public override string Send()
        {
            string errorMessg = ValidateData();
            using (var client = new ImapClient())
            {
                // For demo-purposes, accept all SSL certificates
                client.ServerCertificateValidationCallback = (s, c, h, e) => true;

                client.Connect("imap.friends.com", 993, true);

                client.Authenticate("joey", "password");

                // The Inbox folder is always available on all IMAP servers...
                var inbox = client.Inbox;
                inbox.Open(FolderAccess.ReadOnly);

                Console.WriteLine("Total messages: {0}", inbox.Count);
                Console.WriteLine("Recent messages: {0}", inbox.Recent);

                for (int i = 0; i < inbox.Count; i++)
                {
                    var message = inbox.GetMessage(i);
                    Console.WriteLine("Subject: {0}", message.Subject);
                }

                client.Disconnect(true);
                return errorMessg;
            }
        }   
    }
}
