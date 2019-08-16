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
            ClassMaster_ID: $('#ClassMaster_ID').text() == undefined ? 0 : $('#ClassMaster_ID').text().trim(),
            ClassClassification_Id: $('#GEE1110mdClassClassification').val() == undefined ? "" : $('#GEE1110mdClassClassification').val().trim(),
            Name: $('#GEE1110mdName').val() == undefined ? 0 : $('#GEE1110mdName').val().trim(),
            Code: $("#GEE1110mdCode").val() == undefined ? "" : $('#GEE1110mdCode').val().trim(),
            Sequence: $("#GEE1110mdSequence").val() == undefined ? "" : $('#GEE1110mdSequence').val().trim(),
            TotalSections: $("#GEE1110mdTotalSections").val() == undefined ? "" : $('#GEE1110mdTotalSections').val().trim(),
            ISDeleted: false,
        }
        var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/ClassMaster/Create', data, true, 'POST');
        oTable = $('#tblclassmasterdatadetails').DataTable();
        oTable.draw();
    }
});

$('#Update').click(function () {
    var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

    var MasterTable_id = $('#ClassMaster_ID').text();
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            ClassMaster_ID: $('#ClassMaster_ID').text() == undefined ? 0 : $('#ClassMaster_ID').text().trim(),
            ClassClassification_Id: $('#GEE1110mdClassClassification').val() == undefined ? "" : $('#GEE1110mdClassClassification').val().trim(),
            Name: $('#GEE1110mdName').val() == undefined ? 0 : $('#GEE1110mdName').val().trim(),
            Code: $("#GEE1110mdCode").val() == undefined ? "" : $('#GEE1110mdCode').val().trim(),
            Sequence: $("#GEE1110mdSequence").val() == undefined ? "" : $('#GEE1110mdSequence').val().trim(),
            TotalSections: $("#GEE1110mdTotalSections").val() == undefined ? "" : $('#GEE1110mdTotalSections').val().trim(),
            ISDeleted: false,
            //CreatedDate: $("#hdnCreatedDate").val() == undefined ? "" : $('#hdnCreatedDate').val().trim() 
        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        //data.CreatedBy_ID = sessionStorage.getItem('CUserId');

        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/ClassMaster/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblclassmasterdatadetails').DataTable();
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
        $('#GEE1110mdName,#GEE1110mdCode,#GEE1110mdSequence,#GEE1110mdTotalSections').val('');
        $("#GEE1110mdClassClassification").val("0").change();
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

    $.getScript(combojsURL, function myfunction() {
        LoadMasterDropdown('GEE1110mdClassClassification', null, MasterTypeEnum.ClassClassification, null, null, null, false);
    });
    GetAllMasterData();
});
function Returnobj() {
    var jObj = [
    ];
    var obj1 = { "data": "ClassMaster_ID", "name": "ClassMaster_ID", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = { "data": "ClassClassification", "name": "ClassClassification", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "Code", "name": "Code", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "Name", "name": "Name", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "Sequence", "name": "Sequence", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "TotalSections", "name": "TotalSections", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = {
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.ClassMaster_ID + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.ClassMaster_ID + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";
        }
    };
    jObj.push(obj7)
    return jObj;
}
function GetAllMasterData() {

    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th> MasterTable Id</th>" +
        "<th>Class Classification</th>" +
        "<th>Code</th>" +
        "<th>Name</th>" +
        "<th>Sequence</th>" +
        "<th>Total Sections</th>" +
        "<th>Action</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblclassmasterdatadetails").html(html);
    $("#tblclassmasterdatadetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "searching": false,
        "ajax": {
            "url": '/ClassMaster/Index',
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
        url: '/ClassMaster/GetDataToEdit',
        data: { id: RId },
        dataType: "json",
        success: function (response) {
            $('#ClassMaster_ID').text(response.ClassMaster_ID);
            $("#GEE1110mdClassClassification").val(response.ClassClassification_Id);
            $("#GEE1110mdCode").val(response.Code);
            $('#GEE1110mdName').val(response.Name);
            $('#GEE1110mdSequence').val(response.Sequence);
            $('#GEE1110mdTotalSections').val(response.TotalSections);
            $('#hdnCreatedDate').val(response.CreatedDate)
        }
    });
}

function DeleteData(RId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {

        $.ajax({
            type: 'POST',
            url: '/ClassMaster/Delete',
            data: { ID: RId },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblclassmasterdatadetails').DataTable();
                    oTable.draw();
                    //alert("Record has been deleted!");

                    var x = document.getElementById("toastmsg");
                    x.innerHTML = '<p class="green">Record has been deleted!</p>';
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
