using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using GEE.Business.Interface.EmailLibrary;
using GEE.Business.Models.EmailLibrary;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace GEE.API.Controllers.EmailLibrary
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CommunicationTemplateController :BaseController
    {
        ICommunicationTemplate _communicationTemp;

        public CommunicationTemplateController(ICommunicationTemplate communicationTemp)
        {
            _communicationTemp = communicationTemp;
        }
    }
}