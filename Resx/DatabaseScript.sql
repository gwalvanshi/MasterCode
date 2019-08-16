USE [GEEDEV]
GO
/****** Object:  Table [dbo].[AcademicYear]    Script Date: 8/15/2019 10:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicYear](
	[AcademicYear_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](20) NULL,
	[ShortName] [char](20) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_AcademicYear] PRIMARY KEY CLUSTERED 
(
	[AcademicYear_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdmissionDetail]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmissionDetail](
	[Admission_ID] [int] IDENTITY(1,1) NOT NULL,
	[AdmissionNumber] [char](10) NULL,
	[Enquiry_ID] [int] NULL,
	[Approvedby_ID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_AdmissionDetail] PRIMARY KEY CLUSTERED 
(
	[Admission_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdmissionStatus]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmissionStatus](
	[AdmissionStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[ClassMaster_id] [int] NOT NULL,
	[AdmissionCode] [varchar](50) NULL,
	[AdmissionStatus] [int] NULL,
	[AdmissionSessionYear] [int] NULL,
	[Startdate] [datetime] NULL,
	[FromDOB] [datetime] NULL,
	[TODOB] [datetime] NULL,
	[ApplicaitonFees] [int] NULL,
	[RegistrationFees] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_[AdmissionStatus] PRIMARY KEY CLUSTERED 
(
	[AdmissionStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Application_ID] [int] IDENTITY(1,1) NOT NULL,
	[Enquiry_ID] [int] NULL,
	[ApplicaitonNo] [char](10) NULL,
	[IsSubmitted] [bit] NOT NULL,
	[SubmitDate] [datetime] NULL,
	[IsOnline] [bit] NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[Applicationsold] [bit] NULL,
	[ApplicationSoldDate] [datetime] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Application_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Role_id] [int] IDENTITY(44,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRolesHistory]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRolesHistory](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[StuStaffTypeId] [int] NULL,
	[UserGroupId] [int] NULL,
	[CUserId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentStructureAssessmentTypeMapping]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentStructureAssessmentTypeMapping](
	[AssessmentStructureAssessmentTypeMapping_Id] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentStructureID] [int] NULL,
	[AssessmentTypeID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_AssessmentStructureAssessmentTypeMapping] PRIMARY KEY CLUSTERED 
(
	[AssessmentStructureAssessmentTypeMapping_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentTYPE]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentTYPE](
	[AssessmentType_Id] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentGroup_ID] [int] NULL,
	[AssessmentType_code] [varchar](50) NULL,
	[AssessmentType_Name] [varchar](50) NULL,
	[MinMarks] [int] NULL,
	[MaxMarks] [int] NULL,
	[PassingMarks] [int] NULL,
	[Weightage] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_AssessmentTYPE] PRIMARY KEY CLUSTERED 
(
	[AssessmentType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchClassTeacherMonitorMapping]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchClassTeacherMonitorMapping](
	[BatchClassTeacherMonitorMapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchMaster_ID] [int] NULL,
	[ClassTeacher_staffID] [int] NULL,
	[classMonitor_AdmID] [int] NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_BatchClassTeacherMonitorMapping] PRIMARY KEY CLUSTERED 
(
	[BatchClassTeacherMonitorMapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchMaster]    Script Date: 8/15/2019 10:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchMaster](
	[BatchMaster_ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassMaster_ID] [int] NULL,
	[SectionMaster_ID] [int] NULL,
	[ShiftMaster_ID] [int] NULL,
	[RoomMaster_ID] [int] NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Startdate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[TotalSeats] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_BatchMaster] PRIMARY KEY CLUSTERED 
(
	[BatchMaster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchStudentMapping]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchStudentMapping](
	[BatchStudentMapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchMaster_ID] [int] NULL,
	[Student_ID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Rollnumber] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_BatchStudentMapping] PRIMARY KEY CLUSTERED 
(
	[BatchStudentMapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCourseMapping]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCourseMapping](
	[BookCourseMapping_Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_ID] [int] NULL,
	[Book_ID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_BookCourseMapping] PRIMARY KEY CLUSTERED 
(
	[BookCourseMapping_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookMaster]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookMaster](
	[BookMaster_Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[Publisher] [varchar](50) NULL,
	[ISBN] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[MRP] [float] NULL,
	[Discount] [float] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_BookMaster] PRIMARY KEY CLUSTERED 
(
	[BookMaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateDetail]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateDetail](
	[CandidateDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Enquiry_ID] [int] NULL,
	[AdmissionClass_id] [int] NULL,
	[LastPassClass_ID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](20) NULL,
	[Lastname] [varchar](50) NULL,
	[DOB] [date] NULL,
	[Email] [varchar](50) NULL,
	[StudentType_ID] [int] NULL,
	[ContactMobileNo] [char](10) NULL,
	[HomePhone] [char](10) NULL,
	[Gender] [char](10) NULL,
	[Nationality] [char](10) NULL,
	[hasSibiling] [bit] NULL,
	[SiblingAdmNumber_ID] [char](10) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City_ID] [int] NULL,
	[State_ID] [int] NULL,
	[Country_ID] [int] NULL,
	[PinCode] [varchar](50) NULL,
	[Landmark] [varchar](50) NULL,
	[DistanceFromSchool] [varchar](50) NULL,
	[Caste_ID] [int] NULL,
	[Religon_ID] [int] NULL,
	[FatheFirstName] [varchar](50) NULL,
	[FatherMiddleName] [varchar](50) NULL,
	[FatherLasttName] [varchar](50) NULL,
	[FatherQualificaiton_ID] [int] NULL,
	[FatherQualificaitonText] [varchar](50) NULL,
	[FatherOccupation] [varchar](50) NULL,
	[FatherOfficeAddres] [varchar](50) NULL,
	[FatherOrgnisation] [varchar](50) NULL,
	[FatherDesignation] [varchar](50) NULL,
	[MotherFirstName] [varchar](50) NULL,
	[MotherMiddleName] [varchar](50) NULL,
	[MotherLasttName] [varchar](50) NULL,
	[MotherQualificaiton_Id] [int] NULL,
	[MotherQualificaitonText] [varchar](50) NULL,
	[MotherOccupation] [varchar](50) NULL,
	[MotherOfficeAddres] [varchar](50) NULL,
	[MotherOrgnisation] [varchar](50) NULL,
	[MotherDesignation] [varchar](50) NULL,
	[CurrentSchool] [varchar](50) NULL,
	[CurrentSchoolCity] [varchar](50) NULL,
	[IsGovtTransfer] [varchar](50) NULL,
	[Remarks] [varchar](100) NULL,
	[CommunicationMode] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[SubjectId] [int] NULL,
	[MotherPhoneNumber] [int] NULL,
	[FatherPhoneNumber] [int] NULL,
 CONSTRAINT [PK_CandidateDetail] PRIMARY KEY CLUSTERED 
(
	[CandidateDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassMaster]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassMaster](
	[ClassMaster_ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassClassification_Id] [int] NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Sequence] [int] NULL,
	[TotalSections] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ClassMaster] PRIMARY KEY CLUSTERED 
(
	[ClassMaster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationTemplate]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationTemplate](
	[Temp_Id] [int] IDENTITY(1,1) NOT NULL,
	[TempCode] [char](10) NULL,
	[TemplateName] [varchar](100) NULL,
	[CommunicationType] [int] NULL,
	[MailSMSBody] [varchar](max) NULL,
	[Subject] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_CommunicationTemplate] PRIMARY KEY CLUSTERED 
(
	[Temp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseBatchMapping]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseBatchMapping](
	[CourseBatchMapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[batchID] [int] NULL,
	[Code] [varchar](50) NULL,
	[Remarks] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CourseBatchMapping] PRIMARY KEY CLUSTERED 
(
	[CourseBatchMapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseMaster]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseMaster](
	[CourseMaster_ID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectMaster_ID] [int] NULL,
	[ClassMaster_ID] [int] NULL,
	[Code] [varchar](20) NULL,
	[Name] [varchar](50) NULL,
	[ExcfromAtt] [bit] NULL,
	[ISoptional] [bit] NULL,
	[Streams] [int] NULL,
	[GradeStructure] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CourseMaster] PRIMARY KEY CLUSTERED 
(
	[CourseMaster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doccategory_IDmapping]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doccategory_IDmapping](
	[DoccategoryIDmapping_id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[IDtablename] [varchar](50) NULL,
	[IDcolumnname] [varchar](50) NULL,
	[SearchColumn] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Doccategory_IDmapping] PRIMARY KEY CLUSTERED 
(
	[DoccategoryIDmapping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentAuditlog]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentAuditlog](
	[DocumentAuditlogId] [int] IDENTITY(1,1) NOT NULL,
	[Reportedincorrect] [bit] NULL,
	[ReportedCorrect] [bit] NULL,
	[documentSubmisisonID] [int] NULL,
	[Remarks] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentAuditlog] PRIMARY KEY CLUSTERED 
(
	[DocumentAuditlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentdownloadHistory]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentdownloadHistory](
	[DocumentdownloadHistoryid] [int] IDENTITY(1,1) NOT NULL,
	[CuserID] [int] NULL,
	[DocumentSubmissionID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentdownloadHistory] PRIMARY KEY CLUSTERED 
(
	[DocumentdownloadHistoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentPermission]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentPermission](
	[DocumentPermission_Id] [int] IDENTITY(1,1) NOT NULL,
	[IdType] [int] NULL,
	[ID] [varchar](20) NULL,
	[CategoryID] [int] NULL,
	[SubCategoryID] [int] NULL,
	[TypeID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentPermission] PRIMARY KEY CLUSTERED 
(
	[DocumentPermission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentSubmissionDetail]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentSubmissionDetail](
	[DocumentSubmission_ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeID] [int] NULL,
	[Enquiry_Id] [int] NULL,
	[AdmissionNumber] [char](10) NULL,
	[EmployeeID] [char](20) NULL,
	[SubmissionDate] [datetime] NULL,
	[DigitalPathofDocument] [varchar](100) NULL,
	[PhysicalFileLocaiton] [varchar](100) NULL,
	[onlinesubmitted] [bit] NULL,
	[OnlineDocumentVerified] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_DocumentSubmissionDetail] PRIMARY KEY CLUSTERED 
(
	[DocumentSubmission_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 8/15/2019 10:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType](
	[DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeCode] [char](10) NULL,
	[DocumentTypeName] [varchar](100) NULL,
	[DocumentCategoryID] [int] NULL,
	[Digitalallowed] [bit] NULL,
	[IsMandatory] [bit] NULL,
	[ToFollow] [bit] NULL,
	[FollowupTypeCode] [char](10) NULL,
	[Is Verified] [bit] NULL,
	[SessionYear] [char](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationDetails]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationDetails](
	[EducationDetailID] [int] IDENTITY(1,1) NOT NULL,
	[EmpCode] [int] NULL,
	[Degree_ID] [int] NULL,
	[Subjects] [varchar](50) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[InstituteName] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[EmpDegreeModeid] [int] NULL,
	[Percent_Marks] [int] NULL,
	[Division] [varchar](20) NULL,
	[Remarks] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
 CONSTRAINT [PK_EducationDetails] PRIMARY KEY CLUSTERED 
(
	[EducationDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailLog]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[LogCode] [char](10) NULL,
	[TempId] [int] NULL,
	[MailFrom] [varchar](100) NULL,
	[MailTo] [varchar](100) NULL,
	[MailCC] [varchar](100) NULL,
	[MailBCC] [varchar](100) NULL,
	[MailAttachments] [varchar](max) NULL,
	[MailSMSBody] [varchar](max) NULL,
	[Subject] [varchar](100) NULL,
	[IsSent] [bit] NULL,
	[UserId] [int] NULL,
	[UserType] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_EmailLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeEducationDetail]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeEducationDetail](
	[EmployeeEducationDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpCode] [int] NULL,
	[Degree_ID] [int] NULL,
	[Subjects] [varchar](50) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[InstituteName] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[EmpDegreeModeid] [int] NULL,
	[Percent_Marks] [int] NULL,
	[Division] [varchar](20) NULL,
	[Remarks] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EmployeeEducationDetails] PRIMARY KEY CLUSTERED 
(
	[EmployeeEducationDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeExperience]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeExperience](
	[EmployeeExperience_Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpCode] [int] NULL,
	[Company_Name] [varchar](100) NULL,
	[WorkCity] [varchar](20) NULL,
	[From_Date] [datetime] NULL,
	[To_Date] [datetime] NULL,
	[Last_salary] [int] NULL,
	[joining_Designation] [varchar](50) NULL,
	[Last_Designation] [varchar](50) NULL,
	[Reason_To_leave] [varchar](100) NULL,
	[IsRelevant] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EmployeeExperience] PRIMARY KEY CLUSTERED 
(
	[EmployeeExperience_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeIDdetail]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeIDdetail](
	[EmployeeIDdetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcardTypeID] [int] NULL,
	[EmpcodeID] [int] NULL,
	[Idnumber] [varchar](50) NULL,
	[validFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[IssueCityID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EmployeeIDdetail] PRIMARY KEY CLUSTERED 
(
	[EmployeeIDdetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[EmployeeMasterID] [int] IDENTITY(1,1) NOT NULL,
	[EmpCode] [varchar](20) NULL,
	[EmpCategoryID] [int] NULL,
	[StaffDesignationID] [int] NULL,
	[VendorID] [int] NULL,
	[DepartmentID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[Lastname] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ContactMobileNo] [varchar](20) NULL,
	[HomePhone] [varchar](20) NULL,
	[CurrentAddress] [varchar](50) NULL,
	[CurrentCityID] [int] NULL,
	[CurrentStateID] [int] NULL,
	[CurrentCountryID] [int] NULL,
	[CurrentPinCode] [varchar](20) NULL,
	[CurrentLandmark] [varchar](50) NULL,
	[Is_also_Permanent] [bit] NULL,
	[PermenentAddress] [varchar](50) NULL,
	[PermenentCity_ID] [int] NULL,
	[PermenentState_ID] [int] NULL,
	[PermenentCountry_ID] [int] NULL,
	[PinCode] [varchar](20) NULL,
	[Landmark] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[GenderID] [int] NULL,
	[Nationality] [varchar](20) NULL,
	[Married] [bit] NULL,
	[Remarks] [varchar](100) NULL,
	[FatheFirstName] [varchar](20) NULL,
	[FatherMiddleName] [varchar](20) NULL,
	[FatherLasttName] [varchar](20) NULL,
	[MotherFirstName] [varchar](20) NULL,
	[MotherMiddleName] [varchar](20) NULL,
	[MotherLasttName] [varchar](20) NULL,
	[Caste_ID] [int] NULL,
	[Religon_ID] [int] NULL,
	[Create_Login] [varchar](50) NULL,
	[selectUsergroup] [varchar](50) NULL,
	[EmpStatusId] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[EmployeeMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enquiry]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enquiry](
	[Enquiry_ID] [int] IDENTITY(1,1) NOT NULL,
	[EnquiryNo] [char](20) NULL,
	[MarketSource_ID] [int] NULL,
	[EnquiryType_ID] [int] NULL,
	[Status] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_Enquiry] PRIMARY KEY CLUSTERED 
(
	[Enquiry_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeDetail]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeDetail](
	[GradeDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeStructure_Id] [int] NULL,
	[Grade] [varchar](50) NULL,
	[FromMarks] [int] NULL,
	[ToMarks] [int] NULL,
	[GradePoint] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_GradeDetail] PRIMARY KEY CLUSTERED 
(
	[GradeDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMaster]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMaster](
	[Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [int] NULL,
	[GroupName] [varchar](100) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State_ID] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[PinCode] [varchar](50) NULL,
	[Landmark] [varchar](50) NULL,
	[GroupEmail] [varchar](50) NULL,
	[GroupOwner] [varchar](50) NULL,
	[OwnerMobile] [varchar](20) NULL,
	[GrouplPhone] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [char](20) NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [char](20) NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_GroupMaster] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseDesignationMemersMapping]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseDesignationMemersMapping](
	[HouseDesignationMemersMapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[House_ID] [int] NULL,
	[Admission_Id] [int] NULL,
	[Staff_ID] [int] NULL,
	[StartDate] [datetime] NULL,
	[Enddate] [datetime] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_HouseDesignationMemersMapping] PRIMARY KEY CLUSTERED 
(
	[HouseDesignationMemersMapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseMembersMapping]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseMembersMapping](
	[HouseMembersMapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[House_ID] [int] NULL,
	[Staff_ID] [int] NULL,
	[Adm_no] [int] NULL,
	[startDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_HouseMembersMapping] PRIMARY KEY CLUSTERED 
(
	[HouseMembersMapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndexScreenDetails]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexScreenDetails](
	[IndexScreenDetails_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nav_menu_ID] [int] NULL,
	[TableName] [varchar](50) NULL,
	[ColName] [varchar](50) NULL,
	[GridVisibilty] [bit] NULL,
	[Sequence] [int] NULL,
	[Length] [int] NULL,
	[Search_visible] [bit] NULL,
	[ColDataType] [varchar](50) NULL,
	[DefaultSorting] [bit] NULL,
	[DefaultSortOrder] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_IndexScreenDetails1] PRIMARY KEY CLUSTERED 
(
	[IndexScreenDetails_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginTrack]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginTrack](
	[Track_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[IPAddress] [varchar](20) NULL,
	[LoginTime] [datetime] NULL,
	[LogoutTime] [datetime] NULL,
	[MacAddress] [varchar](50) NULL,
	[latitudeLongitude] [varchar](50) NULL,
	[DeviceType] [varchar](20) NULL,
	[DeviceName] [varchar](20) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[AuthenticationType] [tinyint] NULL,
 CONSTRAINT [PK_LoginTrack] PRIMARY KEY CLUSTERED 
(
	[Track_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailMerge]    Script Date: 8/15/2019 10:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailMerge](
	[MergeId] [int] IDENTITY(1,1) NOT NULL,
	[MergeCode] [char](10) NULL,
	[VariableName] [varchar](100) NULL,
	[MergeVariable] [varchar](100) NULL,
	[CommunicationType] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_MailMerge] PRIMARY KEY CLUSTERED 
(
	[MergeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterTable]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterTable](
	[MasterTable_id] [int] IDENTITY(1,1) NOT NULL,
	[Mastertabletype_id] [int] NULL,
	[Code] [varchar](20) NULL,
	[Name] [varchar](50) NULL,
	[Parent_id] [int] NULL,
	[Remark] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_MasterTable] PRIMARY KEY CLUSTERED 
(
	[MasterTable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterTabletype]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterTabletype](
	[Mastertabletype_id] [int] IDENTITY(1,1) NOT NULL,
	[MastertableName] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_MasterTabletype] PRIMARY KEY CLUSTERED 
(
	[Mastertabletype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavigationMenu]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavigationMenu](
	[NavigationMenuId] [int] IDENTITY(1,1) NOT NULL,
	[NavigationMenuCode] [char](10) NULL,
	[NavigationMenuName] [varchar](100) NULL,
	[NavigationTypeId] [int] NOT NULL,
	[NavigationMenuParentId] [int] NOT NULL,
	[MenuURL] [nvarchar](256) NULL,
	[IPAddress] [nvarchar](256) NULL,
	[MACAddress] [nvarchar](256) NULL,
	[RoleId] [nvarchar](128) NULL,
	[RoleName] [nvarchar](256) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[MenuLevel] [int] NULL,
 CONSTRAINT [PK_NavigationMenu] PRIMARY KEY CLUSTERED 
(
	[NavigationMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavigationMenu1]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavigationMenu1](
	[NavigationMenuId] [int] IDENTITY(1,1) NOT NULL,
	[NavigationMenuCode] [char](10) NULL,
	[NavigationMenuName] [varchar](100) NULL,
	[NavigationTypeId] [int] NOT NULL,
	[NavigationMenuParentId] [int] NOT NULL,
	[MenuURL] [nvarchar](256) NULL,
	[NaviVisible] [bit] NULL,
	[IconClass] [varchar](20) NULL,
	[Resxkey] [varchar](20) NULL,
	[IPAddress] [nvarchar](256) NULL,
	[MACAddress] [nvarchar](256) NULL,
	[RoleId] [nvarchar](128) NULL,
	[RoleName] [nvarchar](256) NULL,
	[PermisionName] [char](10) NULL,
	[MenuGroupId] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK_NavigationMenu1] PRIMARY KEY CLUSTERED 
(
	[NavigationMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavigationType]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavigationType](
	[NavigationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[NavigationTypeCode] [char](10) NULL,
	[NavigationTypeName] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_NavigationType] PRIMARY KEY CLUSTERED 
(
	[NavigationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Navmenu_asprole_permisison_mapping]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navmenu_asprole_permisison_mapping](
	[Navrolepermisisonmapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[NavigationMenu_Id] [int] NOT NULL,
	[Role_id] [int] NOT NULL,
	[Permission_Id] [int] NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [Navmenu_asprole_permisison_mapping_PK] PRIMARY KEY CLUSTERED 
(
	[Navrolepermisisonmapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Navmenu_asprole_permisison_UserGroup_mapping]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navmenu_asprole_permisison_UserGroup_mapping](
	[Navrolepermisisonmappingusergroup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Navrolepermisisonmapping_ID] [int] NOT NULL,
	[UserGroup_ID] [int] NOT NULL,
	[AcitiveEdit] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [Navmenu_asprole_permisison_UserGroup_mapping_PK] PRIMARY KEY CLUSTERED 
(
	[Navrolepermisisonmappingusergroup_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumberGenScheme]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberGenScheme](
	[NumberGenScheme_id] [int] IDENTITY(1,1) NOT NULL,
	[NumGenForm_ID] [int] NULL,
	[Prefix] [varchar](50) NULL,
	[Postfix] [varchar](50) NULL,
	[DateDisplayformat] [varchar](10) NULL,
	[NumberStart] [int] NULL,
	[Delimeter] [char](5) NULL,
	[IncludeDate] [bit] NULL,
	[Sequece] [nvarchar](250) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[Navigationmenu_id] [int] NULL,
	[NextNumber] [int] NULL,
	[SchoolConfig_Id] [int] NULL,
 CONSTRAINT [PK_NumberGenScheme] PRIMARY KEY CLUSTERED 
(
	[NumberGenScheme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Registration_ID] [int] IDENTITY(1,1) NOT NULL,
	[Enquiry_ID] [int] NULL,
	[RegistrationNo] [char](10) NULL,
	[Issubmitted] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[IsSubmitedDate] [datetime] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Registration_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomMaster]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomMaster](
	[RoomMaster_ID] [int] IDENTITY(1,1) NOT NULL,
	[Building_ID] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[SeatingCapicity] [int] NULL,
	[GeoCoordinates] [varchar](50) NULL,
	[Remarks] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_RoomMaster] PRIMARY KEY CLUSTERED 
(
	[RoomMaster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route_Vech_Driver_Mapping]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route_Vech_Driver_Mapping](
	[Route_Vech_Driver_MappingID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NULL,
	[VechicleID] [int] NULL,
	[DriveEmpcode] [varchar](20) NULL,
	[ConductorEmpCode] [varchar](20) NULL,
	[RouteCoordinatorID] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Route_Vech_Driver_Mapping] PRIMARY KEY CLUSTERED 
(
	[Route_Vech_Driver_MappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteDetail]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteDetail](
	[RouteDetailId] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NULL,
	[StopID] [int] NULL,
	[PickUPtime] [time](7) NULL,
	[Droptime] [time](7) NULL,
	[serialNumber] [int] NULL,
	[distance] [decimal](18, 0) NULL,
	[MonthlyFees] [decimal](18, 0) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RouteDetail] PRIMARY KEY CLUSTERED 
(
	[RouteDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteMaster]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteMaster](
	[RouteMasterId] [int] IDENTITY(1,1) NOT NULL,
	[RouteCode] [varchar](20) NULL,
	[RoutName] [varchar](50) NULL,
	[Totaldistance] [int] NULL,
	[TripID] [int] NULL,
	[VechicelID] [int] NULL,
	[MorningStartTime] [time](7) NULL,
	[AfternoonStarttime] [time](7) NULL,
	[MorningEndTime] [time](7) NULL,
	[AfternoonEndtime] [time](7) NULL,
	[TotalTriptime] [time](7) NULL,
	[RouteCoordinator] [int] NULL,
	[ISAC] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RouteMaster] PRIMARY KEY CLUSTERED 
(
	[RouteMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolConfig]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolConfig](
	[SchoolConfig_id] [int] IDENTITY(1,1) NOT NULL,
	[Navigationmenu_id] [int] NULL,
	[tablecolumn] [varchar](50) NULL,
	[configKey] [varchar](50) NULL,
	[configvalue] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
	[NavigationMenuCode] [int] NULL,
 CONSTRAINT [PK_SchoolConfig] PRIMARY KEY CLUSTERED 
(
	[SchoolConfig_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolMaster]    Script Date: 8/15/2019 10:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolMaster](
	[School_ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[SchoolCode] [char](10) NULL,
	[SchoolName] [varchar](100) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State_ID] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[PinCode] [varchar](50) NULL,
	[Landmark] [varchar](50) NULL,
	[SchoolEmail] [varchar](50) NULL,
	[SchoolOwner] [varchar](50) NULL,
	[OwnerMobile] [varchar](20) NULL,
	[SchoolPrincipal] [varchar](50) NULL,
	[SchoolPhone] [varchar](20) NULL,
	[BillingStart] [datetime] NULL,
	[ISActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [char](20) NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [char](20) NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_SchoolMaster] PRIMARY KEY CLUSTERED 
(
	[School_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftMaster]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftMaster](
	[ShiftMaster_Id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ShiftMaster] PRIMARY KEY CLUSTERED 
(
	[ShiftMaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMSLog]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSLog](
	[SmsLogId] [int] IDENTITY(1,1) NOT NULL,
	[SmsLogCode] [char](10) NULL,
	[ContactNumber] [varchar](100) NULL,
	[SMS] [varchar](max) NULL,
	[SentTime] [datetime] NULL,
	[IsSent] [bit] NULL,
	[UserId] [int] NULL,
	[UserType] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_SMSLog] PRIMARY KEY CLUSTERED 
(
	[SmsLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StopMaster]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StopMaster](
	[StopMasterID] [int] IDENTITY(1,1) NOT NULL,
	[StopCode] [nchar](10) NULL,
	[StopName] [varchar](100) NULL,
	[Locality] [varchar](100) NULL,
	[StopAddress] [varchar](100) NULL,
	[PinCode] [varchar](10) NULL,
	[GeoCoordinates] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_StopMaster] PRIMARY KEY CLUSTERED 
(
	[StopMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Subject_ID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectCode] [char](10) NULL,
	[SubjectAbbr] [varchar](20) NULL,
	[SubjectName] [varchar](50) NULL,
	[IsScholastic] [bit] NULL,
	[IsPractical] [bit] NULL,
	[CGPAIncluded] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Subject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectMaster]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectMaster](
	[SubjectMaster_ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentStructure_ID] [int] NULL,
	[GradeStructure_ID] [int] NULL,
	[SubjectType_Id] [int] NULL,
	[SubjectGroup_ID] [int] NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[isOptional] [bit] NULL,
	[IncludedInCGPA] [varchar](50) NULL,
	[ExculdedfromAtt] [varchar](50) NULL,
	[isScholastic] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_SubjectMaster] PRIMARY KEY CLUSTERED 
(
	[SubjectMaster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectTypeMaster]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectTypeMaster](
	[SubjectTypeMaster_Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[Remarks] [varchar](50) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_SubjectTypeMaster] PRIMARY KEY CLUSTERED 
(
	[SubjectTypeMaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherCourseMapping]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherCourseMapping](
	[TeacherCourseMapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[CourseID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Modifiedby_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TeacherCourseMapping] PRIMARY KEY CLUSTERED 
(
	[TeacherCourseMapping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportAllocation]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportAllocation](
	[TransportAllocationID] [int] IDENTITY(1,1) NOT NULL,
	[PassangerTypeID] [int] NULL,
	[PassangerID] [int] NULL,
	[RouteID] [int] NULL,
	[StopID] [int] NULL,
	[Startdate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PassangerStatusID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TransportAllocation] PRIMARY KEY CLUSTERED 
(
	[TransportAllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportFee]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportFee](
	[TransportFeeRouteID] [int] IDENTITY(1,1) NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TransportFee] PRIMARY KEY CLUSTERED 
(
	[TransportFeeRouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[UserGroupId] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupCode] [char](10) NULL,
	[UserGroupName] [varchar](100) NULL,
	[UserGroupDescription] [varchar](max) NULL,
	[IsDefault] [bit] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroupAspUserMapping]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupAspUserMapping](
	[UserGroupAspUserMappingId] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [int] NOT NULL,
	[AspNetUserName] [nvarchar](256) NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_UserGroupAspUserMapping] PRIMARY KEY CLUSTERED 
(
	[UserGroupAspUserMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroupNavigationMenuMapping]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupNavigationMenuMapping](
	[UserGroupNavigationMenuMappingId] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [int] NOT NULL,
	[NavigationMenuId] [int] NOT NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_UserGroupNavigationMenuMapping] PRIMARY KEY CLUSTERED 
(
	[UserGroupNavigationMenuMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [char](10) NOT NULL,
	[Password] [char](10) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[Lastname] [varchar](20) NULL,
	[Role] [varchar](20) NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy_ID] [int] NULL,
	[SchoolID] [int] NULL,
	[GroupID] [int] NULL,
	[ISDeleted] [bit] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VechicleMaster]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VechicleMaster](
	[VechicleMasterId] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNumber] [varchar](20) NULL,
	[VechicalManufactureNameID] [int] NULL,
	[VechicalMakeID] [int] NULL,
	[VechicalModelID] [int] NULL,
	[Manufactureyear] [int] NULL,
	[RegisteredOwner] [varchar](50) NULL,
	[VendorId] [int] NULL,
	[RCImageIDpath] [varchar](100) NULL,
	[VechicleImageIDPath] [varchar](100) NULL,
	[TotalSeats] [int] NULL,
	[FuelType] [int] NULL,
	[VechicleStatusID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_VechicleMaster] PRIMARY KEY CLUSTERED 
(
	[VechicleMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VechicleStaffMapping]    Script Date: 8/15/2019 10:52:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VechicleStaffMapping](
	[VechicleStaffMappingID] [int] IDENTITY(1,1) NOT NULL,
	[VechicleID] [int] NULL,
	[DriveID] [int] NULL,
	[Contuctor_1ID] [int] NULL,
	[Conductor_2ID] [int] NULL,
	[Sessionyear] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Createdby_ID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby_ID] [int] NULL,
	[School_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_VechicleStaffMapping] PRIMARY KEY CLUSTERED 
(
	[VechicleStaffMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AcademicYear] ON 
GO
INSERT [dbo].[AcademicYear] ([AcademicYear_ID], [Name], [ShortName], [FromDate], [ToDate], [Active], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (1, N'2018-2019           ', N'18-19               ', CAST(N'2018-04-01T00:00:00.000' AS DateTime), CAST(N'2019-03-31T00:00:00.000' AS DateTime), 1, CAST(N'2019-07-16T21:32:49.620' AS DateTime), 1, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[AcademicYear] ([AcademicYear_ID], [Name], [ShortName], [FromDate], [ToDate], [Active], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (2, N'2019-2020           ', N'19-20               ', CAST(N'2019-04-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, CAST(N'2019-07-16T21:34:19.500' AS DateTime), 1, NULL, NULL, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[AcademicYear] OFF
GO
SET IDENTITY_INSERT [dbo].[Application] ON 
GO
INSERT [dbo].[Application] ([Application_ID], [Enquiry_ID], [ApplicaitonNo], [IsSubmitted], [SubmitDate], [IsOnline], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Applicationsold], [ApplicationSoldDate]) VALUES (1, 3, N'1         ', 0, NULL, 0, 1, CAST(N'2019-08-12T00:00:00.000' AS DateTime), 0, NULL, NULL, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Application] ([Application_ID], [Enquiry_ID], [ApplicaitonNo], [IsSubmitted], [SubmitDate], [IsOnline], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Applicationsold], [ApplicationSoldDate]) VALUES (2, 4, N'1A        ', 0, NULL, 0, 1, CAST(N'2019-08-13T00:00:00.000' AS DateTime), 0, NULL, NULL, 1, 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'04114C1E-EB8B-4355-AD86-00EB64533871', 27, N'AssessmentStructureAssessmentTypeMapping_Update', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'04C9726D-7661-4658-A3F5-226F12AE4F96', 6, N'MasterTable_POST', 1, CAST(N'2019-08-04T23:21:35.913' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'05A06DA2-44E3-4338-BC56-DAF45E134BEE', 48, N'RoomMaster_DELETE', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'0625E605-D2EA-417E-A7E3-A0CCAE2A97A1', 53, N'SubjectMaster_DELETE', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'0CC51D5B-045C-4BA1-BDB3-3B2C273BAD13', 19, N'AssessmentType_Update', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'1501C5D6-6736-4D3D-BF1D-920928F7CE0E', 10, N'ClassMaster_View', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'183DD418-DA85-437B-A102-B7A3A3D4830F', 50, N'SubjectMaster_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'1CC0E29B-B994-40C6-BE3F-822DE5952548', 1, N'AspNetUser_POST', 1, CAST(N'2019-08-04T23:21:35.913' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'236A0347-4BD8-45BC-86AC-A9D8B5D298FB', 14, N'BookMaster_POST', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'28C2F4C8-024E-4FBD-943F-606D0A011917', 9, N'ClassMaster_POST', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'29B41126-9FBB-4F79-87E3-E0119F46A01B', 3, N'AspNetUser_PUT', 1, CAST(N'2019-08-04T23:21:35.913' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'31C55618-9118-4CA9-BE9E-3370ECD3CE69', 15, N'BookMaster_Update', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'3484DED7-98FC-42A6-B43E-D8BE838217DA', 38, N'AdmissionStatus_PUT', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'3744107A-57D3-4CC0-8B58-669600460642', 23, N'CourseMaster_Update', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'37D3D202-1BDB-4E88-857F-0A4186E1FD28', 49, N'SellSubmit_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'39FF5547-6C25-41A7-8891-809B9461DBCA', 42, N'DocumentType_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'3A9A3BFD-0CEE-428F-B7C4-BD56F4E4886B', 7, N'MasterTable_PUT', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'3B1D6481-49A1-432A-B04F-D5974C0B413B', 17, N'AssessmentType_GET', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'3B22A883-FF4C-4403-AC8E-B7CFC13FF4A7', 24, N'CourseMaster_Delete', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'3CEC96BD-AAFE-4046-96BD-5B0CAA69E520', 2, N'AspNetUser_GET', 1, CAST(N'2019-08-04T23:21:35.913' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'561A70E7-4351-4DA5-B508-954D18D350E7', 52, N'SubjectMaster_PUT', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'5CD9CC7D-CB49-480E-8F0D-CBE3F6319C01', 46, N'RoomMaster_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6E2D9172-08CD-44AC-BBE0-1E8B21955B92', 22, N'CourseMaster_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'75B2EA02-7145-4356-B650-D1803385E76C', 13, N'BookMaster_GET', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'76E5FE05-9460-4ABB-99C9-E5318B7E454D', 41, N'DocumentType_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'810620EA-341B-47B1-9F0E-C85F830857EB', 11, N'ClassMaster_Update', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'88F38479-A7D8-441A-9D46-FB4E947A2D49', 16, N'BookMaster_Delete', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'93C5F792-D968-4FA1-989D-3BDF485644F2', 4, N'AspNetUser_DELETE', 1, CAST(N'2019-08-04T23:21:35.913' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'9718ED0F-0B1B-47D0-97B1-F010380B8C05', 39, N'AdmissionStatus_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'97E00B93-A20D-412F-9C57-3C073A9AD06C', 21, N'CourseMaster_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'9BBE682B-58A4-4E12-B726-1DE05EB615FC', 44, N'DocumentType_DELETE', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AFD7781A-0DFB-4CA0-ACF8-C10381D2E4B3', 43, N'DocumentType_PUT', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'B12F50A8-A387-419C-BC78-96D8D0F56A94', 8, N'MasterTable_DELETE', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'BBDBB5C2-E624-4EB8-81E3-E697F83F0CC8', 26, N'AssessmentStructureAssessmentTypeMapping_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'BDD53200-0C29-4163-A494-40AA1F1E9925', 47, N'RoomMaster_PUT', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'C15CAFB0-1794-4B1D-8C6F-4AF33446DFAF', 32, N'Enquiry_DELETE', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'C192282D-0FED-457E-AF53-B540B9CC1A5C', 33, N'CandidateDetail_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'C4C33AFA-4DDB-412D-A3C3-8ECA4985FAA9', 36, N'CandidateDetail_DELETE', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'C535C4FF-96F0-4878-847B-7951EA2E7EBF', 5, N'MasterTable_GET', 1, CAST(N'2019-08-04T23:21:35.913' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CE34F3AB-89C7-4E43-89E5-25AE83EF2862', 20, N'AssessmentType_Delete', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CEC5AD89-2483-49C8-9545-432DA3EF64A2', 25, N'AssessmentStructureAssessmentTypeMapping_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'D2FAD458-3497-4603-BB6D-00A5918A4EFB', 34, N'CandidateDetail_PUT', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'D3DB15A2-6099-47B8-9DC9-67E7E552860F', 35, N'CandidateDetail_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'D9F908DA-0CF6-4F40-BA9A-2F68531427E9', 45, N'RoomMaster_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'DF544296-208A-4792-A908-FBE2A90FDEE6', 30, N'Enquiry_PUT', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'E7CEE96C-8338-4921-A10E-D46248FEF192', 37, N'AdmissionStatus_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'EDE8EFCD-0583-49C1-BEA1-A10B40F48095', 29, N'Enquiry_GET', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'EF9C907A-BE10-4D04-AD65-BDDDA1273CB3', 31, N'Enquiry_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'F130507D-FFD5-4245-B30D-0A1796CFFB2F', 18, N'AssessmentType_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'F38648F8-545D-4B3C-9442-6D4F9ED89327', 51, N'SubjectMaster_POST', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'F6224CE8-2C65-42F5-BFA1-54215A8715F2', 40, N'AdmissionStatus_DELETE', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'FE69C019-634E-4DEC-8C0F-AE68AE22E31F', 12, N'ClassMaster_Delete', 1, CAST(N'2019-08-04T23:21:35.930' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Role_id], [Name], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'FEB280FB-71AC-4C2F-A2A1-CD8D31D44553', 28, N'AssessmentStructureAssessmentTypeMapping_Delete', 1, CAST(N'2019-08-04T23:21:35.943' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'05A06DA2-44E3-4338-BC56-DAF45E134BEE', NULL, CAST(N'2019-08-07T22:01:21.113' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'0625E605-D2EA-417E-A7E3-A0CCAE2A97A1', NULL, CAST(N'2019-08-07T22:01:21.210' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'1501C5D6-6736-4D3D-BF1D-920928F7CE0E', NULL, CAST(N'2019-08-07T22:01:21.047' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'183DD418-DA85-437B-A102-B7A3A3D4830F', NULL, CAST(N'2019-08-07T22:01:21.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'236A0347-4BD8-45BC-86AC-A9D8B5D298FB', NULL, CAST(N'2019-08-07T22:01:21.250' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'28C2F4C8-024E-4FBD-943F-606D0A011917', NULL, CAST(N'2019-08-07T22:01:20.973' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'31C55618-9118-4CA9-BE9E-3370ECD3CE69', NULL, CAST(N'2019-08-07T22:01:21.287' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'3484DED7-98FC-42A6-B43E-D8BE838217DA', NULL, CAST(N'2019-08-07T22:00:49.653' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'3744107A-57D3-4CC0-8B58-669600460642', NULL, CAST(N'2019-08-07T22:01:21.437' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'37D3D202-1BDB-4E88-857F-0A4186E1FD28', NULL, CAST(N'2019-08-07T22:00:49.430' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'3B22A883-FF4C-4403-AC8E-B7CFC13FF4A7', NULL, CAST(N'2019-08-07T22:01:21.460' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'561A70E7-4351-4DA5-B508-954D18D350E7', NULL, CAST(N'2019-08-07T22:01:21.190' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'5CD9CC7D-CB49-480E-8F0D-CBE3F6319C01', NULL, CAST(N'2019-08-07T22:01:21.060' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'6E2D9172-08CD-44AC-BBE0-1E8B21955B92', NULL, CAST(N'2019-08-07T22:01:21.377' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'75B2EA02-7145-4356-B650-D1803385E76C', NULL, CAST(N'2019-08-07T22:01:21.360' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'810620EA-341B-47B1-9F0E-C85F830857EB', NULL, CAST(N'2019-08-07T22:01:21.010' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'88F38479-A7D8-441A-9D46-FB4E947A2D49', NULL, CAST(N'2019-08-07T22:01:21.317' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'9718ED0F-0B1B-47D0-97B1-F010380B8C05', NULL, CAST(N'2019-08-07T22:00:49.613' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'97E00B93-A20D-412F-9C57-3C073A9AD06C', NULL, CAST(N'2019-08-07T22:01:21.520' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'BDD53200-0C29-4163-A494-40AA1F1E9925', NULL, CAST(N'2019-08-07T22:01:21.093' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'C15CAFB0-1794-4B1D-8C6F-4AF33446DFAF', NULL, CAST(N'2019-08-07T22:00:49.400' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'C192282D-0FED-457E-AF53-B540B9CC1A5C', NULL, CAST(N'2019-08-07T22:00:49.590' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'C4C33AFA-4DDB-412D-A3C3-8ECA4985FAA9', NULL, CAST(N'2019-08-07T22:00:49.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'D2FAD458-3497-4603-BB6D-00A5918A4EFB', NULL, CAST(N'2019-08-07T22:00:49.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'D3DB15A2-6099-47B8-9DC9-67E7E552860F', NULL, CAST(N'2019-08-07T22:00:49.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'D9F908DA-0CF6-4F40-BA9A-2F68531427E9', NULL, CAST(N'2019-08-07T22:01:21.133' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'DF544296-208A-4792-A908-FBE2A90FDEE6', NULL, CAST(N'2019-08-07T22:00:49.380' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'E7CEE96C-8338-4921-A10E-D46248FEF192', NULL, CAST(N'2019-08-07T22:00:49.690' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'EDE8EFCD-0583-49C1-BEA1-A10B40F48095', NULL, CAST(N'2019-08-07T22:00:49.413' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'EF9C907A-BE10-4D04-AD65-BDDDA1273CB3', NULL, CAST(N'2019-08-07T22:00:49.330' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'F38648F8-545D-4B3C-9442-6D4F9ED89327', NULL, CAST(N'2019-08-07T22:01:21.153' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'F6224CE8-2C65-42F5-BFA1-54215A8715F2', NULL, CAST(N'2019-08-07T22:00:49.670' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'FE69C019-634E-4DEC-8C0F-AE68AE22E31F', NULL, CAST(N'2019-08-07T22:01:21.030' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'05A06DA2-44E3-4338-BC56-DAF45E134BEE', NULL, CAST(N'2019-08-07T22:01:21.113' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'0625E605-D2EA-417E-A7E3-A0CCAE2A97A1', NULL, CAST(N'2019-08-07T22:01:21.210' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'1501C5D6-6736-4D3D-BF1D-920928F7CE0E', NULL, CAST(N'2019-08-07T22:01:21.047' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'183DD418-DA85-437B-A102-B7A3A3D4830F', NULL, CAST(N'2019-08-07T22:01:21.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'236A0347-4BD8-45BC-86AC-A9D8B5D298FB', NULL, CAST(N'2019-08-07T22:01:21.250' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'28C2F4C8-024E-4FBD-943F-606D0A011917', NULL, CAST(N'2019-08-07T22:01:20.973' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'31C55618-9118-4CA9-BE9E-3370ECD3CE69', NULL, CAST(N'2019-08-07T22:01:21.287' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'3484DED7-98FC-42A6-B43E-D8BE838217DA', NULL, CAST(N'2019-08-07T22:00:49.653' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'3744107A-57D3-4CC0-8B58-669600460642', NULL, CAST(N'2019-08-07T22:01:21.437' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'37D3D202-1BDB-4E88-857F-0A4186E1FD28', NULL, CAST(N'2019-08-07T22:00:49.430' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'3B22A883-FF4C-4403-AC8E-B7CFC13FF4A7', NULL, CAST(N'2019-08-07T22:01:21.460' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'561A70E7-4351-4DA5-B508-954D18D350E7', NULL, CAST(N'2019-08-07T22:01:21.190' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'5CD9CC7D-CB49-480E-8F0D-CBE3F6319C01', NULL, CAST(N'2019-08-07T22:01:21.060' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'6E2D9172-08CD-44AC-BBE0-1E8B21955B92', NULL, CAST(N'2019-08-07T22:01:21.377' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'75B2EA02-7145-4356-B650-D1803385E76C', NULL, CAST(N'2019-08-07T22:01:21.360' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'810620EA-341B-47B1-9F0E-C85F830857EB', NULL, CAST(N'2019-08-07T22:01:21.010' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'88F38479-A7D8-441A-9D46-FB4E947A2D49', NULL, CAST(N'2019-08-07T22:01:21.317' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'9718ED0F-0B1B-47D0-97B1-F010380B8C05', NULL, CAST(N'2019-08-07T22:00:49.613' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'97E00B93-A20D-412F-9C57-3C073A9AD06C', NULL, CAST(N'2019-08-07T22:01:21.520' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'BDD53200-0C29-4163-A494-40AA1F1E9925', NULL, CAST(N'2019-08-07T22:01:21.093' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'C15CAFB0-1794-4B1D-8C6F-4AF33446DFAF', NULL, CAST(N'2019-08-07T22:00:49.400' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'C192282D-0FED-457E-AF53-B540B9CC1A5C', NULL, CAST(N'2019-08-07T22:00:49.590' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'C4C33AFA-4DDB-412D-A3C3-8ECA4985FAA9', NULL, CAST(N'2019-08-07T22:00:49.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'D2FAD458-3497-4603-BB6D-00A5918A4EFB', NULL, CAST(N'2019-08-07T22:00:49.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'D3DB15A2-6099-47B8-9DC9-67E7E552860F', NULL, CAST(N'2019-08-07T22:00:49.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'D9F908DA-0CF6-4F40-BA9A-2F68531427E9', NULL, CAST(N'2019-08-07T22:01:21.133' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'DF544296-208A-4792-A908-FBE2A90FDEE6', NULL, CAST(N'2019-08-07T22:00:49.380' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'E7CEE96C-8338-4921-A10E-D46248FEF192', NULL, CAST(N'2019-08-07T22:00:49.690' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'EDE8EFCD-0583-49C1-BEA1-A10B40F48095', NULL, CAST(N'2019-08-07T22:00:49.413' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'EF9C907A-BE10-4D04-AD65-BDDDA1273CB3', NULL, CAST(N'2019-08-07T22:00:49.330' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'F38648F8-545D-4B3C-9442-6D4F9ED89327', NULL, CAST(N'2019-08-07T22:01:21.153' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'F6224CE8-2C65-42F5-BFA1-54215A8715F2', NULL, CAST(N'2019-08-07T22:00:49.670' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'FE69C019-634E-4DEC-8C0F-AE68AE22E31F', NULL, CAST(N'2019-08-07T22:01:21.030' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'05A06DA2-44E3-4338-BC56-DAF45E134BEE', NULL, CAST(N'2019-08-07T22:01:21.113' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'0625E605-D2EA-417E-A7E3-A0CCAE2A97A1', NULL, CAST(N'2019-08-07T22:01:21.210' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'1501C5D6-6736-4D3D-BF1D-920928F7CE0E', NULL, CAST(N'2019-08-07T22:01:21.047' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'183DD418-DA85-437B-A102-B7A3A3D4830F', NULL, CAST(N'2019-08-07T22:01:21.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'236A0347-4BD8-45BC-86AC-A9D8B5D298FB', NULL, CAST(N'2019-08-07T22:01:21.250' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'28C2F4C8-024E-4FBD-943F-606D0A011917', NULL, CAST(N'2019-08-07T22:01:20.973' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'31C55618-9118-4CA9-BE9E-3370ECD3CE69', NULL, CAST(N'2019-08-07T22:01:21.287' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'3484DED7-98FC-42A6-B43E-D8BE838217DA', NULL, CAST(N'2019-08-07T22:00:49.653' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'3744107A-57D3-4CC0-8B58-669600460642', NULL, CAST(N'2019-08-07T22:01:21.437' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'37D3D202-1BDB-4E88-857F-0A4186E1FD28', NULL, CAST(N'2019-08-07T22:00:49.430' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'3B22A883-FF4C-4403-AC8E-B7CFC13FF4A7', NULL, CAST(N'2019-08-07T22:01:21.460' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'561A70E7-4351-4DA5-B508-954D18D350E7', NULL, CAST(N'2019-08-07T22:01:21.190' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'5CD9CC7D-CB49-480E-8F0D-CBE3F6319C01', NULL, CAST(N'2019-08-07T22:01:21.060' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'6E2D9172-08CD-44AC-BBE0-1E8B21955B92', NULL, CAST(N'2019-08-07T22:01:21.377' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'75B2EA02-7145-4356-B650-D1803385E76C', NULL, CAST(N'2019-08-07T22:01:21.360' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'810620EA-341B-47B1-9F0E-C85F830857EB', NULL, CAST(N'2019-08-07T22:01:21.010' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'88F38479-A7D8-441A-9D46-FB4E947A2D49', NULL, CAST(N'2019-08-07T22:01:21.317' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'9718ED0F-0B1B-47D0-97B1-F010380B8C05', NULL, CAST(N'2019-08-07T22:00:49.613' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'97E00B93-A20D-412F-9C57-3C073A9AD06C', NULL, CAST(N'2019-08-07T22:01:21.520' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'BDD53200-0C29-4163-A494-40AA1F1E9925', NULL, CAST(N'2019-08-07T22:01:21.093' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'C15CAFB0-1794-4B1D-8C6F-4AF33446DFAF', NULL, CAST(N'2019-08-07T22:00:49.400' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'C192282D-0FED-457E-AF53-B540B9CC1A5C', NULL, CAST(N'2019-08-07T22:00:49.590' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'C4C33AFA-4DDB-412D-A3C3-8ECA4985FAA9', NULL, CAST(N'2019-08-07T22:00:49.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'D2FAD458-3497-4603-BB6D-00A5918A4EFB', NULL, CAST(N'2019-08-07T22:00:49.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'D3DB15A2-6099-47B8-9DC9-67E7E552860F', NULL, CAST(N'2019-08-07T22:00:49.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'D9F908DA-0CF6-4F40-BA9A-2F68531427E9', NULL, CAST(N'2019-08-07T22:01:21.133' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'DF544296-208A-4792-A908-FBE2A90FDEE6', NULL, CAST(N'2019-08-07T22:00:49.380' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'E7CEE96C-8338-4921-A10E-D46248FEF192', NULL, CAST(N'2019-08-07T22:00:49.690' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'EDE8EFCD-0583-49C1-BEA1-A10B40F48095', NULL, CAST(N'2019-08-07T22:00:49.413' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'EF9C907A-BE10-4D04-AD65-BDDDA1273CB3', NULL, CAST(N'2019-08-07T22:00:49.330' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'F38648F8-545D-4B3C-9442-6D4F9ED89327', NULL, CAST(N'2019-08-07T22:01:21.153' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'F6224CE8-2C65-42F5-BFA1-54215A8715F2', NULL, CAST(N'2019-08-07T22:00:49.670' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'FE69C019-634E-4DEC-8C0F-AE68AE22E31F', NULL, CAST(N'2019-08-07T22:01:21.030' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'05A06DA2-44E3-4338-BC56-DAF45E134BEE', NULL, CAST(N'2019-08-07T22:01:21.113' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'0625E605-D2EA-417E-A7E3-A0CCAE2A97A1', NULL, CAST(N'2019-08-07T22:01:21.210' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'1501C5D6-6736-4D3D-BF1D-920928F7CE0E', NULL, CAST(N'2019-08-07T22:01:21.047' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'183DD418-DA85-437B-A102-B7A3A3D4830F', NULL, CAST(N'2019-08-07T22:01:21.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'236A0347-4BD8-45BC-86AC-A9D8B5D298FB', NULL, CAST(N'2019-08-07T22:01:21.250' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'28C2F4C8-024E-4FBD-943F-606D0A011917', NULL, CAST(N'2019-08-07T22:01:20.973' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'31C55618-9118-4CA9-BE9E-3370ECD3CE69', NULL, CAST(N'2019-08-07T22:01:21.287' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'3484DED7-98FC-42A6-B43E-D8BE838217DA', NULL, CAST(N'2019-08-07T22:00:49.653' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'3744107A-57D3-4CC0-8B58-669600460642', NULL, CAST(N'2019-08-07T22:01:21.437' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'37D3D202-1BDB-4E88-857F-0A4186E1FD28', NULL, CAST(N'2019-08-07T22:00:49.430' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'3B22A883-FF4C-4403-AC8E-B7CFC13FF4A7', NULL, CAST(N'2019-08-07T22:01:21.460' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'561A70E7-4351-4DA5-B508-954D18D350E7', NULL, CAST(N'2019-08-07T22:01:21.190' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'5CD9CC7D-CB49-480E-8F0D-CBE3F6319C01', NULL, CAST(N'2019-08-07T22:01:21.060' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'6E2D9172-08CD-44AC-BBE0-1E8B21955B92', NULL, CAST(N'2019-08-07T22:01:21.377' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'75B2EA02-7145-4356-B650-D1803385E76C', NULL, CAST(N'2019-08-07T22:01:21.360' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'810620EA-341B-47B1-9F0E-C85F830857EB', NULL, CAST(N'2019-08-07T22:01:21.010' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'88F38479-A7D8-441A-9D46-FB4E947A2D49', NULL, CAST(N'2019-08-07T22:01:21.317' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'9718ED0F-0B1B-47D0-97B1-F010380B8C05', NULL, CAST(N'2019-08-07T22:00:49.613' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'97E00B93-A20D-412F-9C57-3C073A9AD06C', NULL, CAST(N'2019-08-07T22:01:21.520' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'BDD53200-0C29-4163-A494-40AA1F1E9925', NULL, CAST(N'2019-08-07T22:01:21.093' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'C15CAFB0-1794-4B1D-8C6F-4AF33446DFAF', NULL, CAST(N'2019-08-07T22:00:49.400' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'C192282D-0FED-457E-AF53-B540B9CC1A5C', NULL, CAST(N'2019-08-07T22:00:49.590' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'C4C33AFA-4DDB-412D-A3C3-8ECA4985FAA9', NULL, CAST(N'2019-08-07T22:00:49.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'D2FAD458-3497-4603-BB6D-00A5918A4EFB', NULL, CAST(N'2019-08-07T22:00:49.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'D3DB15A2-6099-47B8-9DC9-67E7E552860F', NULL, CAST(N'2019-08-07T22:00:49.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'D9F908DA-0CF6-4F40-BA9A-2F68531427E9', NULL, CAST(N'2019-08-07T22:01:21.133' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'DF544296-208A-4792-A908-FBE2A90FDEE6', NULL, CAST(N'2019-08-07T22:00:49.380' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'E7CEE96C-8338-4921-A10E-D46248FEF192', NULL, CAST(N'2019-08-07T22:00:49.690' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'EDE8EFCD-0583-49C1-BEA1-A10B40F48095', NULL, CAST(N'2019-08-07T22:00:49.413' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'EF9C907A-BE10-4D04-AD65-BDDDA1273CB3', NULL, CAST(N'2019-08-07T22:00:49.330' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'F38648F8-545D-4B3C-9442-6D4F9ED89327', NULL, CAST(N'2019-08-07T22:01:21.153' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'F6224CE8-2C65-42F5-BFA1-54215A8715F2', NULL, CAST(N'2019-08-07T22:00:49.670' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'FE69C019-634E-4DEC-8C0F-AE68AE22E31F', NULL, CAST(N'2019-08-07T22:01:21.030' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'b7de8685-80b4-455e-b439-d2782e07aaef', N'39FF5547-6C25-41A7-8891-809B9461DBCA', NULL, CAST(N'2019-08-07T21:39:37.473' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'b7de8685-80b4-455e-b439-d2782e07aaef', N'76E5FE05-9460-4ABB-99C9-E5318B7E454D', NULL, CAST(N'2019-08-07T21:39:37.533' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'b7de8685-80b4-455e-b439-d2782e07aaef', N'AFD7781A-0DFB-4CA0-ACF8-C10381D2E4B3', NULL, CAST(N'2019-08-07T21:39:37.503' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'04114C1E-EB8B-4355-AD86-00EB64533871', NULL, CAST(N'2019-08-07T21:39:46.687' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'04C9726D-7661-4658-A3F5-226F12AE4F96', NULL, CAST(N'2019-08-07T17:56:48.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'05A06DA2-44E3-4338-BC56-DAF45E134BEE', NULL, CAST(N'2019-08-07T17:56:48.123' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'0625E605-D2EA-417E-A7E3-A0CCAE2A97A1', NULL, CAST(N'2019-08-07T17:56:48.203' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'0CC51D5B-045C-4BA1-BDB3-3B2C273BAD13', NULL, CAST(N'2019-08-07T21:39:46.583' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'1501C5D6-6736-4D3D-BF1D-920928F7CE0E', NULL, CAST(N'2019-08-07T17:56:48.067' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'183DD418-DA85-437B-A102-B7A3A3D4830F', NULL, CAST(N'2019-08-07T17:56:48.217' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'1CC0E29B-B994-40C6-BE3F-822DE5952548', NULL, CAST(N'2019-08-07T21:39:30.183' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'236A0347-4BD8-45BC-86AC-A9D8B5D298FB', NULL, CAST(N'2019-08-07T17:56:48.233' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'28C2F4C8-024E-4FBD-943F-606D0A011917', NULL, CAST(N'2019-08-07T17:56:47.920' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'29B41126-9FBB-4F79-87E3-E0119F46A01B', NULL, CAST(N'2019-08-07T21:39:30.213' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'31C55618-9118-4CA9-BE9E-3370ECD3CE69', NULL, CAST(N'2019-08-07T17:56:48.270' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'3484DED7-98FC-42A6-B43E-D8BE838217DA', NULL, CAST(N'2019-08-07T21:33:16.960' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'3744107A-57D3-4CC0-8B58-669600460642', NULL, CAST(N'2019-08-07T17:56:48.433' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'37D3D202-1BDB-4E88-857F-0A4186E1FD28', NULL, CAST(N'2019-08-07T21:33:16.597' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'39FF5547-6C25-41A7-8891-809B9461DBCA', NULL, CAST(N'2019-08-07T21:39:37.473' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'3A9A3BFD-0CEE-428F-B7C4-BD56F4E4886B', NULL, CAST(N'2019-08-07T17:56:48.530' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'3B1D6481-49A1-432A-B04F-D5974C0B413B', NULL, CAST(N'2019-08-07T21:39:46.617' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'3B22A883-FF4C-4403-AC8E-B7CFC13FF4A7', NULL, CAST(N'2019-08-07T17:56:48.470' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'3CEC96BD-AAFE-4046-96BD-5B0CAA69E520', NULL, CAST(N'2019-08-07T21:39:30.247' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'561A70E7-4351-4DA5-B508-954D18D350E7', NULL, CAST(N'2019-08-07T17:56:48.183' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'5CD9CC7D-CB49-480E-8F0D-CBE3F6319C01', NULL, CAST(N'2019-08-07T17:56:48.080' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'6E2D9172-08CD-44AC-BBE0-1E8B21955B92', NULL, CAST(N'2019-08-07T17:56:48.393' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'75B2EA02-7145-4356-B650-D1803385E76C', NULL, CAST(N'2019-08-07T17:56:48.360' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'76E5FE05-9460-4ABB-99C9-E5318B7E454D', NULL, CAST(N'2019-08-07T21:39:37.533' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'810620EA-341B-47B1-9F0E-C85F830857EB', NULL, CAST(N'2019-08-07T17:56:48.033' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'88F38479-A7D8-441A-9D46-FB4E947A2D49', NULL, CAST(N'2019-08-07T17:56:48.310' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'93C5F792-D968-4FA1-989D-3BDF485644F2', NULL, CAST(N'2019-08-07T21:39:30.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'9718ED0F-0B1B-47D0-97B1-F010380B8C05', NULL, CAST(N'2019-08-07T21:33:16.913' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'97E00B93-A20D-412F-9C57-3C073A9AD06C', NULL, CAST(N'2019-08-07T17:56:48.490' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'AFD7781A-0DFB-4CA0-ACF8-C10381D2E4B3', NULL, CAST(N'2019-08-07T21:39:37.503' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'B12F50A8-A387-419C-BC78-96D8D0F56A94', NULL, CAST(N'2019-08-07T17:56:48.547' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'BBDBB5C2-E624-4EB8-81E3-E697F83F0CC8', NULL, CAST(N'2019-08-07T21:39:46.633' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'BDD53200-0C29-4163-A494-40AA1F1E9925', NULL, CAST(N'2019-08-07T17:56:48.110' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'C15CAFB0-1794-4B1D-8C6F-4AF33446DFAF', NULL, CAST(N'2019-08-07T21:33:16.540' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'C192282D-0FED-457E-AF53-B540B9CC1A5C', NULL, CAST(N'2019-08-07T21:33:16.883' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'C4C33AFA-4DDB-412D-A3C3-8ECA4985FAA9', NULL, CAST(N'2019-08-07T21:33:16.860' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'C535C4FF-96F0-4878-847B-7951EA2E7EBF', NULL, CAST(N'2019-08-07T17:56:48.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'CE34F3AB-89C7-4E43-89E5-25AE83EF2862', NULL, CAST(N'2019-08-07T21:39:46.600' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'CEC5AD89-2483-49C8-9545-432DA3EF64A2', NULL, CAST(N'2019-08-07T21:39:46.717' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'D2FAD458-3497-4603-BB6D-00A5918A4EFB', NULL, CAST(N'2019-08-07T21:33:16.837' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'D3DB15A2-6099-47B8-9DC9-67E7E552860F', NULL, CAST(N'2019-08-07T21:33:16.780' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'D9F908DA-0CF6-4F40-BA9A-2F68531427E9', NULL, CAST(N'2019-08-07T17:56:48.140' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'DF544296-208A-4792-A908-FBE2A90FDEE6', NULL, CAST(N'2019-08-07T21:33:16.517' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'E7CEE96C-8338-4921-A10E-D46248FEF192', NULL, CAST(N'2019-08-07T21:33:17.007' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'EDE8EFCD-0583-49C1-BEA1-A10B40F48095', NULL, CAST(N'2019-08-07T21:33:16.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'EF9C907A-BE10-4D04-AD65-BDDDA1273CB3', NULL, CAST(N'2019-08-07T21:33:15.783' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'F130507D-FFD5-4245-B30D-0A1796CFFB2F', NULL, CAST(N'2019-08-07T21:39:46.533' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'F38648F8-545D-4B3C-9442-6D4F9ED89327', NULL, CAST(N'2019-08-07T17:56:48.153' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'F6224CE8-2C65-42F5-BFA1-54215A8715F2', NULL, CAST(N'2019-08-07T21:33:16.983' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'FE69C019-634E-4DEC-8C0F-AE68AE22E31F', NULL, CAST(N'2019-08-07T17:56:48.050' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'FEB280FB-71AC-4C2F-A2A1-CD8D31D44553', NULL, CAST(N'2019-08-07T21:39:46.703' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'04114C1E-EB8B-4355-AD86-00EB64533871', NULL, CAST(N'2019-08-07T21:39:46.687' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'04C9726D-7661-4658-A3F5-226F12AE4F96', NULL, CAST(N'2019-08-07T17:56:48.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'05A06DA2-44E3-4338-BC56-DAF45E134BEE', NULL, CAST(N'2019-08-07T17:56:48.123' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'0625E605-D2EA-417E-A7E3-A0CCAE2A97A1', NULL, CAST(N'2019-08-07T17:56:48.203' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'0CC51D5B-045C-4BA1-BDB3-3B2C273BAD13', NULL, CAST(N'2019-08-07T21:39:46.583' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'1501C5D6-6736-4D3D-BF1D-920928F7CE0E', NULL, CAST(N'2019-08-07T17:56:48.067' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'183DD418-DA85-437B-A102-B7A3A3D4830F', NULL, CAST(N'2019-08-07T17:56:48.217' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'1CC0E29B-B994-40C6-BE3F-822DE5952548', NULL, CAST(N'2019-08-07T21:39:30.183' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'236A0347-4BD8-45BC-86AC-A9D8B5D298FB', NULL, CAST(N'2019-08-07T17:56:48.233' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'28C2F4C8-024E-4FBD-943F-606D0A011917', NULL, CAST(N'2019-08-07T17:56:47.920' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'29B41126-9FBB-4F79-87E3-E0119F46A01B', NULL, CAST(N'2019-08-07T21:39:30.213' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'31C55618-9118-4CA9-BE9E-3370ECD3CE69', NULL, CAST(N'2019-08-07T17:56:48.270' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'3484DED7-98FC-42A6-B43E-D8BE838217DA', NULL, CAST(N'2019-08-07T21:33:16.960' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'3744107A-57D3-4CC0-8B58-669600460642', NULL, CAST(N'2019-08-07T17:56:48.433' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'37D3D202-1BDB-4E88-857F-0A4186E1FD28', NULL, CAST(N'2019-08-07T21:33:16.597' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'39FF5547-6C25-41A7-8891-809B9461DBCA', NULL, CAST(N'2019-08-07T21:39:37.473' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'3A9A3BFD-0CEE-428F-B7C4-BD56F4E4886B', NULL, CAST(N'2019-08-07T17:56:48.530' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'3B1D6481-49A1-432A-B04F-D5974C0B413B', NULL, CAST(N'2019-08-07T21:39:46.617' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'3B22A883-FF4C-4403-AC8E-B7CFC13FF4A7', NULL, CAST(N'2019-08-07T17:56:48.470' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'3CEC96BD-AAFE-4046-96BD-5B0CAA69E520', NULL, CAST(N'2019-08-07T21:39:30.247' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'561A70E7-4351-4DA5-B508-954D18D350E7', NULL, CAST(N'2019-08-07T17:56:48.183' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'5CD9CC7D-CB49-480E-8F0D-CBE3F6319C01', NULL, CAST(N'2019-08-07T17:56:48.080' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'6E2D9172-08CD-44AC-BBE0-1E8B21955B92', NULL, CAST(N'2019-08-07T17:56:48.393' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'75B2EA02-7145-4356-B650-D1803385E76C', NULL, CAST(N'2019-08-07T17:56:48.360' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'76E5FE05-9460-4ABB-99C9-E5318B7E454D', NULL, CAST(N'2019-08-07T21:39:37.533' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'810620EA-341B-47B1-9F0E-C85F830857EB', NULL, CAST(N'2019-08-07T17:56:48.033' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'88F38479-A7D8-441A-9D46-FB4E947A2D49', NULL, CAST(N'2019-08-07T17:56:48.310' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'93C5F792-D968-4FA1-989D-3BDF485644F2', NULL, CAST(N'2019-08-07T21:39:30.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'9718ED0F-0B1B-47D0-97B1-F010380B8C05', NULL, CAST(N'2019-08-07T21:33:16.913' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'97E00B93-A20D-412F-9C57-3C073A9AD06C', NULL, CAST(N'2019-08-07T17:56:48.490' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'AFD7781A-0DFB-4CA0-ACF8-C10381D2E4B3', NULL, CAST(N'2019-08-07T21:39:37.503' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'B12F50A8-A387-419C-BC78-96D8D0F56A94', NULL, CAST(N'2019-08-07T17:56:48.547' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'BBDBB5C2-E624-4EB8-81E3-E697F83F0CC8', NULL, CAST(N'2019-08-07T21:39:46.633' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'BDD53200-0C29-4163-A494-40AA1F1E9925', NULL, CAST(N'2019-08-07T17:56:48.110' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'C15CAFB0-1794-4B1D-8C6F-4AF33446DFAF', NULL, CAST(N'2019-08-07T21:33:16.540' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'C192282D-0FED-457E-AF53-B540B9CC1A5C', NULL, CAST(N'2019-08-07T21:33:16.883' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'C4C33AFA-4DDB-412D-A3C3-8ECA4985FAA9', NULL, CAST(N'2019-08-07T21:33:16.860' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'C535C4FF-96F0-4878-847B-7951EA2E7EBF', NULL, CAST(N'2019-08-07T17:56:48.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'CE34F3AB-89C7-4E43-89E5-25AE83EF2862', NULL, CAST(N'2019-08-07T21:39:46.600' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'CEC5AD89-2483-49C8-9545-432DA3EF64A2', NULL, CAST(N'2019-08-07T21:39:46.717' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'D2FAD458-3497-4603-BB6D-00A5918A4EFB', NULL, CAST(N'2019-08-07T21:33:16.837' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'D3DB15A2-6099-47B8-9DC9-67E7E552860F', NULL, CAST(N'2019-08-07T21:33:16.780' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'D9F908DA-0CF6-4F40-BA9A-2F68531427E9', NULL, CAST(N'2019-08-07T17:56:48.140' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'DF544296-208A-4792-A908-FBE2A90FDEE6', NULL, CAST(N'2019-08-07T21:33:16.517' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'E7CEE96C-8338-4921-A10E-D46248FEF192', NULL, CAST(N'2019-08-07T21:33:17.007' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'EDE8EFCD-0583-49C1-BEA1-A10B40F48095', NULL, CAST(N'2019-08-07T21:33:16.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'EF9C907A-BE10-4D04-AD65-BDDDA1273CB3', NULL, CAST(N'2019-08-07T21:33:15.783' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'F130507D-FFD5-4245-B30D-0A1796CFFB2F', NULL, CAST(N'2019-08-07T21:39:46.533' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'F38648F8-545D-4B3C-9442-6D4F9ED89327', NULL, CAST(N'2019-08-07T17:56:48.153' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'F6224CE8-2C65-42F5-BFA1-54215A8715F2', NULL, CAST(N'2019-08-07T21:33:16.983' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'FE69C019-634E-4DEC-8C0F-AE68AE22E31F', NULL, CAST(N'2019-08-07T17:56:48.050' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'FEB280FB-71AC-4C2F-A2A1-CD8D31D44553', NULL, CAST(N'2019-08-07T21:39:46.703' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'0ac464bd-30c7-498b-bd7e-82642375b779', N'user2@gee.com', 0, N'ANjq4nvXOfPaX4pBLuz+aBCAW0jV1uTvABpI2qQ3TE9e7bMlndnRostNd3bLDxh8Kw==', N'faf56a88-cf64-4144-bb63-ee7d58a3b8b0', N'1234327680', 0, 0, NULL, 0, 0, N'user2@gee.com', 1, CAST(N'2019-08-13T22:30:03.340' AS DateTime), 6, NULL, NULL, 1, 1, 0, N'user2', N'user2 last', 29, 1, 16)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'17775617-8EFD-43A2-BEC4-85AEB91456A3', N'shivani@g.com', 0, N'Shivani@12345', N'CEF16112-5BC8-46A2-AA61-B173564ABC82', NULL, 0, 0, NULL, 0, 0, N'Shivani', 1, CAST(N'2019-07-24T21:30:35.420' AS DateTime), NULL, NULL, NULL, 1, 1, 0, N'Shivani', N'ABCD', NULL, 2, 2)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'504d528b-6d1b-44e2-bcba-dcd0c411893a', N'user1@gee.com', 0, N'AC0MgvHGYGZu5qVnTEg64obuYNNq1DX8Hmoe7hW1mLHzpgM5WMItwjM1A9SgB2hfqQ==', N'90db9a3f-4ac2-492a-b78f-d379ec43285c', N'1234567890', 0, 0, NULL, 0, 0, N'user1@gee.com', 1, CAST(N'2019-08-13T20:58:09.817' AS DateTime), 6, CAST(N'2019-08-13T20:58:36.323' AS DateTime), 6, 1, 1, 0, N'User1', N'user1last', 28, 1, 15)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'57992771-fdeb-4363-9e6a-8964436ec2c1', N'c@a.com', 0, N'ALGPLdGVQZkgmzKhenHcOJ0keXfv4kdA9RAdCvdFHBj/IxXH9QCKLsLTZGc3JHZL3g==', N'bc929a39-929c-431f-be18-e8f2a633bbe6', NULL, 0, 0, NULL, 0, 0, N'c@a.com', NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, 11)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'59047970-D525-4562-943B-E4B9735F15B4', N'jiya@g.com', 0, N'jiya@12345', N'2BC4D02B-0890-4BBE-8704-2345F3466D94', NULL, 0, 0, NULL, 0, 0, N'Jiya', 1, CAST(N'2019-07-24T21:31:27.497' AS DateTime), NULL, NULL, NULL, 1, 1, 0, N'Jiya', N'ABCD', NULL, 2, 3)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'6DED0041-EEEE-4B76-9961-060FED9035AB', N'himanshu@g.com', 0, N'himanshu@12345', N'FA8C6825-E7D0-42DC-9C0A-BB95A771110E', NULL, 0, 0, NULL, 0, 0, N'Himanshu', 1, CAST(N'2019-07-24T21:32:12.107' AS DateTime), NULL, NULL, NULL, 1, 1, 0, N'Himanshu', N'ABCD', NULL, 2, 4)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'AE33BE6B-E4A1-40ED-BB6D-A64BEDB92AE2', N'ram@g.com', 0, N'ram@12345', N'CE3CB196-B44A-4CB9-8EA8-C19D59A02ACF', NULL, 0, 0, NULL, 0, 0, N'Ram', 1, CAST(N'2019-07-24T21:34:18.890' AS DateTime), NULL, NULL, NULL, 1, 1, 0, N'Ram', N'ABCD', NULL, 2, 7)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'b4e9edc2-4733-4ee0-98e9-d7cc7da58196', N'd@a.com', 0, N'AAz5ALDHpSgakzexy+wXwW0J9YCxJDedZ/YKiEn2tefWUhtPMkMN4FeHqfIRBzyqSg==', N'abf7f996-d5d0-42c4-bbf7-b178e579eb15', NULL, 0, 0, NULL, 0, 0, N'd@a.com', NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, 12)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'b7de8685-80b4-455e-b439-d2782e07aaef', N'b@a.com', 0, N'AHTiBCz5xuoMTsZgiifARhuUUz53nqyIOs7lAkmNUyC599Lq2leJEcSbZ6LBI2LeJA==
', N'29e43df2-48d1-441c-9eda-bc73bb97361b', NULL, 0, 0, NULL, 0, 0, N'b@a.com', NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 1, 10)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'CAA4E60A-EC49-40F6-A772-FC529F289B6A', N'Amixa@g.com', 0, N'amixa@12345', N'2E105EFC-6ADE-40D9-9B70-195719DAD51E', NULL, 0, 0, NULL, 0, 0, N'Amixa', 1, CAST(N'2019-07-24T21:32:47.437' AS DateTime), NULL, NULL, NULL, 1, 1, 0, N'Amixa', N'ABCD', NULL, 1, 5)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [FirstName], [LastName], [StuStaffTypeId], [UserGroupId], [CUserId]) VALUES (N'dd088a0f-d797-488f-8810-b2c0764ac570', N'a@a.com', 0, N'AHTiBCz5xuoMTsZgiifARhuUUz53nqyIOs7lAkmNUyC599Lq2leJEcSbZ6LBI2LeJA==
', N'66ca5ae8-36f6-443e-b669-9e8b730a32e6', NULL, 0, 0, NULL, 0, 0, N'a@a.com', 1, CAST(N'2019-07-24T21:33:23.450' AS DateTime), NULL, NULL, NULL, 1, 1, 0, N'a@a.com', N'ABCD', NULL, 1, 6)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[AssessmentTYPE] ON 
GO
INSERT [dbo].[AssessmentTYPE] ([AssessmentType_Id], [AssessmentGroup_ID], [AssessmentType_code], [AssessmentType_Name], [MinMarks], [MaxMarks], [PassingMarks], [Weightage], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, NULL, N'SA', N'Submittive Assesment', 100, 35, 40, N'40', 1, CAST(N'2019-08-13T01:02:54.447' AS DateTime), 0, CAST(N'2019-08-13T01:02:54.447' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[AssessmentTYPE] ([AssessmentType_Id], [AssessmentGroup_ID], [AssessmentType_code], [AssessmentType_Name], [MinMarks], [MaxMarks], [PassingMarks], [Weightage], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (2, NULL, N'Term1', N'Term1 Exam', 50, 18, 18, N'50', 1, CAST(N'2019-08-08T22:33:10.457' AS DateTime), 6, CAST(N'2019-08-08T22:33:10.457' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[AssessmentTYPE] ([AssessmentType_Id], [AssessmentGroup_ID], [AssessmentType_code], [AssessmentType_Name], [MinMarks], [MaxMarks], [PassingMarks], [Weightage], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (3, NULL, N'Term2', N'Term2 Exam', 50, 18, 18, N'50', 1, CAST(N'2019-08-08T22:33:41.697' AS DateTime), 6, CAST(N'2019-08-08T22:33:41.697' AS DateTime), 6, 1, 1, 1)
GO
INSERT [dbo].[AssessmentTYPE] ([AssessmentType_Id], [AssessmentGroup_ID], [AssessmentType_code], [AssessmentType_Name], [MinMarks], [MaxMarks], [PassingMarks], [Weightage], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (4, NULL, N'1', N'Term2', 80, 40, 40, N'50', 1, CAST(N'2019-08-13T01:04:26.920' AS DateTime), 6, CAST(N'2019-08-13T01:04:26.920' AS DateTime), 6, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[AssessmentTYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[BookMaster] ON 
GO
INSERT [dbo].[BookMaster] ([BookMaster_Id], [Code], [name], [Publisher], [ISBN], [Version], [MRP], [Discount], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, N'M1', N'Maths', N'Vision', NULL, N'II', 100, 10, 1, CAST(N'2019-08-08T20:31:59.307' AS DateTime), 0, CAST(N'2019-08-08T20:31:59.307' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[BookMaster] ([BookMaster_Id], [Code], [name], [Publisher], [ISBN], [Version], [MRP], [Discount], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (2, N'Sci', N'Science', N'Nirali', NULL, NULL, 80, 5, 1, CAST(N'2019-08-07T22:12:48.200' AS DateTime), 6, CAST(N'2019-08-07T22:12:48.200' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[BookMaster] ([BookMaster_Id], [Code], [name], [Publisher], [ISBN], [Version], [MRP], [Discount], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (3, N'001', N'Maths', N'Vision', NULL, N'II', 90, NULL, 1, CAST(N'2019-08-08T20:31:20.317' AS DateTime), 6, CAST(N'2019-08-08T20:31:20.317' AS DateTime), 6, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[BookMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CandidateDetail] ON 
GO
INSERT [dbo].[CandidateDetail] ([CandidateDetail_ID], [Enquiry_ID], [AdmissionClass_id], [LastPassClass_ID], [FirstName], [MiddleName], [Lastname], [DOB], [Email], [StudentType_ID], [ContactMobileNo], [HomePhone], [Gender], [Nationality], [hasSibiling], [SiblingAdmNumber_ID], [Address1], [Address2], [City_ID], [State_ID], [Country_ID], [PinCode], [Landmark], [DistanceFromSchool], [Caste_ID], [Religon_ID], [FatheFirstName], [FatherMiddleName], [FatherLasttName], [FatherQualificaiton_ID], [FatherQualificaitonText], [FatherOccupation], [FatherOfficeAddres], [FatherOrgnisation], [FatherDesignation], [MotherFirstName], [MotherMiddleName], [MotherLasttName], [MotherQualificaiton_Id], [MotherQualificaitonText], [MotherOccupation], [MotherOfficeAddres], [MotherOrgnisation], [MotherDesignation], [CurrentSchool], [CurrentSchoolCity], [IsGovtTransfer], [Remarks], [CommunicationMode], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [SubjectId], [MotherPhoneNumber], [FatherPhoneNumber]) VALUES (1, 3, 2, 2, N'Sita', N'k', N'B', NULL, N'q@gmail.com', 39, NULL, NULL, N'0         ', N'Indian    ', NULL, NULL, N'aa', N'ccc', NULL, 42, NULL, N'421456', N'ppppp', N'ppppppp', 30, 38, N'K', N'g', NULL, 37, N'BSc', N'service', N'pune', N'aaaaa', N'aaaaaa', N'a', N'k', N'b', 37, N'bsc', N'housewide', NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, 1, CAST(N'2019-08-13T00:23:11.910' AS DateTime), 0, CAST(N'2019-08-13T00:23:11.910' AS DateTime), 6, 1, 1, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[CandidateDetail] ([CandidateDetail_ID], [Enquiry_ID], [AdmissionClass_id], [LastPassClass_ID], [FirstName], [MiddleName], [Lastname], [DOB], [Email], [StudentType_ID], [ContactMobileNo], [HomePhone], [Gender], [Nationality], [hasSibiling], [SiblingAdmNumber_ID], [Address1], [Address2], [City_ID], [State_ID], [Country_ID], [PinCode], [Landmark], [DistanceFromSchool], [Caste_ID], [Religon_ID], [FatheFirstName], [FatherMiddleName], [FatherLasttName], [FatherQualificaiton_ID], [FatherQualificaitonText], [FatherOccupation], [FatherOfficeAddres], [FatherOrgnisation], [FatherDesignation], [MotherFirstName], [MotherMiddleName], [MotherLasttName], [MotherQualificaiton_Id], [MotherQualificaitonText], [MotherOccupation], [MotherOfficeAddres], [MotherOrgnisation], [MotherDesignation], [CurrentSchool], [CurrentSchoolCity], [IsGovtTransfer], [Remarks], [CommunicationMode], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [SubjectId], [MotherPhoneNumber], [FatherPhoneNumber]) VALUES (2, 4, NULL, NULL, N'Rekha', N'k', N'A', CAST(N'2019-08-13' AS Date), N'r@gmail.com', 39, NULL, NULL, NULL, NULL, 0, NULL, N'11sdf', N'asdf', 55, 54, 41, NULL, NULL, NULL, NULL, NULL, N'k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'qw', N'k', N'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-08-13T00:00:00.000' AS DateTime), 0, NULL, NULL, 1, 1, NULL, 0, 1234567890, 1234567987)
GO
SET IDENTITY_INSERT [dbo].[CandidateDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ClassMaster] ON 
GO
INSERT [dbo].[ClassMaster] ([ClassMaster_ID], [ClassClassification_Id], [Code], [Name], [Sequence], [TotalSections], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, 27, N'High', N'Highschool', NULL, NULL, 1, CAST(N'2019-08-07T22:45:49.200' AS DateTime), 6, CAST(N'2019-08-07T22:45:49.200' AS DateTime), 6, 1, 1, 1)
GO
INSERT [dbo].[ClassMaster] ([ClassMaster_ID], [ClassClassification_Id], [Code], [Name], [Sequence], [TotalSections], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (2, 64, N'V', N'Class 5', 12, 12, 1, CAST(N'2019-08-13T01:06:16.703' AS DateTime), 0, CAST(N'2019-08-13T01:06:16.703' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[ClassMaster] ([ClassMaster_ID], [ClassClassification_Id], [Code], [Name], [Sequence], [TotalSections], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (3, 65, N'X', N'Class 10', 3, 8, 1, CAST(N'2019-08-08T20:22:34.690' AS DateTime), 0, CAST(N'2019-08-08T20:22:34.690' AS DateTime), 6, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[ClassMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseMaster] ON 
GO
INSERT [dbo].[CourseMaster] ([CourseMaster_ID], [SubjectMaster_ID], [ClassMaster_ID], [Code], [Name], [ExcfromAtt], [ISoptional], [Streams], [GradeStructure], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, 2, 2, N'Art', N'Arts', 0, 1, 82, 77, NULL, CAST(N'2019-08-08T20:34:30.237' AS DateTime), 6, CAST(N'2019-08-08T20:34:30.237' AS DateTime), 6, NULL, NULL, 0)
GO
INSERT [dbo].[CourseMaster] ([CourseMaster_ID], [SubjectMaster_ID], [ClassMaster_ID], [Code], [Name], [ExcfromAtt], [ISoptional], [Streams], [GradeStructure], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (2, 1, 2, N'', N'', 0, 0, 0, 0, NULL, CAST(N'2019-08-08T20:34:30.317' AS DateTime), 6, CAST(N'2019-08-08T20:34:30.317' AS DateTime), 6, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[CourseMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentType] ON 
GO
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeCode], [DocumentTypeName], [DocumentCategoryID], [Digitalallowed], [IsMandatory], [ToFollow], [FollowupTypeCode], [Is Verified], [SessionYear], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SchoolID], [GroupID], [ISDeleted], [Remarks]) VALUES (1, N'TC        ', N'Transfer certificate', 49, 1, 1, 0, N'50        ', NULL, N'1         ', CAST(N'2019-08-12T04:00:03.653' AS DateTime), 0, CAST(N'2019-08-12T04:00:03.653' AS DateTime), NULL, 1, 1, 0, N'df')
GO
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeCode], [DocumentTypeName], [DocumentCategoryID], [Digitalallowed], [IsMandatory], [ToFollow], [FollowupTypeCode], [Is Verified], [SessionYear], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SchoolID], [GroupID], [ISDeleted], [Remarks]) VALUES (2, N'MS        ', N'old Mraksheets', 49, 1, 1, 0, N'50        ', NULL, N'1         ', CAST(N'2019-08-13T04:36:59.790' AS DateTime), 0, CAST(N'2019-08-13T04:36:59.790' AS DateTime), NULL, 1, 1, 0, N'updated')
GO
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeCode], [DocumentTypeName], [DocumentCategoryID], [Digitalallowed], [IsMandatory], [ToFollow], [FollowupTypeCode], [Is Verified], [SessionYear], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SchoolID], [GroupID], [ISDeleted], [Remarks]) VALUES (3, N'Cert      ', N'CBSE certificate', 61, 1, 1, 0, N'0         ', NULL, N'1         ', CAST(N'2019-08-13T20:17:28.687' AS DateTime), 0, CAST(N'2019-08-13T20:17:28.687' AS DateTime), NULL, 1, 1, 0, N'All Good')
GO
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeCode], [DocumentTypeName], [DocumentCategoryID], [Digitalallowed], [IsMandatory], [ToFollow], [FollowupTypeCode], [Is Verified], [SessionYear], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SchoolID], [GroupID], [ISDeleted], [Remarks]) VALUES (4, NULL, NULL, NULL, 0, 0, 0, N'Select    ', NULL, N'1         ', CAST(N'2019-08-13T00:54:12.017' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeCode], [DocumentTypeName], [DocumentCategoryID], [Digitalallowed], [IsMandatory], [ToFollow], [FollowupTypeCode], [Is Verified], [SessionYear], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SchoolID], [GroupID], [ISDeleted], [Remarks]) VALUES (6, N'aadhar    ', N'aadhar', 49, 1, 0, 0, N'50        ', NULL, N'1         ', CAST(N'2019-08-13T04:37:49.727' AS DateTime), 1, NULL, NULL, 1, 1, 0, N'tr')
GO
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeCode], [DocumentTypeName], [DocumentCategoryID], [Digitalallowed], [IsMandatory], [ToFollow], [FollowupTypeCode], [Is Verified], [SessionYear], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SchoolID], [GroupID], [ISDeleted], [Remarks]) VALUES (7, N'Z         ', N'SSC certificate', 61, 1, 0, 0, N'50        ', NULL, N'1         ', CAST(N'2019-08-13T20:20:38.027' AS DateTime), 1, NULL, NULL, 1, 1, 0, N'Done')
GO
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeCode], [DocumentTypeName], [DocumentCategoryID], [Digitalallowed], [IsMandatory], [ToFollow], [FollowupTypeCode], [Is Verified], [SessionYear], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SchoolID], [GroupID], [ISDeleted], [Remarks]) VALUES (8, N'cert      ', N'Marksheet', 58, 0, 0, 0, N'50        ', NULL, N'1         ', CAST(N'2019-08-13T20:40:46.560' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeEducationDetail] ON 
GO
INSERT [dbo].[EmployeeEducationDetail] ([EmployeeEducationDetail_ID], [EmpCode], [Degree_ID], [Subjects], [FromDate], [ToDate], [InstituteName], [City], [EmpDegreeModeid], [Percent_Marks], [Division], [Remarks], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (9, 1, NULL, N'S1', CAST(N'2019-08-01T00:00:00.000' AS DateTime), CAST(N'2019-08-15T00:00:00.000' AS DateTime), N'Im', N'C1', 29, 12, N'f', NULL, NULL, CAST(N'2019-08-15T09:16:15.617' AS DateTime), 6, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[EmployeeEducationDetail] ([EmployeeEducationDetail_ID], [EmpCode], [Degree_ID], [Subjects], [FromDate], [ToDate], [InstituteName], [City], [EmpDegreeModeid], [Percent_Marks], [Division], [Remarks], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (10, 1, NULL, N'S2', CAST(N'2019-08-09T00:00:00.000' AS DateTime), CAST(N'2019-08-10T00:00:00.000' AS DateTime), N'im', N'c2', 28, 13, N'd', NULL, NULL, CAST(N'2019-08-15T09:16:15.617' AS DateTime), 6, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[EmployeeEducationDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeExperience] ON 
GO
INSERT [dbo].[EmployeeExperience] ([EmployeeExperience_Id], [EmpCode], [Company_Name], [WorkCity], [From_Date], [To_Date], [Last_salary], [joining_Designation], [Last_Designation], [Reason_To_leave], [IsRelevant], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (9, 1, N'c1', N'w1', CAST(N'2019-08-07T00:00:00.000' AS DateTime), CAST(N'2019-08-22T00:00:00.000' AS DateTime), 123, N'j1', N'l1', N'r1', NULL, NULL, CAST(N'2019-08-15T09:16:15.617' AS DateTime), 6, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[EmployeeExperience] ([EmployeeExperience_Id], [EmpCode], [Company_Name], [WorkCity], [From_Date], [To_Date], [Last_salary], [joining_Designation], [Last_Designation], [Reason_To_leave], [IsRelevant], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (10, 1, N'c2', N'w2', CAST(N'2019-08-13T00:00:00.000' AS DateTime), CAST(N'2019-08-20T00:00:00.000' AS DateTime), 234, N'j2', N'l2', N'r2', NULL, NULL, CAST(N'2019-08-15T09:16:15.617' AS DateTime), 6, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[EmployeeExperience] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeIDdetail] ON 
GO
INSERT [dbo].[EmployeeIDdetail] ([EmployeeIDdetail_ID], [IDcardTypeID], [EmpcodeID], [Idnumber], [validFrom], [ValidTo], [IssueCityID], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (9, NULL, 1, N'id110', CAST(N'2019-08-01T00:00:00.000' AS DateTime), CAST(N'2019-08-15T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-08-15T09:16:15.617' AS DateTime), 6, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[EmployeeIDdetail] ([EmployeeIDdetail_ID], [IDcardTypeID], [EmpcodeID], [Idnumber], [validFrom], [ValidTo], [IssueCityID], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (10, NULL, 1, N'id0013', CAST(N'2019-08-05T00:00:00.000' AS DateTime), CAST(N'2019-08-07T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-08-15T09:16:15.617' AS DateTime), 6, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[EmployeeIDdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeMaster] ON 
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeMasterID], [EmpCode], [EmpCategoryID], [StaffDesignationID], [VendorID], [DepartmentID], [FirstName], [MiddleName], [Lastname], [Email], [ContactMobileNo], [HomePhone], [CurrentAddress], [CurrentCityID], [CurrentStateID], [CurrentCountryID], [CurrentPinCode], [CurrentLandmark], [Is_also_Permanent], [PermenentAddress], [PermenentCity_ID], [PermenentState_ID], [PermenentCountry_ID], [PinCode], [Landmark], [DOB], [GenderID], [Nationality], [Married], [Remarks], [FatheFirstName], [FatherMiddleName], [FatherLasttName], [MotherFirstName], [MotherMiddleName], [MotherLasttName], [Caste_ID], [Religon_ID], [Create_Login], [selectUsergroup], [EmpStatusId], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, N'EC001', 28, 31, 31, 31, N'test1', N'Mname', N'Lnam', N'email@email.com', N'1234567890', N'9876543210', N'Ca', 43, 42, 41, N'123456', N'CL', NULL, N'PA', 43, 42, 41, N'123456', N'PL', CAST(N'2019-08-01T00:00:00.000' AS DateTime), 85, N'41', NULL, N'R', N'FFn', N'FMn', N'FLN', N'MFN', N'MMN', N'MLN', 0, 38, N'yes', N'28', NULL, 1, CAST(N'2019-08-15T09:03:15.890' AS DateTime), 6, CAST(N'2019-08-15T09:16:15.617' AS DateTime), 6, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[EmployeeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Enquiry] ON 
GO
INSERT [dbo].[Enquiry] ([Enquiry_ID], [EnquiryNo], [MarketSource_ID], [EnquiryType_ID], [Status], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (3, N'3EnqNO40            ', 0, 32, NULL, NULL, CAST(N'2019-08-12T00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Enquiry] ([Enquiry_ID], [EnquiryNo], [MarketSource_ID], [EnquiryType_ID], [Status], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (4, N'3EnqNO41            ', 36, 33, NULL, NULL, CAST(N'2019-08-13T00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Enquiry] OFF
GO
SET IDENTITY_INSERT [dbo].[IndexScreenDetails] ON 
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, 3, N'Enquiry', N'Enquiry_ID', 0, 1, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:34:46.710' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (2, 3, N'Enquiry', N'EnquiryNo', 1, 2, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:51:31.993' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (3, 3, N'EnquiryType', N'EnquiryName', 1, 3, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:05.993' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (4, 3, N'Application', N'ApplicaitonNo', 0, 4, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (5, 3, N'Registration', N'RegistrationNo', 1, 5, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (6, 3, N'CandidateDetail', N'FirstName', 1, 6, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (7, 3, N'CandidateDetail', N'MiddleName', 1, 7, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (8, 3, N'CandidateDetail', N'Lastname', 1, 8, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (9, 3, N'CandidateDetail', N'DOB', 1, 9, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (10, 3, N'CandidateDetail', N'Email', 1, 10, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (11, 3, N'CandidateDetail', N'Gender', 1, 11, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (12, 3, N'CandidateDetail', N'Nationality', 1, 12, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (13, 3, N'CandidateDetail', N'Address1', 1, 13, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (14, 3, N'CandidateDetail', N'Address2', 1, 14, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (15, 3, N'CandidateDetail', N'FatheFirstName', 1, 15, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (16, 3, N'CandidateDetail', N'FatherMiddleName', 0, 16, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (17, 3, N'CandidateDetail', N'FatherLasttName', 0, 17, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (18, 3, N'CandidateDetail', N'FatherDesignation', 1, 18, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:59:34.243' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (19, 3, N'CandidateDetail', N'MotherFirstName', 1, 19, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:59:34.243' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (20, 3, N'Enquiry', N'Status', 0, 20, 20, 0, N'int', 0, NULL, NULL, CAST(N'2019-04-03T12:31:37.057' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (21, 14, N'AspNetUsers', N'Email', 1, 6, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.143' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (22, 14, N'AspNetUsers', N'PhoneNumber', 1, 5, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.160' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (23, 14, N'AspNetUsers', N'UserName', 1, 2, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.160' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (24, 14, N'AspNetUsers', N'FirstName', 1, 3, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.160' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (25, 14, N'AspNetUsers', N'LastName', 1, 4, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.160' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (26, 14, N'UserGroup', N'UserGroupName', 1, 8, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.177' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (27, 14, N'AspNetUsers', N'CUserId', 1, 1, 20, 1, N'int', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.177' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (28, 14, N'MasterTable', N'Name', 0, 7, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-04-21T23:58:48.177' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (29, 7, N'Enquiry', N'Enquiry_ID', 1, 1, 20, 1, N'int', 1, NULL, NULL, CAST(N'2019-05-10T21:50:06.677' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (30, 7, N'CandidateDetail', N'FirstName', 1, 2, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-05-10T21:52:49.847' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (31, 7, N'CandidateDetail', N'LastName', 1, 3, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T21:55:38.423' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (32, 7, N'CandidateDetail', N'DOB', 1, 7, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T21:58:06.017' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (33, 7, N'CandidateDetail', N'Email', 1, 8, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T21:58:41.830' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (34, 7, N'CandidateDetail', N'ContactMobileNo', 1, 4, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T21:59:31.360' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (35, 7, N'CandidateDetail', N'Gender', 1, 5, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T22:00:05.097' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (36, 7, N'CandidateDetail', N'FatheFirstName', 1, 6, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T22:00:41.660' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (37, 7, N'Enquiry', N'Status', 1, 9, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T22:01:24.770' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (38, 7, N'Application', N'ApplicaitonNo', 1, 10, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T22:02:22.583' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (39, 7, N'Registration', N'RegistrationNo', 1, 11, 20, 1, N'string', NULL, NULL, NULL, CAST(N'2019-05-10T22:03:16.830' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (40, 7, N'Application', N'IsSubmitted', 1, 12, 20, 1, N'bit', NULL, NULL, NULL, CAST(N'2019-05-10T23:57:42.070' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (41, 7, N'Registration', N'Issubmitted', 0, 13, 20, 1, N'bit', NULL, NULL, NULL, CAST(N'2019-05-10T23:58:11.020' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (42, 7, N'Application', N'Applicationsold', 0, 14, 20, 1, N'bit', NULL, NULL, NULL, CAST(N'2019-05-10T22:02:22.583' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (43, 8, N'CandidateDetail', N'FirstName', 1, 1, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (44, 8, N'CandidateDetail', N'MiddleName', 1, 2, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (45, 8, N'CandidateDetail', N'Lastname', 1, 3, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (46, 8, N'CandidateDetail', N'DOB', 1, 4, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (47, 8, N'CandidateDetail', N'Email', 1, 5, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (48, 8, N'CandidateDetail', N'Gender', 1, 6, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (49, 8, N'CandidateDetail', N'Nationality', 1, 7, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (50, 8, N'CandidateDetail', N'Address1', 1, 8, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (51, 8, N'CandidateDetail', N'Address2', 1, 9, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (52, 8, N'CandidateDetail', N'FatheFirstName', 1, 10, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (53, 8, N'CandidateDetail', N'FatherMiddleName', 0, 8, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (54, 8, N'CandidateDetail', N'FatherLasttName', 0, 12, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (55, 8, N'CandidateDetail', N'FatherDesignation', 1, 13, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:59:34.243' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (56, 8, N'CandidateDetail', N'MotherFirstName', 1, 14, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:59:34.243' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (57, 8, N'CandidateDetail', N'CandidateDetail_ID', 0, 15, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:59:34.243' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (58, 8, N'CandidateDetail', N'Enquiry_ID', 0, 16, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:59:34.243' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (59, 8, N'Enquiry', N'EnquiryNo', 1, 17, 20, 0, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:59:34.243' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (60, 12, N'AdmissionStatus', N'AdmissionStatus_id', 1, 1, 20, 0, N'int', 1, N'ASC', NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (61, 12, N'AdmissionStatus', N'ClassMaster_id', 0, 11, 20, 0, N'int', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (62, 12, N'AdmissionStatus', N'AdmissionCode', 1, 3, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (63, 12, N'AdmissionStatus', N'AdmissionStatus', 1, 4, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (64, 12, N'AdmissionStatus', N'AdmissionSessionYear', 0, 12, 20, 1, N'int', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (65, 12, N'AdmissionStatus', N'Startdate', 1, 6, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (66, 12, N'AdmissionStatus', N'FromDOB', 1, 7, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (67, 12, N'AdmissionStatus', N'TODOB', 1, 8, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (68, 12, N'AdmissionStatus', N'ApplicaitonFees', 1, 9, 20, 1, N'int', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (69, 12, N'AdmissionStatus', N'RegistrationFees', 1, 10, 20, 1, N'int', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (70, 12, N'ClassMaster', N'Name', 1, 2, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (71, 12, N'AcademicYear', N'ShortName', 1, 5, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-04-02T00:52:06.023' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (72, 32, N'EmployeeMaster', N'EmployeeMasterID', 1, 1, 20, 0, N'int', 1, N'ASC', NULL, CAST(N'2019-07-27T20:20:37.963' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (73, 32, N'EmployeeMaster', N'FirstName', 1, 2, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-07-27T20:20:38.227' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (74, 32, N'EmployeeMaster', N'Lastname', 1, 3, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-07-27T20:20:38.457' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (75, 32, N'EmployeeMaster', N'ContactMobileNo', 1, 4, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-07-27T20:20:38.700' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (76, 32, N'EmployeeMaster', N'Email', 1, 5, 20, 1, N'string', 0, NULL, NULL, CAST(N'2019-07-27T20:20:38.953' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (77, 32, N'EmployeeMaster', N'GenderID', 0, 6, 20, 0, N'int', 0, NULL, NULL, CAST(N'2019-07-27T20:20:39.187' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (78, 36, N'RouteMaster', N'RouteCode', 1, 2, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-08-14T21:28:16.287' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (79, 36, N'RouteMaster', N'RoutName', 1, 2, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-08-14T21:32:13.740' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (80, 36, N'RouteMaster', N'Name', 1, 2, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-08-14T21:32:13.740' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (81, 36, N'RouteMaster', N'Totaldistance', 1, 2, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-08-14T21:32:13.757' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (82, 36, N'RouteMaster', N'TotalTriptime', 1, 2, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-08-14T21:32:13.757' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID], [Nav_menu_ID], [TableName], [ColName], [GridVisibilty], [Sequence], [Length], [Search_visible], [ColDataType], [DefaultSorting], [DefaultSortOrder], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (83, 36, N'RouteMaster', N'RouteMasterId', 1, 2, 20, 1, N'string', 1, N'ASC', NULL, CAST(N'2019-08-14T21:32:13.757' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[IndexScreenDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterTable] ON 
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (1, 14, N'Upd', N'Update', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.023' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (2, 14, N'del', N'Delete', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.023' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (3, 14, N'vw', N'View', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.023' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (4, 14, N'Sms', N'SendSMS', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.023' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (5, 14, N'Smail', N'SendEmail', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.040' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (6, 14, N'Prntdoc', N'PrintDocument', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.040' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (7, 14, N'Wrkflapprv', N'WorkflowApproval', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.040' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (8, 14, N'Sav', N'add', NULL, NULL, NULL, CAST(N'2019-07-17T22:00:34.040' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (9, 29, N' Tech', N' Teaching', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.037' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (10, 29, N' Non-Tech', N' Non-Teaching', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.053' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (11, 30, N' HOD', N'Head of Department', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.100' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (12, 30, N' Co', N'co-ordinator', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.117' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (13, 31, N' Best', N'The best Supplier', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.130' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (14, 32, N' Maths', N'Mathematics', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.130' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (15, 32, N' Sci', N'Science', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.147' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (16, 33, N' AdH', N'Adhar Card', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.160' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (17, 33, N' DL', N'Driving License', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.177' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (18, 34, N' HSC', N'Higher Secondary School', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.177' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (19, 34, N' Grad', N'Graduation', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.193' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (20, 35, N' OL', N'Online', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.193' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (21, 35, N' Cor', N'corresponden', NULL, NULL, NULL, CAST(N'2019-07-22T23:05:04.210' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (22, 36, N' ACT', N' Active', NULL, NULL, NULL, CAST(N'2019-07-25T13:22:48.973' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (23, 36, N' EX', N' Exit', NULL, NULL, NULL, CAST(N'2019-07-25T13:22:48.973' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (24, 36, N' Susp', N' Suspended', NULL, NULL, NULL, CAST(N'2019-07-25T13:22:48.990' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (25, 18, NULL, NULL, NULL, NULL, 1, CAST(N'2019-08-07T22:32:17.563' AS DateTime), 6, CAST(N'2019-08-08T19:44:55.713' AS DateTime), 6, 1, 1, 1, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (26, 27, N'Sci', N'Science', 0, NULL, 1, CAST(N'2019-08-07T22:32:55.817' AS DateTime), 6, CAST(N'2019-08-08T20:15:15.420' AS DateTime), 6, 1, 1, 1, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (27, 18, N'X', N'Class X', NULL, NULL, 1, CAST(N'2019-08-07T22:34:56.953' AS DateTime), 6, CAST(N'2019-08-08T19:44:49.730' AS DateTime), 6, 1, 1, 1, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (28, 13, N'Stff', N'STAFF', 0, NULL, 1, CAST(N'2019-08-08T19:37:40.250' AS DateTime), 0, CAST(N'2019-08-08T19:37:40.250' AS DateTime), 6, 1, 1, 0, 1)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (29, 13, N'Stud', N'Student', 0, NULL, 1, CAST(N'2019-08-08T19:37:55.523' AS DateTime), 0, CAST(N'2019-08-08T19:37:55.523' AS DateTime), 6, 1, 1, 0, 1)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (30, 1, N'1', N'Test Cast', NULL, NULL, 1, CAST(N'2019-08-07T22:42:54.587' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (31, 2, N'HD', N'HOD', 0, NULL, 1, CAST(N'2019-08-07T23:43:50.663' AS DateTime), 0, CAST(N'2019-08-07T23:43:50.663' AS DateTime), 6, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (32, 3, N'Tel', N'Telephonic', 0, NULL, 1, CAST(N'2019-08-07T22:44:16.710' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (33, 3, N'Wlk', N'WalkIn', NULL, NULL, 1, CAST(N'2019-08-07T22:46:49.733' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (34, 4, N'ENG', N'English', 0, NULL, 1, CAST(N'2019-08-07T22:47:50.060' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (35, 4, N'Hin', N'Hindi', 0, NULL, 1, CAST(N'2019-08-07T22:48:12.067' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (36, 5, N'Digimed', N'Digital Media', 0, NULL, 1, CAST(N'2019-08-07T22:49:14.350' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (37, 6, N'Grad', N'Graduation', 0, NULL, 1, CAST(N'2019-08-07T23:48:36.500' AS DateTime), 0, CAST(N'2019-08-07T23:48:36.500' AS DateTime), 6, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (38, 7, N'Hin', N'Hindu', 0, NULL, 1, CAST(N'2019-08-07T22:50:06.853' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (39, 8, N'HS', N'Hostel', 0, NULL, 1, CAST(N'2019-08-07T22:50:34.997' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (40, 8, N'DB', N'Day Boarder', 0, NULL, 1, CAST(N'2019-08-07T22:51:00.937' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (41, 9, N'IND', N'INDIA', 0, NULL, 1, CAST(N'2019-08-07T22:51:27.713' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (42, 10, N'MAH', N'Maharashtra', 41, NULL, 1, CAST(N'2019-08-07T23:53:25.537' AS DateTime), 0, CAST(N'2019-08-07T23:53:25.537' AS DateTime), 6, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (43, 11, N'PUN', N'Pune', 42, NULL, 1, CAST(N'2019-08-07T23:54:49.987' AS DateTime), 0, CAST(N'2019-08-07T23:54:49.987' AS DateTime), 6, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (44, 13, N'Stf', N'Staff', NULL, NULL, 1, CAST(N'2019-08-07T22:53:45.947' AS DateTime), 6, CAST(N'2019-08-08T19:38:07.887' AS DateTime), 6, 1, 1, 1, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (45, 13, N'St', N'student', 0, NULL, 1, CAST(N'2019-08-07T22:54:07.470' AS DateTime), 6, CAST(N'2019-08-08T19:38:14.220' AS DateTime), 6, 1, 1, 1, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (46, 15, N'Sch', N'School', 0, NULL, 1, CAST(N'2019-08-07T22:54:50.307' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (47, 15, N'Stu', N'Student', 0, NULL, 1, CAST(N'2019-08-07T22:55:06.000' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (48, 15, N'Stf', N'Staff', 0, NULL, 1, CAST(N'2019-08-07T22:55:23.297' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (49, 16, N'AdmDoc', N'Admission Document', 47, NULL, 1, CAST(N'2019-08-08T19:39:45.040' AS DateTime), 0, CAST(N'2019-08-08T19:39:45.040' AS DateTime), 6, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (50, 17, N'EM', N'Email', NULL, NULL, 1, CAST(N'2019-08-07T22:56:49.893' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (51, 9, N'US', N'USA', 0, NULL, 1, CAST(N'2019-08-07T23:17:05.377' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (52, 2, N'Tech', N'Teacher', NULL, NULL, 1, CAST(N'2019-08-07T23:43:35.573' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (53, 6, N'BSC', N'Bachelor  of Science', 0, NULL, 1, CAST(N'2019-08-07T23:52:16.983' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (54, 10, N'GUJ', N'Gujrat', 41, NULL, 1, CAST(N'2019-08-07T23:54:13.547' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (55, 11, N'SRT', N'Surat', 54, NULL, 1, CAST(N'2019-08-07T23:55:21.573' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (56, 12, N'AppFrom', N'Applicaiton', NULL, NULL, 1, CAST(N'2019-08-08T19:36:30.483' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (57, 16, N'EXdoc', N'ExitDocument', 47, NULL, 1, CAST(N'2019-08-08T19:40:12.513' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (58, 16, N'Qual', N'Qualification', 48, NULL, 1, CAST(N'2019-08-08T19:40:42.063' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (60, 16, N'Exp', N'Experience', 48, NULL, 1, CAST(N'2019-08-08T19:41:21.197' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (61, 16, N'CmplDoc', N'ComplienceDocument', 46, NULL, 1, CAST(N'2019-08-08T19:41:52.560' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (62, 16, N'MiscDoc', N'MiscelleanousDocument', 46, NULL, 1, CAST(N'2019-08-08T19:42:18.287' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (63, 17, N'Sm', N'SMS', 0, NULL, 1, CAST(N'2019-08-08T19:43:19.743' AS DateTime), 0, CAST(N'2019-08-08T19:43:19.743' AS DateTime), 6, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (64, 18, N'Pri', N'Primary School', 0, NULL, 1, CAST(N'2019-08-08T19:44:08.673' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (65, 18, N'HS', N'High School', 0, NULL, 1, CAST(N'2019-08-08T19:44:43.177' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (66, 19, N'secmas', N'Section1', 0, NULL, 1, CAST(N'2019-08-08T19:45:52.927' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (67, 20, N'BldMast', N'Block1', 0, NULL, 1, CAST(N'2019-08-08T19:46:52.550' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (68, 21, N'RdH', N'RedHouse', 0, NULL, 1, CAST(N'2019-08-08T19:48:08.227' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (69, 21, N'GrH', N'Green House', 0, NULL, 1, CAST(N'2019-08-08T19:48:49.813' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (70, 22, N'cp', N'Captin', 0, NULL, 1, CAST(N'2019-08-08T19:49:38.677' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (71, 22, N'Vcp', N'Vice Captain', 0, NULL, 1, CAST(N'2019-08-08T19:50:06.453' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (72, 23, N'Primary', N'PGT', 0, NULL, 1, CAST(N'2019-08-08T19:50:53.317' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (73, 24, N'Term1', N'Term1', 0, NULL, 1, CAST(N'2019-08-08T19:51:48.177' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (74, 24, N'Term2', N'Term2', 0, NULL, 1, CAST(N'2019-08-08T19:52:09.983' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (75, 25, N'1to5', N'1to5', NULL, NULL, 1, CAST(N'2019-08-08T20:12:45.033' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (76, 25, N'6to8', N'6to8', 0, NULL, 1, CAST(N'2019-08-08T20:13:06.617' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (77, 26, N'PrGrade', N'PrimaryGrade', 0, NULL, 1, CAST(N'2019-08-08T20:13:46.963' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (78, 26, N'HigherGrade', N'HighSchoolGrade', 0, NULL, 1, CAST(N'2019-08-08T20:14:06.860' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (79, 27, N'Scholastic', N'Scholastic', 0, NULL, 1, CAST(N'2019-08-08T20:15:10.327' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (80, 27, N'CoScholastic', N'CoScholastic', 0, NULL, 1, CAST(N'2019-08-08T20:15:41.650' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (81, 28, N'Sci', N'Science', 0, NULL, 1, CAST(N'2019-08-08T20:16:22.437' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (82, 28, N'ART', N'Arts', 0, NULL, 1, CAST(N'2019-08-08T20:16:49.520' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (83, 37, N' Sc-bio', N' Science- BIO', NULL, NULL, NULL, CAST(N'2019-08-09T00:04:37.110' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (84, 37, N' comm', N' Commerce', NULL, NULL, NULL, CAST(N'2019-08-09T00:04:37.120' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (85, 38, N' M', N' Male', NULL, NULL, NULL, CAST(N'2019-08-09T00:06:28.827' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (86, 38, N' F', N' Female', NULL, NULL, NULL, CAST(N'2019-08-09T00:06:28.827' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (87, 39, N' NS', N' NOTStarted', NULL, NULL, NULL, CAST(N'2019-08-09T00:08:14.903' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (88, 39, N' OP', N' Open', NULL, NULL, NULL, CAST(N'2019-08-09T00:08:14.903' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (89, 39, N' Cls', N' Closed', NULL, NULL, NULL, CAST(N'2019-08-09T00:08:14.903' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (90, 40, N' T1', N' Trip1', NULL, NULL, NULL, CAST(N'2019-08-09T00:09:30.860' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (91, 40, N' T2', N' Trip2', NULL, NULL, NULL, CAST(N'2019-08-09T00:09:30.860' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (92, 40, N' T3', N' Trip3', NULL, NULL, NULL, CAST(N'2019-08-09T00:09:30.860' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (93, 43, N'  Act', N'  Active', NULL, NULL, NULL, CAST(N'2019-08-09T00:13:56.000' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (94, 43, N'  Inact', N'  Inactive', NULL, NULL, NULL, CAST(N'2019-08-09T00:13:56.000' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (95, 43, N'  Rpr', N'  Repair', NULL, NULL, NULL, CAST(N'2019-08-09T00:13:56.000' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (96, 44, N'  HND', N'   Honda', NULL, NULL, NULL, CAST(N'2019-08-09T00:15:18.530' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (97, 44, N'  TM', N'   Temp', NULL, NULL, NULL, CAST(N'2019-08-09T00:15:18.530' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (98, 44, N'  TA', N'   Tata', NULL, NULL, NULL, CAST(N'2019-08-09T00:15:18.530' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (99, 45, N'   BS', N'    Bus', 98, NULL, NULL, CAST(N'2019-08-09T00:18:17.720' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (100, 45, N'   JP', N'    Jeep', 97, NULL, NULL, CAST(N'2019-08-09T00:18:17.720' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (101, 45, N'   VN', N'    Van', 96, NULL, NULL, CAST(N'2019-08-09T00:18:17.720' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (102, 46, N'   ZX', N'     ZXI', 99, NULL, NULL, CAST(N'2019-08-09T00:20:04.827' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (103, 46, N'    VX', N'     VXI', 100, NULL, NULL, CAST(N'2019-08-09T00:20:04.827' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (104, 46, N'    CRV', N'     CRV', 101, NULL, NULL, CAST(N'2019-08-09T00:20:04.843' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (105, 47, N'   Ptr', N' Petrol', NULL, NULL, NULL, CAST(N'2019-08-09T00:21:41.267' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (106, 47, N'    DS', N'      Disel', NULL, NULL, NULL, CAST(N'2019-08-09T00:21:41.267' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (107, 47, N'     CNG', N'      CNG', NULL, NULL, NULL, CAST(N'2019-08-09T00:21:41.267' AS DateTime), 1, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (108, 20, N'blk2', N'Block 2', 0, N'this  is block 2', 1, CAST(N'2019-08-13T19:35:45.510' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (109, 27, N'Geo', N'Geography', NULL, NULL, 1, CAST(N'2019-08-13T20:34:16.923' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[MasterTable] ([MasterTable_id], [Mastertabletype_id], [Code], [Name], [Parent_id], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsDefault]) VALUES (110, 27, N'EVS', N'Environment science', 0, NULL, 1, CAST(N'2019-08-13T20:35:14.343' AS DateTime), 6, NULL, NULL, 1, 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[MasterTable] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterTabletype] ON 
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (1, N'CastCategory', NULL, CAST(N'2019-07-16T21:07:52.463' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (2, N' Designation', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (3, N' EnquiryType', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (4, N' Languages', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (5, N' MarketingSource ', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (6, N' Qualificaton', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (7, N' Religion', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (8, N' StudentType ', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (9, N' Country', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (10, N' State', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, 9)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (11, N' City ', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, 10)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (12, N' NumberGenforms', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (13, N' UserType', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (14, N' PermissionMaster', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (15, N' DocuemntMastercategory', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (16, N' Docuementcategory', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, 15)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (17, N' DocumentFollowupType', NULL, CAST(N'2019-07-16T21:07:52.480' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (18, N' ClassClassification', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (19, N' SectionsMaster', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (20, N' BuildingMaster', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (21, N' HouseMaster', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (22, N' HouseDesignation ', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (23, N' TeacherClassificationMaster', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (24, N' AssessmentTypeGroup', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (25, N' AssessmentStructure', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (26, N' GradeStructure', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (27, N' SubjectType', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (28, N'SubjectGroup', NULL, CAST(N'2019-07-16T21:07:52.527' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (29, N'EmpCategory', NULL, CAST(N'2019-07-22T22:46:10.757' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (30, N'StaffDesignation', NULL, CAST(N'2019-07-22T22:46:10.770' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (31, N'Vendor', NULL, CAST(N'2019-07-22T22:46:10.790' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (32, N'Department', NULL, CAST(N'2019-07-22T22:46:10.803' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (33, N'IDcardType', NULL, CAST(N'2019-07-22T22:46:10.820' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (34, N'EmpDegree
', NULL, CAST(N'2019-07-22T22:46:10.820' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (35, N'EmpDegreeMode
', NULL, CAST(N'2019-07-22T22:46:10.833' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (36, N'EmployeeStatus', NULL, CAST(N'2019-07-25T13:19:53.413' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (37, N'Streams', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (38, N'Gender', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (39, N'AdmissionStatusValue', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (40, N'VechicleTrip', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (41, N'RouteMaster', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (42, N'PassangerStatus', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (43, N'VechicleStatus', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (44, N'VechicalManufacturer', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (45, N'VechicalMake', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (46, N'VechicalModel', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[MasterTabletype] ([Mastertabletype_id], [MastertableName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [ParentId]) VALUES (47, N'Fueltype', NULL, CAST(N'2019-08-08T23:47:28.640' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[MasterTabletype] OFF
GO
SET IDENTITY_INSERT [dbo].[NavigationMenu1] ON 
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (1, N'100       ', N'Home', 1, 0, N'Parent', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (2, N'1000      ', N'Admission', 1, 1, N'Parent', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (3, N'1001      ', N'Add Enquiry', 2, 2, N'/Admission/Enquiry/EnquiryIndex', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (4, N'1002      ', N'Update Enquiry', 2, 2, N'/Admission/Enquiry/Update', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (5, N'1003      ', N'View Enq', 2, 2, N'/Admission/Enquiry/View', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (6, N'1004      ', N'Del Inq', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (7, N'1005      ', N'Sell and Submit Form', 2, 2, N'/Admission/SellSubmit/Index', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (8, N'1006      ', N'Fill Candidate Details', 2, 2, N'/Admission/CandidateDetail/Index', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (9, N'1007      ', N'Add Fill Candidate Details', 2, 2, N'/Admission/CandidateDetail/Create', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (10, N'1008      ', N'Del FCD', 2, 2, N'/Admission/Catdidate/Delete', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (12, N'1012      ', N'Start Admission', 2, 2, N'/Admission/StartAdmission/Index', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (13, N'1400      ', N'UserMangement', 1, 1, N'Parent', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (14, N'1401      ', N'Createuser', 2, 13, N'/Admin/UserCreation/Index', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (15, N'1403      ', N'CreateGroup', 2, 13, N'/UserManagement/Group/Create', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (16, N'1500      ', N'Document Management', 1, 1, N'Parent', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (17, N'1010      ', N'Submit Documents', 2, 16, N'/Document/DocumentSubmission/DocumentIndex', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.573' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (18, N'1510      ', N'Document Type', 2, 16, N'/Document/DocumentType/DocumentIndex', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.590' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (19, N'1520      ', N'Document Portal', 2, 16, N'/Document/DocumentPortal/Index', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.627' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (20, N'1100      ', N'SchoolSetup', 1, 1, N'Parent', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.627' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (21, N'1110      ', N'ClassMaster', 2, 20, N'/Admin/ClassMaster/Create', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.627' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (22, N'1115      ', N'RoomMaster', 2, 20, N'/SchoolSetup/Room/RoomIndex', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (23, N'1120      ', N'Subject master', 2, 20, N'/Admin/SubjectMaster/SubjectMasterIndex', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (24, N'1130      ', N'Book Master', 2, 20, N'/Admin/BookMaster/Create', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (25, N'1135      ', N'CreateCourse', 2, 20, N'/Admin/CourseMaster/Create', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (26, N'1105      ', N'Master Table', 2, 20, N'/Admin/MasterTable/Create', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (27, N'1140      ', N'Permission ', 2, 20, N'/Admin/Permission/PermissionMapping', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (28, N'1600      ', N'Exam Module', 2, 1, N'Parent', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (29, N'1605      ', N'AssessmentType', 2, 28, N'/Admission/AssessmentType/Create', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (30, N'1615      ', N'Create Assment Structure', 2, 28, N'/Admin/AssessmentStructureAssessmentTypeMapping/Create', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (31, N'1900      ', N'HR Module', 2, 1, N'NA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (32, N'1910      ', N'EmployeeMasterRegistration', 2, 31, N'/HR/EmployeeMaster/Index', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (33, N'1700      ', N'Transport', 1, 1, N'NA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (34, N'1720      ', N'StopMaster', 2, 33, N'/Transport/StopMaster/StopMasterIndex', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (35, N'1710      ', N'VechicleMaster ', 2, 33, N'NA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-04T21:40:17.637' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[NavigationMenu1] ([NavigationMenuId], [NavigationMenuCode], [NavigationMenuName], [NavigationTypeId], [NavigationMenuParentId], [MenuURL], [NaviVisible], [IconClass], [Resxkey], [IPAddress], [MACAddress], [RoleId], [RoleName], [PermisionName], [MenuGroupId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Sequence]) VALUES (36, N'1730      ', N'RouteMaster', 2, 33, N'/Transport/RouteMaster/RouteMasterIndex', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2019-08-14T21:12:46.317' AS DateTime), 1, NULL, NULL, 1, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[NavigationMenu1] OFF
GO
SET IDENTITY_INSERT [dbo].[NavigationType] ON 
GO
INSERT [dbo].[NavigationType] ([NavigationTypeId], [NavigationTypeCode], [NavigationTypeName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (1, N'Head      ', N'Header', NULL, CAST(N'2019-07-16T23:03:17.927' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[NavigationType] ([NavigationTypeId], [NavigationTypeCode], [NavigationTypeName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (2, N'Menu      ', N'Menu', NULL, CAST(N'2019-07-16T23:05:19.833' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[NavigationType] ([NavigationTypeId], [NavigationTypeCode], [NavigationTypeName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (3, N'Btn       ', N'Button', NULL, CAST(N'2019-07-16T23:05:19.833' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[NavigationType] ([NavigationTypeId], [NavigationTypeCode], [NavigationTypeName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (4, N'Dummy     ', N'Dummy     ', NULL, CAST(N'2019-07-16T23:05:19.833' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[NavigationType] ([NavigationTypeId], [NavigationTypeCode], [NavigationTypeName], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (5, N'Rep       ', N'Rport', NULL, CAST(N'2019-07-16T23:05:19.850' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[NavigationType] OFF
GO
SET IDENTITY_INSERT [dbo].[Navmenu_asprole_permisison_mapping] ON 
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (1, 14, 1, 8, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (2, 14, 2, 3, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (3, 14, 3, 1, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (4, 14, 4, 2, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (5, 26, 5, 3, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (6, 26, 6, 8, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (7, 26, 7, 1, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (8, 26, 8, 2, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (9, 21, 9, 8, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (10, 21, 10, 3, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (11, 21, 11, 1, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (12, 21, 12, 2, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (13, 24, 13, 3, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (14, 24, 14, 8, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (15, 24, 15, 1, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (16, 24, 16, 2, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (17, 29, 17, 3, NULL, CAST(N'2019-08-04T23:23:35.900' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (18, 29, 18, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (19, 29, 19, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (20, 29, 20, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (21, 25, 21, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (22, 25, 22, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (23, 25, 23, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (24, 25, 24, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (25, 30, 25, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (26, 30, 26, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (27, 30, 27, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (28, 30, 28, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (29, 3, 29, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (30, 3, 30, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (31, 3, 31, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (32, 3, 32, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (33, 8, 33, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (34, 8, 34, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (35, 8, 35, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (36, 8, 36, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (37, 12, 37, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (38, 12, 38, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (39, 12, 39, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (40, 12, 40, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (41, 18, 41, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (42, 18, 42, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (43, 18, 43, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (44, 18, 44, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (45, 22, 45, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (46, 22, 46, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (47, 22, 47, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (48, 22, 48, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (49, 7, 49, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (50, 23, 50, 3, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (51, 23, 51, 8, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (52, 23, 52, 1, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_mapping] ([Navrolepermisisonmapping_ID], [NavigationMenu_Id], [Role_id], [Permission_Id], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (53, 23, 53, 2, NULL, CAST(N'2019-08-04T23:23:35.947' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Navmenu_asprole_permisison_mapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ON 
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (1, 9, 1, 0, NULL, CAST(N'2019-08-07T17:56:47.920' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (2, 11, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.033' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (3, 12, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.050' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (4, 10, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.067' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (5, 46, 1, 1, NULL, CAST(N'2019-08-07T17:56:48.080' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (6, 47, 1, 1, NULL, CAST(N'2019-08-07T17:56:48.110' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (7, 48, 1, 1, NULL, CAST(N'2019-08-07T17:56:48.123' AS DateTime), 6, NULL, 6, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (8, 45, 1, 1, NULL, CAST(N'2019-08-07T17:56:48.140' AS DateTime), 6, NULL, 6, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (9, 51, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.153' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (10, 52, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.183' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (11, 53, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.203' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (12, 50, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.217' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (13, 14, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.233' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (14, 15, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.270' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (15, 16, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.310' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (16, 13, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.360' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (17, 22, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.393' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (18, 23, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.433' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (19, 24, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.470' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (20, 21, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.490' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (21, 6, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (22, 7, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.530' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (23, 8, 1, 1, NULL, CAST(N'2019-08-07T17:56:48.547' AS DateTime), 6, NULL, 6, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (24, 5, 1, 0, NULL, CAST(N'2019-08-07T17:56:48.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (25, 31, 1, 0, NULL, CAST(N'2019-08-07T21:33:15.783' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (26, 30, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.517' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (27, 32, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.540' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (28, 29, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (29, 49, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.597' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (30, 35, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.780' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (31, 34, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.837' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (32, 36, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.860' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (33, 33, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.883' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (34, 39, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.913' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (35, 38, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.960' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (36, 40, 1, 0, NULL, CAST(N'2019-08-07T21:33:16.983' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (37, 37, 1, 0, NULL, CAST(N'2019-08-07T21:33:17.007' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (38, 1, 1, 0, NULL, CAST(N'2019-08-07T21:39:30.183' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (39, 3, 1, 0, NULL, CAST(N'2019-08-07T21:39:30.213' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (40, 4, 1, 0, NULL, CAST(N'2019-08-07T21:39:30.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (41, 2, 1, 0, NULL, CAST(N'2019-08-07T21:39:30.247' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (42, 42, 1, 1, NULL, CAST(N'2019-08-07T21:39:37.473' AS DateTime), 6, NULL, 6, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (43, 43, 1, 1, NULL, CAST(N'2019-08-07T21:39:37.503' AS DateTime), 6, NULL, 6, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (44, 44, 1, 0, NULL, CAST(N'2019-08-07T21:39:37.517' AS DateTime), 6, NULL, 6, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (45, 41, 1, 0, NULL, CAST(N'2019-08-07T21:39:37.533' AS DateTime), 6, NULL, 6, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (46, 18, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.533' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (47, 19, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.583' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (48, 20, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.600' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (49, 17, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.617' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (50, 26, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.633' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (51, 27, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.687' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (52, 28, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.703' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (53, 25, 1, 0, NULL, CAST(N'2019-08-07T21:39:46.717' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (54, 31, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.330' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (55, 30, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.380' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (56, 32, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.400' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (57, 29, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.413' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (58, 49, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.430' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (59, 35, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.503' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (60, 34, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.560' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (61, 36, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.577' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (62, 33, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.590' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (63, 39, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.613' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (64, 38, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.653' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (65, 40, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.670' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (66, 37, 2, 0, NULL, CAST(N'2019-08-07T22:00:49.690' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (67, 9, 2, 0, NULL, CAST(N'2019-08-07T22:01:20.973' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (68, 11, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.010' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (69, 12, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.030' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (70, 10, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.047' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (71, 46, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.060' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (72, 47, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.093' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (73, 48, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.113' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (74, 45, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.133' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (75, 51, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.153' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (76, 52, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.190' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (77, 53, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.210' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (78, 50, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.230' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (79, 14, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.250' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (80, 15, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.287' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (81, 16, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.317' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (82, 13, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.360' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (83, 22, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.377' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (84, 23, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.437' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (85, 24, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.460' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (86, 21, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.520' AS DateTime), 6, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (87, 6, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.560' AS DateTime), 6, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (88, 7, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.587' AS DateTime), 6, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (89, 8, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.617' AS DateTime), 6, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ([Navrolepermisisonmappingusergroup_ID], [Navrolepermisisonmapping_ID], [UserGroup_ID], [AcitiveEdit], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (90, 5, 2, 0, NULL, CAST(N'2019-08-07T22:01:21.637' AS DateTime), 6, NULL, NULL, 1, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] OFF
GO
SET IDENTITY_INSERT [dbo].[NumberGenScheme] ON 
GO
INSERT [dbo].[NumberGenScheme] ([NumberGenScheme_id], [NumGenForm_ID], [Prefix], [Postfix], [DateDisplayformat], [NumberStart], [Delimeter], [IncludeDate], [Sequece], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Navigationmenu_id], [NextNumber], [SchoolConfig_Id]) VALUES (2, 56, N'APP', NULL, N'MMYYYY', 1, NULL, 1, N'NumberGenScheme_id,Prefix,Postfix', 1, CAST(N'2019-02-11T07:12:55.810' AS DateTime), 1, NULL, 1, 1, 1, 1, 7, 42, 1)
GO
INSERT [dbo].[NumberGenScheme] ([NumberGenScheme_id], [NumGenForm_ID], [Prefix], [Postfix], [DateDisplayformat], [NumberStart], [Delimeter], [IncludeDate], [Sequece], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Navigationmenu_id], [NextNumber], [SchoolConfig_Id]) VALUES (3, NULL, N'Enq', N'NO', N'MMYYYY', 1, NULL, 1, N'NumberGenScheme_id,Prefix,Postfix', 1, CAST(N'2019-02-22T21:04:25.187' AS DateTime), 1, NULL, 1, 1, 1, 0, 7, 42, 2)
GO
INSERT [dbo].[NumberGenScheme] ([NumberGenScheme_id], [NumGenForm_ID], [Prefix], [Postfix], [DateDisplayformat], [NumberStart], [Delimeter], [IncludeDate], [Sequece], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Navigationmenu_id], [NextNumber], [SchoolConfig_Id]) VALUES (4, NULL, N'APP', N'NO', N'YYYYMM', 1, NULL, 1, N'NumberGenScheme_id,Prefix,Postfix', 1, CAST(N'2019-02-22T21:04:25.187' AS DateTime), 1, NULL, 1, 1, 1, 0, 7, 1, 3)
GO
INSERT [dbo].[NumberGenScheme] ([NumberGenScheme_id], [NumGenForm_ID], [Prefix], [Postfix], [DateDisplayformat], [NumberStart], [Delimeter], [IncludeDate], [Sequece], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [Navigationmenu_id], [NextNumber], [SchoolConfig_Id]) VALUES (5, NULL, N'REG', N'NO', N'YYYYMM', 1, NULL, 1, N'NumberGenScheme_id,Prefix,Postfix', 1, CAST(N'2019-02-22T21:04:25.187' AS DateTime), 1, NULL, 1, 1, 1, 0, 7, 1, 5)
GO
SET IDENTITY_INSERT [dbo].[NumberGenScheme] OFF
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 
GO
INSERT [dbo].[Registration] ([Registration_ID], [Enquiry_ID], [RegistrationNo], [Issubmitted], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsSubmitedDate]) VALUES (1, 3, NULL, NULL, 1, CAST(N'2019-08-12T00:00:00.000' AS DateTime), 0, NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Registration] ([Registration_ID], [Enquiry_ID], [RegistrationNo], [Issubmitted], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [IsSubmitedDate]) VALUES (2, 4, NULL, NULL, 1, CAST(N'2019-08-13T00:00:00.000' AS DateTime), 0, NULL, NULL, 1, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomMaster] ON 
GO
INSERT [dbo].[RoomMaster] ([RoomMaster_ID], [Building_ID], [Code], [Name], [SeatingCapicity], [GeoCoordinates], [Remarks], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, N'1', N'S', N'Science', 50, N'1', NULL, NULL, CAST(N'2019-07-16T21:12:20.807' AS DateTime), 1, CAST(N'2019-05-04T20:05:48.000' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[RoomMaster] ([RoomMaster_ID], [Building_ID], [Code], [Name], [SeatingCapicity], [GeoCoordinates], [Remarks], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (2, N'67', N'RM1', N'Room1', 40, N'123.23', N'test1 updated', 1, CAST(N'2019-08-10T20:15:41.007' AS DateTime), 6, CAST(N'2019-08-13T04:35:37.597' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[RoomMaster] ([RoomMaster_ID], [Building_ID], [Code], [Name], [SeatingCapicity], [GeoCoordinates], [Remarks], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (3, N'108', N'AB1', N'gfg', 121, N'1212', N'changed', 1, CAST(N'2019-08-12T00:46:32.080' AS DateTime), 6, CAST(N'2019-08-13T19:58:57.527' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[RoomMaster] ([RoomMaster_ID], [Building_ID], [Code], [Name], [SeatingCapicity], [GeoCoordinates], [Remarks], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (4, N'67', N'at', N'add test', 79, NULL, N'add test', 1, CAST(N'2019-08-13T04:34:29.373' AS DateTime), 6, CAST(N'2019-08-13T04:34:39.653' AS DateTime), 6, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[RoomMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolConfig] ON 
GO
INSERT [dbo].[SchoolConfig] ([SchoolConfig_id], [Navigationmenu_id], [tablecolumn], [configKey], [configvalue], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [NavigationMenuCode]) VALUES (1, 3, N'Application.ApplicaitonNo', N'IsSystemGenerated', N'True', NULL, 1, CAST(N'2019-02-15T02:27:00.867' AS DateTime), 1, NULL, NULL, 1, 1, 0, 1001)
GO
INSERT [dbo].[SchoolConfig] ([SchoolConfig_id], [Navigationmenu_id], [tablecolumn], [configKey], [configvalue], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [NavigationMenuCode]) VALUES (2, 3, N'Enquiry.EnquiryNo', N'IsSystemGenerated', N'True', NULL, 1, CAST(N'2019-02-22T21:02:54.670' AS DateTime), 1, NULL, NULL, 1, 1, 0, 1001)
GO
INSERT [dbo].[SchoolConfig] ([SchoolConfig_id], [Navigationmenu_id], [tablecolumn], [configKey], [configvalue], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [NavigationMenuCode]) VALUES (3, 7, N'Application.ApplicaitonNo', N'IsSystemGenerated', N'False', NULL, 1, CAST(N'2019-02-22T21:02:54.670' AS DateTime), 1, NULL, NULL, 1, 1, 0, 1005)
GO
INSERT [dbo].[SchoolConfig] ([SchoolConfig_id], [Navigationmenu_id], [tablecolumn], [configKey], [configvalue], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [NavigationMenuCode]) VALUES (4, 7, N'Application.ApplicaitonNo', N'AppNumEqualsRegiNum', N'False', NULL, 1, CAST(N'2019-05-14T02:18:33.990' AS DateTime), 1, NULL, NULL, 1, 1, 0, 1005)
GO
INSERT [dbo].[SchoolConfig] ([SchoolConfig_id], [Navigationmenu_id], [tablecolumn], [configKey], [configvalue], [Remark], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted], [NavigationMenuCode]) VALUES (5, 7, N'Registration.RegistrationNo', N'IsSystemGenerated', N'False', NULL, 1, CAST(N'2019-05-14T02:25:37.553' AS DateTime), 1, NULL, NULL, 1, 1, 0, 1005)
GO
SET IDENTITY_INSERT [dbo].[SchoolConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolMaster] ON 
GO
INSERT [dbo].[SchoolMaster] ([School_ID], [GroupID], [SchoolCode], [SchoolName], [Address1], [Address2], [City], [State_ID], [Country], [PinCode], [Landmark], [SchoolEmail], [SchoolOwner], [OwnerMobile], [SchoolPrincipal], [SchoolPhone], [BillingStart], [ISActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ISDeleted]) VALUES (1, 1, N'DPSRK     ', N'DPS RK puram', N'RK puram', N'RK puram', N' Delhi', N'Delhi', N'India', N'110068', NULL, N'DpsRK@gmailcom', N'Kanta Bhai', N'9988998877', N'Mrs Tripathi', N'-33445394', NULL, 1, CAST(N'2019-07-16T21:18:57.980' AS DateTime), N'1                   ', NULL, NULL, NULL)
GO
INSERT [dbo].[SchoolMaster] ([School_ID], [GroupID], [SchoolCode], [SchoolName], [Address1], [Address2], [City], [State_ID], [Country], [PinCode], [Landmark], [SchoolEmail], [SchoolOwner], [OwnerMobile], [SchoolPrincipal], [SchoolPhone], [BillingStart], [ISActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [ISDeleted]) VALUES (2, 1, N'DPSMath   ', N'DPS Mathur road', N'Mathura road', N'mathura', N' Delhi', N'Delhi', N'India', N'110069', NULL, N'Dpsmathura@gmailcom', N'Leena D.', N'9822346590', N'Mr. Sharma', N'-22445394', NULL, 1, CAST(N'2019-07-16T21:22:12.183' AS DateTime), N'1                   ', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SchoolMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[SubjectMaster] ON 
GO
INSERT [dbo].[SubjectMaster] ([SubjectMaster_ID], [AssessmentStructure_ID], [GradeStructure_ID], [SubjectType_Id], [SubjectGroup_ID], [Code], [Name], [isOptional], [IncludedInCGPA], [ExculdedfromAtt], [isScholastic], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (1, 76, 78, 79, 81, N'1', N'Physics', 0, NULL, NULL, 0, 1, CAST(N'2019-08-08T20:29:19.620' AS DateTime), 6, CAST(N'2019-08-08T20:29:19.620' AS DateTime), 0, 1, 1, 0)
GO
INSERT [dbo].[SubjectMaster] ([SubjectMaster_ID], [AssessmentStructure_ID], [GradeStructure_ID], [SubjectType_Id], [SubjectGroup_ID], [Code], [Name], [isOptional], [IncludedInCGPA], [ExculdedfromAtt], [isScholastic], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (2, 75, 77, 79, 82, N'2', N'History', 0, NULL, NULL, 0, 1, CAST(N'2019-08-08T20:30:03.570' AS DateTime), 6, CAST(N'2019-08-08T20:30:03.570' AS DateTime), 0, 1, 1, 0)
GO
INSERT [dbo].[SubjectMaster] ([SubjectMaster_ID], [AssessmentStructure_ID], [GradeStructure_ID], [SubjectType_Id], [SubjectGroup_ID], [Code], [Name], [isOptional], [IncludedInCGPA], [ExculdedfromAtt], [isScholastic], [Sessionyear], [CreatedDate], [Createdby_ID], [ModifiedDate], [Modifiedby_ID], [School_ID], [Group_ID], [IsDeleted]) VALUES (3, 75, 77, 110, 81, N'3', N'science', 0, NULL, NULL, 0, 1, CAST(N'2019-08-13T20:39:26.920' AS DateTime), 6, CAST(N'2019-08-13T20:39:26.920' AS DateTime), 0, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[SubjectMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserGroup] ON 
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (1, N'Admin     ', N'Adminstrators', N'Description', NULL, 1, CAST(N'2019-07-16T21:23:35.620' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (2, N'Adm       ', N'Admission', N'Description', NULL, 2, CAST(N'2019-07-16T21:25:40.483' AS DateTime), 0, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (3, N'FO        ', N'Frontoffice', N'Description', NULL, 1, CAST(N'2019-07-16T21:26:32.837' AS DateTime), 0, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (4, N'Fin       ', N'Finance', NULL, NULL, 2, CAST(N'2019-07-16T21:27:09.977' AS DateTime), 0, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (5, N'Tchrs     ', N'Teachers', NULL, NULL, 1, CAST(N'2019-07-16T21:27:52.743' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (6, N'Admin     ', N'Administration', NULL, NULL, 1, CAST(N'2019-07-20T21:45:55.377' AS DateTime), 1, NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (7, N'teacher   ', N'teacher', NULL, NULL, 1, CAST(N'2019-07-20T21:45:55.377' AS DateTime), 1, NULL, NULL, 1, 1, 1)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (8, N'Coordi    ', N'Coordinator', NULL, NULL, 1, CAST(N'2019-07-20T21:45:55.377' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (9, N'Dev       ', N'Develoer', NULL, NULL, 1, CAST(N'2019-07-20T21:45:55.377' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroup] ([UserGroupId], [UserGroupCode], [UserGroupName], [UserGroupDescription], [IsDefault], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (10, N'QA        ', N'Testing', NULL, NULL, 1, CAST(N'2019-07-20T21:45:55.377' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[UserGroupNavigationMenuMapping] ON 
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (1, 1, 1, 1, CAST(N'2019-08-04T23:43:21.980' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (2, 1, 2, 1, CAST(N'2019-08-04T23:43:21.980' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (3, 1, 3, 1, CAST(N'2019-08-04T23:43:21.980' AS DateTime), 1, CAST(N'2019-08-07T21:39:02.117' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (4, 1, 4, 1, CAST(N'2019-08-04T23:43:22.003' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (5, 1, 5, 1, CAST(N'2019-08-04T23:43:22.003' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (6, 1, 6, 1, CAST(N'2019-08-04T23:43:22.003' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (7, 1, 7, 1, CAST(N'2019-08-04T23:43:22.003' AS DateTime), 1, CAST(N'2019-08-07T21:39:02.177' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (8, 1, 8, 1, CAST(N'2019-08-04T23:43:22.010' AS DateTime), 1, CAST(N'2019-08-07T21:39:02.213' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (9, 1, 9, 1, CAST(N'2019-08-04T23:43:22.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (10, 1, 10, 1, CAST(N'2019-08-04T23:43:22.010' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (12, 1, 12, 1, CAST(N'2019-08-04T23:43:22.037' AS DateTime), 1, CAST(N'2019-08-07T21:39:02.300' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (13, 1, 13, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (14, 1, 14, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-07T23:39:07.147' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (15, 1, 15, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (16, 1, 16, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (17, 1, 17, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (18, 1, 18, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-13T04:36:17.177' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (19, 1, 19, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (20, 1, 20, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (21, 1, 21, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-13T22:36:37.710' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (22, 1, 22, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-13T22:36:38.163' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (23, 1, 23, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-13T22:36:38.210' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (24, 1, 24, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-13T22:36:38.240' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (25, 1, 25, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-13T22:36:38.273' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (26, 1, 26, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, CAST(N'2019-08-13T22:36:38.303' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (27, 1, 27, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (28, 1, 28, 1, CAST(N'2019-08-04T23:43:22.043' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (29, 1, 29, 1, CAST(N'2019-08-04T23:43:22.067' AS DateTime), 1, CAST(N'2019-08-07T21:39:46.563' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (30, 1, 30, 1, CAST(N'2019-08-04T23:43:22.067' AS DateTime), 1, CAST(N'2019-08-07T21:39:46.667' AS DateTime), 6, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (31, 1, 31, 1, CAST(N'2019-08-04T23:43:22.067' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (32, 1, 32, 1, CAST(N'2019-08-04T23:43:22.067' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (33, 1, 33, 1, CAST(N'2019-08-04T23:43:22.073' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (34, 1, 34, 1, CAST(N'2019-08-04T23:43:22.073' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (35, 1, 35, 1, CAST(N'2019-08-04T23:43:22.073' AS DateTime), 1, NULL, NULL, 1, 1, 0)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (36, 2, 3, NULL, CAST(N'2019-08-07T22:00:49.350' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (37, 2, 7, NULL, CAST(N'2019-08-07T22:00:49.447' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (38, 2, 8, NULL, CAST(N'2019-08-07T22:00:49.530' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (39, 2, 12, NULL, CAST(N'2019-08-07T22:00:49.633' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (40, 2, 21, NULL, CAST(N'2019-08-07T22:01:20.993' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (41, 2, 22, NULL, CAST(N'2019-08-07T22:01:21.077' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (42, 2, 23, NULL, CAST(N'2019-08-07T22:01:21.170' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (43, 2, 24, NULL, CAST(N'2019-08-07T22:01:21.270' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId], [UserGroupId], [NavigationMenuId], [Sessionyear], [CreatedDate], [CreatedBy_ID], [ModifiedDate], [ModifiedBy_ID], [SchoolID], [GroupID], [ISDeleted]) VALUES (44, 2, 25, NULL, CAST(N'2019-08-07T22:01:21.410' AS DateTime), 6, NULL, NULL, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserGroupNavigationMenuMapping] OFF
GO
ALTER TABLE [dbo].[AcademicYear] ADD  CONSTRAINT [DF_AcademicYear_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AdmissionDetail] ADD  CONSTRAINT [DF_AdmissionDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AdmissionStatus] ADD  CONSTRAINT [DF_AdmissionStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AdmissionStatus] ADD  CONSTRAINT [DF_AdmissionStatus_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_SubmitDate]  DEFAULT (getdate()) FOR [SubmitDate]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_IsOnline]  DEFAULT ((0)) FOR [IsOnline]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Sessionyear]  DEFAULT ((1)) FOR [Sessionyear]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_GroupID]  DEFAULT ((1)) FOR [GroupID]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[AspNetRoles] ADD  CONSTRAINT [DF_AspNetRoles_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD  CONSTRAINT [DF_AspNetUserRoles_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AssessmentStructureAssessmentTypeMapping] ADD  CONSTRAINT [DF_AssessmentStructureAssessmentTypeMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AssessmentStructureAssessmentTypeMapping] ADD  CONSTRAINT [DF_AssessmentStructureAssessmentTypeMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AssessmentTYPE] ADD  CONSTRAINT [DF_AssessmentTYPE_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AssessmentTYPE] ADD  CONSTRAINT [DF_AssessmentTYPE_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BatchClassTeacherMonitorMapping] ADD  CONSTRAINT [DF_BatchClassTeacherMonitorMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BatchClassTeacherMonitorMapping] ADD  CONSTRAINT [DF_BatchClassTeacherMonitorMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BatchMaster] ADD  CONSTRAINT [DF_BatchMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BatchMaster] ADD  CONSTRAINT [DF_BatchMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BatchStudentMapping] ADD  CONSTRAINT [DF_BatchStudentMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BatchStudentMapping] ADD  CONSTRAINT [DF_BatchStudentMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BookCourseMapping] ADD  CONSTRAINT [DF_BookCourseMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BookCourseMapping] ADD  CONSTRAINT [DF_BookCourseMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BookMaster] ADD  CONSTRAINT [DF_BookMaster_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BookMaster] ADD  CONSTRAINT [DF_BookMaster_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CandidateDetail] ADD  CONSTRAINT [DF_CandidateDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ClassMaster] ADD  CONSTRAINT [DF_ClassMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ClassMaster] ADD  CONSTRAINT [DF_ClassMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CommunicationTemplate] ADD  CONSTRAINT [DF_CommunicationTemplate_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CommunicationTemplate] ADD  CONSTRAINT [DF_CommunicationTemplate_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[CourseBatchMapping] ADD  CONSTRAINT [DF_CourseBatchMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CourseBatchMapping] ADD  CONSTRAINT [DF_CourseBatchMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  CONSTRAINT [DF_CourseMaster_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  CONSTRAINT [DF_CourseMaster_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Doccategory_IDmapping] ADD  CONSTRAINT [DF_Doccategory_IDmapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Doccategory_IDmapping] ADD  CONSTRAINT [DF_Doccategory_IDmapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DocumentAuditlog] ADD  CONSTRAINT [DF_DocumentAuditlog_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DocumentAuditlog] ADD  CONSTRAINT [DF_DocumentAuditlog_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DocumentdownloadHistory] ADD  CONSTRAINT [DF_DocumentdownloadHistory_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DocumentdownloadHistory] ADD  CONSTRAINT [DF_DocumentdownloadHistory_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DocumentPermission] ADD  CONSTRAINT [DF_DocumentPermission_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DocumentPermission] ADD  CONSTRAINT [DF_DocumentPermission_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DocumentType] ADD  CONSTRAINT [DF_DocumentType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EducationDetails] ADD  CONSTRAINT [DF_EducationDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmailLog] ADD  CONSTRAINT [DF_EmailLog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmailLog] ADD  CONSTRAINT [DF_EmailLog_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[EmployeeEducationDetail] ADD  CONSTRAINT [DF_EmployeeEducationDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeEducationDetail] ADD  CONSTRAINT [DF_EmployeeEducationDetail_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[EmployeeExperience] ADD  CONSTRAINT [DF_EmployeeExperience_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeExperience] ADD  CONSTRAINT [DF_EmployeeExperience_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[EmployeeIDdetail] ADD  CONSTRAINT [DF_EmployeeIDdetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeIDdetail] ADD  CONSTRAINT [DF_EmployeeIDdetail_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Enquiry] ADD  CONSTRAINT [DF_Enquiry_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Enquiry] ADD  CONSTRAINT [DF_Enquiry_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[GradeDetail] ADD  CONSTRAINT [DF_GradeDetail_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[GradeDetail] ADD  CONSTRAINT [DF_GradeDetail_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GroupMaster] ADD  CONSTRAINT [DF_GroupMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HouseDesignationMemersMapping] ADD  CONSTRAINT [DF_HouseDesignationMemersMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HouseDesignationMemersMapping] ADD  CONSTRAINT [DF_HouseDesignationMemersMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[HouseMembersMapping] ADD  CONSTRAINT [DF_HouseMembersMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HouseMembersMapping] ADD  CONSTRAINT [DF_HouseMembersMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[IndexScreenDetails] ADD  CONSTRAINT [DF_IndexScreendetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[IndexScreenDetails] ADD  CONSTRAINT [DF_IndexScreenDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MailMerge] ADD  CONSTRAINT [DF_MailMerge_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MailMerge] ADD  CONSTRAINT [DF_MailMerge_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[MasterTable] ADD  CONSTRAINT [DF_MasterTable_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MasterTable] ADD  CONSTRAINT [DF_MasterTable_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[MasterTable] ADD  CONSTRAINT [DF__MasterTab__IsDef__1CA7377D]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[MasterTabletype] ADD  CONSTRAINT [DF_MasterTabletype_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MasterTabletype] ADD  CONSTRAINT [DF_MasterTabletype_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[NavigationMenu] ADD  CONSTRAINT [DF_NavigationMenu_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NavigationMenu] ADD  CONSTRAINT [DF_NavigationMenu_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[NavigationMenu1] ADD  CONSTRAINT [DF_NavigationMenu1_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NavigationMenu1] ADD  CONSTRAINT [DF_NavigationMenu1_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[NavigationType] ADD  CONSTRAINT [DF_NavigationType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NavigationType] ADD  CONSTRAINT [DF_NavigationType_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[Navmenu_asprole_permisison_mapping] ADD  CONSTRAINT [DF_Navmenu_asprole_permisison_mapping_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Navmenu_asprole_permisison_mapping] ADD  CONSTRAINT [DF_Navmenu_asprole_permisison_mapping_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ADD  CONSTRAINT [DF_Navmenu_asprole_permisison_UserGroup_mapping_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] ADD  CONSTRAINT [DF_Navmenu_asprole_permisison_UserGroup_mapping_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[NumberGenScheme] ADD  CONSTRAINT [DF_NumberGenScheme_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NumberGenScheme] ADD  CONSTRAINT [DF_NumberGenScheme_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[Registration] ADD  CONSTRAINT [DF_Registration_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Registration] ADD  CONSTRAINT [DF_Registration_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[RoomMaster] ADD  CONSTRAINT [DF_RoomMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RoomMaster] ADD  CONSTRAINT [DF_RoomMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[RoomMaster] ADD  CONSTRAINT [DF_RoomMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Route_Vech_Driver_Mapping] ADD  CONSTRAINT [DF_Route_Vech_Driver_Mapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Route_Vech_Driver_Mapping] ADD  CONSTRAINT [DF_Route_Vech_Driver_Mapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RouteDetail] ADD  CONSTRAINT [DF_RouteDetail_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RouteDetail] ADD  CONSTRAINT [DF_RouteDetail_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RouteMaster] ADD  CONSTRAINT [DF_RouteMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RouteMaster] ADD  CONSTRAINT [DF_RouteMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SchoolConfig] ADD  CONSTRAINT [DF_SchoolConfig_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SchoolConfig] ADD  CONSTRAINT [DF_SchoolConfig_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[SchoolMaster] ADD  CONSTRAINT [DF_SchoolMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ShiftMaster] ADD  CONSTRAINT [DF_ShiftMaster_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ShiftMaster] ADD  CONSTRAINT [DF_ShiftMaster_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SMSLog] ADD  CONSTRAINT [DF_SMSLog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SMSLog] ADD  CONSTRAINT [DF_SMSLog_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[StopMaster] ADD  CONSTRAINT [DF_StopMaster_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[StopMaster] ADD  CONSTRAINT [DF_StopMaster_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_IsScholastic]  DEFAULT ((0)) FOR [IsScholastic]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_IsPractical]  DEFAULT ((0)) FOR [IsPractical]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_CGPAIncluded]  DEFAULT ((0)) FOR [CGPAIncluded]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[SubjectMaster] ADD  CONSTRAINT [DF_SubjectMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SubjectMaster] ADD  CONSTRAINT [DF_SubjectMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SubjectTypeMaster] ADD  CONSTRAINT [DF_SubjectTypeMaster_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SubjectTypeMaster] ADD  CONSTRAINT [DF_SubjectTypeMaster_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TeacherCourseMapping] ADD  CONSTRAINT [DF_TeacherCourseMapping_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TeacherCourseMapping] ADD  CONSTRAINT [DF_TeacherCourseMapping_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TransportAllocation] ADD  CONSTRAINT [DF_TransportAllocation_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransportAllocation] ADD  CONSTRAINT [DF_TransportAllocation_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TransportFee] ADD  CONSTRAINT [DF_TransportFee_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransportFee] ADD  CONSTRAINT [DF_TransportFee_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_UserGroup_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_UserGroup_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[UserGroupAspUserMapping] ADD  CONSTRAINT [DF_UserGroupAspUserMapping_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserGroupAspUserMapping] ADD  CONSTRAINT [DF_UserGroupAspUserMapping_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[UserGroupNavigationMenuMapping] ADD  CONSTRAINT [DF_UserGroupNavigationMenuMapping_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserGroupNavigationMenuMapping] ADD  CONSTRAINT [DF_UserGroupNavigationMenuMapping_ISDeleted]  DEFAULT ((0)) FOR [ISDeleted]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[VechicleMaster] ADD  CONSTRAINT [DF_VechicleMaster_CreatedDate1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[VechicleMaster] ADD  CONSTRAINT [DF_VechicleMaster_IsDeleted1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VechicleStaffMapping] ADD  CONSTRAINT [DF_VechicleStaffMapping_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[VechicleStaffMapping] ADD  CONSTRAINT [DF_VechicleStaffMapping_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AdmissionDetail]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionDetail_Enquiry] FOREIGN KEY([Approvedby_ID])
REFERENCES [dbo].[UserMaster] ([User_ID])
GO
ALTER TABLE [dbo].[AdmissionDetail] CHECK CONSTRAINT [FK_AdmissionDetail_Enquiry]
GO
ALTER TABLE [dbo].[AdmissionStatus]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionStatus_AcademicYear] FOREIGN KEY([AdmissionSessionYear])
REFERENCES [dbo].[AcademicYear] ([AcademicYear_ID])
GO
ALTER TABLE [dbo].[AdmissionStatus] CHECK CONSTRAINT [FK_AdmissionStatus_AcademicYear]
GO
ALTER TABLE [dbo].[AdmissionStatus]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionStatus_ClassMaster] FOREIGN KEY([ClassMaster_id])
REFERENCES [dbo].[ClassMaster] ([ClassMaster_ID])
GO
ALTER TABLE [dbo].[AdmissionStatus] CHECK CONSTRAINT [FK_AdmissionStatus_ClassMaster]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Enquiry] FOREIGN KEY([Enquiry_ID])
REFERENCES [dbo].[Enquiry] ([Enquiry_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Enquiry]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CandidateDetail]  WITH CHECK ADD  CONSTRAINT [FK__Candidate__Enqui__50B0EB68] FOREIGN KEY([Enquiry_ID])
REFERENCES [dbo].[Enquiry] ([Enquiry_ID])
GO
ALTER TABLE [dbo].[CandidateDetail] CHECK CONSTRAINT [FK__Candidate__Enqui__50B0EB68]
GO
ALTER TABLE [dbo].[DocumentType]  WITH CHECK ADD  CONSTRAINT [FK_DocumentType_MasterTable] FOREIGN KEY([DocumentCategoryID])
REFERENCES [dbo].[MasterTable] ([MasterTable_id])
GO
ALTER TABLE [dbo].[DocumentType] CHECK CONSTRAINT [FK_DocumentType_MasterTable]
GO
ALTER TABLE [dbo].[IndexScreenDetails]  WITH CHECK ADD  CONSTRAINT [FK_IndexScreenDetails_IndexScreenDetails] FOREIGN KEY([IndexScreenDetails_ID])
REFERENCES [dbo].[IndexScreenDetails] ([IndexScreenDetails_ID])
GO
ALTER TABLE [dbo].[IndexScreenDetails] CHECK CONSTRAINT [FK_IndexScreenDetails_IndexScreenDetails]
GO
ALTER TABLE [dbo].[LoginTrack]  WITH CHECK ADD  CONSTRAINT [FK_LoginTrack_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([User_ID])
GO
ALTER TABLE [dbo].[LoginTrack] CHECK CONSTRAINT [FK_LoginTrack_UserMaster]
GO
ALTER TABLE [dbo].[MasterTable]  WITH CHECK ADD  CONSTRAINT [FK_MasterTable_MasterTableType] FOREIGN KEY([Mastertabletype_id])
REFERENCES [dbo].[MasterTabletype] ([Mastertabletype_id])
GO
ALTER TABLE [dbo].[MasterTable] CHECK CONSTRAINT [FK_MasterTable_MasterTableType]
GO
ALTER TABLE [dbo].[NavigationMenu]  WITH CHECK ADD  CONSTRAINT [FK_NavigationMenu_NavigationType] FOREIGN KEY([NavigationTypeId])
REFERENCES [dbo].[NavigationType] ([NavigationTypeId])
GO
ALTER TABLE [dbo].[NavigationMenu] CHECK CONSTRAINT [FK_NavigationMenu_NavigationType]
GO
ALTER TABLE [dbo].[NavigationMenu1]  WITH CHECK ADD  CONSTRAINT [FK_NavigationMenu1_NavigationType] FOREIGN KEY([NavigationTypeId])
REFERENCES [dbo].[NavigationType] ([NavigationTypeId])
GO
ALTER TABLE [dbo].[NavigationMenu1] CHECK CONSTRAINT [FK_NavigationMenu1_NavigationType]
GO
ALTER TABLE [dbo].[Navmenu_asprole_permisison_UserGroup_mapping]  WITH CHECK ADD  CONSTRAINT [FK_Navmenu_asprole_permisison_UserGroup_mapping_UserGroup] FOREIGN KEY([UserGroup_ID])
REFERENCES [dbo].[UserGroup] ([UserGroupId])
GO
ALTER TABLE [dbo].[Navmenu_asprole_permisison_UserGroup_mapping] CHECK CONSTRAINT [FK_Navmenu_asprole_permisison_UserGroup_mapping_UserGroup]
GO
ALTER TABLE [dbo].[NumberGenScheme]  WITH CHECK ADD  CONSTRAINT [FK__NumberGen__Schoo__2A363CC5] FOREIGN KEY([SchoolConfig_Id])
REFERENCES [dbo].[SchoolConfig] ([SchoolConfig_id])
GO
ALTER TABLE [dbo].[NumberGenScheme] CHECK CONSTRAINT [FK__NumberGen__Schoo__2A363CC5]
GO
ALTER TABLE [dbo].[NumberGenScheme]  WITH CHECK ADD  CONSTRAINT [FK__NumberGen__Schoo__4F87BD05] FOREIGN KEY([SchoolConfig_Id])
REFERENCES [dbo].[SchoolConfig] ([SchoolConfig_id])
GO
ALTER TABLE [dbo].[NumberGenScheme] CHECK CONSTRAINT [FK__NumberGen__Schoo__4F87BD05]
GO
ALTER TABLE [dbo].[NumberGenScheme]  WITH CHECK ADD  CONSTRAINT [FK__NumberGen__Schoo__507BE13E] FOREIGN KEY([SchoolConfig_Id])
REFERENCES [dbo].[SchoolConfig] ([SchoolConfig_id])
GO
ALTER TABLE [dbo].[NumberGenScheme] CHECK CONSTRAINT [FK__NumberGen__Schoo__507BE13E]
GO
ALTER TABLE [dbo].[NumberGenScheme]  WITH CHECK ADD  CONSTRAINT [FK__NumberGen__Schoo__538D5813] FOREIGN KEY([SchoolConfig_Id])
REFERENCES [dbo].[SchoolConfig] ([SchoolConfig_id])
GO
ALTER TABLE [dbo].[NumberGenScheme] CHECK CONSTRAINT [FK__NumberGen__Schoo__538D5813]
GO
ALTER TABLE [dbo].[NumberGenScheme]  WITH CHECK ADD  CONSTRAINT [FK_NumberGenScheme_MasterTable] FOREIGN KEY([NumGenForm_ID])
REFERENCES [dbo].[MasterTable] ([MasterTable_id])
GO
ALTER TABLE [dbo].[NumberGenScheme] CHECK CONSTRAINT [FK_NumberGenScheme_MasterTable]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Enquiry] FOREIGN KEY([Enquiry_ID])
REFERENCES [dbo].[Enquiry] ([Enquiry_ID])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Enquiry]
GO
ALTER TABLE [dbo].[SchoolConfig]  WITH CHECK ADD  CONSTRAINT [FK_SchoolConfig_NavigationMenu] FOREIGN KEY([Navigationmenu_id])
REFERENCES [dbo].[NavigationMenu1] ([NavigationMenuId])
GO
ALTER TABLE [dbo].[SchoolConfig] CHECK CONSTRAINT [FK_SchoolConfig_NavigationMenu]
GO
ALTER TABLE [dbo].[UserGroupAspUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupAspUserMapping_UserGroup] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([UserGroupId])
GO
ALTER TABLE [dbo].[UserGroupAspUserMapping] CHECK CONSTRAINT [FK_UserGroupAspUserMapping_UserGroup]
GO
ALTER TABLE [dbo].[UserGroupAspUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupAspUserMapping_UserGroupNavigationMenuMapping] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroupNavigationMenuMapping] ([UserGroupNavigationMenuMappingId])
GO
ALTER TABLE [dbo].[UserGroupAspUserMapping] CHECK CONSTRAINT [FK_UserGroupAspUserMapping_UserGroupNavigationMenuMapping]
GO
ALTER TABLE [dbo].[UserGroupNavigationMenuMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupNavigationMenuMapping_NavigationMenu] FOREIGN KEY([NavigationMenuId])
REFERENCES [dbo].[NavigationMenu1] ([NavigationMenuId])
GO
ALTER TABLE [dbo].[UserGroupNavigationMenuMapping] CHECK CONSTRAINT [FK_UserGroupNavigationMenuMapping_NavigationMenu]
GO
ALTER TABLE [dbo].[UserGroupNavigationMenuMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupNavigationMenuMapping_UserGroup] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([UserGroupId])
GO
ALTER TABLE [dbo].[UserGroupNavigationMenuMapping] CHECK CONSTRAINT [FK_UserGroupNavigationMenuMapping_UserGroup]
GO
/****** Object:  StoredProcedure [dbo].[ChangeUserGroupPermission]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCedure  [dbo].[ChangeUserGroupPermission] 
@UserName NVARCHAR(256)='a@a.com',
@NewUserGroup_ID int,
@Action TINYINT =1
AS

DECLARE @CUserId int
DECLARE @UserId nvarchar(128)
--Get old user group of  user
SELECT @UserId = id, @CUserId=cuserid from AspNetUsers where Email=@UserName
IF @Action=1
	BEGIN
	--INSERT INTO HISTORY TABLE
	INSERT AspNetUserRolesHistory (UserId,RoleId,Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	SELECT A.UserId,A.RoleId,A.Sessionyear, A.CreatedDate,@CUserId, A.ModifiedDate, 
		A.ModifiedBy_ID, A.SchoolID, A.GroupID, A.ISDeleted FROM AspNetUserRoles A   where A.UserId=@UserId
	
	--DELETE from ASPNetuser roles table
	DELETE FROM AspNetUserRoles    where UserId=@UserId

	--INSERT NEW group permission INTO AspNetUserRoles TABLE
	INSERT AspNetUserRoles (UserId,RoleId,Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	SELECT @UserId,A.RoleId,A.Sessionyear, A.CreatedDate,@CUserId, A.ModifiedDate, 
		A.ModifiedBy_ID, A.SchoolID, A.GroupID, A.ISDeleted 
		FROM AspNetUserRoles A   
		
		
	END


GO
/****** Object:  StoredProcedure [dbo].[CheckIsDefault]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[CheckIsDefault]
@SchoolId INT =0,
@GroupId INT =0

AS
select Count(MasterTable_id) from [dbo].[MasterTable] 
Where IsDefault=1 AND SchoolID = @SchoolId AND GroupID=@GroupId
GO
/****** Object:  StoredProcedure [dbo].[CheckMenuPermissionForModule]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,jIYA>
-- Create date: <Create Date,08june 19,>
-- Description:	<Description,, to check permsiion for user to confegured or not for module
-- =============================================
CREATE procEDURE [dbo].[CheckMenuPermissionForModule]
	-- Add the parameters for the stored procedure here
	@UserGroupID INT,
	@NavigationId INT ---Main Parent Id
AS
BEGIN
	 SELECT NavigationMenuId,NavigationMenuName ,CASE WHEN  EXISTS( SELECT 1 FROM(
    SELECT  NavigationMenu_Id ,Menu.NavigationMenuParentId,Menu.NavigationMenuName,NAPM.Permission_Id ,Navrolepermisisonmapping_ID	,	
	MT.Name AS Permission  ,
	CASE WHEN ( (SELECT Navrolepermisisonmapping_ID FROM Navmenu_asprole_permisison_UserGroup_mapping NAPUM
	WHERE  NAPUM.UserGroup_ID=@UserGroupID AND NAPUM.Navrolepermisisonmapping_ID=NAPM.Navrolepermisisonmapping_ID AND NAPUM.ISDeleted=0)) IS  NULL THEN 0  ELSE 1 END AS IsPermission

	FROM [dbo].[Navmenu_asprole_permisison_mapping]  NAPM 
	INNER JOIN MasterTable MT ON NAPM.Permission_Id=MT.MasterTable_id AND MT.ISDeleted=0
	INNER JOIN [dbo].[NavigationMenu1] Menu ON  NAPM.NavigationMenu_Id=Menu.NavigationMenuId) Temp where 	Temp.NavigationMenuParentId=NavigationMenuId AND  IsPermission=1) 
	THEN 1 ELSE 0 END IsPermission
	FROM [dbo].[NavigationMenu1] 
     WHERE NavigationMenuParentId=@NavigationId

END

GO
/****** Object:  StoredProcedure [dbo].[CopyGroupRights]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[CopyGroupRights]
@OriginalGroupID int,
@NewGroupID int
AS
BEGIN
INSERT INTO UserGroupNavigationMenuMapping (
      [UserGroupId]
      ,[NavigationMenuId]
      ,[Sessionyear]
      ,[CreatedDate]
      ,[CreatedBy_ID]
      ,[ModifiedDate]
      ,[ModifiedBy_ID]
      ,[SchoolID]
      ,[GroupID]
      ,[ISDeleted]
	  )

	  SELECT 
	  @NewGroupID AS [UserGroupId]
      ,[NavigationMenuId]
      ,[Sessionyear]
      ,[CreatedDate]
      ,[CreatedBy_ID]
      ,[ModifiedDate]
      ,[ModifiedBy_ID]
      ,[SchoolID]
      ,[GroupID]
      ,[ISDeleted]
	  FROM UserGroupNavigationMenuMapping
	  WHERE UserGroupId=@OriginalGroupID

END
GO
/****** Object:  StoredProcedure [dbo].[FillCombo]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procEDURE [dbo].[FillCombo] -- 'CandidateDetail','ReligionName','Religion_ID','ISDeleted=0'

@TbName varchar(100),
@fname varchar(1000),
@code varchar(50),
@cond varchar(MAX)

AS
BEGIN
    --select @fname,@code from @TbName where @cond

    declare  @fillcombo table(ddlId int , ddlName Varchar(500))

    insert into @fillcombo
    exec('select ' +' distinct '  + @code +' , '+ @fname +' from ' + @TbName + ' where ' +' '+ @cond +' ')
    select * from @fillcombo
END





GO
/****** Object:  StoredProcedure [dbo].[FillComboAdv]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procEDURE [dbo].[FillComboAdv] -- 'Religion'--,'ReligionName','Religion_ID','ISDeleted=0'

@TbName varchar(100)

AS
BEGIN
    --select @fname,@code from @TbName where @cond
    declare @fname varchar(100),
@code varchar(50),
@cond varchar(MAX)

select @fname=TableDisplayField,@code=TablePrimaryKey,@cond=TableWhereConditionField from DropDownDetails where TableName=@TbName and Active=1
    declare  @fillcombo table(ddlId int , ddlName Varchar(500))

    insert into @fillcombo
    exec('select ' +' distinct '  + @code +' , '+ @fname +' from ' + @TbName + ' where ' +' '+ @cond +' ')
    select * from @fillcombo
END





GO
/****** Object:  StoredProcedure [dbo].[GetCandidateDetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[GetCandidateDetails]
(
	   @SelectColumn  NVARCHAR(max) = 'CandidateDetail.FirstName,CandidateDetail.MiddleName,CandidateDetail.Lastname,CandidateDetail.DOB,CandidateDetail.Email,CandidateDetail.Gender,CandidateDetail.Nationality,CandidateDetail.Address1,CandidateDetail.Address2,CandidateDetail.FatheFirstName,CandidateDetail.FatherMiddleName,CandidateDetail.FatherLasttName,CandidateDetail.FatherDesignation,CandidateDetail.MotherFirstName,CandidateDetail.CandidateDetail_ID,CandidateDetail.Enquiry_ID,Enquiry.EnquiryNo',
	   @SearchValue NVARCHAR(max) = '',--'WHERE CandidateDetail.FirstName LIKE ''%j%''',
       @PageNo INT = 0,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) = 'CandidateDetail.FirstName',
       @SortOrder NVARCHAR(20) = 'ASC',
	   @SchoolId INT =0,
	   @GroupId INT =0
)
 AS BEGIN
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
 'SELECT (SELECT count(CandidateDetail.CandidateDetail_ID) FROM [dbo].[CandidateDetail]  
INNER JOIN  [dbo].[Enquiry]  ON CandidateDetail.Enquiry_ID = Enquiry.Enquiry_ID
Where CandidateDetail.ISDeleted  = 0) as MaxRows,
 '+@SelectColumn+' FROM [dbo].[CandidateDetail]  
INNER JOIN  [dbo].[Enquiry]  ON CandidateDetail.Enquiry_ID = Enquiry.Enquiry_ID
Where CandidateDetail.ISDeleted  = 0 
 
       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
      OFFSET ' +CONVERT(varchar(50), @PageNo)+' ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY'
  EXEC (@query)

 END

 END
GO
/****** Object:  StoredProcedure [dbo].[GetDetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetDetails]
@EnquiryNo char(10) =''

AS

IF @EnquiryNo =''
begin
	SELECT e.EnquiryNo,et.EnquiryName,ms.MarketingDetails
	FROM Enquiry e 
	INNER JOIN EnquiryType et
	ON e.EnquiryType_ID=et.EnquiryType_ID
	INNER JOIN MarketingSource ms 
	ON e.MarketSource_ID=ms.MarketingSource_ID
	--print 'm here'
end
else
begin
	SELECT e.EnquiryNo,et.EnquiryName,ms.MarketingDetails
	FROM Enquiry e 
	INNER JOIN EnquiryType et
	ON e.EnquiryType_ID=et.EnquiryType_ID
	INNER JOIN MarketingSource ms 
	ON e.MarketSource_ID=ms.MarketingSource_ID
	WHERE e.EnquiryNo=@EnquiryNo
	--print 'm here ele'
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeDetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[GetEmployeeDetails]
(
	   @SelectColumn  NVARCHAR(max) ='AspNetUsers.Email, AspNetUsers.UserName, MasterTable.Name,UserGroup.UserGroupName',
       @SearchValue NVARCHAR(max) = '',--'WHERE CandidateDetail.FirstName LIKE ''%j%''',
       @PageNo INT = 0,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) = 'AspNetUsers.UserName',
       @SortOrder NVARCHAR(20) = 'ASC'
)
 AS BEGIN
 SET NOCOUNT ON;
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
 'SELECT (select count(EmployeeMaster.EmployeeMasterID)  from EmployeeMaster WHERE EmployeeMaster.ISDeleted=0) as MaxRows,'+@SelectColumn+' FROM [dbo].[EmployeeMaster] 
--INNER JOIN [dbo].[MasterTable] EmpStatus ON   EmployeeMaster.EmpStatusId=EmpStatus.MasterTable_id
--INNER JOIN [dbo].[MasterTable] Gender ON   EmployeeMaster.GenderID=Gender.MasterTable_id 
WHERE EmployeeMaster.ISDeleted=0
 
       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
 
      OFFSET ' +CONVERT(varchar(50), @PageNo)+' ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY'
	  print @query
  EXEC (@query)

 END

 END
GO
/****** Object:  StoredProcedure [dbo].[GetEnquiryDetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[GetEnquiryDetails]
(
	   @SelectColumn  NVARCHAR(max) ='Enquiry.Enquiry_ID, CandidateDetail.CandidateDetail_ID, CandidateDetail.FirstName, CandidateDetail.HomePhone ',
       @SearchValue NVARCHAR(max) = 'WHERE CandidateDetail.FirstName LIKE ''%j%''',
       @PageNo INT = 0,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) = 'CandidateDetail.FirstName',
       @SortOrder NVARCHAR(20) = 'DESC'
)
 AS BEGIN
 SET NOCOUNT ON;
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
' ; WITH CTE_Results AS
(
    SELECT '+@SelectColumn+' FROM [dbo].[Enquiry] 
LEFT JOIN [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID=CandidateDetail.Enquiry_ID
LEFT JOIN [dbo].[Application]  ON Enquiry.Enquiry_ID=Application.Enquiry_ID
LEFT JOIN [dbo].[Registration]  ON Enquiry.Enquiry_ID=Registration.Enquiry_ID
LEFT JOIN [dbo].[EnquiryType]  ON Enquiry.EnquiryType_ID=EnquiryType.EnquiryType_ID
LEFT JOIN [dbo].[MarketingSource]  ON Enquiry.MarketSource_ID=MarketingSource.MarketingSource_ID
 
       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
 
      OFFSET ' +CONVERT(varchar(50), @PageNo)+' ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY
       ),
CTE_TotalRows AS
(
   select count(Enquiry.Enquiry_ID) as MaxRows  FROM [dbo].[Enquiry]  
LEFT JOIN [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID=CandidateDetail.Enquiry_ID
LEFT JOIN [dbo].[Application]  ON Enquiry.Enquiry_ID=Application.Enquiry_ID
LEFT JOIN [dbo].[Registration]  ON Enquiry.Enquiry_ID=Registration.Enquiry_ID
LEFT JOIN [dbo].[EnquiryType]  ON Enquiry.EnquiryType_ID=EnquiryType.EnquiryType_ID
LEFT JOIN [dbo].[MarketingSource]  ON Enquiry.MarketSource_ID=MarketingSource.MarketingSource_ID 
   ' +@SearchValue+'
 
)
   Select MaxRows,  '+@SelectColumn+' FROM [dbo].[Enquiry] 
LEFT JOIN [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID=CandidateDetail.Enquiry_ID
LEFT JOIN [dbo].[Application]  ON Enquiry.Enquiry_ID=Application.Enquiry_ID
LEFT JOIN [dbo].[Registration]  ON Enquiry.Enquiry_ID=Registration.Enquiry_ID
LEFT JOIN [dbo].[EnquiryType]  ON Enquiry.EnquiryType_ID=EnquiryType.EnquiryType_ID
LEFT JOIN [dbo].[MarketingSource]  ON Enquiry.MarketSource_ID=MarketingSource.MarketingSource_ID
 , CTE_TotalRows
   WHERE EXISTS (SELECT 1 FROM CTE_Results WHERE CTE_Results.Enquiry_ID = Enquiry.Enquiry_ID)
 
    ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
 
   OPTION (RECOMPILE)'

  EXEC (@query)
 
  END

 END
GO
/****** Object:  StoredProcedure [dbo].[GetMaster]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetMaster]

@TableName char(100) =''

AS

IF @TableName =''
begin
	SELECT * FROM Religion
	--print 'm here'
end
IF @TableName ='GroupMaster'
begin
	SELECT * from GroupMaster
	
end
GO
/****** Object:  StoredProcedure [dbo].[GetMasterDropDown]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetMasterDropDown]

@TableName char(100) =''

AS

IF @TableName =''
begin
	SELECT r.ReligionCode as [KeyM], r.ReligionName as [KeyValue]  FROM Religion r
	--print 'm here'
end
IF @TableName ='GroupMaster'
begin
	SELECT r.GroupCode as [KeyM], r.GroupName as [KeyValue]  FROM GroupMaster r 
	
end
GO
/****** Object:  StoredProcedure [dbo].[GetMasterForDropDown]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMasterForDropDown]

@TableName char(100) =''

AS

IF @TableName =''
begin
	SELECT r.ReligionCode as [KeyM], r.ReligionName as [KeyValue]  FROM Religion r
	--print 'm here'
end
IF @TableName ='GroupMaster'
begin
	SELECT r.GroupCode as [KeyM], r.GroupName as [KeyValue]  FROM GroupMaster r 
	
end
GO
/****** Object:  StoredProcedure [dbo].[GetMasterOfAll]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetMasterOfAll]

@TableName char(100) =''

AS

IF @TableName ='Religion'
begin
	SELECT r.Religion_ID as [KeyM], 
	CAST(r.ReligionCode as varchar(100)) as [KeyValue],
	CAST(r.ReligionName as varchar(100)) as [KeyDesc],
	CAST('Opt Val' as varchar(100)) as [OptCol]  FROM Religion r
	--print 'm here'
end
IF @TableName ='GroupMaster'
begin
	SELECT r.group_ID  as [KeyM], 
	CAST(r.GroupCode as varchar(100)) as [KeyValue],  
	CAST(r.GroupName as varchar(100)) as [KeyDesc],
	CAST(r.State_ID as varchar(100)) as [OptCol] FROM GroupMaster r 
	
end

IF @TableName ='EnquiryType'
begin
	SELECT r.EnquiryType_ID as [KeyM], 
	CAST(r.EnquiryCode as varchar(100)) as [KeyValue],  
	CAST(r.EnquiryName as varchar(100)) as [KeyDesc],
	CAST(r.GroupID as varchar(100)) as [OptCol] FROM EnquiryType r 
	
end
GO
/****** Object:  StoredProcedure [dbo].[GetMasterTableRecord]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Auther,,Jiya>
-- Create date: <Create Date,03/13/2019,>
-- Description:	<Get Master table record as per parameters,,>
-- =============================================
CREATE procEDURE [dbo].[GetMasterTableRecord]
	-- Add the parameters for the stored procedure here
	@MasterTableId INT,
	@MasterTypeId INT,
	@SchoolId INT,
	@GroupId INT,
	@SessionYear INT,
	@IsDeleted BIT
	
AS
BEGIN
SELECT  * FROM 
      [dbo].[MasterTable]
	  WHERE
(@MasterTableId IS NULL OR MasterTable_id=@MasterTableId)
AND
(@MasterTypeId IS NULL OR Mastertabletype_id=@MasterTypeId)
AND
(@SchoolId IS NULL OR SchoolID=@SchoolId)
AND
(@GroupId IS NULL OR GroupID=@GroupId)
AND
(@SessionYear IS NULL OR Sessionyear=@SessionYear)
AND
(@IsDeleted IS NULL OR ISDeleted=@IsDeleted)
END
GO
/****** Object:  StoredProcedure [dbo].[GetMenu]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMenu] --'user2@gee.com'
@UserName nvarchar(512),
@Action tinyint =1

AS

BEGIN
DECLARE @UserGroupId INT
SET @UserGroupId =(select UserGroupId from AspNetUsers where UserName=@UserName)
;WITH MenuHierarchy (NavigationMenuId,NavigationMenuCode, NavigationMenuName, MenuURL, NavigationMenuParentId) AS
	(
		select nm.NavigationMenuId, NavigationMenuCode,NavigationMenuName, MenuURL, NavigationMenuParentId
			 from [dbo].[NavigationMenu1] nm
		inner join [dbo].[UserGroupNavigationMenuMapping]  ugnm on ugnm.NavigationMenuId=nm.NavigationMenuId
		where NaviVisible=1 and ugnm.ISDeleted =0
		and ugnm.UserGroupId=@UserGroupId

		UNION ALL

		
		select nm.NavigationMenuId, nm.NavigationMenuCode,nm.NavigationMenuName, nm.MenuURL, nm.NavigationMenuParentId
			 from [dbo].[NavigationMenu1] nm	
		INNER JOIN MenuHierarchy EH ON EH.NavigationMenuParentId = nm.NavigationMenuId
		
	)
	
 SELECT 
	DISTINCT NavigationMenuId,NavigationMenuCode, NavigationMenuName, MenuURL, NavigationMenuParentId	
	FROM 
		MenuHierarchy 
	ORDER BY 
		NavigationMenuId 

END
GO
/****** Object:  StoredProcedure [dbo].[GetMenuadv]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMenuadv]
@UserName nvarchar(512),
@Action tinyint 

AS

Select nm.*,nmt.NavigationTypeName from NavigationMenu nm
INNER JOIN NavigationType nmt ON nmt.NavigationTypeId=nm.NavigationTypeId
INNER JOIN UserGroupNavigationMenuMapping sgnm ON sgnm.NavigationMenuId=nm.NavigationMenuId
INNER JOIN UserGroup sug ON sug.UserGroupId=sgnm.UserGroupId
INNER JOIN UserGroupAspUserMapping sgam ON sgam.UserGroupId=sug.UserGroupId
WHERE sgam.AspNetUserName=@UserName

GO
/****** Object:  StoredProcedure [dbo].[GetNavigationPermission]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procEDURE [dbo].[GetNavigationPermission]
	-- Add the parameters for the stored procedure here
	@UserGroupID INT,
	@NavigationId INT
AS
BEGIN
	SELECT  NavigationMenu_Id ,ANR.Name AS RoleName ,MT.Name AS Permission,ANR.Role_id   FROM [dbo].[Navmenu_asprole_permisison_mapping]  NAPM
	INNER JOIN [Navmenu_asprole_permisison_UserGroup_mapping] NAPUM ON 
	NAPM.Navrolepermisisonmapping_ID=NAPUM.Navrolepermisisonmapping_ID 
	INNER JOIN [dbo].[AspNetRoles] ANR ON NAPM.Role_id=ANR.Role_id 
	INNER JOIN MasterTable MT ON NAPM.Permission_Id=MT.MasterTable_id AND MT.ISDeleted=0
	WHERE NavigationMenu_Id= (SELECT NavigationMenuId FROM NavigationMenu1 WHERE NavigationMenuCode= @NavigationId) AND NAPUM.UserGroup_ID=@UserGroupID
	--(SELECT NavigationMenuId FROM NavigationMenu1 WHERE NavigationMenuCode= @NavigationId)
END

GO
/****** Object:  StoredProcedure [dbo].[GetReligion]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetReligion]

AS
begin
SELECT * FROM Religion
end
GO
/****** Object:  StoredProcedure [dbo].[GetRuteMasterById]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procEDURE [dbo].[GetRuteMasterById]
(
	   @RouteMasterId INT =1,
	   @SchoolId INT =4,
	   @GroupId INT =1
)
 AS BEGIN
 Select 
 RM.RouteMasterId,
 RM.RouteCode,
 RM.RoutName,
 RM.Totaldistance,
 RM.TripID, 
 RM.ISAC,
 MT3.[Name] as TripName,
 VM.RegistrationNumber,
 MT.[Name] as Manufacturer,
 MT1.[Name] as Make,
 MT2.[Name] as model,
 EM.FirstName + '' + EM.MiddleName +''+EM.Lastname as DriverName,
 RM.RouteCoordinator
 FROM RouteMaster RM
 Inner Join VechicleMaster VM
 ON VM.VechicleMasterId=RM.VechicelID
 INNER JOIN MasterTable MT
 ON VM.VechicalManufactureNameID = MT.MasterTable_id
 INNER JOIN MasterTable MT1
 ON VM.VechicalMakeID = MT1.MasterTable_id
 INNER JOIN MasterTable MT2
 ON VM.VechicalModelID = MT2.MasterTable_id 
 INNER JOIN MasterTable MT3 
 ON RM.TripID = MT3.MasterTable_id 
 Left Outer Join VechicleStaffMapping VSM
 ON RM.VechicelID = VSM.VechicleID
 Left Outer JOin EmployeeMaster EM
 ON VSM.DriveID = EM.EmployeeMasterID

 where RM.RouteMasterId=@RouteMasterId and
 RM.School_ID=@SchoolId and RM.Group_ID=@GroupId and RM.IsDeleted=0

 END
GO
/****** Object:  StoredProcedure [dbo].[GetRuteMasterdetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[GetRuteMasterdetails]
(
	   @SelectColumn  NVARCHAR(max) = 'RouteMaster.RouteCode
										,RouteMaster.RoutName
										,MasterTable.Name
										,RouteMaster.Totaldistance
										,RouteMaster.TotalTriptime
										,RouteMaster.RouteMasterId',
	   @SearchValue NVARCHAR(max) = '',--'WHERE RouteMaster.FirstName LIKE ''%j%''',
       @PageNo INT = 0,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) = 'RouteMaster.RouteMasterId',
       @SortOrder NVARCHAR(20) = 'ASC',
	   @SchoolId INT =4,
	   @GroupId INT =1
)
 AS BEGIN
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
 'SELECT (SELECT count(RouteMaster.RouteMasterId) FROM [dbo].[RouteMaster]  
Where RouteMaster.ISDeleted  = 0) as MaxRows,
 '+@SelectColumn+' FROM [dbo].[RouteMaster]
 inner join [dbo].[MasterTable] on RouteMaster.TripID = MasterTable.MasterTable_id
Where RouteMaster.ISDeleted  = 0 AND 
RouteMaster.School_ID='++CONVERT(varchar(50), @SchoolId)++'  and RouteMaster.Group_ID='+CONVERT(varchar(50), @GroupId)+' 

       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
      OFFSET ' +CONVERT(varchar(50), @PageNo)+' ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY'
  EXEC (@query)

 END

 END
GO
/****** Object:  StoredProcedure [dbo].[GetSellAndSubmitDetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[GetSellAndSubmitDetails]
(
	   @SelectColumn  NVARCHAR(max) ='Enquiry.Enquiry_ID,CandidateDetail.FirstName,CandidateDetail.LastName,
	   CandidateDetail.ContactMobileNo,CandidateDetail.Gender,CandidateDetail.FatheFirstName,CandidateDetail.DOB,
	   CandidateDetail.Email,Enquiry.Status,Application.ApplicaitonNo,Registration.RegistrationNo,Application.IsSubmitted,
	   Registration.Issubmitted,Application.Applicationsold',

       @SearchValue NVARCHAR(max) = '',--'WHERE CandidateDetail.FirstName LIKE ''%j%''',
       @PageNo INT = 0,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) = 'CandidateDetail.FirstName',
       @SortOrder NVARCHAR(20) = 'ASC',
	   @SchoolId INT =0,
	   @GroupId INT =0
)
 AS BEGIN
 SET NOCOUNT ON;
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
 'SELECT (SELECT count(Enquiry.Enquiry_ID) FROM [dbo].[Enquiry]  
INNER JOIN  [dbo].[Application]  ON Enquiry.Enquiry_ID = Application.Enquiry_ID
INNER JOIN  [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID = CandidateDetail.Enquiry_ID
INNER JOIN  [dbo].[Registration]  ON Enquiry.Enquiry_ID = Registration.Enquiry_ID
Where Enquiry.ISDeleted  = 0) as MaxRows,
 '+@SelectColumn+' FROM [dbo].[Enquiry] 
INNER JOIN  [dbo].[Application] ON Enquiry.Enquiry_ID = Application.Enquiry_ID
INNER JOIN  [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID = CandidateDetail.Enquiry_ID
INNER JOIN  [dbo].[Registration]  ON Enquiry.Enquiry_ID = Registration.Enquiry_ID
WHERE Enquiry.ISDeleted=0 
 
       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
 
      OFFSET ' +CONVERT(varchar(50), @PageNo)+' ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY'
  EXEC (@query)

 END

 END
GO
/****** Object:  StoredProcedure [dbo].[GetStartAdmissiondetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[GetStartAdmissiondetails]
(
	   @SelectColumn  NVARCHAR(max) = 'AdmissionStatus.AdmissionStatus_id,AdmissionStatus.ClassMaster_id,
										AdmissionStatus.AdmissionCode,AdmissionStatus.AdmissionStatus,
										AdmissionStatus.AdmissionSessionYear,AdmissionStatus.Startdate,
										AdmissionStatus.FromDOB,AdmissionStatus.TODOB,
										AdmissionStatus.ApplicaitonFees,AdmissionStatus.RegistrationFees,ClassMaster.Name,
										AcademicYear.ShortName',
	   @SearchValue NVARCHAR(max) = '',--'WHERE AdmissionStatus.FirstName LIKE ''%j%''',
       @PageNo INT = 0,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) = 'AdmissionStatus.AdmissionStatus_id',
       @SortOrder NVARCHAR(20) = 'ASC',
	   @SchoolId INT =4,
	   @GroupId INT =1
)
 AS BEGIN
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
 'SELECT (SELECT count(AdmissionStatus.AdmissionStatus_id) FROM [dbo].[AdmissionStatus]  
Where AdmissionStatus.ISDeleted  = 0) as MaxRows,
 '+@SelectColumn+' FROM [dbo].[AdmissionStatus]
 inner join [dbo].[ClassMaster] on AdmissionStatus.ClassMaster_id = ClassMaster.ClassMaster_ID
 Inner Join [dbo].[AcademicYear] on AcademicYear.AcademicYear_ID = AdmissionStatus.AdmissionSessionYear
Where AdmissionStatus.ISDeleted  = 0 AND 
AdmissionStatus.SchoolID='++CONVERT(varchar(50), @SchoolId)++'  and AdmissionStatus.GroupID='+CONVERT(varchar(50), @GroupId)+' 

 
       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
      OFFSET ' +CONVERT(varchar(50), @PageNo)+' ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY'
  EXEC (@query)

 END

 END
GO
/****** Object:  StoredProcedure [dbo].[GetStateCountyByCity]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procEDURE [dbo].[GetStateCountyByCity] --9

@CityId INT=0

AS
BEGIN
    --select @fname,@code from @TbName where @cond
	SELECT m1.MasterTable_id as CityId,m1.Name As CityName,
m2.MasterTable_id as StateId,m2.Name as StateName,
m3.MasterTable_id as CountryId,m3.Name from MasterTable m1, MasterTable m2,
MasterTable m3 where m2.MasterTable_id = m1.Parent_id and
m3.MasterTable_id = m2.Parent_id and
m1.MasterTable_id=@CityId
   
END





GO
/****** Object:  StoredProcedure [dbo].[GetUserDetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[GetUserDetails]
(
	   @SelectColumn  NVARCHAR(max) ='AspNetUsers.Email, AspNetUsers.UserName, MasterTable.Name,UserGroup.UserGroupName',
       @SearchValue NVARCHAR(max) = '',--'WHERE CandidateDetail.FirstName LIKE ''%j%''',
       @PageNo INT = 0,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) = 'AspNetUsers.UserName',
       @SortOrder NVARCHAR(20) = 'ASC'
)
 AS BEGIN
 SET NOCOUNT ON;
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
 'SELECT (select count(AspNetUsers.Id)  from AspNetUsers WHERE AspNetUsers.ISDeleted=0) as MaxRows,'+@SelectColumn+' FROM [dbo].[AspNetUsers] 
LEFT JOIN [dbo].[UserGroup]  ON AspNetUsers.UserGroupId=UserGroup.UserGroupId
LEFT JOIN [dbo].[MasterTable]  ON AspNetUsers.StuStaffTypeId=MasterTable.MasterTable_id
WHERE AspNetUsers.ISDeleted=0
 
       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
 
      OFFSET ' +CONVERT(varchar(50), @PageNo)+' ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY'
	  print @query
  EXEC (@query)

 END

 END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployeeDetails]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************
     Name                       = InsertEmployeeDetails
     Author                     = Jiya
	 Date						= 27 July 2019
     Purpose                  	= Insert data into employee master as well in child tables.
	 Modification History    
*****************************************************************************************************/
CREATE proc [dbo].[InsertEmployeeDetails]
	@EmployeeDetailsXML XML,
	@EducationItemXML XML,
	@ExperinceItemXML XML,
	@EmployeeIdItemXML XML,
	@modifiedBy INT,
	@EmployeeMasterID int
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		BEGIN TRAN			
			
			
			IF(@EmployeeMasterID > 0)
				BEGIN
				
				--Update employee details
					UPDATE [EmployeeMaster]
					SET 
						
					[EmpCode]	   =x.d.value('EmpCode[1]','VARCHAR(20)'),
				   [EmpCategoryID]	  =x.d.value('EmpCategoryID[1]','INT'),
				   [StaffDesignationID]	  =x.d.value('StaffDesignationID[1]','INT'),
				   [VendorID]	  =x.d.value('VendorID[1]','INT'),
				   [DepartmentID]	  =x.d.value('DepartmentID[1]','INT'),
				   [FirstName]	  =x.d.value('FirstName[1]','VARCHAR(50)'),
				   [MiddleName]	  =x.d.value('MiddleName[1]','VARCHAR(50)'),
				   [Lastname]	  =x.d.value('Lastname[1]','VARCHAR(50)'),
				   [Email]	  =x.d.value('Email[1]','VARCHAR(50)'),
				   [ContactMobileNo]	  =x.d.value('ContactMobileNo[1]','VARCHAR(20)'),
				   [HomePhone]	  =x.d.value('HomePhone[1]','VARCHAR(20)'),
				   [CurrentAddress]	  =x.d.value('CurrentAddress[1]','VARCHAR(50)'),
				   [CurrentCityID]	  =x.d.value('CurrentCityID[1]','INT'),
				   [CurrentStateID]	  =x.d.value('CurrentStateID[1]','INT'),
				   [CurrentCountryID]	  =x.d.value('CurrentCountryID[1]','INT'),
				   [CurrentPinCode]	  =x.d.value('CurrentPinCode[1]','VARCHAR(20)'),
				   [CurrentLandmark]	  =x.d.value('CurrentLandmark[1]','VARCHAR(50)'),
				   [Is_also_Permanent]	  =x.d.value('Is_also_Permanent[1]','BIT'),
				   [PermenentAddress]	  =x.d.value('PermenentAddress[1]','VARCHAR(50)'),
				   [PermenentCity_ID]	  =x.d.value('PermenentCity_ID[1]','INT'),
				   [PermenentState_ID]	  =x.d.value('PermenentState_ID[1]','INT'),
				   [PermenentCountry_ID]	  =x.d.value('PermenentCountry_ID[1]','INT'),
				   [PinCode]	  =x.d.value('PinCode[1]','VARCHAR(20)'),
				   [Landmark]	  =x.d.value('Landmark[1]','VARCHAR(50)'),
				   [DOB]	  =x.d.value('DOB[1]','DATETIME'),
				   [GenderID]	  =x.d.value('GenderID[1]','INT'),
				   [Nationality]	  =x.d.value('Nationality[1]','VARCHAR(20)'),
				   [Married]	  =x.d.value('Married[1]','BIT'),
				   [Remarks]	  =x.d.value('Remarks[1]','VARCHAR(100)'),
				   [FatheFirstName]	  =x.d.value('FatheFirstName[1]','VARCHAR(20)'),
				   [FatherMiddleName]	  =x.d.value('FatherMiddleName[1]','VARCHAR(20)'),
				   [FatherLasttName]	  =x.d.value('FatherLasttName[1]','VARCHAR(20)'),
				   [MotherFirstName]	  =x.d.value('MotherFirstName[1]','VARCHAR(20)'),
				   [MotherMiddleName]	  =x.d.value('MotherMiddleName[1]','VARCHAR(20)'),
				   [MotherLasttName]	  =x.d.value('MotherLasttName[1]','VARCHAR(20)'),
				   [Caste_ID]	  =x.d.value('Caste_ID[1]','INT'),
				   [Religon_ID]	  =x.d.value('Religon_ID[1]','INT'),
				   [Create_Login]	  =x.d.value('Create_Login[1]','VARCHAR(50)'),
				   [selectUsergroup]	  =x.d.value('selectUsergroup[1]','VARCHAR(50)'),
				   [EmpStatusId]	  =x.d.value('EmpStatusId[1]','INT'),
				   [Sessionyear]	  =x.d.value('Sessionyear[1]','INT'),				 
				   [ModifiedDate]	  =getdate(),
				   [Modifiedby_ID]	  =@modifiedBy,
				   [School_ID]	  =x.d.value('School_ID[1]','INT'),
				   [Group_ID]	  =x.d.value('Group_ID[1]','INT'),
				   [IsDeleted]	  =0	
					FROM @EmployeeDetailsXML.nodes('/DocumentElement/EmployeeMasterModel ') x(d)
					WHERE EmployeeMasterID = @EmployeeMasterID				
				END
			ELSE
				BEGIN
				   --Insert In employee details
					INSERT INTO [dbo].[EmployeeMaster](					  
					
					  [EmpCode] ,[EmpCategoryID],[StaffDesignationID] ,[VendorID] ,[DepartmentID],[FirstName],[MiddleName],[Lastname]
					  ,[Email],[ContactMobileNo],[HomePhone],[CurrentAddress],[CurrentCityID],[CurrentStateID],[CurrentCountryID],[CurrentPinCode],[CurrentLandmark],[Is_also_Permanent]
					  ,[PermenentAddress],[PermenentCity_ID],[PermenentState_ID],[PermenentCountry_ID],[PinCode],[Landmark],[DOB],[GenderID],[Nationality],[Married],[Remarks]
					  ,[FatheFirstName],[FatherMiddleName],[FatherLasttName],[MotherFirstName] ,[MotherMiddleName],[MotherLasttName],[Caste_ID]
					  ,[Religon_ID],[Create_Login],[selectUsergroup],[EmpStatusId],[Sessionyear],[CreatedDate],[Createdby_ID] ,[School_ID],[Group_ID],[IsDeleted])
						SELECT 
					   x.d.value('EmpCode[1]','VARCHAR(20)') ,x.d.value('EmpCategoryID[1]','INT'),x.d.value('StaffDesignationID[1]','INT'),x.d.value('VendorID[1]','INT')
					  ,x.d.value('DepartmentID[1]','INT')
					  ,x.d.value('FirstName[1]','VARCHAR(50)')
					  ,x.d.value('MiddleName[1]','VARCHAR(50)')
					  ,x.d.value('Lastname[1]','VARCHAR(50)')
					  ,x.d.value('Email[1]','VARCHAR(50)')
					  ,x.d.value('ContactMobileNo[1]','VARCHAR(20)')
					  ,x.d.value('HomePhone[1]','VARCHAR(20)')
					  ,x.d.value('CurrentAddress[1]','VARCHAR(50)')
					  ,x.d.value('CurrentCityID[1]','INT')
					  ,x.d.value('CurrentStateID[1]','INT')
					  ,x.d.value('CurrentCountryID[1]','INT')
					  ,x.d.value('CurrentPinCode[1]','VARCHAR(20)')
					  ,x.d.value('CurrentLandmark[1]','VARCHAR(50)')
					  ,x.d.value('Is_also_Permanent[1]','BIT')
					  ,x.d.value('PermenentAddress[1]','VARCHAR(50)')
					  ,x.d.value('PermenentCity_ID[1]','INT')
					  ,x.d.value('PermenentState_ID[1]','INT')
					  ,x.d.value('PermenentCountry_ID[1]','INT')
					  ,x.d.value('PinCode[1]','VARCHAR(20)')
					  ,x.d.value('Landmark[1]','VARCHAR(50)')
					  ,x.d.value('DOB[1]','DATETIME')
					  ,x.d.value('GenderID[1]','INT')
					  ,x.d.value('Nationality[1]','VARCHAR(20)')
					  ,x.d.value('Married[1]','BIT')
					  ,x.d.value('Remarks[1]','VARCHAR(100)')
					  ,x.d.value('FatheFirstName[1]','VARCHAR(20)')
					  ,x.d.value('FatherMiddleName[1]','VARCHAR(20)')
					  ,x.d.value('FatherLasttName[1]','VARCHAR(20)')
					  ,x.d.value('MotherFirstName[1]','VARCHAR(20)')
					  ,x.d.value('MotherMiddleName[1]','VARCHAR(20)')
					  ,x.d.value('MotherLasttName[1]','VARCHAR(20)')
					  ,x.d.value('Caste_ID[1]','INT')
					  ,x.d.value('Religon_ID[1]','INT')
					  ,x.d.value('Create_Login[1]','VARCHAR(50)')
					  ,x.d.value('selectUsergroup[1]','VARCHAR(50)')
					  ,x.d.value('EmpStatusId[1]','INT')
					  ,x.d.value('Sessionyear[1]','INT')
					  ,getdate()
					  ,@modifiedBy					  
					  ,x.d.value('School_ID[1]','INT')
					  ,x.d.value('Group_ID[1]','INT')
					  ,0--x.d.value('IsDeleted[1]','BIT')
					  				
					FROM @EmployeeDetailsXML.nodes('/DocumentElement/EmployeeMasterModel ') x(d)
					SET @EmployeeMasterID = SCOPE_IDENTITY();					
				END
			DELETE  FROM EmployeeEducationDetail WHERE EmpCode = @EmployeeMasterID
			DELETE  FROM EmployeeExperience WHERE EmpCode = @EmployeeMasterID
			DELETE  FROM EmployeeIDdetail WHERE EmpcodeID = @EmployeeMasterID

		INSERT INTO EmployeeEducationDetail
		([EmpCode]
      ,[Degree_ID]
      ,[Subjects]
      ,[FromDate]
      ,[ToDate]
      ,[InstituteName]
      ,[City]
      ,[EmpDegreeModeid]
      ,[Percent_Marks]
      ,[Division]
      ,[Remarks]
	   ,[CreatedDate]
      ,[Createdby_ID])

	   SELECT
	   @EmployeeMasterID, x.d.value('Degree_ID[1]','INT'),
	   x.d.value('Subjects[1]','VARCHAR(20)'),
	    x.d.value('FromDate[1]','DATETIME'),
		 x.d.value('ToDate[1]','DATETIME'),
		
		     x.d.value('InstituteName[1]','VARCHAR(100)'),
			   x.d.value('City[1]','VARCHAR(50)'),
				x.d.value('EmpDegreeModeid[1]','INT'),	 
				x.d.value('Percent_Marks[1]','INT'),	 
				x.d.value('Division[1]','VARCHAR(20)'),
				x.d.value('Remarks[1]','VARCHAR(100)'),	 
					  getdate()
					  ,@modifiedBy				  
					 
					FROM @EducationItemXML.nodes('/DocumentElement/EmployeeEducationDetailModel') x(d)

		INSERT INTO EmployeeExperience	
	 ([EmpCode]
      ,[Company_Name]
      ,[WorkCity]
      ,[From_Date]
      ,[To_Date]
      ,[Last_salary]
      ,[joining_Designation]
      ,[Last_Designation]
      ,[Reason_To_leave]
      ,[IsRelevant]      
      ,[CreatedDate]
      ,[Createdby_ID])    
	  SELECT
	   @EmployeeMasterID, x.d.value('Company_Name[1]','VARCHAR(100)'),
	   x.d.value('WorkCity[1]','VARCHAR(20)'),
	    x.d.value('From_Date[1]','DATETIME'),
		 x.d.value('To_Date[1]','DATETIME'),
		  x.d.value('Last_salary[1]','INT'),
		     x.d.value('joining_Designation[1]','VARCHAR(50)'),
			   x.d.value('Last_Designation[1]','VARCHAR(50)'),
				x.d.value('Reason_To_leave[1]','VARCHAR(100)'),	 
				x.d.value('IsRelevant[1]','BIT'),	 
					  getdate()
					  ,@modifiedBy				  
					 
					FROM @ExperinceItemXML.nodes('/DocumentElement/EmployeeExperienceModel') x(d)
		
		INSERT INTO EmployeeIDdetail
		 (
      [EmpcodeID],
	  [IDcardTypeID]
      ,[Idnumber]
      ,[validFrom]
      ,[ValidTo]
      ,[IssueCityID]
	  ,[CreatedDate]
      ,[Createdby_ID]) 
	   SELECT
	   @EmployeeMasterID, x.d.value('IDcardTypeID[1]','INT'),
	   x.d.value('Idnumber[1]','VARCHAR(50)'),
	    x.d.value('validFrom[1]','DATETIME'),
		 x.d.value('ValidTo[1]','DATETIME'),
		  x.d.value('IssueCityID[1]','INT'),		    
					  getdate()
					  ,@modifiedBy				  
					 
					FROM @EmployeeIdItemXML.nodes('/DocumentElement/EmployeeIDdetailModel') x(d)
			
		COMMIT TRAN			
		SELECT @EmployeeMasterID;
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN	
		DECLARE @ErrorMessage NVARCHAR(4000);
		SELECT @ErrorMessage = ERROR_MESSAGE();
		RAISERROR (@ErrorMessage, 16, 1);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRole]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertRole] 
@RoleName NVARCHAR(256),
@NavigationMenuCode char(10),
@NavigationMenuName varchar(100),
@NavigationTypeId int,
@NavigationMenuParentId int,
@MenuURL nvarchar(256),
@NaviVisible bit,
@IconClass varchar(20),
@ResxKey varchar(20),
@IPAddress  nvarchar(256),
@MACAddress  nvarchar(256),
@PermissionName char(10),
@MenuGroupId int,
@Sessionyear int ,
@CreatedBy_ID int,
@ModifiedBy_ID int,
@SchoolID int , 
@GroupID int,
@Sequence int,
@Action TINYINT =1
AS
DECLARE @RoleId NVARCHAR(128), @UserId NVARCHAR(128), 
 @UserName NVARCHAR(256), @UserGroupId int

SET @UserName= 'a@a.com'
IF @Action=1
	BEGIN
		INSERT INTO AspNetRoles(Id,Name, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted ) VALUES(NEWID(),@RoleName, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		SELECT @RoleId = Id from AspNetRoles
		WHERE Name=@RoleName

		SELECT @UserId = Id, @UserGroupId = UserGroupId from AspNetUsers
		WHERE UserName=@UserName

		INSERT INTO AspNetUserRoles(UserId, RoleId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
		 VALUES(@UserId,@RoleId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		INSERT INTO [NavigationMenu1]
      ([NavigationMenuCode]
      ,[NavigationMenuName]
      ,[NavigationTypeId]
      ,[NavigationMenuParentId]
      ,[MenuURL]
      ,[NaviVisible]
      ,[IconClass]
      ,[Resxkey]
      ,[IPAddress]
      ,[MACAddress]
      ,[RoleId]
      ,[RoleName]
      ,[PermisionName]
      ,[MenuGroupId]
      ,[Sessionyear]
      ,[CreatedDate]
      ,[CreatedBy_ID]
      ,[ModifiedDate]
      ,[ModifiedBy_ID]
      ,[SchoolID]
      ,[GroupID]
      ,[ISDeleted]
      ,[Sequence])

	  VALUES
	  (@NavigationMenuCode,@NavigationMenuName , 
		@NavigationTypeId,@NavigationMenuParentId ,
		@MenuURL ,
		@NaviVisible ,
		@IconClass ,
		@ResxKey ,
		@IPAddress ,
		@MACAddress  ,@RoleId,@RoleName,@PermissionName ,
		@MenuGroupId,
	    @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		@ModifiedBy_ID,@SchoolID,@GroupID,0, @Sequence
	  )
	  DECLARE @NavigationMenuId int
	  SELECT @NavigationMenuId =  SCOPE_IDENTITY()
	  print @NavigationMenuId
	  INSERT INTO UserGroupNavigationMenuMapping(UserGroupId, NavigationMenuId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
		 VALUES(@UserGroupId,@NavigationMenuId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )
	END


GO
/****** Object:  StoredProcedure [dbo].[InsertRole_New]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertRole_New] 
@RoleName NVARCHAR(256),

@Sessionyear int ,
@CreatedBy_ID int,
@ModifiedBy_ID int,
@SchoolID int , 
@GroupID int,

@Action TINYINT =1
AS
DECLARE @RoleId NVARCHAR(128), @UserId NVARCHAR(128), 
 @UserName NVARCHAR(256), @UserGroupId int

SET @UserName= 'a@a.com'
IF @Action=1
	BEGIN
		INSERT INTO AspNetRoles(Id,Name, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted ) VALUES(NEWID(),@RoleName, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		SELECT @RoleId = Id from AspNetRoles
		WHERE Name=@RoleName

		SELECT @UserId = Id, @UserGroupId = UserGroupId from AspNetUsers
		WHERE UserName=@UserName

		INSERT INTO AspNetUserRoles(UserId, RoleId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
		 VALUES(@UserId,@RoleId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		
	END


GO
/****** Object:  StoredProcedure [dbo].[MenuPermission]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,jIYA>
-- Create date: <Create Date,08june 19,>
-- Description:	<Description,, to check permsiion for user to confegured>
-- =============================================
CREATE procEDURE [dbo].[MenuPermission]
	-- Add the parameters for the stored procedure here
	@UserGroupID INT,
	@NavigationId INT
AS
BEGIN
	SELECT  NavigationMenu_Id ,NAPM.Permission_Id ,Navrolepermisisonmapping_ID	,	
	MT.Name AS Permission  ,
	case when ( (SELECT Navrolepermisisonmapping_ID FROM Navmenu_asprole_permisison_UserGroup_mapping NAPUM
	WHERE  NAPUM.UserGroup_ID=@UserGroupID AND NAPUM.Navrolepermisisonmapping_ID=NAPM.Navrolepermisisonmapping_ID AND NAPUM.ISDeleted=0)) IS  NULL THEN 0  ELSE 1 END AS IsPermission

	FROM [dbo].[Navmenu_asprole_permisison_mapping]  NAPM 
	INNER JOIN MasterTable MT ON NAPM.Permission_Id=MT.MasterTable_id AND MT.ISDeleted=0
	WHERE NavigationMenu_Id=@NavigationId
END

GO
/****** Object:  StoredProcedure [dbo].[RoleMappingToAspNetUserRole]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RoleMappingToAspNetUserRole] 
@UserName NVARCHAR(256)='a@a.com',
@Action TINYINT =1
AS

DECLARE @CUserId int

SELECT @CUserId=cuserid from AspNetUsers where Email=@UserName
IF @Action=1
	BEGIN

	--case 1: IF A.ISDeleted =TRUE  AND A.AcitiveEdit = TRUE 
	--GET user pr]ermission from Navmenu_asprole_permisison_UserGroup_mapping

	SELECT A.UserGroup_ID,B.Role_id,C.ID, C.Role_id, D.UserId, D.RoleId  FROM Navmenu_asprole_permisison_UserGroup_mapping A
		INNER JOIN Navmenu_asprole_permisison_mapping B ON B.Navrolepermisisonmapping_ID = A.Navrolepermisisonmapping_ID
		INNER JOIN AspNetRoleS  C ON C.Role_id = B.Role_id
		INNER JOIN AspNetUserRoles D ON C.Id = D.RoleId
		--INNER JOIN AspNetUsers E ON E.UserGroupId = A.UserGroup_ID
		WHERE A.ISDeleted =1  AND A.AcitiveEdit = 1 
		ORDER BY A.UserGroup_ID

	-- Insert into History Table AspNetUserRolesHistory

	INSERT AspNetUserRolesHistory (UserId,RoleId,Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	SELECT A.UserId,A.RoleId,A.Sessionyear, A.CreatedDate,@CUserId, A.ModifiedDate, 
		A.ModifiedBy_ID, A.SchoolID, A.GroupID, A.ISDeleted FROM AspNetUserRoles A  
		INNER JOIN AspNetRoles B ON B.Id = A.RoleId		
		INNER JOIN Navmenu_asprole_permisison_mapping C ON c.Role_id = b.Role_id
		INNER JOIN Navmenu_asprole_permisison_UserGroup_mapping D ON D.Navrolepermisisonmapping_ID = C.Navrolepermisisonmapping_ID
		WHERE D.ISDeleted =1  AND D.AcitiveEdit = 1
		---
	--SELECT  D.UserId,D.RoleId,D.Sessionyear, D.CreatedDate,D.CreatedBy_ID, D.ModifiedDate, 
	--	D.ModifiedBy_ID, D.SchoolID, D.GroupID, D.ISDeleted  FROM Navmenu_asprole_permisison_UserGroup_mapping A
	--	INNER JOIN Navmenu_asprole_permisison_mapping B ON B.Navrolepermisisonmapping_ID = A.Navrolepermisisonmapping_ID
	--	INNER JOIN AspNetRoleS  C ON C.Role_id = B.Role_id
	--	INNER JOIN AspNetUserRoles D ON C.Id = D.RoleId
	--	--INNER JOIN AspNetUsers E ON E.UserGroupId = A.UserGroup_ID
	--	WHERE A.ISDeleted =1  AND A.AcitiveEdit = 1 
	--	--ORDER BY A.UserGroup_ID

	----
		--REPLACE D.CreatedBy_ID BY LOGGED IN PARAM ID USERID IN ABOVE SELECT STATEMENT-- completed

		-- DELETE FROM AspNetUserRoles TABLE
		DELETE A FROM AspNetUserRoles A  
		INNER JOIN AspNetRoles B ON B.Id = A.RoleId		
		INNER JOIN Navmenu_asprole_permisison_mapping C ON c.Role_id = b.Role_id
		INNER JOIN Navmenu_asprole_permisison_UserGroup_mapping D ON D.Navrolepermisisonmapping_ID = C.Navrolepermisisonmapping_ID
		WHERE D.ISDeleted =1  AND D.AcitiveEdit = 1 
	
	--case 2: IF A.ISDeleted =FALSE  AND A.AcitiveEdit = TRUE 
	--GET user pr]ermission from Navmenu_asprole_permisison_UserGroup_mapping

	SELECT A.UserGroup_ID,B.Role_id,C.ID, C.Role_id, D.UserId, D.RoleId  FROM Navmenu_asprole_permisison_UserGroup_mapping A
		INNER JOIN Navmenu_asprole_permisison_mapping B ON B.Navrolepermisisonmapping_ID = A.Navrolepermisisonmapping_ID
		INNER JOIN AspNetRoleS  C ON C.Role_id = B.Role_id
		INNER JOIN AspNetUserRoles D ON C.Id = D.RoleId
		--INNER JOIN AspNetUsers E ON E.UserGroupId = A.UserGroup_ID
		WHERE A.ISDeleted =0  AND A.AcitiveEdit = 1 
		ORDER BY A.UserGroup_ID

		--select * from AspNetUserRoles where UserId ='dd088a0f-d797-488f-8810-b2c0764ac570' and RoleId='965D4C79-FE96-479E-84DA-7784563ADA7D'
		--	select * from AspNetUserRoles where UserId ='dd088a0f-d797-488f-8810-b2c0764ac570' and RoleId='F3DDECC6-190D-473B-9ADD-1BF7BC9B878C'
	-- Insert into History Table AspNetUserRolesHistory

	

		INSERT AspNetUserRoles (UserId,RoleId,Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	SELECT A.UserId,A.RoleId,A.Sessionyear, A.CreatedDate,A.CreatedBy_ID, A.ModifiedDate, 
		A.ModifiedBy_ID, A.SchoolID, A.GroupID, A.ISDeleted FROM AspNetUserRoles A  
		INNER JOIN AspNetRoles B ON B.Id = A.RoleId		
		INNER JOIN Navmenu_asprole_permisison_mapping C ON c.Role_id = b.Role_id
		INNER JOIN Navmenu_asprole_permisison_UserGroup_mapping D ON D.Navrolepermisisonmapping_ID = C.Navrolepermisisonmapping_ID
		WHERE D.ISDeleted =0  AND D.AcitiveEdit = 1


	--BELOW START
	--SELECT * FROM Navmenu_asprole_permisison_UserGroup_mapping 
	--	WHERE ISDeleted =1  AND AcitiveEdit = 1

	--	INSERT INTO AspNetRoles(Id,Name, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
	--	ModifiedBy_ID, SchoolID, GroupID, ISDeleted ) VALUES(NEWID(),@RoleName, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
	--	 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

	--	SELECT @RoleId = Id from AspNetRoles
	--	WHERE Name=@RoleName

	--	SELECT @UserId = Id, @UserGroupId = UserGroupId from AspNetUsers
	--	WHERE UserName=@UserName

	--	INSERT INTO AspNetUserRoles(UserId, RoleId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
	--	ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	--	 VALUES(@UserId,@RoleId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
	--	 @ModifiedBy_ID,@SchoolID,@GroupID,0 )
	--BELOW END
		
	END


GO
/****** Object:  StoredProcedure [dbo].[RoleMappingToAspNetUserRoleToDEl]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROC [dbo].[RoleMappingToAspNetUserRoleToDEl] 
@UserName NVARCHAR(256)='a@a.com',
@Action TINYINT =1
AS

DECLARE @CUserId int

SELECT @CUserId=cuserid from AspNetUsers where Email=@UserName
IF @Action=1
	BEGIN

	--case 1: IF A.ISDeleted =TRUE  AND A.AcitiveEdit = TRUE 
	--GET user pr]ermission from Navmenu_asprole_permisison_UserGroup_mapping

	SELECT A.UserGroup_ID,B.Role_id,C.ID, C.Role_id, D.UserId, D.RoleId  FROM Navmenu_asprole_permisison_UserGroup_mapping A
		INNER JOIN Navmenu_asprole_permisison_mapping B ON B.Navrolepermisisonmapping_ID = A.Navrolepermisisonmapping_ID
		INNER JOIN AspNetRoleS  C ON C.Role_id = B.Role_id
		INNER JOIN AspNetUserRoles D ON C.Id = D.RoleId
		--INNER JOIN AspNetUsers E ON E.UserGroupId = A.UserGroup_ID
		WHERE A.ISDeleted =1  AND A.AcitiveEdit = 1 
		ORDER BY A.UserGroup_ID

	-- Insert into History Table AspNetUserRolesHistory

	INSERT AspNetUserRolesHistory (UserId,RoleId,Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	SELECT A.UserId,A.RoleId,A.Sessionyear, A.CreatedDate,@CUserId, A.ModifiedDate, 
		A.ModifiedBy_ID, A.SchoolID, A.GroupID, A.ISDeleted FROM AspNetUserRoles A  
		INNER JOIN AspNetRoles B ON B.Id = A.RoleId		
		INNER JOIN Navmenu_asprole_permisison_mapping C ON c.Role_id = b.Role_id
		INNER JOIN Navmenu_asprole_permisison_UserGroup_mapping D ON D.Navrolepermisisonmapping_ID = C.Navrolepermisisonmapping_ID
		WHERE D.ISDeleted =1  AND D.AcitiveEdit = 1
		---
	--SELECT  D.UserId,D.RoleId,D.Sessionyear, D.CreatedDate,D.CreatedBy_ID, D.ModifiedDate, 
	--	D.ModifiedBy_ID, D.SchoolID, D.GroupID, D.ISDeleted  FROM Navmenu_asprole_permisison_UserGroup_mapping A
	--	INNER JOIN Navmenu_asprole_permisison_mapping B ON B.Navrolepermisisonmapping_ID = A.Navrolepermisisonmapping_ID
	--	INNER JOIN AspNetRoleS  C ON C.Role_id = B.Role_id
	--	INNER JOIN AspNetUserRoles D ON C.Id = D.RoleId
	--	--INNER JOIN AspNetUsers E ON E.UserGroupId = A.UserGroup_ID
	--	WHERE A.ISDeleted =1  AND A.AcitiveEdit = 1 
	--	--ORDER BY A.UserGroup_ID

	----
		--REPLACE D.CreatedBy_ID BY LOGGED IN PARAM ID USERID IN ABOVE SELECT STATEMENT-- completed

		-- DELETE FROM AspNetUserRoles TABLE
		DELETE A FROM AspNetUserRoles A  
		INNER JOIN AspNetRoles B ON B.Id = A.RoleId		
		INNER JOIN Navmenu_asprole_permisison_mapping C ON c.Role_id = b.Role_id
		INNER JOIN Navmenu_asprole_permisison_UserGroup_mapping D ON D.Navrolepermisisonmapping_ID = C.Navrolepermisisonmapping_ID
		WHERE D.ISDeleted =1  AND D.AcitiveEdit = 1 
	
	--case 2: IF A.ISDeleted =FALSE  AND A.AcitiveEdit = TRUE 
	--GET user pr]ermission from Navmenu_asprole_permisison_UserGroup_mapping

	SELECT A.UserGroup_ID,B.Role_id,C.ID, C.Role_id, D.UserId, D.RoleId  FROM Navmenu_asprole_permisison_UserGroup_mapping A
		INNER JOIN Navmenu_asprole_permisison_mapping B ON B.Navrolepermisisonmapping_ID = A.Navrolepermisisonmapping_ID
		INNER JOIN AspNetRoleS  C ON C.Role_id = B.Role_id
		INNER JOIN AspNetUserRoles D ON C.Id = D.RoleId
		--INNER JOIN AspNetUsers E ON E.UserGroupId = A.UserGroup_ID
		WHERE A.ISDeleted =0  AND A.AcitiveEdit = 1 
		ORDER BY A.UserGroup_ID

		--select * from AspNetUserRoles where UserId ='dd088a0f-d797-488f-8810-b2c0764ac570' and RoleId='965D4C79-FE96-479E-84DA-7784563ADA7D'
		--	select * from AspNetUserRoles where UserId ='dd088a0f-d797-488f-8810-b2c0764ac570' and RoleId='F3DDECC6-190D-473B-9ADD-1BF7BC9B878C'
	-- Insert into History Table AspNetUserRolesHistory

	

		INSERT AspNetUserRoles (UserId,RoleId,Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	SELECT A.UserId,A.RoleId,A.Sessionyear, A.CreatedDate,A.CreatedBy_ID, A.ModifiedDate, 
		A.ModifiedBy_ID, A.SchoolID, A.GroupID, A.ISDeleted FROM AspNetUserRoles A  
		INNER JOIN AspNetRoles B ON B.Id = A.RoleId		
		INNER JOIN Navmenu_asprole_permisison_mapping C ON c.Role_id = b.Role_id
		INNER JOIN Navmenu_asprole_permisison_UserGroup_mapping D ON D.Navrolepermisisonmapping_ID = C.Navrolepermisisonmapping_ID
		WHERE D.ISDeleted =0  AND D.AcitiveEdit = 1


	--BELOW START
	--SELECT * FROM Navmenu_asprole_permisison_UserGroup_mapping 
	--	WHERE ISDeleted =1  AND AcitiveEdit = 1

	--	INSERT INTO AspNetRoles(Id,Name, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
	--	ModifiedBy_ID, SchoolID, GroupID, ISDeleted ) VALUES(NEWID(),@RoleName, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
	--	 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

	--	SELECT @RoleId = Id from AspNetRoles
	--	WHERE Name=@RoleName

	--	SELECT @UserId = Id, @UserGroupId = UserGroupId from AspNetUsers
	--	WHERE UserName=@UserName

	--	INSERT INTO AspNetUserRoles(UserId, RoleId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
	--	ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
	--	 VALUES(@UserId,@RoleId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
	--	 @ModifiedBy_ID,@SchoolID,@GroupID,0 )
	--BELOW END
		
	END


GO
/****** Object:  StoredProcedure [dbo].[SampleFilterSP]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SampleFilterSP]
(
	   @SelectColumn  NVARCHAR(max) ='',-- 'Enquiry.Enquiry_ID, CandidateDetail.CandidateDetail_ID, CandidateDetail.FirstName, CandidateDetail.HomePhone ',
       @SearchValue NVARCHAR(max) ='', -- 'WHERE CandidateDetail.FirstName LIKE ''%j%''',
       @PageNo INT = 1,
       @PageSize INT = 10,
       @SortColumn NVARCHAR(500) ='',-- 'CandidateDetail.FirstName',
       @SortOrder NVARCHAR(20) = ''--'DESC'
)
 AS BEGIN
 SET NOCOUNT ON;
 IF(@SelectColumn!='')
 BEGIN

 DECLARE @query NVARCHAR(MAX)
 SET @query=
' ; WITH CTE_Results AS
(
    SELECT '+@SelectColumn+' FROM [dbo].[Enquiry] 
LEFT JOIN [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID=CandidateDetail.Enquiry_ID
LEFT JOIN [dbo].[Application]  ON Enquiry.Enquiry_ID=Application.Enquiry_ID
LEFT JOIN [dbo].[Registration]  ON Enquiry.Enquiry_ID=Registration.Enquiry_ID
LEFT JOIN [dbo].[EnquiryType]  ON Enquiry.EnquiryType_ID=EnquiryType.EnquiryType_ID
LEFT JOIN [dbo].[MarketingSource]  ON Enquiry.MarketSource_ID=MarketingSource.MarketingSource_ID
 
       '+@SearchValue+'   
      
                 ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
      
 
      OFFSET ' +CONVERT(varchar(50), @PageSize)+' * (' +CONVERT(varchar(50),@PageNo)+' - 1) ROWS
      FETCH NEXT ' +CONVERT(varchar(50),@PageSize)+' ROWS ONLY
       ),
CTE_TotalRows AS
(
   select count(Enquiry.Enquiry_ID) as MaxRows  FROM [dbo].[Enquiry]  
LEFT JOIN [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID=CandidateDetail.Enquiry_ID
LEFT JOIN [dbo].[Application]  ON Enquiry.Enquiry_ID=Application.Enquiry_ID
LEFT JOIN [dbo].[Registration]  ON Enquiry.Enquiry_ID=Registration.Enquiry_ID
LEFT JOIN [dbo].[EnquiryType]  ON Enquiry.EnquiryType_ID=EnquiryType.EnquiryType_ID
LEFT JOIN [dbo].[MarketingSource]  ON Enquiry.MarketSource_ID=MarketingSource.MarketingSource_ID 
   ' +@SearchValue+'
 
)
   Select MaxRows,  '+@SelectColumn+' FROM [dbo].[Enquiry] 
LEFT JOIN [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID=CandidateDetail.Enquiry_ID
LEFT JOIN [dbo].[Application]  ON Enquiry.Enquiry_ID=Application.Enquiry_ID
LEFT JOIN [dbo].[Registration]  ON Enquiry.Enquiry_ID=Registration.Enquiry_ID
LEFT JOIN [dbo].[EnquiryType]  ON Enquiry.EnquiryType_ID=EnquiryType.EnquiryType_ID
LEFT JOIN [dbo].[MarketingSource]  ON Enquiry.MarketSource_ID=MarketingSource.MarketingSource_ID
 , CTE_TotalRows
   WHERE EXISTS (SELECT 1 FROM CTE_Results WHERE CTE_Results.Enquiry_ID = Enquiry.Enquiry_ID)
 
    ORDER BY '+ @SortColumn+ '  '+ @SortOrder+'
 
   OPTION (RECOMPILE)'
  print @query
  EXEC (@query)
 
  END

 END
GO
/****** Object:  StoredProcedure [dbo].[SampleFilterSP_New]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SampleFilterSP_New]
AS BEGIN
	declare @SearchValue NVARCHAR(50) = NULL
	declare @PageNo INT = 0
	declare @PageSize INT = 5
	declare @SortColumn NVARCHAR(20) = 'CandidateDetail.FirstName'
	declare @SortOrder NVARCHAR(20) = 'ASC'
	


 SET NOCOUNT ON;

 SET @SearchValue = LTRIM(RTRIM(@SearchValue))

 SELECT  (select count(Enquiry.Enquiry_ID)  from Enquiry) as MaxRows, Enquiry.Enquiry_ID, CandidateDetail.CandidateDetail_ID, CandidateDetail.FirstName, CandidateDetail.HomePhone  FROM [dbo].[Enquiry] 
LEFT JOIN [dbo].[CandidateDetail]  ON Enquiry.Enquiry_ID=CandidateDetail.Enquiry_ID
LEFT JOIN [dbo].[Application]  ON Enquiry.Enquiry_ID=Application.Enquiry_ID
LEFT JOIN [dbo].[Registration]  ON Enquiry.Enquiry_ID=Registration.Enquiry_ID
LEFT JOIN [dbo].[EnquiryType]  ON Enquiry.EnquiryType_ID=EnquiryType.EnquiryType_ID
LEFT JOIN [dbo].[MarketingSource]  ON Enquiry.MarketSource_ID=MarketingSource.MarketingSource_ID

	WHERE (@SearchValue IS NULL OR FirstName LIKE '%' + @SearchValue + '%') 
	 	    ORDER BY CandidateDetail.FirstName DESC
   
      OFFSET @PageNo ROWS
      FETCH NEXT @PageSize ROWS ONLY
  END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMasterTable]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procEDURE [dbo].[UpdateMasterTable] 

@SchoolId Int=0 ,
@GroupId INT=0

AS
BEGIN
   Update [dbo].[MasterTable] set IsDefault = 0 Where SchoolID=@SchoolId AND GroupID=@GroupId AND IsDefault=1
END





GO
/****** Object:  StoredProcedure [dbo].[usp_Permission_seq1]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Permission_seq1]
@VUserName NVARCHAR(256),
@RoleName NVARCHAR(256),
@Action TINYINT =1

AS
--Declare all varibale
DECLARE @RoleId NVARCHAR(128)
DECLARE @UserId NVARCHAR(128) 
DECLARE @UserName NVARCHAR(256) 
DECLARE @UserGroupId int
DECLARE @Sessionyear int
DECLARE @CreatedBy_ID int
DECLARE @ModifiedBy_ID int
DECLARE @SchoolID int
DECLARE @GroupID int
DECLARE @CRole_Id  int
DECLARE @VUserId NVARCHAR(128)
--DECLARE @CUser_Id  int

--Set all variable
SET @UserName= 'a@a.com';
SET @UserGroupId  = 1
SET @Sessionyear = 1
SET @CreatedBy_ID = 1
SET @ModifiedBy_ID = 1
SET @SchoolID = 1
SET @GroupID = 1

IF NOT EXISTS (SELECT email from AspNetUsers WHERE UserName=@VUserName)
		BEGIN
			PRINT 'USER DOES NOT EXIST'
			RETURN
		END

IF  EXISTS (SELECT Name from AspNetRoles WHERE Name=@RoleName)
		BEGIN
			PRINT 'Role name already EXIST'
			RETURN
		END

IF @Action=1 -- INSERT into AspNetRoles table and AspNetUserRoles table
	BEGIN
		--SELECT  @CRole_Id=MAX(Role_id) from AspNetRoles
		--SELECT  @CUser_Id=cuserid   from AspNetUsers WHERE UserName=@VUserName

		INSERT INTO AspNetRoles(Id,Name, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted ) VALUES(NEWID(),@RoleName, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		SELECT @RoleId = Id, @CRole_Id=Role_id from AspNetRoles
		WHERE Name=@RoleName

		SELECT @UserId = Id from AspNetUsers
		WHERE UserName=@UserName
		
		SELECT @VUserId = Id, @UserGroupId = UserGroupId from AspNetUsers
		WHERE UserName=@VUserName


		INSERT INTO AspNetUserRoles(UserId, RoleId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
		 VALUES(@UserId,@RoleId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		 INSERT INTO AspNetUserRoles(UserId, RoleId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
		 VALUES(@VUserId,@RoleId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		PRINT 'Role_Id = '+ CAST(@CRole_Id as varchar(max)) + '::' + 'User Group Id = '+ CAST(@UserGroupId as varchar(max))
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_Permission_seq2]    Script Date: 8/15/2019 10:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Permission_seq2]
@RoleId int,
@NavigationMenu_Id int,
@Permission_Id int,
@UserGroup_ID int,
@Action TINYINT =1

AS
--Declare all varibale
--DECLARE @RoleId NVARCHAR(128)
--DECLARE @UserId NVARCHAR(128) 
--DECLARE @UserName NVARCHAR(256) 
--DECLARE @UserGroupId int
DECLARE @Sessionyear int
DECLARE @CreatedBy_ID int
DECLARE @ModifiedBy_ID int
DECLARE @SchoolID int
DECLARE @GroupID int
--DECLARE @CRole_Id  int
--Set all variable
--SET @UserName= 'a@a.com';
--SET @UserGroupId  = 1
SET @Sessionyear = 1
SET @CreatedBy_ID = 1
SET @ModifiedBy_ID = 1
SET @SchoolID = 1
SET @GroupID = 1

IF @Action=1 -- INSERT into Navmenu_asprole_permisison_mapping table and Navmenu_asprole_permisison_UserGroup_mapping table
	BEGIN

	INSERT INTO Navmenu_asprole_permisison_mapping(
	[NavigationMenu_Id]
      ,[Role_id]
      ,[Permission_Id]
      ,[Sessionyear]
      ,[CreatedDate]
      ,[CreatedBy_ID]
      ,[ModifiedDate]
      ,[ModifiedBy_ID]
      ,[SchoolID]
      ,[GroupID]
      ,[ISDeleted])
	VALUES(@NavigationMenu_Id, @RoleId, @Permission_Id, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0)

		 DECLARE @Navrolepermisisonmapping_ID int
		 SELECT @Navrolepermisisonmapping_ID =  SCOPE_IDENTITY()

	INSERT INTO Navmenu_asprole_permisison_UserGroup_mapping([Navrolepermisisonmapping_ID]
      ,[UserGroup_ID]
      ,[Sessionyear]
      ,[CreatedDate]
      ,[CreatedBy_ID]
      ,[ModifiedDate]
      ,[ModifiedBy_ID]
      ,[SchoolID]
      ,[GroupID]
      ,[ISDeleted])
	VALUES(@Navrolepermisisonmapping_ID, @UserGroup_ID,  @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		 @ModifiedBy_ID,@SchoolID,@GroupID,0)
	
		--SELECT  @CRole_Id=MAX(Role_id) from AspNetRoles
		--INSERT INTO AspNetRoles(Id,Name, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		--ModifiedBy_ID, SchoolID, GroupID, ISDeleted,Role_id ) VALUES(NEWID(),@RoleName, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		-- @ModifiedBy_ID,@SchoolID,@GroupID,0,@CRole_Id )

		--SELECT @RoleId = Id, @CRole_Id=Role_id from AspNetRoles
		--WHERE Name=@RoleName

		--SELECT @UserId = Id, @UserGroupId = UserGroupId from AspNetUsers
		--WHERE UserName=@UserName

		--INSERT INTO AspNetUserRoles(UserId, RoleId, Sessionyear, CreatedDate,CreatedBy_ID, ModifiedDate, 
		--ModifiedBy_ID, SchoolID, GroupID, ISDeleted)
		-- VALUES(@UserId,@RoleId, @Sessionyear, GETDATE(),@CreatedBy_ID,GETDATE(),
		-- @ModifiedBy_ID,@SchoolID,@GroupID,0 )

		--PRINT @NavigationMenuId
	END
GO
