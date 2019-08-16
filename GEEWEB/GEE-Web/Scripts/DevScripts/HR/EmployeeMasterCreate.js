var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';
var x = 1; //Initial field counter is 1

$('#submit').click(function () {

    // var CUserId = $('#CUserId').val();
    //isAllValid = checkValidationOnSubmit();
    if (isAllValid) {

        if (ValidationOnSave()) {
            var EmployeeData =
            {
                EmployeeMasterID: $('#EmployeeMasterID').val() == undefined ? "" : $('#EmployeeMasterID').val(),
                MaxRows: "",
                EmpStatus: "",
                Gender: "",
                EmpCode: $("#GEE1910mdEmployee_Code").val(),
                EmpCategoryID: $("#GEE1910mdEmployee_Category_ID").val(),
                StaffDesignationID: $("#GEE1910mdStaffDesignationID").val(),
                VendorID: $("#GEE1910mdVendorID").val(),
                DepartmentID: $("#GEE1910mdDepartment_ID").val(),
                FirstName: $("#GEE1910mdFirstName").val(),
                MiddleName: $("#GEE1910mdMiddleName").val(),
                Lastname: $("#GEE1910mdLastname").val(),
                Email: $("#GEE1910mdEmail").val(),
                ContactMobileNo: $("#GEE1910mdMobile_no_").val(),
                HomePhone: $("#GEE1910mdHomePhone").val(),
                CurrentAddress: $("#GEE1910mdCurrentAddress").val(),
                CurrentCityID: $("#GEE1910mdCity").val(),
                CurrentStateID: $("#GEE1910mdCurrentState").val(),
                CurrentCountryID: $("#GEE1910mdCurrentCountry").val(),
                CurrentPinCode: $("#GEE1910mdCurrentPinCode").val(),
                CurrentLandmark: $("#GEE1910mdCurrentLandmark").val(),
                Is_also_Permanent: $("#GEE1910mdIsalsoPermanent").val(),
                PermenentAddress: $("#GEE1910mdPermenantAddress").val(),
                PermenentCity_ID: $("#GEE1910mdPermenantCity").val(),
                PermenentState_ID: $("#GEE1910mdPermenantState").val(),
                PermenentCountry_ID: $("#GEE1910mdPermenantCountry").val(),
                PinCode: $("#GEE1910mdPermenantPinCode").val(),
                Landmark: $("#GEE1910mdPermenantLandmark").val(),
                DOB: $("#GEE1910mdDOB").val(),
                GenderID: $("#GEE1910mdGenderID").val(),
                Nationality: $("#GEE1910mdNationality").val(),
                Married: $("#GEE1910mdMarried").val(),
                Remarks: $("#GEE1910mdRemarks").val(),
                FatheFirstName: $("#GEE1910mdFatheFirstName").val(),
                FatherMiddleName: $("#GEE1910mdFatherMIDdleName").val(),
                FatherLasttName: $("#GEE1910mdFatherLasttName").val(),
                MotherFirstName: $("#GEE1910mdMothereFirstName").val(),
                MotherMiddleName: $("#GEE1910mdMotherMIDdleName").val(),
                MotherLasttName: $("#GEE1910mdMotherLastName").val(),
                Caste_ID: $("#GEE1910mdCaste").val(),
                Religon_ID: $("#GEE1910mdReligon").val(),
                Create_Login: $("#GEE1910LBLCreateLogin").val(),
                selectUsergroup: $("#GEE1910mdSelectUserGroup").val(),
                EmpStatusId: "",
                CreatedBy_ID: sessionStorage.getItem('CUserId'),
                SchoolID: sessionStorage.getItem('schoolId'),
                GroupID: sessionStorage.getItem('groupId'),
                Sessionyear: sessionStorage.getItem('sessionYear')
            }

            var EmployeeDetailsSchema =
            {
                EmployeeMasterModel: EmployeeData,
                EmployeeEducationDetailModelList: [],
                EmployeeExperienceModelList: [],
                EmployeeIDdetailModelList: []
            }
            //Experince binding
            $("div.ExperinceDataDiv").each(function (e) {

                var objExperince = $(this).find(':input');
                var Experince =
                {
                    EmployeeExperience_Id: "",
                    EmpCode: "",
                    Company_Name: objExperince[0].value,
                    WorkCity: objExperince[1].value,
                    From_Date: objExperince[2].value,
                    To_Date: objExperince[3].value,
                    Last_salary: objExperince[4].value,
                    joining_Designation: objExperince[5].value,
                    Last_Designation: objExperince[6].value,
                    Reason_To_leave: objExperince[7].value,
                    IsRelevant: ""
                }
                EmployeeDetailsSchema.EmployeeExperienceModelList.push(Experince)

            });
            //Indentity binding
            $("div.IndentityDataDiv").each(function (e) {

                var objIndentity = $(this).find(':input');
                var Indentity =
                {
                    EmployeeIDdetail_ID: "",
                    IDcardTypeID: objIndentity[0].value,
                    EmpcodeID: "",
                    Idnumber: objIndentity[1].value,
                    validFrom: objIndentity[2].value,
                    ValidTo: objIndentity[3].value,
                    IssueCityID: objIndentity[4].value,
                }
                EmployeeDetailsSchema.EmployeeIDdetailModelList.push(Indentity)

            });
            ///Education details binding           
            $("div.EducaltionDataDiv").each(function (e) {

                var objEducation = $(this).find(':input');
                var Education =
                {
                    EmployeeEducationDetail_ID: "",
                    EmpCode: "",
                    Degree_ID: objEducation[0].value,
                    Subjects: objEducation[1].value,
                    FromDate: objEducation[2].value,
                    ToDate: objEducation[3].value,
                    InstituteName: objEducation[4].value,
                    City: objEducation[5].value,
                    EmpDegreeModeid: objEducation[6].value,
                    Percent_Marks: objEducation[7].value,
                    Division: objEducation[8].value,
                    Remarks: ""
                }
                EmployeeDetailsSchema.EmployeeEducationDetailModelList.push(Education)

            });
          
            var Edata = EmployeeDetailsSchema;
            $.ajax({
                url: '/EmployeeMaster/Create',
                method: 'POST',
                data: Edata,
                success: function (response) {
                    var x = document.getElementById("toastmsg");
                    x.innerHTML = '<p class="green">Saved successfully!</p>';
                    x.className = "show";
                    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);

                },
                error: function (jqXHR) {
                    alert(jqXHR.responseText);
                }
            });


        }
    }

    return false;
});
function ValidationOnSave() {
    //if (ValidateEmail(document.getElementById('UserGroup1401lmdEmailID'), ValidEmail) == false) {
    //    return false;
    //}
    //else if (ValidateMobNumber(document.getElementById('UserGroup1401lmdPhoneNumber'), ValidContactNumber) == false) {
    //    return false;
    //}
    //else if (StrCompare(document.getElementById('UserGroup1401lmdPassword'), document.getElementById('UserGroup1401lblconfirmpassword'), PwdCompare) == false) {
    //    return false;
    //}
    return true;
}
//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid) {

    //if (isValid) {
    //    $('#CUserId,#UserGroup1401lmdEmailID,#UserGroup1401lmdPassword,#UserGroup1401lmdPhoneNumber,#UserGroup1401lmdLoginID,#UserGroup1401lmdFirstName,#UserGroup1401lmdLastName').val('');
    //    $("#UserGroup1401lmdUserType,#UserGroup1401lmdGroup").val("0").change();
    //}
    //else {
    //    $('#submit').val('Save');
    //}
}

$(document).ready(function () {

    $.getScript(commonjsURL, function myfunction()
    {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));

    });


    $.getScript(combojsURL, function myfunction() {

        var EmployeeMasterID = $('#EmployeeMasterID').val() == undefined ? "" : $('#EmployeeMasterID').val();
        if (EmployeeMasterID != "")
            GetUserDetails();
        else {
            LoadMasterDropdown('GEE1910mdEmployee_Category_ID', null, MasterTypeEnum.UserType, null, null, null, false);
            LoadMasterDropdown('GEE1910mdStaffDesignationID', null, MasterTypeEnum.Designation, null, null, null, false);
            LoadMasterDropdown('GEE1910mdVendorID', null, MasterTypeEnum.Designation, null, null, null, false);
            LoadMasterDropdown('GEE1910mdDepartment_ID', null, MasterTypeEnum.Designation, null, null, null, false);
            LoadMasterDropdown('GEE1910mdCity', null, MasterTypeEnum.City, null, null, null, false);
            LoadMasterDropdown('GEE1910mdCurrentState', null, MasterTypeEnum.State, null, null, null, false);
            LoadMasterDropdown('GEE1910mdCurrentCountry', null, MasterTypeEnum.Country, null, null, null, false);
            LoadMasterDropdown('GEE1910mdPermenantCity', null, MasterTypeEnum.City, null, null, null, false);
            LoadMasterDropdown('GEE1910mdPermenantState', null, MasterTypeEnum.State, null, null, null, false);
            LoadMasterDropdown('GEE1910mdPermenantCountry', null, MasterTypeEnum.Country, null, null, null, false);
            LoadMasterDropdown('GEE1910mdGenderID', null, MasterTypeEnum.Gender, null, null, null, false);
            LoadMasterDropdown('GEE1910mdCaste', null, MasterTypeEnum.CastCategory, null, null, null, false);
            LoadMasterDropdown('GEE1910mdReligon', null, MasterTypeEnum.Religion, null, null, null, false);
            LoadMasterDropdown('GEE1910mdDegree_Mode', null, MasterTypeEnum.Designation, null, null, null, false);
            LoadMasterDropdown('GEE1910mdSelectUserGroup', null, MasterTypeEnum.UserType, null, null, null, false);
            LoadMasterDropdown('GEE1910mdNationality', null, MasterTypeEnum.Country, null, null, null, false);
        }

    });

    function GetUserDetails() {
        var EmployeeMasterID = $('#EmployeeMasterID').val();
        $.ajax({
            type: 'POST',
            url: '/EmployeeMaster/EditData',
            data: { Id: EmployeeMasterID },
            dataType: "json",
            success: function (response) {
                BindEdit(response);
            },
            error: function () {
                alert(" An error occurred.employee Master");
            },
        })
    }
    function BindEdit(response) {

       
       
        $('#EmployeeMasterID').val(response.EmployeeMasterID);
        $('#GEE1910mdEmployee_Code').val(response.EmpCode);
        LoadMasterDropdown('GEE1910mdEmployee_Category_ID', null, MasterTypeEnum.UserType, null, null, null, false,response.EmpCategoryID);
        LoadMasterDropdown('GEE1910mdStaffDesignationID', null, MasterTypeEnum.Designation, null, null, null, false, response.StaffDesignationID);
        LoadMasterDropdown('GEE1910mdVendorID', null, MasterTypeEnum.Designation, null, null, null, false, response.VendorID);
        LoadMasterDropdown('GEE1910mdDepartment_ID', null, MasterTypeEnum.Designation, null, null, null, false,response.DepartmentID);
        $('#GEE1910mdFirstName').val(response.FirstName);
        $('#GEE1910mdMiddleName').val(response.MiddleName);
        $('#GEE1910mdLastname').val(response.Lastname);
        $('#GEE1910mdEmail').val(response.Email);
        $('#GEE1910mdMobile_no_').val(response.ContactMobileNo);
        $('#GEE1910mdHomePhone').val(response.HomePhone);
        $('#GEE1910mdCurrentAddress').val(response.CurrentAddress);
        LoadMasterDropdown('GEE1910mdCity', null, MasterTypeEnum.City, null, null, null, false, response.CurrentCityID);
        LoadMasterDropdown('GEE1910mdCurrentState', null, MasterTypeEnum.State, null, null, null, false, response.CurrentStateID);
        LoadMasterDropdown('GEE1910mdCurrentCountry', null, MasterTypeEnum.Country, null, null, null, false, response.CurrentCountryID);
        $('#GEE1910mdCurrentPinCode').val(response.CurrentPinCode);
        $('#GEE1910mdCurrentLandmark').val(response.CurrentLandmark);
        $('#GEE1910mdIsalsoPermanent').val(response.Is_also_Permanent);
        $('#GEE1910mdPermenantAddress').val(response.PermenentAddress);
        LoadMasterDropdown('GEE1910mdPermenantCity', null, MasterTypeEnum.City, null, null, null, false, response.PermenentCity_ID);
        LoadMasterDropdown('GEE1910mdPermenantState', null, MasterTypeEnum.State, null, null, null, false, response.PermenentState_ID);
        LoadMasterDropdown('GEE1910mdPermenantCountry', null, MasterTypeEnum.Country, null, null, null, false, response.PermenentCountry_ID);
        $('#GEE1910mdPermenantPinCode').val(response.PinCode);
        $('#GEE1910mdPermenantLandmark').val(response.Landmark);
        $('#GEE1910mdDOB').val(JsonDateFormat(response.DOB));
        LoadMasterDropdown('GEE1910mdGenderID', null, MasterTypeEnum.Gender, null, null, null, false, response.GenderID);
        LoadMasterDropdown('GEE1910mdNationality', null, MasterTypeEnum.Country, null, null, null, false, response.Nationality);
        $('#GEE1910mdMarried').val(response.Married);
        $('#GEE1910mdRemarks').val(response.Remarks);
        $('#GEE1910mdFatheFirstName').val(response.FatheFirstName);
        $('#GEE1910mdFatherMIDdleName').val(response.FatherMiddleName);
        $('#GEE1910mdFatherLasttName').val(response.FatherLasttName);
        $('#GEE1910mdMothereFirstName').val(response.MotherFirstName);
        $('#GEE1910mdMotherMIDdleName').val(response.MotherMiddleName);
        $('#GEE1910mdMotherLastName').val(response.MotherLasttName);
        LoadMasterDropdown('GEE1910mdReligon', null, MasterTypeEnum.Religion, null, null, null, false,response.Religon_ID);
        LoadMasterDropdown('GEE1910mdCaste', null, MasterTypeEnum.CastCategory, null, null, null, false, response.CastCategory);
        $('#GEE1910LBLCreateLogin').val(response.Create_Login);
        LoadMasterDropdown('GEE1910mdSelectUserGroup', null, MasterTypeEnum.UserType, null, null, null, false, response.selectUsergroup);

        //Education Bind
        var edwrapper = $('.education_detail_wrapper'); //Input field wrapper
        for (var i = 0; i < response.EmployeeEducationDetailModelList.length; i++) {
           
            if (i == 0) {


                $('#GEE1910mdDegree_ID').val(response.EmployeeEducationDetailModelList[i].Degree_ID);
                $('#GEE1910mdSubjects').val(response.EmployeeEducationDetailModelList[i].Subjects);
                $('#GEE1910mdFrom_Date').val(JsonDateFormat(response.EmployeeEducationDetailModelList[i].FromDate));
                $('#GEE1910mdTo_Date').val(JsonDateFormat(response.EmployeeEducationDetailModelList[i].ToDate));
                $('#GEE1910mdInstitute_Name').val(response.EmployeeEducationDetailModelList[i].InstituteName);
                $('#City').val(response.EmployeeEducationDetailModelList[i].City);
                $('#GEE1910mdPercent_Marks').val(response.EmployeeEducationDetailModelList[i].Percent_Marks);
                $('#GEE1910mdDivision').val(response.EmployeeEducationDetailModelList[i].Division);
                LoadMasterDropdown('GEE1910mdDegree_Mode', null, MasterTypeEnum.UserType, null, null, null, false,response.EmployeeEducationDetailModelList[i].EmpDegreeModeid);
            }
            else
            {
               
                $.ajax({
                    type: "GET",
                    url: '/Lookups/GetMasterDropdownData',
                    data: { masterTableId: null, masterTypeId: MasterTypeEnum.UserType, schoolId: null, groupId: null, sessionYear: null, isDeleted: false },
                    dataType: "json",
                    ajaxI:i,
                    beforeSend: function (xhr)
                    {
                        xhr.setRequestHeader('Authorization', sessionStorage.getItem('accessToken'));
                    },
                    success: function (data)
                    {
                        i = this.ajaxI;
                        var strData = "";

                        $.each(data, function (ii, vall)
                        {
                            if (response.EmployeeEducationDetailModelList[i].EmpDegreeModeid == vall.MasterTable_id)
                                strData = strData + '<option value="' + vall.MasterTable_id + '" Selected>' + vall.Name + '</option>';
                            else
                                strData = strData + '<option value="' + vall.MasterTable_id + '">' + vall.Name + '</option>';
                        })
                        x++;
                        $(edwrapper).append(EducationEditReturnString(strData, response.EmployeeEducationDetailModelList[i]));
                    }
                })
            }
        }
        //Experince Bind
        var exdwrapper = $('.experience_detail_wrapper'); //Input field wrapper
        for (var j = 0; j < response.EmployeeExperienceModelList.length; j++) {
            if (j == 0) {

                $('#GEE1910mdCompany_Name').val(response.EmployeeExperienceModelList[j].Company_Name);
                $('#GEE1910mdWork_City').val(response.EmployeeExperienceModelList[j].WorkCity);
                $('#GEE1910mdFrom_Date1').val(JsonDateFormat(response.EmployeeExperienceModelList[j].From_Date));
                $('#GEE1910mdTo_Date1').val(JsonDateFormat(response.EmployeeExperienceModelList[j].To_Date));
                $('#GEE1910mdLast_salary').val(response.EmployeeExperienceModelList[j].Last_salary);
                $('#GEE1910mdjoining_Designation').val(response.EmployeeExperienceModelList[j].joining_Designation);
                $('#GEE1910mdLast_Designation').val(response.EmployeeExperienceModelList[j].Last_Designation);
                $('#GEE1910mdReason_to_leave').val(response.EmployeeExperienceModelList[j].Reason_To_leave);
            }
            else {
                x++;
                $(exdwrapper).append(ExperinceEditReturnString(response.EmployeeExperienceModelList[j]));
            }
        }
        //Identity Bind
        var wrapper = $('.field_wrapper'); //Input field wrapper
        for (var k = 0; k < response.EmployeeIDdetailModelList.length; k++) {
            if (k == 0) {

                $('#GEE1910mdIDcardType').val(response.EmployeeIDdetailModelList[k].IDcardTypeID);
                $('#GEE1910mdID_Number').val(response.EmployeeIDdetailModelList[k].Idnumber);
                $('#GEE1910mdvalidFrom').val(JsonDateFormat(response.EmployeeIDdetailModelList[k].validFrom));
                $('#GEE1910mdValid_To').val(JsonDateFormat(response.EmployeeIDdetailModelList[k].ValidTo));
                $('#GEE1910mdIssue_CityI_D').val(response.EmployeeIDdetailModelList[k].IssueCityID);

            }
            else {
                x++;
                $(wrapper).append(IndenityEditReturnString(response.EmployeeIDdetailModelList[k])); //Add field html
            }
        }


    }


});



