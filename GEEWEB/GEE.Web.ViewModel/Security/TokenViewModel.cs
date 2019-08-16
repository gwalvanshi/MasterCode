using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.Security
{
    public class TokenViewModel
    {
        public string  UserName { get; set; }
        public string Password { get; set; }
        public string Grant_Type { get; set; }

        public string Access_Token { get; set; }
      
        public string Refresh_Token { get; set; }

        public string SchoolId { get; set; }
        public string GroupId { get; set; }

        public string SessionYear { get; set; }
        public string CUserId { get; set; }

        public string Id { get; set; }

        //sessionStorage.setItem('accessToken', response.access_token)
        //                  sessionStorage.setItem('userName', response.userName)
        //                  sessionStorage.setItem('refreshToken', response.refresh_token)
        //                  sessionStorage.setItem('schoolId', response.schoolId)
        //                  sessionStorage.setItem('groupId', response.groupId)
        //                  sessionStorage.setItem('sessionYear', response.sessionYear)

        //username: $('#txtEmail').val(),
        //                  password: $('#txtPassword').val(),
        //                  grant_type: 'password'
    }
}
