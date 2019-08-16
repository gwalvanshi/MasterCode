using System;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using GEE.Business.Interface.EmailLibrary;
using GEE.Business.Models.EmailLibrary;
using GEE.Communication;

namespace GEE.API.Controllers.EmailLibrary
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class EmailLogController : BaseController
    {
        IEmailLog _emailLog;

        public EmailLogController(IEmailLog emailLog)
        {
            _emailLog = emailLog;
        }
        [AcceptVerbs("POST")]
        [HttpPost]
        public async Task<EmailLogModel> Save(EmailLogModel data)
        {
            EmailLogModel objEmailLogModel = new EmailLogModel();
            Message _objMessage;
            string returnMsg = string.Empty;
            try
            {
                _objMessage = Message.CreateMessageObject(System.Configuration.ConfigurationManager.AppSettings["COMM_TYPE"].ToString());              
                _objMessage._toMailId = data.MailTo.ToString();
                _objMessage._ccToEmailId = data.MailCC.ToString();
                _objMessage._bccToEmailId = data.MailBCC.ToString();
                _objMessage._subject = data.Subject.ToString();
                _objMessage._messageBody = data.MailSMSBody.ToString();
                _objMessage._mailAttachments = data.MailAttachments.ToString();
                 _objMessage._hostName = System.Configuration.ConfigurationManager.AppSettings["HostName"].ToString();
                _objMessage._port = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["Port"].ToString());
                _objMessage._fromMailId = System.Configuration.ConfigurationManager.AppSettings["FromMailId"].ToString();
                _objMessage._frmEmailPwd = System.Configuration.ConfigurationManager.AppSettings["FrmEmailPwd"].ToString();
                _objMessage._isBodyHtml = Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["IsBodyHtml"].ToString());
                _objMessage._isSSLEnable = System.Configuration.ConfigurationManager.AppSettings["IsSSLEnable"].ToString();
                returnMsg = _objMessage.Send();
                objEmailLogModel= await _emailLog.SaveAsync(data);
                objEmailLogModel.ReturnMessage = returnMsg;
                return objEmailLogModel;

            }
            catch (Exception ex)
            {
                Common.MyLogger.Error(ex.Message + ex.StackTrace + ex.InnerException.ToString());
                return null;
            }

        }

    }
}