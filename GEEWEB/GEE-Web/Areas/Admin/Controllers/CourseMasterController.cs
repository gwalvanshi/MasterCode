using GEE.Web.Service.Admin;
using GEE.Web.Service.SchoolSetup;
using GEE.Web.ViewModel;
using GEE.Web.ViewModel.Admin;
using GEE.Web.ViewModel.SchoolSetup;
using GEE_Web.Controllers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace GEE_Web.Areas.Admin.Controllers
{
    public class CourseMasterController : BaseController
    {
        ///
        ///Created By: Amit Gajera on 05/01/2019 
        ///
        ClassMasterService _classService = new ClassMasterService();
        SubjectMasterService _subjectService = new SubjectMasterService();
        CourseMasterService _courseService = new CourseMasterService();
        MasterTableService masterService = new MasterTableService();

        public ActionResult Index()
        {
            return View();
        }
        public async Task<ActionResult> Create()
        {
            var ClassList = await _classService.GetAllClass();
            var SubjectList = await _subjectService.GetAll();

            ViewBag.ClassList = ClassList;
            ViewBag.SubjectList = SubjectList.Where(w => w.ISDeleted == false);

            return View();
        }

        [HttpPost]
        public async Task<ActionResult> SaveCourceTable(string strJsonData = "")
        {
            try
            {
                if (strJsonData != "")
                {
                    List<CourseMasterModel> _list = new List<CourseMasterModel>();
                    _list = JsonConvert.DeserializeObject<List<CourseMasterModel>>(strJsonData);

                    var stringContent = new StringContent(JsonConvert.SerializeObject(_list).ToString(), Encoding.UTF8, "application/json");
                    var status = await _courseService.SaveAllRow(stringContent);
                    return Json(data: status);
                }
                return Json(data: "");
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<ActionResult> Edit(int id = 0)
        {            
            var ClassList = await _classService.GetEditClassListWithCourse();
            ViewBag.ClassList = ClassList;
            ViewBag.Id = id;
            if (id > 0)
            {
                List<SubjectMasterViewModel> _list = new List<SubjectMasterViewModel>();
                var SubjectList = await _subjectService.GetAll();
                _list = SubjectList.Where(w => w.ISDeleted == false).ToList();
                ViewBag.SubjectList = _list;
                ViewBag.CourseList = await _courseService.GetAllCourseWithClass(Convert.ToInt32(id));

                var _gradeStructure = await masterService.GetMasterDropdownData(null, 2017, null, null, null, null);
                var _streamsList = await masterService.GetMasterDropdownData(null, 2022, null, null, null, null);

                var _grlist = new SelectList(_gradeStructure, "MasterTable_id", "Name", 0);
                ViewData["GradeStructureList"] = _grlist;

                var _strlist = new SelectList(_streamsList, "MasterTable_id", "Name", 0);
                ViewData["StreamsList"] = _strlist;
            }
            else
            {
                ViewBag.SubjectList = null;
                ViewBag.CourseList = null;
            }
            return View();
        }


        [HttpPost]
        public async Task<ActionResult> UpdateCourceTable(string strJsonData = "")
        {
            try
            {
                if (strJsonData != "")
                {
                    List<EditCourseMasterModel> _list = new List<EditCourseMasterModel>();
                    _list = JsonConvert.DeserializeObject<List<EditCourseMasterModel>>(strJsonData);

                    var stringContent = new StringContent(JsonConvert.SerializeObject(_list).ToString(), Encoding.UTF8, "application/json");
                    var status = await _courseService.UpdateCourceTableAllRow(stringContent);
                    return Json(data: status);
                }
                return Json(data: "");
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}