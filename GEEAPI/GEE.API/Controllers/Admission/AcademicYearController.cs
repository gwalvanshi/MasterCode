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
    public class AcademicYearController : BaseController
    {
        // GET: AcademicYear
        IAcademicYear _iAcademicYear;
        public AcademicYearController(IAcademicYear academicYear)
        {
            _iAcademicYear = academicYear;
        }
        [Route("admission/years")]
        [HttpGet]
        public HttpResponseMessage GetAcademicYear()
        {
            CustomDataResponseModel customResponseModel = new CustomDataResponseModel();
            try
            {
                AcademicYearModel objAcademicYearModel = new AcademicYearModel();
                List<AcademicYearModel> objList = new List<AcademicYearModel>();
                  objList = _iAcademicYear.GetAll();              


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