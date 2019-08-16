var dropdownData = [];
var requiredFeild = [];
var dropdownStopMasterData = [];
var AllStopMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#Save').click(function () {
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            StopCode : $('#GEE1720mdStopCode').val() == undefined ? "" : $('#GEE1720mdStopCode').val().trim(),
            StopName: $("#GEE1720mdStopName").val() == undefined ? "" : $('#GEE1720mdStopName').val().trim(),
            Locality: $("#GEE1720mdLocality").val() == undefined ? "" : $('#GEE1720mdLocality').val().trim(),
            StopAddress: $("#GEE1720mdStopAddress").val() == undefined ? "" : $('#GEE1720mdStopAddress').val().trim(),
            PinCode: $('#GEE1720mdPinCode').val() == undefined ? "" : $('#GEE1720mdPinCode').val().trim(),
            GeoCoordinates: $('#GEE1720mdGeoCoordinates').val() == undefined ? "" : $('#GEE1720mdGeoCoordinates').val().trim(),

            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/StopMaster/Create', data, true, 'POST');
        oTable = $('#tblStopMasterdetails').DataTable();
        oTable.draw();
    }
});

$('#Update').click(function () {

    var StopMaster_ID = $('#StopMaster_ID').text();
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            StopMasterID: StopMaster_ID,
            StopCode: $('#GEE1720mdStopCode').val() == undefined ? "" : $('#GEE1720mdStopCode').val().trim(),
            StopName: $("#GEE1720mdStopName").val() == undefined ? "" : $('#GEE1720mdStopName').val().trim(),
            Locality: $("#GEE1720mdLocality").val() == undefined ? "" : $('#GEE1720mdLocality').val().trim(),
            StopAddress: $("#GEE1720mdStopAddress").val() == undefined ? "" : $('#GEE1720mdStopAddress').val().trim(),
            PinCode: $('#GEE1720mdPinCode').val() == undefined ? "" : $('#GEE1720mdPinCode').val().trim(),
            GeoCoordinates: $('#GEE1720mdGeoCoordinates').val() == undefined ? "" : $('#GEE1720mdGeoCoordinates').val().trim(),
            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/StopMaster/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblStopMasterdetails').DataTable();
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
    console.log(isValid);
    if (isValid) {
        $('#GEE1720mdStopCode,#GEE1720mdStopName,#GEE1720mdLocality,#GEE1720mdStopAddress,#GEE1720mdGeoCoordinates,#GEE1720mdPinCode').val('');
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
    
    GetAllStopMasterData();
});

function Returnobj() {
    var jObj = [
    ];
    

    var obj1 = { "data": "StopMasterID", "name": "StopMasterID", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = { "data": "StopCode", "name": "StopCode", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "StopName", "name": "StopName", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "Locality", "name": "Locality", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "StopAddress", "name": "StopAddress", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "PinCode", "name": "PinCode", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = { "data": "GeoCoordinates", "name": "GeoCoordinates", "autoWidth": true };
    jObj.push(obj7)
   
    var obj8 = {
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.StopMasterID + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.StopMasterID + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";
        }
    };
    jObj.push(obj8)
    return jObj;
}


function GetAllStopMasterData(StopMaster_ID) {
    var objData = { "id": StopMaster_ID };

    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th>Stop Master Id</th>" +
        "<th>Stop Code</th>" +
        "<th>Stop Name</th >" +
        "<th>Locality</th >" +
        "<th>Stop Address</th >" +
        "<th>Pin Code</th >" +
        "<th>Geo Coordinates</th >" +
        "<th>Action</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblStopMasterdetails").html(html);
    $("#tblStopMasterdetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "ajax": {
            "url": '/StopMaster/Index',
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

function EditData(StopMaster_ID) {

    $('#Update').removeAttr("hidden", "hidden");
    $('#Save').attr("hidden", "hidden");

    $.ajax({
        type: 'GET',
        url: '/StopMaster/GetDataToEdit',
        data: { id: StopMaster_ID },
        dataType: "json",
        success: function (response) {
            console.log(response);
            $('#StopMaster_ID').text(response.StopMasterID);

            $("#GEE1720mdStopCode").val(response.StopCode.trim());
            $('#GEE1720mdStopName').val(response.StopName.trim());
            $('#GEE1720mdStopAddress').val(response.StopAddress.trim());
            $('#GEE1720mdLocality').val(response.Locality);
            $('#GEE1720mdPinCode').val(response.PinCode);
            $('#GEE1720mdGeoCoordinates').val(response.GeoCoordinates);

        }
    });
}

function DeleteData(StopMasterId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {
        $.ajax({
            type: 'GET',
            url: '/StopMaster/Delete',
            data: { StopMasterID: StopMasterId, ModifiedBy_ID: sessionStorage.getItem('CUserId') },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblStopMasterdetails').DataTable();
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