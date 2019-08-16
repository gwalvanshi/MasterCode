using GEE.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Business.Model.SchoolSetup
{
   public class SubjectMasterModel: BaseEntity
    {
        public int SubjectMaster_ID { get; set; }
        public int? AssessmentStructure_ID { get; set; }
        public int? GradeStructure_ID { get; set; }
        public int? SubjectType_Id { get; set; }
        public int? SubjectGroup_ID { get; set; }

        public string Code { get; set; }
        public string Name { get; set; }
        public bool? isOptional { get; set; }
        public string IncludedInCGPA { get; set; }
        public string ExculdedfromAtt { get; set; }
        public bool? isScholastic { get; set; }
       

        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }

        public string AssessmentStructureName { get; set; }
        public string GradeStructureName { get; set; }
        public string SubjectTypeName { get; set; }
        public string SubjectGroupName { get; set; }
    }
}
