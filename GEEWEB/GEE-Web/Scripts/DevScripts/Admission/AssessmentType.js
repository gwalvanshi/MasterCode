///Created By: Amit Gajera on 05/01/2019 

var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var dropdownForParent = [];
var AllMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#Save').click(function () {

    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            AssessmentType_Id: $('#AssessmentType_Id').text() == undefined ? 0 : $('#AssessmentType_Id').text().trim(),
            AssessmentType_code: $("#GEE1605MDAssessmentTypeCode").val() == undefined ? "" : $('#GEE1605MDAssessmentTypeCode').val().trim(),
            AssessmentType_Name: $('#GEE1605MDAssessmentTypeName').val() == undefined ? 0 : $('#GEE1605MDAssessmentTypeName').val().trim(),
            MinMarks: $("#GEE1605MDMaxMarks").val() == undefined ? "" : $('#GEE1605MDMaxMarks').val().trim(),
            MaxMarks: $("#GEE1605MDMinMarks").val() == undefined ? "" : $('#GEE1605MDMinMarks').val().trim(),
            PassingMarks: $("#GEE1605MDPassingMarks").val() == undefined ? "" : $('#GEE1605MDPassingMarks').val().trim(),
            Weightage: $("#GEE1605MDWeightage").val() == undefined ? "" : $('#GEE1605MDWeightage').val().trim(),            
            ISDeleted: false,
        }
        var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/AssessmentType/Create', data, true, 'POST');
        oTable = $('#tblassessmenttypedatadetails').DataTable();
        oTable.draw();
    }
});

$('#Update').click(function () {
    var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

    var MasterTable_id = $('#AssessmentType_Id').text();
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            AssessmentType_Id: $('#AssessmentType_Id').text() == undefined ? 0 : $('#AssessmentType_Id').text().trim(),
            AssessmentType_code: $("#GEE1605MDAssessmentTypeCode").val() == undefined ? "" : $('#GEE1605MDAssessmentTypeCode').val().trim(),
            AssessmentType_Name: $('#GEE1605MDAssessmentTypeName').val() == undefined ? 0 : $('#GEE1605MDAssessmentTypeName').val().trim(),
            MinMarks: $("#GEE1605MDMaxMarks").val() == undefined ? "" : $('#GEE1605MDMaxMarks').val().trim(),
            MaxMarks: $("#GEE1605MDMinMarks").val() == undefined ? "" : $('#GEE1605MDMinMarks').val().trim(),
            PassingMarks: $("#GEE1605MDPassingMarks").val() == undefined ? "" : $('#GEE1605MDPassingMarks').val().trim(),
            Weightage: $("#GEE1605MDWeightage").val() == undefined ? "" : $('#GEE1605MDWeightage').val().trim(),      
            ISDeleted: false,
            //CreatedDate: $("#hdnCreatedDate").val() == undefined ? "" : $('#hdnCreatedDate').val().trim() 
        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        //data.CreatedBy_ID = sessionStorage.getItem('CUserId');

        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/AssessmentType/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblassessmenttypedatadetails').DataTable();
        oTable.draw();
    }
});

//For Added New 
$("#Add").click(function () {
    FormControlValueClear(true);
    $('#Update').attr("hidden", "hidden");
    $('#Save').removeAttr("hidden", "hidden");
});


//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid) {

    if (isValid) {
        $('#GEE1605MDAssessmentTypeCode,#GEE1605MDAssessmentTypeName,#GEE1605MDMaxMarks,#GEE1605MDMinMarks,#GEE1605MDPassingMarks,#GEE1605MDWeightage').val('');
    }
    else {
        $('#submit').val('Save');
    }
}

$(document).ready(function () {
    var ctrlArray = new Array("submit");
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);
    });

    //$.getScript(combojsURL, function myfunction() {
    //    LoadMasterDropdown('GEE1110mdClassClassification', null, MasterTypeEnum.ClassClassification, null, null, null, false);
    //});
    GetAllMasterData();
});
function Returnobj() {
    var jObj = [
    ];
    var obj1 = { "data": "AssessmentType_Id", "name": "AssessmentType_Id", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = { "data": "AssessmentType_code", "name": "AssessmentType_code", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "AssessmentType_Name", "name": "AssessmentType_Name", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "MinMarks", "name": "MinMarks", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "MaxMarks", "name": "MaxMarks", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "PassingMarks", "name": "PassingMarks", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = { "data": "Weightage", "name": "Weightage", "autoWidth": true };     
    jObj.push(obj7)
    var obj8 = {
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.AssessmentType_Id + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.AssessmentType_Id + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";
        }
    };
    jObj.push(obj8)
    return jObj;
}
function GetAllMasterData() {

    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th> Assessment Type Id</th>" +
        "<th>Code</th>" +
        "<th>Name</th>" +
        "<th>Min Marks</th>" +
        "<th>Max Marks</th>" +
        "<th>Passing Marks</th>" +
        "<th>Weightage</th>" +         
        "<th>Action</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblassessmenttypedatadetails").html(html);
    $("#tblassessmenttypedatadetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "searching": false,
        "ajax": {
            "url": '/AssessmentType/Index',
            "type": "POST",
            "datatype": "json",
            //"data": objData
        },
        "columnDefs":
            [{
                "targets": [0],
                "visible": false
                //"searchable": false
            }],
        "columns": Returnobj()

    });

}

function EditData(RId) {

    $('#Update').removeAttr("hidden", "hidden");
    $('#Save').attr("hidden", "hidden");

    $.ajax({
        type: 'GET',
        url: '/AssessmentType/GetDataToEdit',
        data: { id: RId },
        dataType: "json",
        success: function (response) {
            $('#AssessmentType_Id').text(response.AssessmentType_Id);
            $("#GEE1605MDAssessmentTypeCode").val(response.AssessmentType_code);
            $("#GEE1605MDAssessmentTypeName").val(response.AssessmentType_Name);
            $('#GEE1605MDMaxMarks').val(response.MinMarks);
            $('#GEE1605MDMinMarks').val(response.MaxMarks);
            $('#GEE1605MDPassingMarks').val(response.PassingMarks);
            $('#GEE1605MDWeightage').val(response.Weightage);            
            $('#hdnCreatedDate').val(response.CreatedDate)
        }
    });
}

function DeleteData(RId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {

        $.ajax({
            type: 'POST',
            url: '/AssessmentType/Delete',
            data: { ID: RId },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblassessmenttypedatadetails').DataTable();
                    oTable.draw();
                    //alert("Record has been deleted!");

                    var x = document.getElementById("toastmsg");
                    x.innerHTML = '<p class="green">Record has been deleted!e</p>';
                    x.className = "show";
                    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);

                }
                else {
                    alert("Something Went Wrong!");
                }
            },
            error: function () {
                alert(" An error occurred.");
            },
        })
    }
}
