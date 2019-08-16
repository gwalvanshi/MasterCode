using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Model.Admin;
namespace GEE.Business.Interface.Admin
{
    public interface IGetMenu : IDisposable
    {

        List<GetMenuModel> GetMenuList(string userName, byte ActionID);
        string GetMenuListstring(string userName, byte ActionID);
    }
}
