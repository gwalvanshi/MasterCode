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

namespace GEE.Business.Manager.Admin
{
    public class AspNetUserManager : IAspNetUser
    {
        IMyDataAccess<GEE.DataAccess.AspNetUser> _db = new MyDataAccess<GEE.DataAccess.AspNetUser>();

        /// <summary>
        /// This is the generic methos to get data from user  and relevent table.
        /// Added by jiya
        /// Date: 22 Apr 2019
        /// </summary>
        /// <param name="SelectColumn"></param>
        /// <param name="SearchValue"></param>
        /// <param name="PageNo"></param>
        /// <param name="PageSize"></param>
        /// <param name="SortColumn"></param>
        /// <param name="SortOrder"></param>
        /// <returns></returns>
        public List<AspNetUserModel> GetUserDetailsWithPagingSorting(string SelectColumn, string SearchValue, int PageNo, int PageSize, string SortColumn, string SortOrder)
        {
            List<AspNetUserModel> enquirModelList = new List<AspNetUserModel>();
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
                    enquirModelList = context.Database.SqlQuery<AspNetUserModel>("GetUserDetails @SelectColumn, @SearchValue,@PageNo,@PageSize,@SortColumn,@SortOrder", P1, P2, P3, P4, P5, P6).ToList();

                }

            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return enquirModelList;
        }
        /// <summary>
        /// Get user data based on cuser id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public AspNetUserModel GetUserDetailById(int id)
        {
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var UserData = objGEEDbContext.AspNetUsers.Where(a => a.CUserId == id).FirstOrDefault();
            return Mapper.Map<AspNetUserModel>(UserData);
        }
        public int GetUserDetailByUserId(string id)
        {
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var UserData = objGEEDbContext.AspNetUsers.Where(a => a.Id == id).FirstOrDefault();
            return UserData.CUserId;
        }       
        public bool DeActivateUser(int id)
        {

            bool isDelete = false;
            try
            {
                GEEDbContext objGEEDbContext = new GEEDbContext();
                var UserData = objGEEDbContext.AspNetUsers.Where(a => a.CUserId == id).FirstOrDefault();
                UserData.ISDeleted = true;
                objGEEDbContext.Entry(UserData).State = System.Data.Entity.EntityState.Modified;
                objGEEDbContext.Entry(UserData).Property(x => x.CUserId).IsModified = false;
                if ( objGEEDbContext.SaveChanges()>0)
                {
                    isDelete = true;
                }               
            }
            catch (Exception)
            {
                isDelete = false;
            }
            return isDelete;
        }
        public void Delete(Model.Admin.AspNetUserModel entity)
        {
            _db.Delete(1);
        }

        public Task DeleteAsync(Model.Admin.AspNetUserModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public List<Model.Admin.AspNetUserModel> GetAll()
        {
            try
            {
                //var ddllist = _enquiryDataAccess.GetDDl("Religion", "ReligionName", "Religion_ID", "ISDeleted=0");

                var enquiryList = _db.GetAll();
                List<Model.Admin.AspNetUserModel> enquiryModelList = new List<Model.Admin.AspNetUserModel>();
                foreach (var item in enquiryList)
                {
                    enquiryModelList.Add(Mapper.Map<Model.Admin.AspNetUserModel>(item));
                }
                return enquiryModelList;
            }
            catch (Exception ex)
            {
                string str = ex.ToString();

            }
            return null;
        }

        public Task<List<Model.Admin.AspNetUserModel>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Model.Admin.AspNetUserModel GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<Model.Admin.AspNetUserModel> GetByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Model.Admin.AspNetUserModel Save(Model.Admin.AspNetUserModel entity)
        {           
            var user = _db.Save(Mapper.Map<GEE.DataAccess.AspNetUser>(entity));
            return new Model.Admin.AspNetUserModel { UserName = user.UserName };
        }

        public async Task<Model.Admin.AspNetUserModel> SaveAsync(Model.Admin.AspNetUserModel entity)
        {
            var user = await _db.SaveAsync(Mapper.Map<GEE.DataAccess.AspNetUser>(entity));
            return new Model.Admin.AspNetUserModel { UserName = user.UserName };

          
        }

        public AspNetUserModel Update(AspNetUserModel entity)
        {
            int cuid =Convert.ToInt32(entity.CUserId);
            GEEDbContext objGEEDbContext = new GEEDbContext();
            var UserData = objGEEDbContext.AspNetUsers.Where(a => a.CUserId == cuid).FirstOrDefault();
            UserData.Email = entity.Email;
            UserData.PasswordHash = entity.PasswordHash;
            UserData.PhoneNumber = entity.PhoneNumber;
            UserData.UserName = entity.UserName;
            UserData.FirstName = entity.FirstName;
            UserData.LastName = entity.LastName;
            UserData.UserGroupId = entity.UserGroupId;
            UserData.StuStaffTypeId = entity.StuStaffTypeId; 
            objGEEDbContext.Entry(UserData).State = System.Data.Entity.EntityState.Modified;
            objGEEDbContext.Entry(UserData).Property(x => x.CUserId).IsModified = false;
            int i=  objGEEDbContext.SaveChanges();
            return new Model.Admin.AspNetUserModel { CUserId = i };
        }

        public async Task<Model.Admin.AspNetUserModel> UpdateAsync(Model.Admin.AspNetUserModel entity)
        {
            var user = await _db.UpdateAsync(Mapper.Map<GEE.DataAccess.AspNetUser>(entity));
            return new Model.Admin.AspNetUserModel { CUserId = user.CUserId };
        }
    }
}
