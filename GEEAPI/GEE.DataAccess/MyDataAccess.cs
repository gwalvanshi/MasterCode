using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace GEE.DataAccess
{
    public class MyDataAccess<T> : IMyDataAccess<T> where T : class
    {
        public MyDataAccess()
        {
            DbContext = new GEEDbContext();
            if (DbContext == null)
            {
                throw new ArgumentNullException("Null DbContext");
            }
            DbSet = DbContext.Set<T>();
        }

        protected DbContext DbContext { get; set; }

        protected DbSet<T> DbSet { get; set; }

        public virtual List<T> GetDDl(string tblName, string Fname, string Code, string Cond)
        {

            using (var context = new GEEDbContext())
            {
                //var TbName = new SqlParameter("@TbName", "Religion");
                //var fname = new SqlParameter("@fname", "ReligionName");
                //var code = new SqlParameter("@code", "Religion_ID");
                //var cond = new SqlParameter("@cond", "ISDeleted=0");

                var TbName = new SqlParameter("@TbName", tblName);
                var fname = new SqlParameter("@fname", Fname);
                var code = new SqlParameter("@code", Code);
                var cond = new SqlParameter("@cond", Cond);


                var result = context.Database
                    .SqlQuery<T>("FillCombo @TbName, @fname, @code, @cond", TbName, fname, code, cond)
                    .ToList();

                return result;
            }

            //using (var context = new GEEDbContext())
            //{
            //    var TbName = new SqlParameter("@TbName", tblName);
            //    var fname = new SqlParameter("@fname", Fname);
            //    var code = new SqlParameter("@code", Code);
            //    var cond = new SqlParameter("@cond", Cond);


            //    var result = context.Database
            //        .SqlQuery<T>("FillCombo @TbName, @fname, @code, @cond", TbName, fname, code, cond)
            //        .ToList();

            //    return result;
            //}
        }

        public virtual List<T> GetAll()
        {
            return DbSet.ToList();
        }

        public virtual List<T> GetAll(params Expression<Func<T, object>>[] includes)
        {
            IQueryable<T> query = DbSet.Include(includes[0]);
            foreach (var include in includes.Skip(1))
            {
                query = query.Include(include);
            }
            return query.ToList();
        }

        public virtual Task<List<T>> GetAllAsync()
        {
            return DbSet.ToListAsync();
        }

        public virtual Task<List<T>> GetAllAsync(params Expression<Func<T, object>>[] includes)
        {
            IQueryable<T> query = DbSet.Include(includes[0]);
            foreach (var include in includes.Skip(1))
            {
                query = query.Include(include);
            }
            return query.ToListAsync();
        }

        public virtual T GetById(int id)
        {
            return DbSet.Find(id);
        }      

        public virtual async Task<T> GetByIdAsync(int id)
        {
            return await DbSet.FindAsync(id);
        }

        public virtual T Save(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State != EntityState.Detached)
            {
                dbEntityEntry.State = EntityState.Added;
            }
            else
            {
                DbSet.Add(entity);
            }
            DbContext.SaveChanges();
            return entity;
        }

        public virtual async Task<T> SaveAsync(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);

            try
            {
                if (dbEntityEntry.State != EntityState.Detached)
                {
                    dbEntityEntry.State = EntityState.Added;
                }
                else
                {
                    DbSet.Add(entity);
                }
                await DbContext.SaveChangesAsync();

            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }

                return null;
            }
            return entity;
        }
       
               
        

        public virtual T Update(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State == EntityState.Detached)
            {
                DbSet.Attach(entity);
            }
            dbEntityEntry.State = EntityState.Modified;
            DbContext.SaveChanges();
            return entity;
        }
        //public virtual void SetPropertyIsModified(T entity)
        //{           
        //    DbContext.Entry(entity).Property("UserName").IsModified = false;
        //}

        //public virtual void SetEntityStateModified(T entity)
        //{
        //    DbContext.Entry(entity).State = EntityState.Modified;
        //}
        public virtual async Task<T> UpdateAsync(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State == EntityState.Detached)
            {
                DbSet.Attach(entity);
            }
            dbEntityEntry.State = EntityState.Modified;           
            await DbContext.SaveChangesAsync();
            return entity;


            //try
            //{
            //    DbContext.Entry(entity).State = EntityState.Modified;
            //    await DbContext.SaveChangesAsync();
            //}
            //catch (Exception ex)
            //{

            //    throw;
            //}
            //return entity;
        }

        public virtual void Delete(int id)
        {
            var entity = GetById(id);
            if (DbContext.Entry(entity).State == EntityState.Detached)
            {
                DbSet.Attach(entity);
                if (entity == null) return; // not found; assume already deleted.
                DbSet.Remove(entity);
            }
        }

        public async Task DeleteAsync(int id)
        {
            var entity = await GetByIdAsync(id);
            if (DbContext.Entry(entity).State == EntityState.Detached)
            {
                DbSet.Attach(entity);
                if (entity == null) return; // not found; assume already deleted.
                DbSet.Remove(entity);
            }
        }

        public virtual List<T> RunSqlQuery(string query, params DbParameter[] parameters)
        {
            return DbSet.SqlQuery(query, parameters).ToList();
        }

        public virtual async Task<List<T>> RunSqlQueryAsync(string query, params DbParameter[] parameters)
        {
            return await DbSet.SqlQuery(query, parameters).ToListAsync();
        }
    }
}