var EnquiryDetails = []
var dropdownData = [];
var isAllValid = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#Update').click(function () {
    var Enquiry_ID = $('#EnquiryId').val();
    isAllValid = checkValidationOnSubmit(); 
    if (isAllValid) {

        try {
            var checkedValue = $('#cbHasSibiling:checked').val();
            var data = {
                Enquiry_ID: Enquiry_ID,
                SiblingAdmNumber_ID: $('#Enquiry1001mdSiblingAdmNumber_ID').val() == undefined ? 0 : $('#Enquiry1001mdSiblingAdmNumber_ID').val().trim(),
                ApplicaitonNo: $('#Enquiry1001mdApplicaitonNo').val() == undefined ? 0 : $('#Enquiry1001mdApplicaitonNo').val().trim(),
                EnquiryNo: $("#txtEnquiryNo").val() == undefined ? 0 : $('#txtEnquiryNo').val().trim(),
                StudentType_ID: $('#ddlStudentType').val() == undefined ? 0 : $('#ddlStudentType').val().trim(),
                AdmissionClass_id: $('#Enquiry1001mdAdmissionClass_id').val() == undefined ? 0 : $('#Enquiry1001mdAdmissionClass_id').val().trim(),
                FirstName: $("#Enquiry1001mdFirstName").val() == undefined ? '' : $("#Enquiry1001mdFirstName").val().trim(),
                MiddleName: $("#Enquiry1001mdMiddleName").val() == undefined ? '' : $("#Enquiry1001mdMiddleName").val().trim(),
                Lastname: $("#Enquiry1001mdLastname").val() == undefined ? '' : $("#Enquiry1001mdLastname").val().trim(),
                DOB: $("#Enquiry1001mdDOB").val() == undefined ? '' : $("#Enquiry1001mdDOB").val().trim(),
                SubjectId: $("#ddlSubject").val().trim(),
                ContactMobileNo: $("#Enquiry1001mdContactMobileNo").val() == undefined ? '' : $("#Enquiry1001mdContactMobileNo").val().trim(),
                Email: $("#Enquiry1001mdEmail").val() == undefined ? '' : $("#Enquiry1001mdEmail").val().trim(),
                SiblingAdmNumber_ID: $("#Enquiry1001mdSiblingAdmNumber_ID").val() == undefined ? '' : $("#Enquiry1001mdSiblingAdmNumber_ID").val().trim(),
                Address1: $("#Enquiry1001mdAddress1").val() == undefined ? '' : $("#Enquiry1001mdAddress1").val().trim(),
                Address2: $("#Enquiry1001mdAddress2").val() == undefined ? '' : $("#Enquiry1001mdAddress2").val().trim(),
                City_ID: $('#Enquiry1001mdCity_ID').val() == undefined ? 0 : $('#Enquiry1001mdCity_ID').val().trim(),
                State_ID: $('#Enquiry1001mdState_ID').val() == undefined ? 0 : $('#Enquiry1001mdState_ID').val().trim(),
                Country_ID: $('#Enquiry1001mdCountry_ID').val() == undefined ? 0 : $('#Enquiry1001mdCountry_ID').val().trim(),

                MotherFirstName: $('#Enquiry1001mdMotherFirstName').val().trim(),
                MotherMiddleName: $("#Enquiry1001mdMotherMiddleName").val() == undefined ? '' : $("#Enquiry1001mdMotherMiddleName").val().trim(),
                MotherLasttName: $("#Enquiry1001mdMotherLasttName").val() == undefined ? '' : $("#Enquiry1001mdMotherLasttName").val().trim(),
                MotherPhoneNumber: $("#Enquiry1001mdMotherPhoneNumber").val() == undefined ? '' : $("#Enquiry1001mdMotherPhoneNumber").val().trim(),

                FatheFirstName: $("#Enquiry1001mdFatheFirstName").val() == undefined ? '' : $("#Enquiry1001mdFatheFirstName").val().trim(),
                FatherMiddleName: $("#Enquiry1001mdFatherMiddleName").val() == undefined ? '' : $("#Enquiry1001mdFatherMiddleName").val().trim(),
                FatherLasttName: $("#Enquiry1001mdFatherLasttName").val() == undefined ? '' : $("#Enquiry1001mdFatherLasttName").val().trim(),
                FatherPhoneNumber: $("#Enquiry1001mdFatherPhoneNumber").val() == undefined ? '' : $("#Enquiry1001mdFatherPhoneNumber").val().trim(),

                MarketSource_ID: $('#Enquiry1001mdMarketSource_ID').val() == undefined ? '' : $('#Enquiry1001mdMarketSource_ID').val().trim(),
                EnquiryType_ID: $('#Enquiry1001mdEnquiryType_ID').val() == undefined ? 0 : $('#Enquiry1001mdEnquiryType_ID').val().trim()
            }
        } catch (e) {
            console.log("error", e);
        }
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/Enquiry/Edit', data, true, 'POST');

    }
});

function FormControlValueClear(isValid) {
    if (isValid) {
        $('#Enquiry1001mdFirstName,#txtDate,#Enquiry1001mdDOB,#Enquiry1001mdMiddleName,#Enquiry1001mdLastname,#Enquiry1001mdEmail,#txtContactMobNo,#txtHomePhoneNo,#txtFatherFirstName').val('');
        $("#ddlEnquiry,#Enquiry1001mdAdmissionClass_id,#ddlLastPassClass,#ddlCast,#ddlReligon,#ddlFatherQualification,#ddlMotherQualification").val("0").change();
    }
    else {
        $('#submit').val('Save');
    }
}

$(document).ready(function () {
        var ctrlArray = new Array("submit");

    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        // GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);

    });

    $.getScript(combojsURL, function myfunction() {
        var CUserId = $('#EnquiryId').val() == undefined ? "" : $('#EnquiryId').val();
        if (CUserId != "")
            GetEnquiryDetails();
        else {
            LoadCombo('ddlSubject', 'Subject', 'SubjectName', 'Subject_ID', 'ISDeleted=0');
            LoadCombo('ddlStudentType', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.StudentType + '');
            //LoadCombo('ddlSubject', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.sub + '');
            LoadCombo('Enquiry1001mdEnquiryType_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.EnquiryType + '');
            LoadCombo('Enquiry1001mdMarketSource_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.MarketingSource + '');
            LoadCombo('Enquiry1001mdCity_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.City + '');
            LoadCombo('Enquiry1001mdState_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.State + '');
            LoadCombo('Enquiry1001mdCountry_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Country + '');
        }
    });

    function GetEnquiryDetails() {
        var EnquiryId = $('#EnquiryId').val();
        $.ajax({
            type: 'GET',
            url: '/Enquiry/Editasy',
            data: { Id: EnquiryId },
            dataType: "json",
            success: function (response) {
                EnquiryDetails = response;
                BindEdit();
            },
            error: function () {
                alert(" An error occurred.10");
            },
        })
    }

    function BindEdit() {
        console.log(EnquiryDetails);
        if (EnquiryDetails.HasSibiling == true) {
            $('#cbHasSibiling:checked').val();
        }
        if (EnquiryDetails.Applicationsold == true) {
            $('#cbSellApplication:checked').val();
        }
        $('#Enquiry1001mdSiblingAdmNumber_ID').val(EnquiryDetails.SiblingAdmNumber_ID);
        $('#Enquiry1001mdApplicaitonNo').val(EnquiryDetails.Applications[0].ApplicaitonNo);
        $("#txtEnquiryNo").val(EnquiryDetails.EnquiryNo);
        //$('#ddlStudentType').val(EnquiryDetails.StudentType_ID).change();
        LoadCombo('ddlStudentType', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.StudentType + '', EnquiryDetails.CandidateDetails[0].StudentType_ID.toString());
        $('#Enquiry1001mdAdmissionClass_id').val(EnquiryDetails.AdmissionClass_id).change();

        $("#Enquiry1001mdFirstName").val(EnquiryDetails.CandidateDetails[0].FirstName);
        $("#Enquiry1001mdMiddleName").val(EnquiryDetails.CandidateDetails[0].MiddleName);
        $("#Enquiry1001mdLastname").val(EnquiryDetails.CandidateDetails[0].Lastname);
        $("#Enquiry1001mdDOB").val(EnquiryDetails.CandidateDetails[0].CDB);
        //$("#ddlSubject").val(EnquiryDetails.SubjectId).change();
        LoadCombo('ddlSubject', 'Subject', 'SubjectName', 'Subject_ID', 'ISDeleted=0', EnquiryDetails.CandidateDetails[0].SubjectId.toString());

        $("#Enquiry1001mdContactMobileNo").val(EnquiryDetails.CandidateDetails[0].ContactMobileNo);
        $("#Enquiry1001mdEmail").val(EnquiryDetails.CandidateDetails[0].Email);
        $("#Enquiry1001mdSiblingAdmNumber_ID").val(EnquiryDetails.SiblingAdmNumber_ID);
        $("#Enquiry1001mdAddress1").val(EnquiryDetails.CandidateDetails[0].Address1);
        $("#Enquiry1001mdAddress2").val(EnquiryDetails.CandidateDetails[0].Address2);
        //$('#Enquiry1001mdCity_ID').val(EnquiryDetails.City_ID).change();
        //$('#Enquiry1001mdState_ID').val(EnquiryDetails.State_ID).change();
        //$('#Enquiry1001mdCountry_ID').val(EnquiryDetails.Country_ID).change();
        LoadCombo('Enquiry1001mdCity_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.City + '', EnquiryDetails.CandidateDetails[0].City_ID.toString());
        LoadCombo('Enquiry1001mdState_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.State + '', EnquiryDetails.CandidateDetails[0].State_ID.toString());
        LoadCombo('Enquiry1001mdCountry_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Country + '', EnquiryDetails.CandidateDetails[0].Country_ID.toString());
        $('#Enquiry1001mdMotherFirstName').val(EnquiryDetails.CandidateDetails[0].MotherFirstName);                                                 
        $("#Enquiry1001mdMotherMiddleName").val(EnquiryDetails.CandidateDetails[0].MotherMiddleName);
        $("#Enquiry1001mdMotherLasttName").val(EnquiryDetails.CandidateDetails[0].MotherLasttName);
        $("#Enquiry1001mdMotherPhoneNumber").val(EnquiryDetails.CandidateDetails[0].MotherPhoneNumber);
        $("#Enquiry1001mdFatheFirstName").val(EnquiryDetails.CandidateDetails[0].FatheFirstName);
        $("#Enquiry1001mdFatherMiddleName").val(EnquiryDetails.CandidateDetails[0].FatherMiddleName);
        $("#Enquiry1001mdFatherLasttName").val(EnquiryDetails.CandidateDetails[0].FatherLasttName);
        $("#Enquiry1001mdFatherPhoneNumber").val(EnquiryDetails.CandidateDetails[0].FatherPhoneNumber);
        //$('#Enquiry1001mdMarketSource_ID').val(EnquiryDetails.MarketSource_ID).change();
        //$('#Enquiry1001mdEnquiryType_ID').val(EnquiryDetails.EnquiryType_ID).change();
        LoadCombo('Enquiry1001mdEnquiryType_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.EnquiryType + '', EnquiryDetails.CandidateDetails[0].EnquiryType_ID);
        LoadCombo('Enquiry1001mdMarketSource_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.MarketingSource + '',EnquiryDetails.CandidateDetails[0].MarketSource_ID);
    }
});