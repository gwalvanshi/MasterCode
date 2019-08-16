﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GEE.Business.Models;

namespace GEE.Business.Model.Admission
{    
    public class AssessmentTypeModel : BaseEntity
    {
        public int AssessmentType_Id { get; set; }
        public int? AssessmentGroup_ID { get; set; }
        public string AssessmentType_code { get; set; }
        public string AssessmentType_Name { get; set; }
        public int? MinMarks { get; set; }
        public int? MaxMarks { get; set; }
        public int? PassingMarks { get; set; }
        public string Weightage { get; set; }         
    }

    public class AssessmentTypeViewModel
    {
        public int AssessmentType_Id { get; set; }
        public int? AssessmentGroup_ID { get; set; }
        public string AssessmentType_code { get; set; }
        public string AssessmentType_Name { get; set; }
        public int? MinMarks { get; set; }
        public int? MaxMarks { get; set; }
        public int? PassingMarks { get; set; }
        public string Weightage { get; set; }             

        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public string SortOrder { get; set; }
        public string SortColumn { get; set; }
        public int RowCount { get; set; }
        public string ParentName { get; set; }
        public string DefaultValue { get; set; }
    }
}
