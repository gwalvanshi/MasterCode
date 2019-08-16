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
            BookMaster_Id: $('#BookMaster_Id').text() == undefined ? 0 : $('#BookMaster_Id').text().trim(),            
            Code: $("#GEE1130mdcode").val() == undefined ? "" : $('#GEE1130mdcode').val().trim(),
            Name: $('#GEE1130mdName').val() == undefined ? 0 : $('#GEE1130mdName').val().trim(),            
            Publisher: $("#GEE1130mdPublisher").val() == undefined ? "" : $('#GEE1130mdPublisher').val().trim(),
            ISBN: $("#GEE1130mdISBN").val() == undefined ? "" : $('#GEE1130mdISBN').val().trim(),
            Version: $("#GEE1130mdVersion").val() == undefined ? "" : $('#GEE1130mdVersion').val().trim(),
            MRP: $("#GEE1130mdMRP").val() == undefined ? "" : $('#GEE1130mdMRP').val().trim(),
            Discount: $("#GEE1130mdDiscount").val() == undefined ? "" : $('#GEE1130mdDiscount').val().trim(),
            ISDeleted: false,
        }
        var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/BookMaster/Create', data, true, 'POST');
        oTable = $('#tblbookmasterdatadetails').DataTable();
        oTable.draw();
    }
});

$('#Update').click(function () {
    var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

    var MasterTable_id = $('#BookMaster_Id').text();
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {                        
            BookMaster_Id: $('#BookMaster_Id').text() == undefined ? 0 : $('#BookMaster_Id').text().trim(),
            Code: $("#GEE1130mdcode").val() == undefined ? "" : $('#GEE1130mdcode').val().trim(),
            Name: $('#GEE1130mdName').val() == undefined ? 0 : $('#GEE1130mdName').val().trim(),
            Publisher: $("#GEE1130mdPublisher").val() == undefined ? "" : $('#GEE1130mdPublisher').val().trim(),
            ISBN: $("#GEE1130mdISBN").val() == undefined ? "" : $('#GEE1130mdISBN').val().trim(),
            Version: $("#GEE1130mdVersion").val() == undefined ? "" : $('#GEE1130mdVersion').val().trim(),
            MRP: $("#GEE1130mdMRP").val() == undefined ? "" : $('#GEE1130mdMRP').val().trim(),
            Discount: $("#GEE1130mdDiscount").val() == undefined ? "" : $('#GEE1130mdDiscount').val().trim(),
            ISDeleted: false,
            //CreatedDate: $("#hdnCreatedDate").val() == undefined ? "" : $('#hdnCreatedDate').val().trim() 
        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        //data.CreatedBy_ID = sessionStorage.getItem('CUserId');

        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/BookMaster/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblbookmasterdatadetails').DataTable();
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
        $('#GEE1130mdName,#GEE1130mdcode,#GEE1130mdPublisher,#GEE1130mdISBN,#GEE1130mdVersion,#GEE1130mdMRP,#GEE1130mdDiscount').val('');        
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
    var obj1 = { "data": "BookMaster_Id", "name": "BookMaster_Id", "autoWidth": true };
    jObj.push(obj1)    
    var obj2 = { "data": "Code", "name": "Code", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "name", "name": "name", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "Publisher", "name": "Publisher", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "ISBN", "name": "ISBN", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "Version", "name": "Version", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = { "data": "MRP", "name": "MRP", "autoWidth": true };
    jObj.push(obj7)
    var obj8 = { "data": "Discount", "name": "Discount", "autoWidth": true };
    jObj.push(obj8)
    var obj9 = {
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.BookMaster_Id + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.BookMaster_Id + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";
        }
    };
    jObj.push(obj9)
    return jObj;
}
function GetAllMasterData() {

    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th> BookMaster Id</th>" +        
        "<th>Code</th>" +
        "<th>Name</th>" +
        "<th>Publisher</th>" +
        "<th>ISBN</th>" +
        "<th>Version</th>" +
        "<th>MRP</th>" +
        "<th>Discount</th>" +
        "<th>Action</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblbookmasterdatadetails").html(html);
    $("#tblbookmasterdatadetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "searching": false,
        "ajax": {
            "url": '/BookMaster/Index',
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
        url: '/BookMaster/GetDataToEdit',
        data: { id: RId },
        dataType: "json",
        success: function (response) {
            $('#BookMaster_Id').text(response.BookMaster_Id);
            $("#GEE1130mdName").val(response.name);
            $("#GEE1130mdcode").val(response.Code);
            $('#GEE1130mdPublisher').val(response.Publisher);
            $('#GEE1130mdISBN').val(response.ISBN);
            $('#GEE1130mdVersion').val(response.Version);
            $('#GEE1130mdMRP').val(response.MRP);
            $('#GEE1130mdDiscount').val(response.Discount);
            $('#hdnCreatedDate').val(response.CreatedDate)
        }
    });
}

function DeleteData(RId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {

        $.ajax({
            type: 'POST',
            url: '/BookMaster/Delete',
            data: { ID: RId },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblbookmasterdatadetails').DataTable();
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
