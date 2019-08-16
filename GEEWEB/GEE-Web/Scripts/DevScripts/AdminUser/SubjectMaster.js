var dropdownData = [];
var requiredFeild = [];
var dropdownSubjectMasterData = [];
var AllSubjectMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#Save').click(function () {
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            AssessmentStructure_ID: $('#GEE1120mdAssessmentStructure').val() == undefined ? 0 : $('#GEE1120mdAssessmentStructure').val().trim(),
            GradeStructure_ID: $('#GEE1120mdGradeStructure').val() == undefined ? 0 : $('#GEE1120mdGradeStructure').val().trim(),
            SubjectType_Id: $('#GEE1120mdSubjectType').val() == undefined ? 0 : $('#GEE1120mdSubjectType').val().trim(),
            SubjectGroup_ID: $('#GEE1120mdSubjectGroup').val() == undefined ? 0 : $('#GEE1120mdSubjectGroup').val().trim(),

            Code: $('#GEE1120mdcode').val() == undefined ? "" : $('#GEE1120mdcode').val().trim(),
            Name: $("#GEE1120mdName").val() == undefined ? "" : $('#GEE1120mdName').val().trim(),
            isOptional: $('#GEE1120mdisOptional').val(),
            isScholastic: $('#GEE1120mdisScholastic').val(),
            IncludedInCGPA: $("#GEE1120mdIncludedInCGPA").val() == undefined ? "" : $('#GEE1120mdIncludedInCGPA').val().trim(),
            ExculdedfromAtt: $("#GEE1120mdGriExculdedfromAtt").val() == undefined ? "" : $('#GEE1120mdGriExculdedfromAtt').val().trim(),
            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/SubjectMaster/Create', data, true, 'POST');
        oTable = $('#tblSubjectMasterdetails').DataTable();
        oTable.draw();
    }
});

$('#Update').click(function () {

    var SubjectMaster_ID = $('#SubjectMaster_ID').text();
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            SubjectMaster_ID: SubjectMaster_ID,
            AssessmentStructure_ID: $('#GEE1120mdAssessmentStructure').val() == undefined ? 0 : $('#GEE1120mdAssessmentStructure').val().trim(),
            GradeStructure_ID: $('#GEE1120mdGradeStructure').val() == undefined ? 0 : $('#GEE1120mdGradeStructure').val().trim(),
            SubjectType_Id: $('#GEE1120mdSubjectType').val() == undefined ? 0 : $('#GEE1120mdSubjectType').val().trim(),
            SubjectGroup_ID: $('#GEE1120mdSubjectGroup').val() == undefined ? 0 : $('#GEE1120mdSubjectGroup').val().trim(),

            Code: $('#GEE1120mdcode').val() == undefined ? "" : $('#GEE1120mdcode').val().trim(),
            Name: $("#GEE1120mdName").val() == undefined ? "" : $('#GEE1120mdName').val().trim(),
            isOptional: $('#GEE1120mdisOptional').val(),
            isScholastic: $('#GEE1120mdisScholastic').val(),
            IncludedInCGPA: $("#GEE1120mdIncludedInCGPA").val() == undefined ? "" : $('#GEE1120mdIncludedInCGPA').val().trim(),
            ExculdedfromAtt: $("#GEE1120mdGriExculdedfromAtt").val() == undefined ? "" : $('#GEE1120mdGriExculdedfromAtt').val().trim(),
            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/SubjectMaster/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblSubjectMasterdetails').DataTable();
        oTable.draw();
    }
});

$("#GEE1120mdisOptional").on('change', function () {
    if ($(this).is(':checked')) {
        $(this).attr('value', 'true');
    } else {
        $(this).attr('value', 'false');
    }
});
$("#GEE1120mdisScholastic").on('change', function () {
    if ($(this).is(':checked')) {
        $(this).attr('value', 'true');
    } else {
        $(this).attr('value', 'false');
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
        $('#GEE1120mdcode,#GEE1120mdName,#GEE1120mdIncludedInCGPA,#GEE1120mdGriExculdedfromAtt').val('');
        $("#GEE1120mdAssessmentStructure,#GEE1120mdGradeStructure,#GEE1120mdSubjectType,#GEE1120mdSubjectGroup").val("0").change();
        $("#GEE1120mdisOptional").attr('value', 'false');
        $("#GEE1120mdisScholastic").attr('value', 'false');
        document.getElementById("GEE1120mdisOptional").checked = false;
        document.getElementById("GEE1120mdisScholastic").checked = false;
    }
    else {
        $('#submit').val('Save');
    }
}


$(document).ready(function () {
    //var defaultSelectedId = "3";
    var ctrlArray = new Array("submit");
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);

    });
    $.getScript(combojsURL, function myfunction() {
        LoadCombo('GEE1120mdAssessmentStructure', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.AssessmentStructure + '');
        LoadCombo('GEE1120mdGradeStructure', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.GradeStructure + '');
        LoadCombo('GEE1120mdSubjectType', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.SubjectType + '');
        LoadCombo('GEE1120mdSubjectGroup', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.SubjectGroup + '');

    });

    GetAllSubjectMasterData();
});

function Returnobj() {
    var jObj = [
    ];

    var obj1 = { "data": "SubjectMaster_ID", "name": "SubjectMaster_ID", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = { "data": "AssessmentStructureName", "name": "AssessmentStructureName", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "GradeStructureName", "name": "GradeStructureName", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "SubjectTypeName", "name": "SubjectTypeName", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "Code", "name": "Code", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "Name", "name": "Name", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = { "data": "isOptionalValue", "name": "isOptionalValue", "autoWidth": true };
    jObj.push(obj7)
    var obj8 = { "data": "isScholasticValue", "name": "isScholasticValue", "autoWidth": true };
    jObj.push(obj8)
    var obj9 = { "data": "IncludedInCGPA", "name": "IncludedInCGPA", "autoWidth": true };
    jObj.push(obj9)
    var obj10 = { "data": "ExculdedfromAtt", "name": "ExculdedfromAtt", "autoWidth": true };
    jObj.push(obj10)
    var obj11 = {
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.SubjectMaster_ID + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.SubjectMaster_ID + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";

        }
    };
    jObj.push(obj11)
    return jObj;
}


function GetAllSubjectMasterData(SubjectMaster_ID) {
    var objData = { "id": SubjectMaster_ID };

    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th>Subject Master Id</th>" +
        "<th>Assessment Structure</th>" +
        "<th>Grade Structure</th>" +
        "<th>Subject Type</th>" +
        "<th>Code</th>" +
        "<th>Name</th >" +
        "<th>Is Optional</th >" +
        "<th>Is Scholastic</th >" +
        "<th>Included In CGPA</th >" +
        "<th>Exculded from Att</th >" +
        "<th>Action</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblSubjectMasterdetails").html(html);
    $("#tblSubjectMasterdetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "ajax": {
            "url": '/SubjectMaster/Index',
            "type": "POST",
            "datatype": "json" //,
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

function EditData(SubjectMaster_ID) {

    $('#Update').removeAttr("hidden", "hidden");
    $('#Save').attr("hidden", "hidden");

    $.ajax({
        type: 'GET',
        url: '/SubjectMaster/GetDataToEdit',
        data: { id: SubjectMaster_ID },
        dataType: "json",
        success: function (response) {
            console.log(response);
            $('#SubjectMaster_ID').text(response.SubjectMaster_ID);
            if (response.isOptional == true) {
                document.getElementById("GEE1120mdisOptional").checked = true;
                $("#GEE1120mdisOptional").attr('value', 'true');
            }
            if (response.isScholastic == true) {
                document.getElementById("GEE1120mdisScholastic").checked = true;
                $("#GEE1120mdisScholastic").attr('value', 'true');
            }
            
            $('#SubjectMaster_ID').text(response.SubjectMaster_ID);
            $("#GEE1120mdAssessmentStructure").val(response.AssessmentStructure_ID);
            $("#GEE1120mdGradeStructure").val(response.GradeStructure_ID);
            $("#GEE1120mdSubjectType").val(response.SubjectType_Id);
            $("#GEE1120mdSubjectGroup").val(response.SubjectGroup_ID);

            $("#GEE1120mdcode").val(response.Code.trim());
            $('#GEE1120mdName').val(response.Name.trim());
            $('#GEE1120mdGriExculdedfromAtt').val(response.ExculdedfromAtt.trim());
            $('#GEE1120mdIncludedInCGPA').val(response.IncludedInCGPA);
        }
    });
}

function DeleteData(subjectMasterId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {
        $.ajax({
            type: 'GET',
            url: '/SubjectMaster/Delete',
            data: { SubjectMaster_ID: subjectMasterId, ModifiedBy_ID: sessionStorage.getItem('CUserId') },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblSubjectMasterdetails').DataTable();
                    oTable.draw();
                    alert("Record has been deleted!");
                }
                else {
                    alert("Something Went Wrong!");
                }
            },
            error: function () {
                alert(" An error occurred.");
            },
        });
    }
}