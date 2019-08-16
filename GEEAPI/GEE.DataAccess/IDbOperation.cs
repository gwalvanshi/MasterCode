using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.DataAccess
{
    interface IDbOperation
    {

        int RunSQLCommand(string query, params DbParameter[] parameters);

        Task<int> RunSQLCommandAsync(string query, params DbParameter[] parameters);

        List<T> RunSQLQuery<T>(string query, DbParameter[] parameters);

        Task<List<T>> RunSQLQueryAsync<T>(string query, DbParameter[] parameters);
        
    }
}
