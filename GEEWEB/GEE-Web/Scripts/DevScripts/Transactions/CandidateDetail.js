var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

var dropdownData = [];
var isAllValid = true;
//var ddlid;
$('#submit').click(function () {
    
    var CUserId = $('#CUserId').val();
    var CandId = $('#CandidateId').text();

    isAllValid = checkValidationOnSubmit();
    if (isAllValid) {

        var data = {
            CandidateDetail_ID: CandId,
            Enquiry_ID: $('#GEE1010mdEnquiry_ID').val() == undefined ? 0 : $('#GEE1010mdEnquiry_ID').val().trim(),
            AdmissionClass_id: $('#GEE1010mdAdmissionClass_id').val() == undefined ? 0 : $('#GEE1010mdAdmissionClass_id').val().trim(),
            LastPassClass_ID: $('#GEE1010mdLastPassClass_ID').val() == undefined ? 0 : $('#GEE1010mdLastPassClass_ID').val().trim(),
            SubjectId: $('#GEE1010mdSubjectId').val() == undefined ? 0 : $('#GEE1010mdSubjectId').val().trim(),
            FirstName: $("#GEE1010mdFirstName").val() == undefined ? '' : $("#GEE1010mdFirstName").val().trim() ,
            MiddleName: $("#GEE1010mdMiddleName").val() == undefined ? '' : $("#GEE1010mdMiddleName").val().trim() ,
            Lastname: $("#GEE1010mdLastname").val() == undefined ? '' : $("#GEE1010mdLastname").val().trim(),
            DOB: $("#GEE1010mdDOB").val() == undefined ? '' : $("#GEE1010mdDOB").val().trim(),
            Email: $("#GEE1010mdEmail").val() == undefined ? '' : $("#GEE1010mdEmail").val().trim() ,
            StudentType_ID: $('#GEE1010mdStudentType_ID').val() == undefined ? 0 : $('#GEE1010mdStudentType_ID').val().trim(),
            ContactMobileNo: $("#GEE1010mdContactMobNo").val() == undefined ? '' : $("#GEE1010mdContactMobNo").val().trim() ,
            HomePhone: $("#GEE1010mdHomePhoneNo").val() == undefined ? '' : $("#GEE1010mdHomePhoneNo").val().trim(),
            Gender: $('#GEE1010mdGender').val() == undefined ? 0 : $('#GEE1010mdGender').val().trim(),
            Nationality: $("#GEE1010mdNationality").val() == undefined ? '' : $("#GEE1010mdNationality").val().trim(),
            hasSibiling: $('#GEE1010mdhasSibiling').val().trim(),
            SiblingAdmNumber_ID: $("#GEE1010mdSiblingAdmNumber").val() == undefined ? '' : $("#GEE1010mdSiblingAdmNumber").val().trim(),
            Address1: $("#GEE1010mdAddress1").val() == undefined ? '' : $("#GEE1010mdAddress1").val().trim() ,
            Address2: $("#GEE1010mdAddress2").val() == undefined ? '' : $("#GEE1010mdAddress2").val().trim() ,
            City: $('#GEE1010mdCity_ID').val() == undefined ? 0 : $('#GEE1010mdCity_ID').val().trim(),
            State_ID: $('#GEE1010mdState_ID').val() == undefined ? 0 : $('#GEE1010mdState_ID').val().trim(),
            
            PinCode: $("#GEE1010mdPinCode").val() == undefined ? '' : $("#GEE1010mdPinCode").val().trim() ,
            Landmark: $("#GEE1010mdLandmark").val() == undefined ? '' : $("#GEE1010mdLandmark").val().trim(),
            Country: $('#GEE1010mdCountry_ID').val() == undefined ? 0 : $('#GEE1010mdCountry_ID').val().trim(),
            DistanceFromSchool: $("#GEE1010mdDistanceFromSchool").val() == undefined ? '' : $("#GEE1010mdDistanceFromSchool").val().trim(),
            Caste_ID: $('#GEE1010mdCaste_ID').val() == undefined ? 0 : $('#GEE1010mdCaste_ID').val().trim(),
            Religon_ID: $('#GEE1010mdReligon_ID').val() == undefined ? 0 : $('#GEE1010mdReligon_ID').val().trim(),
            FatheFirstName: $("#GEE1010mdFatheFirstName").val() == undefined ? '' : $("#GEE1010mdFatheFirstName").val().trim() ,
            FatherMiddleName: $("#GEE1010mdFatherMiddleName").val() == undefined ? '' : $("#GEE1010mdFatherMiddleName").val().trim() ,
            FatherQualificaiton_ID: $('#GEE1010mdFatherQualificaiton_ID').val() == undefined ? '' : $("#GEE1010mdFatherQualificaiton_ID").val().trim(),

            FatherQualificaitonText: $("#GEE1010mdFatherQualificaitonText").val() == undefined ? '' : $("#GEE1010mdFatherQualificaitonText").val().trim() ,
            FatherOccupation: $("#GEE1010mdFatherOccupation").val() == undefined ? '' : $("#GEE1010mdFatherOccupation").val().trim(),
            FatherOfficeAddres: $("#GEE1010mdFatherOfficeAddres").val() == undefined ? '' : $("#GEE1010mdFatherOfficeAddres").val().trim() ,
            FatherOrgnisation: $("#GEE1010mdFatherOrgnisation").val() == undefined ? '' : $("#GEE1010mdFatherOrgnisation").val().trim() ,
            FatherDesignation: $("#GEE1010mdFatherDesignation").val() == undefined ? '' : $("#GEE1010mdFatherDesignation").val().trim() ,
            MotherFirstName: $('#GEE1010mdMotherFirstName').val() == undefined ? '' : $("#GEE1010mdMotherFirstName").val().trim(),
            MotherMiddleName: $("#GEE1010mdMotherMiddleName").val() == undefined ? '' : $("#GEE1010mdMotherMiddleName").val().trim(),
            MotherLasttName: $("#GEE1010mdMotherLasttName").val() == undefined ? '' : $("#GEE1010mdMotherLasttName").val().trim() ,
            MotherQualificaiton_Id: $('#GEE1010mdMotherQualificaiton_Id').val() == undefined ? '' : $("#GEE1010mdMotherQualificaiton_Id").val().trim(),
            MotherQualificaitonText: $("#GEE1010mdMotherQualificaitonText").val() == undefined ? '' : $("#GEE1010mdMotherQualificaitonText").val().trim() ,
            MotherOccupation: $("#GEE1010mdMotherOccupation").val() == undefined ? '' : $("#GEE1010mdMotherOccupation").val().trim() ,
            MotherOfficeAddres: $("#GEE1010mdMotherOfficeAddres").val() == undefined ? '' : $("#GEE1010mdMotherOfficeAddres").val().trim(),
            MotherOrgnisation: $("#GEE1010mdMotherOrgnisation").val() == undefined ? '' : $("#GEE1010mdMotherOrgnisation").val().trim() ,
            MotherDesignation: $("#GEE1010mdMotherDesignation").val() == undefined ? '' : $("#GEE1010mdMotherDesignation").val().trim() ,
            CurrentSchool: $("#GEE1010mdCurrentSchool").val() == undefined ? '' : $("#GEE1010mdCurrentSchool").val().trim() ,
            CurrentSchoolCity: $("#GEE1010mdCurrentSchoolCity").val() == undefined ? '' : $("#GEE1010mdCurrentSchoolCity").val().trim() ,
            IsGovtTransfer: $('#GEE1010mdGovtTransfer').val() == undefined ? 0 : $('#GEE1010mdGovtTransfer').val().trim(),
            Remarks: $("#GEE1010mdRemarks").val() == undefined ? '' : $("#GEE1010mdRemarks").val().trim() ,
            CommunicationMode: $("#GEE1010mdCommunicationMode").val() == undefined ? '' : $("#GEE1010mdCommunicationMode").val().trim() 

        }
        
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
            data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
            CommonAjaxMethod('/CandidateDetail/Edit', data, true, 'POST');
    }
});

//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid) {

    if (isValid) {
        $('#GEE1010mdFirstName,#GEE1010mdDate,#GEE1010mdDOB,#GEE1010mdMiddleName,#GEE1010mdLastName,#GEE1010mdEmail,#GEE1010mdContactMobNo,#GEE1010mdHomePhoneNo,#GEE1010mdFatherFirstName').val('');
        $("#GEE1010mdEnquiry_ID,#GEE1010mdAdmissionClass_id,#GEE1010mdLastPassClass_ID,GEE1010mdCaste_ID,GEE1010mdReligon_ID,GEE1010mdFatherQualificaiton_ID,GEE1010mdMotherQualificaiton_Id").val("0").change();
    }
    else {
        $('#submit').val('Save');
    }
}


function BindFilterCaondidateData(PKID) {

    var CandId = PKID;
    $.ajax({
        type: 'GET',
        url: '/CandidateDetail/Editasy',
        data: { Id: CandId },
        dataType: "json",
        success: function (response) {
            console.log("response", response);
            CandidatesDetails = response;
            BindEdit();
        },
        error: function () {
            alert(" An error occurred.6");
        },
    })

}


$(document).ready(function () {
    var ctrlArray = new Array("submit");

    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        //GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);
    });

    $.getScript(combojsURL, function myfunction() {
        LoadCombo('GEE1010mdStudentType_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.StudentType + '');
        LoadCombo('GEE1010mdEnquiry_ID', 'Enquiry', 'EnquiryNo', 'Enquiry_ID', 'ISDeleted=0 AND EnquiryNo IS NOT NULL');
        LoadCombo('GEE1010mdReligon_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Religion + '');
        LoadCombo('GEE1010mdCity_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.City + '');
        LoadCombo('GEE1010mdState_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.State + '');
        LoadCombo('GEE1010mdCountry_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Country + '');
        LoadCombo('GEE1010mdCaste_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.CastCategory + '');
        LoadCombo('GEE1010mdSubjectId', 'Subject', 'SubjectName', 'Subject_ID', 'ISDeleted=0');
        LoadCombo('GEE1010mdGender', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Gender + '');
        LoadCombo('GEE1010mdFatherQualificaiton_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Qualificaton + '');
        LoadCombo('GEE1010mdMotherQualificaiton_Id', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Qualificaton + '');
        LoadCombo('GEE1010mdAdmissionClass_id', 'ClassMaster', 'Name', 'ClassMaster_ID','IsDeleted=0')
        LoadCombo('GEE1010mdLastPassClass_ID', 'ClassMaster', 'Name', 'ClassMaster_ID','IsDeleted=0')

    });
      

});

$('#GEE1010mdEnquiry_ID').on('change', function () {
    var EnquiryId = $(this).val();
    $.ajax({
        type: 'GET',
        url: '/CandidateDetail/GetCandidateDetailsByEnquiryId',
        data: { Id: EnquiryId },
        dataType: "json",
        success: function (response) {
            console.log("response", response);
            CandidatesDetails = response;
            BindEdit();
        },
        error: function () {
            alert(" An error occurred.6");
        },
    })
});

function BindEdit() {
    $('#CandidateId').text(CandidatesDetails.CandidateDetail_ID);
    $('#CandidateId').val(CandidatesDetails.CandidateDetail_ID);

    LoadCombo('GEE1010mdAdmissionClass_id', 'ClassMaster', 'Name', 'ClassMaster_ID', 'IsDeleted=0', CandidatesDetails.AdmissionClass_id);
    LoadCombo('GEE1010mdStudentType_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.StudentType + '', CandidatesDetails.StudentType_ID);
    LoadCombo('GEE1010mdReligon_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Religion + '', CandidatesDetails.Religon_ID);
    LoadCombo('GEE1010mdCity_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.City + '', CandidatesDetails.City_ID);
    LoadCombo('GEE1010mdState_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.State + '', CandidatesDetails.State_ID);
    LoadCombo('GEE1010mdCountry_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Country + '', CandidatesDetails.Country_ID);
    LoadCombo('GEE1010mdCaste_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.CastCategory + '', CandidatesDetails.Caste_ID);
    LoadCombo('GEE1010mdSubjectId', 'Subject', 'SubjectName', 'Subject_ID', 'ISDeleted=0', CandidatesDetails.SubjectId);
    LoadCombo('GEE1010mdGender', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Gender + '', CandidatesDetails.Gender);
    LoadCombo('GEE1010mdFatherQualificaiton_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Qualificaton + '', CandidatesDetails.FatherQualificaiton_ID);
    LoadCombo('GEE1010mdMotherQualificaiton_Id', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Qualificaton + '', CandidatesDetails.MotherQualificaiton_Id);
    LoadCombo('GEE1010mdLastPassClass_ID', 'ClassMaster', 'Name', 'ClassMaster_ID', 'IsDeleted=0', CandidatesDetails.LastPassClass_ID);

    $('#GEE1010mdhasSibiling').val(CandidatesDetails.hasSibiling == true ? 1 : 2).change();
    $('#GEE1010mdIsGovtTransfer').val(CandidatesDetails.IsGovtTransfer == true ? 1 : 2).change();
    $("#GEE1010mdFirstName").val(CandidatesDetails.FirstName);
    $("#GEE1010mdMiddleName").val(CandidatesDetails.MiddleName);
    $("#GEE1010mdLastname").val(CandidatesDetails.Lastname);
    $("#GEE1010mdDOB").val(CandidatesDetails.DOB);
    $("#GEE1010mdDistanceFromSchool").val(CandidatesDetails.DistanceFromSchool);
    $("#GEE1010mdFatherLastName").val(CandidatesDetails.FatherLasttName);
    $("#GEE1010mdEmail").val(CandidatesDetails.Email);
    $("#GEE1010mdContactMobileNo").val(CandidatesDetails.ContactMobileNo);
    $("#GEE1010mdHomePhone").val(CandidatesDetails.HomePhone);
    $("#GEE1010mdNationality").val(CandidatesDetails.Nationality);
    $("#GEE1010mdSiblingAdmNumber_ID").val(CandidatesDetails.SiblingAdmNumber_ID);
    $("#GEE1010mdAddress1").val(CandidatesDetails.Address1);
    $("#GEE1010mdAddress2").val(CandidatesDetails.Address2);
    $("#GEE1010mdPinCode").val(CandidatesDetails.PinCode);
    $("#GEE1010mdLandmark").val(CandidatesDetails.Landmark);
    $("#GEE1010mdDistanceFromSchool").val(CandidatesDetails.DistanceFromSchool);
    $("#GEE1010mdFatheFirstName").val(CandidatesDetails.FatheFirstName);
    $("#GEE1010mdFatherMiddleName").val(CandidatesDetails.FatherMiddleName);
    $("#GEE1010mdFatherQualificaitonText").val(CandidatesDetails.FatherQualificaitonText);
    $("#GEE1010mdFatherOccupation").val(CandidatesDetails.FatherOccupation);
    $("#GEE1010mdFatherOfficeAddres").val(CandidatesDetails.FatherOfficeAddres);
    $("#GEE1010mdFatherOrgnisation").val(CandidatesDetails.FatherOrgnisation);
    $("#GEE1010mdFatherDesignation").val(CandidatesDetails.FatherDesignation);
    $('#GEE1010mdMotherFirstName').val(CandidatesDetails.MotherFirstName);
    $("#GEE1010mdMotherMiddleName").val(CandidatesDetails.MotherMiddleName);
    $("#GEE1010mdMotherLasttName").val(CandidatesDetails.MotherLasttName);
    $("#GEE1010mdMotherQualificaitonText").val(CandidatesDetails.MotherQualificaitonText);
    $("#GEE1010mdMotherOccupation").val(CandidatesDetails.MotherOccupation);
    $("#GEE1010mdMotherOfficeAddres").val(CandidatesDetails.MotherOfficeAddres);
    $("#GEE1010mdMotherOrgnisation").val(CandidatesDetails.MotherOrgnisation);
    $("#GEE1010mdMotherDesignation").val(CandidatesDetails.MotherDesignation);
    $("#GEE1010mdCurrentSchool").val(CandidatesDetails.CurrentSchool);
    $("#GEE1010mdCurrentSchoolCity").val(CandidatesDetails.CurrentSchoolCity);
    $("#GEE1010mdRemarks").val(CandidatesDetails.Remarks);
    $("#GEE1010mdCommunicationMode").val(CandidatesDetails.CommunicationMode);


}