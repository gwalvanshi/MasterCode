using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Communication
{
   public class POP3Email:Message
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
            if (errorMessg == "")
            {
                try
                {
                    MailMessage msg = new MailMessage();
                    msg.IsBodyHtml = _isBodyHtml;

                    //From Email Id
                    msg.From = new MailAddress(_fromMailId);


                    string[] arrToEmailIds = _toMailId.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string strToEmailId in arrToEmailIds)
                    {
                        if (strToEmailId.Trim() != "") msg.To.Add(strToEmailId);
                    }

                    //CC To Email Ids
                    string[] arrCCToEmailIds = _ccToEmailId.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string strCCToEmailId in arrCCToEmailIds)
                    {
                        if (strCCToEmailId.Trim() != "") msg.CC.Add(strCCToEmailId);
                    }

                    //BCC To Email Ids
                    string[] arrBCCToEmailIds = _bccToEmailId.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string strBCCToEmailId in arrBCCToEmailIds)
                    {
                        if (strBCCToEmailId.Trim() != "") msg.Bcc.Add(strBCCToEmailId);
                    }

                    //Set Subject & Body
                    msg.Subject = _subject; msg.Body = _messageBody;

                    //Set Mail Attachments
                    if (_mailAttachments != "")
                    {
                        if (File.Exists(_mailAttachments))
                        {
                            Attachment fileToAttach = new Attachment(_mailAttachments);
                            msg.Attachments.Add(fileToAttach);
                        }
                        else
                        {
                            throw new Exception("Attachment does not exists");
                        }
                    }

                    SmtpClient _smtpClient = new SmtpClient();

                    _smtpClient.Host = _hostName;
                    _smtpClient.EnableSsl = (_isSSLEnable.ToLower() == "true");
                    NetworkCredential NetworkCred = new NetworkCredential(_fromMailId, _frmEmailPwd);
                    _smtpClient.UseDefaultCredentials = true;
                    _smtpClient.Credentials = NetworkCred;
                    _smtpClient.Port = _port;
                    _smtpClient.Send(msg);
                    msg.Dispose();
                    errorMessg = "Email Sent Successfully.";


                }
                catch (Exception ex)
                {
                    errorMessg = ex.Message;
                }
            }
            return errorMessg;
        }
    }
}
