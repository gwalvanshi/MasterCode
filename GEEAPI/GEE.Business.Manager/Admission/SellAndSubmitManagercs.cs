using GEE.Business.Interface.Admission;
using GEE.Business.Model.Admission;
using GEE.Business.Models.Admission;
using GEE.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Manager.Admission
{
    public class SellAndSubmitManager : ISellSubmit
    {


        /// <summary>
        /// This is the generic methos to get data from Sell and Submit and relevent table.
        /// </summary>
        /// <param name="SelectColumn"></param>
        /// <param name="SearchValue"></param>
        /// <param name="PageNo"></param>
        /// <param name="PageSize"></param>
        /// <param name="SortColumn"></param>
        /// <param name="SortOrder"></param>
        /// <returns></returns>
        public List<SellSubmitModel> GetSellSubmitwithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder)
        {
            List<SellSubmitModel> sellSubmitModelList = new List<SellSubmitModel>();
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {
                    var P1 = new SqlParameter("@SelectColumn", SelectColumn);
                    var P2 = new SqlParameter("@SearchValue", SearchValue);
                    var P3 = new SqlParameter("@PageNo", PageNo);
                    var P4 = new SqlParameter("@PageSize", PageSize);
                    var P5 = new SqlParameter("@SortColumn", SortColumn);
                    var P6 = new SqlParameter("@SortOrder", SortOrder);
                    sellSubmitModelList = context.Database.SqlQuery<SellSubmitModel>("GetSellAndSubmitDetails @SelectColumn, @SearchValue,@PageNo,@PageSize,@SortColumn,@SortOrder", P1, P2, P3, P4, P5, P6).ToList();

                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return sellSubmitModelList;
        }

        /// <summary>
        /// check application is sold = true against EnquiryId
        /// </summary>
        /// <param name="enquiryId"></param>
        /// <returns></returns>
        public bool GetIsApplicationSold(int enquiryId)
        {

            bool isAppSoldResult = false;
            try
            {
                using (GEEDbContext context = new GEEDbContext())
                {

                    var objApplication = context.Applications.Where(a => a.Enquiry_ID == enquiryId).FirstOrDefault();
                    if (objApplication != null)
                        isAppSoldResult = (bool)objApplication.Applicationsold;
                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return isAppSoldResult;
        }

        /// <summary>
        /// This is for Update Application no and IsSubmited Prop
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public ApplicationModel UpdateApplicationNo(ApplicationModel entity)
        {
            using (GEEDbContext context = new GEEDbContext())
            {

                Application application = context.Applications.Where(a => a.Enquiry_ID == entity.Enquiry_ID).FirstOrDefault();
                if (application != null)
                {
                    //If isSubmitted false
                    if (!entity.IsSubmitted)
                    {
                        application.ApplicaitonNo = entity.ApplicaitonNo;
                        application.ApplicationSoldDate = DateTime.Now;
                    }
                    else
                    {
                        application.IsSubmitted = entity.IsSubmitted;
                        application.SubmitDate = DateTime.Now;
                    }
                    context.Entry(application).State = EntityState.Modified;
                    context.SaveChanges();
                }

            }
            return new ApplicationModel { Application_ID = entity.Application_ID };
        }

        /// <summary>
        /// This is for Update Registration no and IsSubmitedDate Prop
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public RegistrationModel UpdateRegistrationNo(RegistrationModel entity)
        {
            using (GEEDbContext context = new GEEDbContext())
            {

                Registration registration = context.Registrations.Where(a => a.Enquiry_ID == entity.Enquiry_ID).FirstOrDefault();
                if (registration != null)
                {
                    registration.RegistrationNo = entity.RegistrationNo;
                    registration.IsSubmitedDate = DateTime.Now;

                }
                context.Entry(registration).State = EntityState.Modified;
                context.SaveChanges();
                return new RegistrationModel { Registration_ID = entity.Registration_ID };

            }

        }
    }
}
