using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admission
{
   public class StartAdmissionViewModel:BaseViewModel
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
        public string StingStartdate { get; set; }
        public string StingFromDOB { get; set; }
        public string StingTODOB { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }

        public string Convertedstartdate { get; set; }
        public string Convertedfrmdob { get; set; }
        public string Convertedtodob { get; set; }
    }
}
