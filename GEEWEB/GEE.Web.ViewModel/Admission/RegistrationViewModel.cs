using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Admission
{
    public class RegistrationViewModel : BaseViewModel
    {
        public int Registration_ID { get; set; }
        public int? Enquiry_ID { get; set; }
        public string RegistrationNo { get; set; }
       
        public bool IsSubmitted { get; set; }
        public DateTime IsSubmitedDate { get; set; }
    }
}
