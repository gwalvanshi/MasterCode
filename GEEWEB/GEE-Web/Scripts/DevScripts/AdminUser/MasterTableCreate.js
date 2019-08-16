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
            Mastertabletype_id: $('#GEE1505MDMasterName').val() == undefined ? 0 : $('#GEE1505MDMasterName').val().trim(),
            Code: $('#GEE1505MDcode').val() == undefined ? "" : $('#GEE1505MDcode').val().trim(),
            Name: $("#GEE1505MDName").val() == undefined ? "" : $('#GEE1505MDName').val().trim(),
            Parent_id: $('#GEE1505MDParentValue').val() == undefined ? 0 : $('#GEE1505MDParentValue').val().trim(),
            IsDefault: $('#GEE1505MDisDefault').val(),
            Remark: $("#GEE1505MDRemark").val() == undefined ? "" : $('#GEE1505MDRemark').val().trim(),
            ISDeleted: false,

        }
        var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/MasterTable/Create', data, true, 'POST');
        oTable = $('#tblmasterdatadetails').DataTable();
        oTable.draw();
       
    }
});

$('#Update').click(function () {
    var CUserId = $('#CUserId').val() == undefined ? "" : $('#CUserId').val();

    var MasterTable_id = $('#MasterTableId').text();
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            MasterTable_id: MasterTable_id,
            Mastertabletype_id: $('#GEE1505MDMasterName').val() == undefined ? 0 : $('#GEE1505MDMasterName').val().trim(),
            Code: $('#GEE1505MDcode').val() == undefined ? "" : $('#GEE1505MDcode').val().trim(),
            Name: $("#GEE1505MDName").val() == undefined ? "" : $('#GEE1505MDName').val().trim(),
            Parent_id: $('#GEE1505MDParentValue').val() == undefined ? 0 : $('#GEE1505MDParentValue').val().trim(),
            IsDefault: $('#GEE1505MDisDefault').val(),
            Remark: $("#GEE1505MDRemark").val() == undefined ? "" : $('#GEE1505MDRemark').val().trim(),
            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/MasterTable/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblmasterdatadetails').DataTable();
        oTable.draw();
       
    }
});

//For Added New 
$("#Add").click(function () {
    FormControlValueClear(true);
    $('#Update').attr("hidden", "hidden");
    $('#Save').removeAttr("hidden", "hidden");
    $('#GEE1505MDMasterName').attr('disabled', false);
});


//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid) {

    if (isValid) {
        $('#GEE1505MDcode,#GEE1505MDName,#GEE1505MDRemark').val('');
        $("#GEE1505MDMasterName,#GEE1505MDParentValue,#GEE1505MDParentName").val("0").change();
        $('#GEE1505MDMasterName').attr('disabled', false);
    }
    else {
        $('#submit').val('Save');
    }
  
}
$("#GEE1505MDMasterName").on('change', function () {
    var masterTableTypeId = $(this).val();
    //CommonGetAjaxMethod('/MasterTable/GetParentValues', masterTableTypeId);
    $.ajax({
        type: 'GET',
        url: '/MasterTable/GetParentValues',
        data: { Id: masterTableTypeId },
        dataType: "json",
        success: function (response) {
            dropdownForParent = response;
            LoadParentDropDown();
        }
    })
});

function LoadParentDropDown() {
    $('#GEE1505MDParentName').empty();
    $("#GEE1505MDParentValue").empty();

    $('#GEE1505MDParentName').append($('<option/>').val(dropdownForParent.Mastertabletype_id).text(dropdownForParent.MastertableName));
    $('#GEE1505MDParentName').val(dropdownForParent.Mastertabletype_id);

    $("#GEE1505MDParentValue").append($('<option/>').val('0').text('Select'));
    $.each(dropdownForParent.MasterTables, function (ii, vall) {
        $("#GEE1505MDParentValue").append($('<option/>').val(vall.MasterTable_id).text(vall.Name));
    })
}

$("#GEE1505MDisDefault").on('change', function () {
    if ($(this).is(':checked')) {
        $(this).attr('value', 'true');
        var SchoolID = sessionStorage.getItem('schoolId');
        var GroupID = sessionStorage.getItem('groupId');

        $.ajax({
            type: 'GET',
            url: '/MasterTable/ChecKIsDefault',
            data: { schoolId: SchoolID, groupId: GroupID },
            dataType: "json",
            success: function (response) {
                if (response) {
                    console.log(response);
                    var x = document.getElementById("toastmsg");
                    x.innerHTML = '<p class="yellow">Are you sure you want to change Default Type</p>';
                    x.className = "show";
                    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
                }
            }
        });
    } else {
        $(this).attr('value', 'false');
    }
});


$(document).ready(function () {
    var ctrlArray = new Array("submit");
    var defaultSelectedId = "2";
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);

    });

    $.getScript(combojsURL, function myfunction() {
        LoadCombo('GEE1505MDMasterName', 'MasterTabletype', 'MastertableName', 'Mastertabletype_id', 'ISDeleted=0' );
        LoadCombo('GEE1505MDAllType', 'MasterTabletype', 'MastertableName', 'Mastertabletype_id', 'ISDeleted=0', defaultSelectedId);
    });
    GetAllMasterData(defaultSelectedId);
});
function Returnobj() {
    var jObj = [

    ];

    var obj1 = { "data": "MasterTable_id", "name": "MasterTable_id", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = { "data": "Code", "name": "Code", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "Name", "name": "Name", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "ParentName", "name": "ParentName", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "DefaultValue", "name": "DefaultValue", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "Remark", "name": "Remark", "autoWidth": true };
    jObj.push(obj6)   
    var obj7 = {
        "orderable": false,
        data: null, render: function (data, type, row)
        {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.MasterTable_id + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.MasterTable_id + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";

        }
    };   
    jObj.push(obj7)
    return jObj;
}
function GetAllMasterData(masterTypeId) {
    
   
    var objData = { "id": masterTypeId};

    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th> MasterTable Id</th>" +
        "<th>" + header1+"</th>" +
        "<th>Name</th>" +
        "<th>Parent Name</th>" +
        "<th>Is Default</th>" +
        "<th>Remark</th>" +
        "<th>Action</th>" +      
        " </tr>" +
        "</thead>;"
    $("#tblmasterdatadetails").html(html);
    $("#tblmasterdatadetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "searching": false,
        "ajax": {
            "url": '/MasterTable/Index',
            "type": "POST",
            "datatype": "json",
             "data": objData
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

function EditData(Mstid)
{
    
    $('#Update').removeAttr("hidden", "hidden");
    $('#Save').attr("hidden", "hidden");

    $.ajax({
        type: 'GET',
        url: '/MasterTable/GetDataToEdit',
        data: { id: Mstid },
        dataType: "json",
        success: function (response)
        {
            document.getElementById("GEE1505MDisDefault").checked = false;
            $("#GEE1505MDisDefault").attr('value', 'false');
            if (response.IsDefault == true) {
                document.getElementById("GEE1505MDisDefault").checked = true;
                $("#GEE1505MDisDefault").attr('value', 'true');
            }
            $('#MasterTableId').text(response.MasterTable_id);
            $("#GEE1505MDMasterName").val(response.Mastertabletype_id);
            $('#GEE1505MDMasterName').attr('disabled', true);
            $("#GEE1505MDcode").val(response.Code);
            $('#GEE1505MDName').val(response.Name);
            $('#GEE1505MDParentValue').val(response.Parent_id);
            GetParent(response.Mastertabletype_id, response.Parent_id);
            $('#GEE1505MDRemark').text(response.Remark);
        }
    });
}

function DeleteData(mstId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {
        $.ajax({
            type: 'GET',
            url: '/MasterTable/Delete',
            data: { MasterTable_id: mstId, ModifiedBy_ID:sessionStorage.getItem('CUserId')},
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblmasterdatadetails').DataTable();
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
        })
    }
}

function GetParent(Mastertabletype_id, Parent_id) {
    var masterTableTypeId = Mastertabletype_id;
    $.ajax({
        type: 'GET',
        url: '/MasterTable/GetParentValues',
        data: { Id: masterTableTypeId },
        dataType: "json",
        success: function (response) {
            dropdownForParent = response;
            LoadParentDropDownForEdit(Parent_id);
        }
    });
}

function LoadParentDropDownForEdit(Parent_id) {
    $('#GEE1505MDParentName').empty();
    $("#GEE1505MDParentValue").empty();

    $('#GEE1505MDParentName').append($('<option/>').val(dropdownForParent.Mastertabletype_id).text(dropdownForParent.MastertableName));
    $('#GEE1505MDParentName').val(dropdownForParent.Mastertabletype_id);

    $("#GEE1505MDParentValue").append($('<option/>').val('0').text('Select'));
    $.each(dropdownForParent.MasterTables, function (ii, vall) {
        $("#GEE1505MDParentValue").append($('<option/>').val(vall.MasterTable_id).text(vall.Name));
    })
    $('#GEE1505MDParentValue').val(Parent_id);
}

$('#btnSearch').click(function () {   
    $("#tblmasterdatadetails").dataTable().fnDestroy();
    var masterTypeId = $('#GEE1505MDAllType').val();
    GetAllMasterData(masterTypeId);
});

