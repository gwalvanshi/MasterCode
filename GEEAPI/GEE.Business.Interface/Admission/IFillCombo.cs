using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Model.Admission;
using GEE.Business.Models.Admission;

namespace GEE.Business.Interface.Admission
{
   public interface IFillCombo : IDisposable
    {

        List<DdlViewModel> GetDDl(string TbName, string fname, string code, string cond);
    }
}
