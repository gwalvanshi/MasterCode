using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq.Expressions;
using System.Threading.Tasks;
using GEE.Business.Models.DocumentLibrary;

namespace GEE.DataAccess
{
    public interface IMyDataAccess<T> where T : class
    {
        List<T> GetAll();

        List<T> GetAll(params Expression<Func<T, object>>[] includes);

        Task<List<T>> GetAllAsync();

        Task<List<T>> GetAllAsync(params Expression<Func<T, object>>[] includes);

        T GetById(int Id);

        Task<T> GetByIdAsync(int id);

        T Save(T entity);

        Task<T> SaveAsync(T entity);

        T Update(T entity);

        Task<T> UpdateAsync(T entity);

        void Delete(int id);

        Task DeleteAsync(int id);

        List<T> RunSqlQuery(string query, params DbParameter[] parameters);

        Task<List<T>> RunSqlQueryAsync(string query, params DbParameter[] parameters);

        List<T> GetDDl(string tblName, string Fname, string Code, string Cond);
    }
}
