using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using GEE.Web.ViewModel;

namespace GEE.Web.BusinessLogic
{
    public class ApiConnection
    {
        readonly IEnumerable<EnquiryViewModel> students = null;

        //private HttpClient client = new HttpClient();

        readonly HttpClient client = new HttpClient();

        int i = 0;
        StringBuilder sr = new StringBuilder();
     sr.
    
        //  client.BaseAddress = new Uri("http://localhost:64189/api/");


        //var responseTask = client.GetAsync("Enquiry");
        //responseTask.Wait();

        //                    var result = responseTask.Result;
        //                    if (result.IsSuccessStatusCode)
        //                    {
        //                        var readTask = result.Content.ReadAsAsync<IList<EnquiryViewModel>>();
        //readTask.Wait();

        //                        students = readTask.Result;
        //                    }
        //                    else //web api sent error response 
        //                    {

        //                        students = Enumerable.Empty<EnquiryViewModel>();
        //                    }
        //        }
    }
   }
