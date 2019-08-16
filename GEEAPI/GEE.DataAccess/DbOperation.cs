using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.DataAccess
{
    public class DbOperation : IDbOperation
    {
        public DbOperation()
        {
            DbContext = new GEEDbContext();
            if (DbContext == null)
            {
                throw new ArgumentNullException("Null DbContext");
            }
        }
        protected DbContext DbContext { get; set; }

        public int RunSQLCommand(string query, params DbParameter[] parameters)
        {
            return DbContext.Database.ExecuteSqlCommand(query, parameters);
        }
        public async Task<int> RunSQLCommandAsync(string query, params DbParameter[] parameters)
        {

            return await DbContext.Database.ExecuteSqlCommandAsync(query, parameters);
        }

        public List<T> RunSQLQuery<T>(string query, DbParameter[] parameters)
        {
            return DbContext.Database.SqlQuery<T>(query, parameters).ToList();
        }

        public async Task<List<T>> RunSQLQueryAsync<T>(string query, DbParameter[] parameters)
        {
            return await DbContext.Database.SqlQuery<T>(query, parameters).ToListAsync();
        }

    }
}
