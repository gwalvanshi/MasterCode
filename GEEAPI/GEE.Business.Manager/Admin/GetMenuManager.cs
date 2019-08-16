using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.DataAccess;
using GEE.Business.Interface.Admin;
using GEE.Business.Model.Admin;
using AutoMapper;
using GEE.Business.Interface;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace GEE.Business.Manager.Admin
{
    public class GetMenuManager:IGetMenu
    {
        public List<GetMenuModel> GetMenuList(string userName, byte ActionID)
        {
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var navMenuList = objGEEDbContext.NavigationMenu1.Where(a => a.NaviVisible == true);
            List<GetMenuModel> listGetMenuModel = new List<GetMenuModel>();
            foreach (var item in navMenuList)
            {
                listGetMenuModel.Add(Mapper.Map<GetMenuModel>(item));
            }
            return listGetMenuModel;
        }
        public string GetMenuListstring(string userName, byte ActionID)
        {
            string jsonstring = "";
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var Param1 = new SqlParameter("@userName", userName);
                    var Param2 = new SqlParameter("@ActionID", ActionID);

                    //getMenu = context.Database.SqlQuery<GetMenuModel>("GetMenu @userName, @ActionID", Param1, Param2).ToList();
                    //string jsonb = string.Concat(context.Database.SqlQuery("exec GetMenu @userName"), new SqlParameter("@userName", Param1));
                    var  getmenu = context.Database.SqlQuery<string>("GetMenu @userName, @ActionID", Param1, Param2).ToList();
                    jsonstring = getmenu[0].ToString();
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return jsonstring;
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
