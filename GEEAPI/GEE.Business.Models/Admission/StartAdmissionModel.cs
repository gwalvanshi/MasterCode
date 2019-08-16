using GEE.Business.Models;
using System;

namespace GEE.Business.Model.Admission
{
    public class StartAdmissionModel : BaseEntity
    {
        public int AdmissionStatus_id { get; set; }
        public int ClassMaster_id { get; set; }
        public string AdmissionCode { get; set; }
        public int AdmissionStatus { get; set; }
        public int AdmissionSessionYear { get; set; }
        public DateTime? Startdate { get; set; }
        public DateTime? FromDOB { get; set; }
        public DateTime? TODOB { get; set; }
        public int? ApplicaitonFees { get; set; }
        public int? RegistrationFees { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }

        public string Convertedstartdate { get; set; }
        public string Convertedfrmdob { get; set; }
        public string Convertedtodob { get; set; }


    }
}
