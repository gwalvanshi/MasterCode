using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.DataAccess;
using System.Linq.Dynamic;
using System.Data.SqlClient;
using System.Reflection;
using GEE.Business.Model.PopupLookup;
namespace GEE.Business.Manager.PopupLookup
{
    #region Popup Base Class
    /// <summary>
    /// This is base class for popup lookup 
    /// Added by Jiya
    /// </summary>
    public abstract class CommonPopupLookupManager
    {
        public enum PopLookupTypes
        {
            CandidateDetails = 1, Enquiry, City
        }
        public static CommonPopupLookupManager CreatePopLookup(PopLookupTypes plt)
        {
            switch (plt)
            {
                case PopLookupTypes.CandidateDetails:
                    return new CandidateDetailPopup();

            }
            throw new System.NotSupportedException(string.Format("Lookup Type: {0} is not implemented.", plt.ToString()));
        }
        public abstract PopupLookupResponseModel GetAllData(PopupLookupRequestModel objPopupLookupModel);
        /// <summary>
        /// This method is using to convert list into Datatable;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="items"></param>
        /// <returns></returns>
        public DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            dataTable.TableName = "PopupRecord";
            //Get all the properties by using reflection   
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names  
                dataTable.Columns.Add(prop.Name);
            }
           
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {

                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);               
            }
           
            return dataTable;
        }

    }
    #endregion

   
}
