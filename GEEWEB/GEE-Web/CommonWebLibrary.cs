using GEE.Web.Service.Security;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Xml;
using System.Xml.Serialization;

namespace GEE_Web.WebLibrary
{
    public class CommonWebLibrary
    {
        /// <summary>
        /// This method is used for getting mandotory * from resource file.
        /// </summary>
        /// <param name="navigationId"></param>
        /// <returns></returns>
        public List<string> GetMandotoryValues(string navigationId)
        {
            try
            {
                List<string> arrayList = new List<string>();
                System.Resources.ResourceManager rm = new System.Resources.ResourceManager("GEE_Web.Resource", this.GetType().Assembly);

                var entry =
                    rm.GetResourceSet(System.Threading.Thread.CurrentThread.CurrentCulture, true, true)
                      .OfType<DictionaryEntry>();

                var abc = entry.Where(a => a.Key.ToString().Contains(navigationId) && a.Value.ToString() =="1").ToList();
               
                foreach (var item in abc)
                {                  
                        arrayList.Add(item.Key.ToString());
                }
                return arrayList;

            }
            catch (Exception ex)
            {

                throw;
            }

        }
        /// <summary>
        /// This method is used for get the tool tip from resource file according to navigation.
        /// </summary>
        /// <param name="navigationId"></param>
        /// <returns></returns>
        public  List<ResourceKeyValueModel> GetToolTipValues(int navigationId)
        {
            try
            {
                List<ResourceKeyValueModel> arrayList = new List<ResourceKeyValueModel>();
                ResourceKeyValueModel objResourceKeyValueModel = new ResourceKeyValueModel();
                System.Resources.ResourceManager rm = new System.Resources.ResourceManager("GEE_Web.Resource", this.GetType().Assembly);

                var entry =
                    rm.GetResourceSet(System.Threading.Thread.CurrentThread.CurrentCulture, true, true)
                      .OfType<DictionaryEntry>();

                
                var abc = entry.Where(a => a.Key.ToString().Contains(navigationId.ToString())).ToList();

                foreach (var item in abc)
                {
                    if (item.Key.ToString().ToLower().Contains("tt"))
                    {
                        objResourceKeyValueModel.Key = item.Key.ToString();
                        objResourceKeyValueModel.Value = item.Value.ToString();
                        arrayList.Add(objResourceKeyValueModel);                        
                    }
                }
                return arrayList;

            }
            catch (Exception ex)
            {

                throw;
            }

        }
        /// <summary>
        /// This method is used for get the label information from resource file according to navigation id.
        /// </summary>
        /// <param name="navigationId"></param>
        /// <returns></returns>
        public List<ResourceKeyValueModel> GetLabelInfoValues(int navigationId)
        {
            try
            {

                List<ResourceKeyValueModel> arrayList = new List<ResourceKeyValueModel>();
                ResourceKeyValueModel objResourceKeyValueModel = new ResourceKeyValueModel();
                System.Resources.ResourceManager rm = new System.Resources.ResourceManager("GEE_Web.Resource", this.GetType().Assembly);

                var entry =
                    rm.GetResourceSet(System.Threading.Thread.CurrentThread.CurrentCulture, true, true)
                      .OfType<DictionaryEntry>();

                
                var abc = entry.Where(a => a.Key.ToString().Contains(navigationId.ToString())).ToList();
                foreach (var item in abc)
                {
                    if (item.Key.ToString().ToLower().Contains("lbl"))
                    {
                        objResourceKeyValueModel.Key = item.Key.ToString();
                        objResourceKeyValueModel.Value = item.Value.ToString();
                        arrayList.Add(objResourceKeyValueModel);
                    }
                }
                return arrayList;

            }
            catch (Exception ex)
            {

                throw;
            }
        }
        /// <summary>
        /// This method is used for get the validation message from resource file according to navigation id.
        /// </summary>
        /// <param name="navigationId"></param>
        /// <returns></returns>
        public List<ResourceKeyValueModel> GetValidationMessageValues(int navigationId)
        {
            try
            {
                List<ResourceKeyValueModel> arrayList = new List<ResourceKeyValueModel>();
                ResourceKeyValueModel objResourceKeyValueModel = new ResourceKeyValueModel();
                System.Resources.ResourceManager rm = new System.Resources.ResourceManager("GEE_Web.Resource", this.GetType().Assembly);

                var entry =
                    rm.GetResourceSet(System.Threading.Thread.CurrentThread.CurrentCulture, true, true)
                      .OfType<DictionaryEntry>();

               
                var abc = entry.Where(a => a.Key.ToString().Contains(navigationId.ToString())).ToList();
                foreach (var item in abc)
                {
                    if (item.Key.ToString().ToLower().Contains("vk"))
                    {
                        objResourceKeyValueModel.Key = item.Key.ToString();
                        objResourceKeyValueModel.Value = item.Value.ToString();
                        arrayList.Add(objResourceKeyValueModel);
                    }
                }
                return arrayList;

            }
            catch (Exception ex)
            {

                throw;
            }

        }
        /// <summary>
        /// This method is using to convert datattable to json
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public string ConvertDatatableToJson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }
        public string DataTableToJsonObj(DataTable dt)
        {
            DataSet ds = new DataSet();
            ds.Merge(dt);
            StringBuilder JsonString = new StringBuilder();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                JsonString.Append("[");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    JsonString.Append("{");
                    for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                    {
                        if (j < ds.Tables[0].Columns.Count - 1)
                        {
                            JsonString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds.Tables[0].Rows[i][j].ToString() + "\",");
                        }
                        else if (j == ds.Tables[0].Columns.Count - 1)
                        {
                            JsonString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds.Tables[0].Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == ds.Tables[0].Rows.Count - 1)
                    {
                        JsonString.Append("}");
                    }
                    else
                    {
                        JsonString.Append("},");
                    }
                }
                JsonString.Append("]");
                return JsonString.ToString();
            }
            else
            {
                return null;
            }
        }

        public  string GetXMLFromObject(object o)
        {
            StringWriter sw = new StringWriter();
            XmlTextWriter tw = null;
            try
            {
                XmlSerializer serializer = new XmlSerializer(o.GetType());
                tw = new XmlTextWriter(sw);
                serializer.Serialize(tw, o);
            }
            catch (Exception ex)
            {
                //Handle Exception Code
            }
            finally
            {
                sw.Close();
                if (tw != null)
                {
                    tw.Close();
                }
            }
            return sw.ToString();
        }
        /// <summary>
        /// This method is using to convert list into Datatable;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="items"></param>
        /// <returns></returns>
        public DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
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
        public string ToListTOTableString<T>(List<T> items)
        {
            string xml = string.Empty;
            DataTable dataTable = new DataTable(typeof(T).Name);
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
            StringWriter objStringWriter;
            StringBuilder objstrBuilder = new StringBuilder();
            objStringWriter = new StringWriter(objstrBuilder);
            dataTable.WriteXml(objStringWriter);
            objStringWriter.Dispose();
            return objstrBuilder.ToString();
        }
        /// <summary>
        /// This methos is used to check the user permission is available or not for the operation.
        /// Added By Jiya
        /// Added Where 02 May 2019
        /// </summary>
        /// <param name="userGroup"></param>
        /// <param name="menuId"></param>
        /// <param name="permission"></param>
        /// <returns></returns>
        public async Task<bool> IsValidPermission(int userGroup, int menuCode, string permission)
        {
            NavigationPermissionService objNavigationPermissionService = new NavigationPermissionService();
            bool isValid = false;
            var list = await objNavigationPermissionService.GetNavigationPermission(userGroup, menuCode);
            var prmission = list.Where(a => a.Permission.Trim().ToLower() == permission.Trim().ToLower()).SingleOrDefault();
            if (prmission != null)
            {
                isValid = true;
            }
            return isValid;
        }

        //public static List<T> ConvertDataTable<T>(DataTable dt)
        //{
        //    List<T> data = new List<T>();
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        T item = GetItem<T>(row);
        //        data.Add(item);
        //    }
        //    return data;
        //}
        //public static T GetItem<T>(DataRow dr)
        //{
        //    Type temp = typeof(T);
        //    T obj = Activator.CreateInstance<T>();

        //    foreach (DataColumn column in dr.Table.Columns)
        //    {
        //        foreach (PropertyInfo pro in temp.GetProperties())
        //        {
        //            if (pro.Name.ToLower() == column.ColumnName.ToLower())
        //                pro.SetValue(obj, dr[column.ColumnName], null);
        //            else
        //                continue;
        //        }
        //    }
        //    return obj;
        //}

        /// <summary>
        /// This method is used to get value from rex file based on Key
        /// Added by Jiya
        /// Addded when 09-April-2018
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string  GetKeyValueFromResx(string keys)
        {
            try
            {
                string keyValue = string.Empty;
                string []  splkeys = keys.Split(',');
                List<ResourceKeyValueModel> arrayList = new List<ResourceKeyValueModel>();
                ResourceKeyValueModel objResourceKeyValueModel = new ResourceKeyValueModel();
                System.Resources.ResourceManager rm = new System.Resources.ResourceManager("GEE_Web.Resource", this.GetType().Assembly);

                var entry =
                    rm.GetResourceSet(System.Threading.Thread.CurrentThread.CurrentCulture, true, true)
                      .OfType<DictionaryEntry>();

                for (int i = 0; i < splkeys.Length; i++)
                {
                    var value= entry.Where(a => a.Key.ToString() == splkeys[i].ToString()).FirstOrDefault();
                    if (value.Value != null)
                        keyValue += value.Value.ToString() + ",";
                    else
                        keyValue += splkeys[i].ToString()+",";
                }               
            
                return keyValue.Remove(keyValue.Length - 1); 

            }
            catch (Exception ex)
            {

                throw;
            }

        }

    }
}