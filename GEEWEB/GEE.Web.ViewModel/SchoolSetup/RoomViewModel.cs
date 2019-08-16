
using System;

namespace GEE.Web.ViewModel.SchoolSetup
{
   public class RoomViewModel : BaseViewModel
    {
        public int RoomMaster_ID { get; set; }
        public string Building_ID { get; set; }
        public string BuildingName { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public Nullable<int> SeatingCapicity { get; set; }
        public string GeoCoordinates { get; set; }
        public string Remarks { get; set; }       

        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }
    }
}
