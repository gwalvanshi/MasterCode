using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class NavigationTypeModel:  BaseEntity
    {
        public int NavigationTypeId { get; set; }
        public string NavigationTypeCode { get; set; }
        public string NavigationTypeName { get; set; }
       
      
    }
}
