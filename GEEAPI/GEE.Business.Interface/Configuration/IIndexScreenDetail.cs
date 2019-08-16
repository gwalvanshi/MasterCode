using GEE.Business.Model.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface.Configuration
{
   public interface IIndexScreenDetail : IService<IndexScreenDetailModel>
    {
        List<IndexScreenDetailModel> GetAllIncludeSearch(int menuId);

        Task<List<IndexScreenDetailModel>> GetAllIncludeSearchAsync(int menuId);
       
    }
}
