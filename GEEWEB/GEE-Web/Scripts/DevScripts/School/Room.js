var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$(document).ready(function () {
    var ctrlArray = new Array("submit");
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
       // GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);
    });
    $.getScript(combojsURL, function myfunction()
    {     
        LoadMasterDropdown('GEE1115mdBuildingsinfo', null, MasterTypeEnum.BuildingMaster, null, null, null, false);
    });

    $("#GEE1115mdSeatingCapacity").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            $("#errmsgSeat").show();
            $("#errmsgSeat").delay(2000).fadeOut(3000);    
           // $("#errmsgSeat").show().fadeOut("slow").animate({ backgroundColor: '#CD3333' }, "slow");
            return false;
        }
    });

    GetAllRoomData();
});

$('#Save').click(function () {
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            Building_ID: $('#GEE1115mdBuildingsinfo').val() == undefined ? "" : $('#GEE1115mdBuildingsinfo').val().trim(),
            Code: $("#GEE1115mdCode").val() == undefined ? "" : $('#GEE1115mdCode').val().trim(),
            Name: $("#GEE1115mdName").val() == undefined ? "" : $('#GEE1115mdName').val().trim(),
            SeatingCapicity: $('#GEE1115mdSeatingCapacity').val() == undefined ? 0 : $('#GEE1115mdSeatingCapacity').val().trim(),
            GeoCoordinates: $("#GEE1115mdGeoCoordinates").val() == undefined ? "" : $('#GEE1115mdGeoCoordinates').val().trim(),
            Remarks: $("#GEE1115mdRemark").val() == undefined ? "" : $('#GEE1115mdRemark').val().trim(),
            ISDeleted: false,
        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/Room/Create', data, true, 'POST');
        oTable = $('#tblRoomdetails').DataTable();
        oTable.draw();
    }
});

//Method too add new Room
$('#Update').click(function () {

    var RoomMaster_ID = $('#RoomMaster_ID').text();
   
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            RoomMaster_ID: RoomMaster_ID,
            Building_ID: $('#GEE1115mdBuildingsinfo').val() == undefined ? "" : $('#GEE1115mdBuildingsinfo').val().trim(),
            Code: $("#GEE1115mdCode").val() == undefined ? "" : $('#GEE1115mdCode').val().trim(),
            Name: $("#GEE1115mdName").val() == undefined ? "" : $('#GEE1115mdName').val().trim(),
            SeatingCapicity: $('#GEE1115mdSeatingCapacity').val() == undefined ? 0 : $('#GEE1115mdSeatingCapacity').val().trim(),
            GeoCoordinates: $("#GEE1115mdGeoCoordinates").val() == undefined ? "" : $('#GEE1115mdGeoCoordinates').val().trim(),
            Remarks: $("#GEE1115mdRemark").val() == undefined ? "" : $('#GEE1115mdRemark').val().trim(),
            ISDeleted: false,
        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/Room/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblRoomdetails').DataTable();
        oTable.draw();
        FormControlValueClear(true);
    }
});

//Method too add new Room
$("#Add").click(function () {
    FormControlValueClear(true);
    $('#Update').attr("hidden", "hidden");
    $('#Save').removeAttr("hidden", "hidden");
});

//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid) {

    if (isValid) {
        $('#GEE1115mdCode,#GEE1115mdName,#GEE1115mdSeatingCapacity,#GEE1115mdGeoCoordinates,#GEE1115mdRemark').val('');
        $("#GEE1115mdBuildingsinfo").val("0").change();
       
    }
    else {
        $('#submit').val('Save');
    }
}

function Returnobj() {
    var jObj = [
    ];

    var obj1 = { "data": "RoomMaster_ID", "name": "RoomMaster_ID", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = { "data": "BuildingName", "name": "BuildingName", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "Code", "name": "Code", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "Name", "name": "Name", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "SeatingCapicity", "name": "SeatingCapicity", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "GeoCoordinates", "name": "GeoCoordinates", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = { "data": "Remarks", "name": "Remarks", "autoWidth": true };
    jObj.push(obj7)
    var obj8 = {
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.RoomMaster_ID + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.RoomMaster_ID + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";
        }
    };
    jObj.push(obj8)
    return jObj;
}

function GetAllRoomData() {
    var objData = { "FristName": "data", "SecondName": "tr" };
    
    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th>Room Master Id</th>" +
        "<th>Building Name</th>" +
        "<th>Code</th>" +
        "<th>Name</th>" +
        "<th>Seating Capacity</th>" +
        "<th>GeoCoordinates</th>" +
        "<th>Remarks</th >" +
        "<th>Action</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblRoomdetails").html(html);
    $("#tblRoomdetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "ajax": {
            "url": '/Room/Index',
            "type": "POST",
            "datatype": "json"//,
            // "data": objData
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

function EditData(RoomMaster_ID) {

    $('#Update').removeAttr("hidden", "hidden");
    $('#Save').attr("hidden", "hidden");
  

    $.ajax({
        type: 'GET',
        url: '/Room/GetDataToEdit',
        data: { id: RoomMaster_ID },
        dataType: "json",
        success: function (response) {
            console.log(response);
            $("#RoomMaster_ID").text(response.RoomMaster_ID);
            $("#GEE1115mdBuildingsinfo").val(response.Building_ID);
            $("#GEE1115mdCode").val(response.Code);
            $("#GEE1115mdName").val(response.Name);
            $("#GEE1115mdSeatingCapacity").val(response.SeatingCapicity);
            $("#GEE1115mdGeoCoordinates").val(response.GeoCoordinates);
            $("#GEE1115mdRemark").val(response.Remarks);
        }
    });
}

function DeleteData(RoomMaster_ID) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {
        $.ajax({
            type: 'GET',
            url: '/Room/Delete',
            data: { RoomMaster_ID: RoomMaster_ID, ModifiedBy_ID: sessionStorage.getItem('CUserId') },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblRoomdetails').DataTable();
                    oTable.draw();

                    var x = document.getElementById("toastmsg");
                    x.innerHTML = '<p class="green">Record has been deleted!e</p>';
                    x.className = "show";
                    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
//                    alert("Record has been deleted!");
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