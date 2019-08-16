using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using GEE.Business.Interface.Admission;
using GEE.Business.Models.Admission;
using GEE.Common;
using NLog;

namespace GEE.API.Controllers.Admission
{
    public class ClassesController : BaseController
    {
        IClasses _iClasses;
        public ClassesController(IClasses classes)
        {
            _iClasses = classes;
        }
        [Route("admission/classes")]
        [HttpGet]
        public HttpResponseMessage GetClasses()
        {
            CustomDataResponseModel customResponseModel = new CustomDataResponseModel();
            try
            {
                ClassesModel objClassesModel = new ClassesModel();
                List<ClassesModel> objList = new List<ClassesModel>();
                objList = _iClasses.GetAll();              

                if (objList.Count > 0)
                {
                    customResponseModel.type = "success";
                    customResponseModel.message = "";
                    customResponseModel.data = objList;
                }
                else
                {
                    customResponseModel.type = "error";
                    customResponseModel.message = "No records found!";
                    customResponseModel.data = objList;

                }

            }
            catch (Exception ex)
            {
                customResponseModel.type = "error";
                customResponseModel.message = ex.Message;
                customResponseModel.data = null;
                return Request.CreateResponse(HttpStatusCode.ExpectationFailed, customResponseModel);
            }
            return Request.CreateResponse(HttpStatusCode.OK, customResponseModel);
        }
    }
}