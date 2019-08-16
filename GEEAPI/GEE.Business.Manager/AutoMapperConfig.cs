using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using GEE.Business.Models.Admission;
using GEE.Business.Model.Admin;
using GEE.DataAccess;
using GEE.Business.Model.Admission;
using GEE.Business.Model.Configuration;
using GEE.Business.Models.DocumentLibrary;
using GEE.Business.Model.SchoolSetup;
using GEE.Business.Models.SchoolSetup;
using GEE.Business.Model.Transport;
using GEE.Business.Model.HR;

namespace GEE.Business.Manager
{
    public class AutoMapperConfig
    {
        public static void Initialize()
        {
            Mapper.Initialize((config) =>
            {
               
                config.CreateMap<Enquiry, EnquiryModel>().ReverseMap();
                config.CreateMap<ClassMaster, ClassesModel>().ReverseMap();
                config.CreateMap<AcademicYear, AcademicYearModel>().ReverseMap();
               
                config.CreateMap<Application, ApplicationModel>().ReverseMap();
                config.CreateMap<CandidateDetail, CandidateDetailModel>().ReverseMap();
                config.CreateMap<DocumentSubmissionDetail, DocumentSubmissionModel>().ReverseMap();
                config.CreateMap<Registration, RegistrationModel>().ReverseMap();
              
                //config.CreateMap<GEE.DataAccess.AspNetUser, Model.Admin.AspNetUserModel>().ReverseMap();
                //config.CreateMap<GEE.DataAccess.AspNetRole, Model.Admin.AspNetRoleModel>().ReverseMap();
                //config.CreateMap<GEE.DataAccess.AspNetUserRole, Model.Admin.AspNetUserRoleModel>().ReverseMap();
                config.CreateMap<UserGroup, UserGroupModel>().ReverseMap();
                config.CreateMap<UserGroupAspUserMapping, UserGroupAspUserMappingModel>().ReverseMap();
                config.CreateMap<UserGroupNavigationMenuMapping, UserGroupNavigationMenuMapping>().ReverseMap();
                config.CreateMap<NavigationType, NavigationTypeModel>().ReverseMap();
                config.CreateMap<NavigationMenu, NavigationMenuModel>().ReverseMap();
                //config.CreateMap<GetMenu_Result, GetMenuModel>().ReverseMap();
                config.CreateMap<LoginTrack, LoginTrackModel>().ReverseMap();

                config.CreateMap<CommunicationTemplate, CommunicationTemplate>().ReverseMap();
                config.CreateMap<EmailLog, EmailLog>().ReverseMap();
                config.CreateMap<SMSLog, SMSLog>().ReverseMap();
                config.CreateMap<MailMerge, MailMerge>().ReverseMap();
                config.CreateMap<SchoolConfig, SchoolConfigModel>().ReverseMap();
                config.CreateMap<NumberGenScheme, NumberGenSchemeModel>().ReverseMap();
                config.CreateMap<MasterTable, MasterTableModel>().ReverseMap();
                config.CreateMap<AspNetUser, AspNetUserModel>().ReverseMap();
                config.CreateMap<IndexScreenDetail, IndexScreenDetailModel>().ReverseMap();
                config.CreateMap<DocumentType, DocumentTypeModel>().ReverseMap();
                config.CreateMap<ClassMaster, ClassMasterModel>().ReverseMap();
                config.CreateMap<BookMaster, BookMasterModel>().ReverseMap();
                config.CreateMap<SubjectMaster, SubjectMasterModel>().ReverseMap();
                config.CreateMap<AssessmentTYPE, AssessmentTypeModel>().ReverseMap();
                config.CreateMap<CourseMaster, CourseMasterModel>().ReverseMap();
                config.CreateMap<RoomMaster, RoomModel>().ReverseMap();
                config.CreateMap<AssessmentStructureAssessmentTypeMapping, AssessmentStructureAssessmentTypeMappingModel>().ReverseMap();
				config.CreateMap<DocumentSubmissionDetail, DocumentSubmissionModel>().ReverseMap();
                config.CreateMap<StopMaster, StopMasterModel>().ReverseMap();


                config.CreateMap<EmployeeEducationDetail, EmployeeEducationDetailModel>().ReverseMap();
                config.CreateMap<EmployeeExperience, EmployeeExperienceModel>().ReverseMap();
                config.CreateMap<EmployeeIDdetail, EmployeeIDdetailModel>().ReverseMap();
                config.CreateMap<EmployeeMaster, EmployeeMasterModel>().ReverseMap();
            });
        }

    }
}
