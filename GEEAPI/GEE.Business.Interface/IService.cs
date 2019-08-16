using GEE.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Interface
{
    public interface IService<TEntity> : IDisposable where TEntity : BaseEntity
    {
        List<TEntity> GetAll();

        Task<List<TEntity>> GetAllAsync();

        TEntity GetById(int id);

        Task<TEntity> GetByIdAsync(int id);

        TEntity Save(TEntity entity);

        Task<TEntity> SaveAsync(TEntity entity);

        TEntity Update(TEntity entity);

        Task<TEntity> UpdateAsync(TEntity entity);

        void Delete(TEntity entity);

        Task DeleteAsync(TEntity entity);


        
    }
}
