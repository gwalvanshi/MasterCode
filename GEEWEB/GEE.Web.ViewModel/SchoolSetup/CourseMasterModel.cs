﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.ViewModel.SchoolSetup
{

    public class CourseMasterModel : BaseViewModel
    {
        public int CourseMaster_ID { get; set; }
        public int? SubjectMaster_ID { get; set; }
        public int? ClassMaster_ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool? ExcfromAtt { get; set; }
        public bool? ISoptional { get; set; }
        public int? Streams { get; set; }
        public int? GradeStructure { get; set; }       
    }

    public class EditCourseMasterModel : BaseViewModel
    {
        public int CourseMaster_ID { get; set; }
        public int? SubjectMaster_ID { get; set; }
        public int? ClassMaster_ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool? ExcfromAtt { get; set; }
        public bool? ISoptional { get; set; }
        public int? Streams { get; set; }
        public int? GradeStructure { get; set; }
        public string Status { get; set; }
    }

}
