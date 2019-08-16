using AutoMapper;
using GEE.Business.Interface.Admission;
using GEE.Business.Model.Admission;
using GEE.Business.Models.Admission;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace GEE.Business.Manager.Admission
{
    public class LookupsManager : IFillCombo
    {

        public List<DdlViewModel> GetDDl(string tbName, string fname, string code, string cond)
        {
            List<DdlViewModel> getDdlList = new List<DdlViewModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var TbName = new SqlParameter("@TbName", tbName);
                    var fName = new SqlParameter("@fname", fname);
                    var Code = new SqlParameter("@code", code);
                    var Cond = new SqlParameter("@cond", cond);


                    getDdlList = context.Database.SqlQuery<DdlViewModel>("FillCombo @TbName, @fname, @code, @cond", TbName, fName, Code, Cond).ToList();
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return getDdlList;
        }


        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.

                disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        // ~EnquiryManager() {
        //   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //   Dispose(false);
        // }

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }

        #endregion


    }
}
