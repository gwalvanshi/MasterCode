using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models.DocumentLibrary;

namespace GEE.Business.Interface.DocumentLibrary
{
   public interface IDocumentType : IService<DocumentTypeModel>
    {
        bool DeleteDocumentType(DocumentTypeModel model);
		List<DocumentTypeModel> GetAllByCategory(int category);
        Task<List<DocumentTypeModel>> GetAllByCategoryAsync(int category);
    
        List<DocumentTypeModel> GetAllDocumentType(int docCatId,int pageNo, int pageSize, string sortOrder, string sortColumn);
    }
}
