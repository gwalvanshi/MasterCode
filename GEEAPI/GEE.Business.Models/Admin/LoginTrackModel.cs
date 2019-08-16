using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;
namespace GEE.Business.Model.Admin
{
    public class LoginTrackModel : BaseEntity
    {
        public int Track_ID { get; set; }
        public Nullable<int> UserID { get; set; }
        public string IPAddress { get; set; }
        public Nullable<System.DateTime> LoginTime { get; set; }
        public Nullable<System.DateTime> LogoutTime { get; set; }
        public string MacAddress { get; set; }
        public string latitudeLongitude { get; set; }
        public string DeviceType { get; set; }
        public string DeviceName { get; set; }
        public Nullable<byte> AuthenticationType { get; set; }
    }
}
