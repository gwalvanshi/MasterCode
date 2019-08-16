var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#submit').click(function () {
   
    var CUserId = $('#CUserId').val();
    isAllValid = checkValidationOnSubmit();   
    if (isAllValid) {       
      
        if (ValidationOnSave())
        {
            var data =
            {

                CUserId: CUserId,
                Email: $('#UserGroup1401lmdEmailID').val() == undefined ? 0 : $('#UserGroup1401lmdEmailID').val().trim(),
                Password: $('#UserGroup1401lmdPassword').val() == undefined ? 0 : $('#UserGroup1401lmdPassword').val().trim(),
                ConfirmPassword: $('#UserGroup1401lmdPassword').val() == undefined ? 0 : $('#UserGroup1401lmdPassword').val().trim(),
                PhoneNumber: $("#UserGroup1401lmdPhoneNumber").val() == undefined ? 0 : $('#UserGroup1401lmdPhoneNumber').val().trim(),
                UserName: $('#UserGroup1401lmdLoginID').val() == undefined ? 0 : $('#UserGroup1401lmdLoginID').val().trim(),
                ISDeleted: false,
                FirstName: $("#UserGroup1401lmdFirstName").val() == undefined ? '' : $("#UserGroup1401lmdFirstName").val().trim(),
                LastName: $("#UserGroup1401lmdLastName").val() == undefined ? '' : $("#UserGroup1401lmdLastName").val().trim(),
                UserGroupId: $("#UserGroup1401lmdGroup").val() == undefined ? '' : $("#UserGroup1401lmdGroup").val().trim(),
                StuStaffTypeId: $("#UserGroup1401lmdUserType").val() == undefined ? '' : $("#UserGroup1401lmdUserType").val().trim(),


            }
            var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

            //true: this is for add common fileds into data object, in case false it will not add common value.
            //i.e.Session id school id, group id etc.Method type is post
            if (CUserId != "") {
                data.Id = sessionStorage.getItem('UserId');
                data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
                CommonAjaxMethod('/UserCreation/Edit', data, true, 'POST');
            }
            else {
                data.CreatedBy_ID = sessionStorage.getItem('CUserId');
                CommonAjaxMethod('/UserCreation/Create', data, true, 'POST');
            }

        }
    }


});
function ValidationOnSave()
{
    var UserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();
    var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    if (ValidateEmail(document.getElementById('UserGroup1401lmdEmailID'), ValidEmail) == false) {
        return false;
    }
    else if (ValidateMobNumber(document.getElementById('UserGroup1401lmdPhoneNumber'), ValidContactNumber) == false) {
        return false;
    }
    else if (StrCompare(document.getElementById('UserGroup1401lmdPassword'), document.getElementById('UserGroup1401lblconfirmpassword'), PwdCompare) == false) {
        return false;
    }  
    else if (!document.getElementById('UserGroup1401lmdPassword').value.match(passw) && UserId == "")
    {
        alert("Passwords must have minimum 6 char and at least one non letter or digit character.Passwords must have at least one lowercase('a' - 'z').Passwords must have at least one uppercase('A' - 'Z').");
        return false;
    }
   
    return true;
}
//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid) {

    if (isValid) {
        $('#CUserId,#UserGroup1401lmdEmailID,#UserGroup1401lmdPassword,#UserGroup1401lmdPhoneNumber,#UserGroup1401lmdLoginID,#UserGroup1401lmdFirstName,#UserGroup1401lmdLastName', '#UserGroup1401lblconfirmpassword').val('');
        $("#UserGroup1401lmdUserType,#UserGroup1401lmdGroup").val("0").change();
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

    $.getScript(combojsURL, function myfunction()
    {      
        
        var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();      
        if (CUserId != "")
            GetUserDetails();
        else {
            LoadCombo('UserGroup1401lmdGroup', 'UserGroup', 'UserGroupName', 'UserGroupId', 'ISDeleted=0');
            LoadMasterDropdown('UserGroup1401lmdUserType', null, MasterTypeEnum.UserType, null, null, null, false);
          }
    });

    function GetUserDetails() {       
        var CUserId = $('#CUserId').val();
        $.ajax({
            type: 'GET',
            url: '/UserCreation/EditData',
            data: { Id: CUserId },
            dataType: "json",
            success: function (response) {
                console.log("response", response);
                UserDetails = response;
                BindEdit();
            },
            error: function () {
                alert(" An error occurred.10");
            },
        })
    }
    function BindEdit() {
       
        $('#CUserId').val(UserDetails.CUserId);
        $('#UserGroup1401lmdEmailID').val(UserDetails.Email);
        $("#UserGroup1401lmdPassword").val(UserDetails.PasswordHash);
        $("#UserGroup1401lblconfirmpassword").val(UserDetails.PasswordHash);        
        $('#UserGroup1401lmdPhoneNumber').val(UserDetails.PhoneNumber);
        $('#UserGroup1401lmdLoginID').val(UserDetails.UserName);
        $("#UserGroup1401lmdFirstName").val(UserDetails.FirstName);
        $("#UserGroup1401lmdLastName").val(UserDetails.LastName);          
        LoadCombo('UserGroup1401lmdGroup', 'UserGroup', 'UserGroupName', 'UserGroupId', 'ISDeleted=0', UserDetails.UserGroupId == undefined ? "" : UserDetails.UserGroupId.toString());
        LoadMasterDropdown('UserGroup1401lmdUserType', null, MasterTypeEnum.UserType, null, null, null, false, UserDetails.StuStaffTypeId == undefined ? "" : UserDetails.StuStaffTypeId.toString());


    }


});


function LoadLookupData(Uid) {
    var url = "";
    //if ($("#myModal").length > 0)
    //$('#myModal').modal('hide');
    if (Uid == Uid) {
        url = '/CandidateDetail/Editasy';
    }
    GetUserDetailsFromPopup(url, Uid)
}
function GetUserDetailsFromPopup(ctrlurl, Uid) {
    $.ajax({
        type: 'GET',
        url: ctrlurl,
        data: { id: Uid },
        dataType: "json",
        success: function (response) {
            console.log("response", response);           
            $('#UserGroup1401lmdEmailID').val(response.Email);
            $('#UserGroup1401lmdPhoneNumber').val(response.ContactMobileNo);
            // $('#UserGroup1401lmdLoginID').val(response.UserName);
            $("#UserGroup1401lmdFirstName").val(response.FirstName);
            $("#UserGroup1401lmdLastName").val(response.Lastname);
            updateUserInformation(response);
            // LoadCombo('UserGroup1401lmdGroup', 'UserGroup', 'UserGroupName', 'UserGroupId', 'ISDeleted=0', UserDetails.UserGroupId.toString());
            // LoadMasterDropdown('UserGroup1401lmdUserType', null, MasterTypeEnum.UserType, null, null, null, false, UserDetails.StuStaffTypeId.toString());
        },
        error: function () {
            alert(" An error occurred.10");
        },
    })
}

$(function () {
    $("#UserGroup1401lmdStaff_ID_OR_Student_ID").autocomplete({
        source: function (request, response) {
            var obj = {};
            obj.prefix = request.term;
            obj.UserType = $("#UserGroup1401lmdUserType").val();
            if (obj.UserType == "0") {
                alert("Please select user type.");
            }
            else {
                $.ajax({
                    url: '/CandidateDetail/AutoComplete/',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data, function (item) {
                            return item;
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            }
        },
        //select: function (e, i) {
        //    $("#Data").val(i.item.val);
        //    FillData();
        //},
        minLength: 2
    });
});
function Popup() {
    var popupType = $("#UserGroup1401lmdUserType").val();
    var columnList = 'CandidateDetail_ID,FirstName,Lastname,FatheFirstName,ContactMobileNo';
    ///Passing the resx Key to got values
    var columnKey = "CandidateDetail_ID,GEE1401POPName,GEE1401POPLastName,GEE1401POPFatherName,GEE1401POPPhonenum";
    if (popupType == "0") {
        alert("Please select user type.");
    }
    else {
        GetKeyValueFromResx(columnKey, columnList);
    }

}
function GetKeyValueFromResx(columnKey, columnList) {
    $.ajax({
        type: 'GET',
        url: '/CommonMethods/GetKeyValueFromResx',
        data: { keys: columnKey },
        dataType: "json",
        success: function (response) {

           
            PopupLookup(1, 'CandidateDetail_ID', columnList, response)

        },
        error: function () {
            alert(" An error occurred.4");
        },
    })
}