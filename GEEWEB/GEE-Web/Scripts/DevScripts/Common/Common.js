
///These are common feilds for popup Lookup
//Added by Jiya
//Added wehn 9 April
//start
var LookUpType = 0;
var GridColumnDetails = "";
var GridColumnForRadioButton = "";
var ResxColumnDetails = "";
//End


///This is common  enum to bind the master dropdown
//// We have to add the masterttype data and value accoding to database ids in enum.
//Data depandancy 
//Hard code
var MasterTypeEnum = {
    CastCategory: 1,
    Designation: 2,
    EnquiryType: 3,
    Languages: 4,
    MarketingSource: 5,
    Qualificaton: 6,
    Religion: 7,
    StudentType: 8,
    Country: 9,
    State: 10,
    City: 11,
    NumberGenforms: 12,
    UserType: 13,
    PermissionMaster: 14,
    DocuemntMastercategory: 15,
    Docuementcategory: 16,
    DocumentFollowupType: 17,
    ClassClassification: 18,
    SectionsMaster: 19,
    BuildingMaster: 20,
    HouseMaster: 21,
    HouseDesignation: 22,
    TeacherClassificationMaster: 23,
    AssessmentTypeGroup: 24,
    AssessmentStructure: 25,
    GradeStructure: 26,
    SubjectType: 27,
    SubjectGroup: 28,
    EmpCategory: 29,
    StaffDesignation: 30,
    Vendor: 31,
    Department: 32,
    IDcardType: 33,
    EmpDegree: 34,
    EmpDegreeMode: 35,
    EmployeeStatus: 36,
    Streams: 37,
    Gender: 38,
    AdmissionStatusValue: 39,
    VechicleTrip: 40,
    RouteMaster: 41,
    PassangerStatus: 42,
    VechicleStatus: 43,
    VechicalManufacturer: 44,
    VechicalMake: 45,
    VechicalModel: 46,
    Fueltype: 47,
    EmpStatus: 48

};

///This is common  method for load the permission to  control .
//Added by jiya
//Date:29-Mar-2019
function GetPermission(userGroup, menuId, arrrControlIds) {

    $.ajax({
        type: 'GET',
        url: '/CommonMethods/GetPermission',
        data: { userGroup: userGroup, menuId: menuId },
        dataType: "json",
        success: function (response) {
            for (var i = 0; i < arrrControlIds.length; i++) {
                var attribs = $('#' + arrrControlIds[i]).attr("Permission");
                // iterate over each element in the array
                for (var j = 0; j < response.length; j++) {

                    // look for the entry with a matching `Permission` value
                    if (response[j].Permission.toLowerCase() == attribs.toLowerCase()) {
                        $('#' + arrrControlIds[i]).prop('disabled', false);
                    }
                }

            }
        },
        error: function () {
            alert(" An error occurred.3");
        },
    })
}

///This is common  method for load mandotory control .
////Parameter
//// navigationMenu-this is the page code or menu code which is available in resx file.

function GetKeyForValidation(navigationMenu) {
    $.ajax({
        type: 'GET',
        url: '/CommonMethods/GetKeyForValidation',
        data: { Id: navigationMenu },
        dataType: "json",
        success: function (response) {
            requiredFeild = response;
            $.each(requiredFeild, function (key, value) {
                var lablePrevioue = $("#" + value).prev();
                lablePrevioue.append("<span class='text-danger ml-1'>*</span>");
                $("#" + value).addClass("errorvalidation");

            });

        },
        error: function () {
            alert(" An error occurred.4");
        },
    })
}
///This is common post method for save the data .
////Parameter
//// URL-this is controller  url to call
////data: object to bind control value
////optional: this is for add common fileds into data object, in case false it will not add common value.
////i.e.Session id school id, group id etc.
///methodType is having only three type value-POST,PUT,DELETE

function CommonAjaxMethod(actionMethodUrl, data, optional, methodType) {
    var isSuccess = false;
    if (optional)
        data = AddCommonFieldsInData(data);
    $.ajax({
        type: methodType,
        url: actionMethodUrl,
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function (data) {

            if (data.status) {
                if (data.Message == undefined) {
                    if (methodType == "POST") {
                        //alert('Successfully Saved');
                        var x = document.getElementById("toastmsg");
                        x.innerHTML = '<p class="green">Saved successfully!</p>';
                        x.className = "show";
                        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                    }
                    else if (methodType == "PUT") {
                        var x = document.getElementById("toastmsg");
                        x.innerHTML = '<p class="green">Successfully updated!</p>';
                        x.className = "show";
                        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                    }
                    //alert('Successfully Updated');
                    else if (methodType == "DELETE")
                        alert('Successfully Deleted');
                }
                else {
                    alert(data.Message);
                }

                //This method should be declared in calling page js to get result.
                FormControlValueClear(true);

            }
            else {

                alert('Error');
                isSuccess = false;
            }
        },
        error: function (error) {
            alert("Hi");
            alert(error);
            isSuccess = false;
        }
    });
    return isSuccess;
}
//Token-Demo
//Below keys will read data from session 
//This function is used to set the value from session to data object to save and update.
function AddCommonFieldsInData(data) {
    data.Sessionyear = sessionStorage.getItem('sessionYear');
    data.SchoolID = sessionStorage.getItem('schoolId');
    data.GroupID = sessionStorage.getItem('groupId');

    return data;
}

///This is common  method for validate  control on submit.
function checkValidationOnSubmit() {

    var isMandatory = true;
    $.each(requiredFeild, function (key, value) {

        var text = $("#" + value).val();
        if (text == "" || text == "0" || text == "Select") {
            isMandatory = false;
        }
    });
    if (!isMandatory) {
        var x = document.getElementById("toastmsg");
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return false;
    }
    return isMandatory;
}

//This is a common method used for get data.
function CommonGetAjaxMethod(actionMethodUrl, data) {
    $.ajax({
        type: "GET",
        url: actionMethodUrl,
        data: JSON.stringify(data),
        dataType: "json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('Authorization', sessionStorage.getItem('accessToken'));
        },
        success: function (data) {
            //This method should be declared in calling page js to get result.
            GetDataFromCommonGetAjax(data);
        }
    })
}

function PopupLookup(popupType, RadioColumn, columnList, RColumnDetails) {

    GridColumnForRadioButton = RadioColumn;
    LookUpType = popupType;
    GridColumnDetails = columnList;
    ResxColumnDetails = RColumnDetails;
    var TeamDetailPostBackURL = '/CommonMethods/Details';
    var options = { "backdrop": "static", keyboard: true };

    $.ajax({
        type: "POST",
        url: TeamDetailPostBackURL,
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (data) {

            $('#myModalContent').html(data);
            $('#myModal').modal(options);
            $('#myModal').modal('show');

        },
        error: function () {
            alert("Dynamic content load failed.");
        }
    });
}
//This function is used to date formate
function JsonDateFormat(dateValue) {
    var strDate = "";
    var dateData = new Date(parseInt(dateValue.replace("/Date(", "").replace(")/")));
    var dd = dateData.getDate();
    var mm = dateData.getMonth() + 1; //January is 0! 
    var yyyy = dateData.getFullYear();
    if (dd < 10) { dd = '0' + dd }
    if (mm < 10) { mm = '0' + mm }
    //if (format == 'dd/mm/yyyy')
    //    strDate = mm + ' / ' + dd + ' / ' + yyyy;
    //else if (format == 'mm/dd/yyyy')
    //    strDate = mm + ' / ' + dd + ' / ' + yyyy;
    //else
    strDate = mm + '/' + dd + '/' + yyyy;
    return strDate;

}