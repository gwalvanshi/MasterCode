var dropdownData = [];
var requiredFeild = [];
var isAllValid = true;
//var ddlid;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#submit').click(function () {
    isAllValid =  checkValidationOnSubmit();

    if (isAllValid) {
        try {
            var checkedValue = $('#cbHasSibiling:checked').val();
        var data = {
            SiblingAdmNumber_ID: $('#Enquiry1001mdSiblingAdmNumber_ID').val() == undefined ? 0 : $('#Enquiry1001mdSiblingAdmNumber_ID').val().trim(),
            ApplicaitonNo: $('#Enquiry1001mdApplicaitonNo').val() == undefined ? 0 : $('#Enquiry1001mdApplicaitonNo').val().trim(),
            EnquiryNo: $("#txtEnquiryNo").val() == undefined ? 0 : $('#txtEnquiryNo').val().trim(),
            StudentType_ID: $('#ddlStudentType').val() == undefined ? 0 : $('#ddlStudentType').val().trim(), 
            AdmissionClass_id: $('#Enquiry1001mdAdmissionClass_id').val() == undefined ? 0: $('#Enquiry1001mdAdmissionClass_id').val().trim(),
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

            MarketSource_ID: $('#Enquiry1001mdMarketSource_ID').val() == undefined ? '': $('#Enquiry1001mdMarketSource_ID').val().trim(),
            EnquiryType_ID: $('#Enquiry1001mdEnquiryType_ID').val() == undefined ? 0 :  $('#Enquiry1001mdEnquiryType_ID').val().trim(),
            NavigationId: sessionStorage.getItem('MenuCode')
            }
        } catch (e) {
            console.log("error", e);
        }
        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/Enquiry/Create', data, true, 'POST');
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

    $('#Enquiry1001mdSiblingAdmNumber_ID').attr("disabled", "disabled"); 
    $('#Enquiry1001mdApplicaitonNo').attr("disabled", "disabled"); 

    var ctrlArray = new Array("submit");
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);

    });

    $.getScript(combojsURL, function myfunction() {
        LoadCombo('ddlSubject', 'Subject', 'SubjectName', 'Subject_ID', 'ISDeleted=0');
        LoadCombo('ddlStudentType', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.StudentType + '');
        //LoadCombo('ddlSubject', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.sub + '');
        LoadCombo('Enquiry1001mdEnquiryType_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.EnquiryType + '');
        LoadCombo('Enquiry1001mdMarketSource_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.MarketingSource + '');
        LoadCombo('Enquiry1001mdCity_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.City + '');
        LoadCombo('Enquiry1001mdState_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.State + '');
        LoadCombo('Enquiry1001mdCountry_ID', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.Country + '');

          });

    var jsURL = '/Scripts/DevScripts/common/validation.js';
    

    $("#cbHasSibiling").on('change', function () {
        if ($(this).is(':checked')) {
            $(this).attr('value', 'true');
            $('#Enquiry1001mdSiblingAdmNumber_ID').removeAttr("disabled");  
        } else {
            $('#Enquiry1001mdSiblingAdmNumber_ID').attr("disabled", "disabled");
            $(this).attr('value', 'false');
        }
    });
    $("#cbSellApplication").on('change', function () {
        if ($(this).is(':checked')) {
            $(this).attr('value', 'true');
            $('#Enquiry1001mdApplicaitonNo').removeAttr("disabled");  
        } else {
            $('#Enquiry1001mdApplicaitonNo').attr("disabled", "disabled"); 
            $(this).attr('value', 'false');
        }
        GetAutoGeneratedNo();

    });
    function GetAutoGeneratedNo() {
        var NavigationId = sessionStorage.getItem('MenuCode');

        $.ajax({
            type: 'GET',
            url: '/Enquiry/GetAutoGeneraedNo',
            data: { Id: NavigationId },
            dataType: "json",
            success: function (response) {
                console.log("response", response);
                $("#Enquiry1001mdApplicaitonNo").val(response.ApplicaitonNo);
                $("#txtEnquiryNo").val(response.EnquiryNo);
            },
            error: function () {
                alert(" An error occurred.8");
            },
        })
    }    
});

//$('#Enquiry1001mdCity_ID').on('change', function () {
//    var CityId = $(this).val();
//        $.ajax({
//            type: 'GET',
//            url: '/Enquiry/GetStateBycity',
//            data: { Id: CityId },
//            dataType: "json",
//            success: function (response) {
//                console.log("hi",response);
//            },
//            error: function () {
//                alert(" An error occurred.9");
//            },
//        })

//});