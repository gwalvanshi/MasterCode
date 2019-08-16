var dropdownData = [];
var dropdownMasterData = [];
var requiredFeild = [];
var dropdowndocumentTypeData = [];
var AllDocumentTypeData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#Save').click(function () {
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {

            DocumentTypeCode: $('#GEE1510mdDocumentCode').val() == undefined ? "" : $('#GEE1510mdDocumentCode').val().trim(),
            DocumentTypeName: $("#GEE1510mdDocumentName").val() == undefined ? "" : $('#GEE1510mdDocumentName').val().trim(),
            DocumentCategoryID: $('#GEE1510mdDocumentCategory').val() == undefined ? 0 : $('#GEE1510mdDocumentCategory').val().trim(),
            Digitalallowed: $('#GEE1510mdDigitalAllowed').val(),
            IsMandatory: $('#GEE1510mdIsMandetory').val(),
            ToFollow: $('#GEE1510mdToFollow').val(),
            FollowupTypeCode: $('#GEE1510mdfollowType').val(),
            Remarks: $("#GEE1510mdRemark").val() == undefined ? "" : $('#GEE1510mdRemark').val().trim(),
            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        console.log(data);
        data.CreatedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/DocumentType/Create', data, true, 'POST');
        oTable = $('#tblDocumentTypedetails').DataTable();
        oTable.draw();
    }
});

$('#Update').click(function () {

    var DocumentTypeID = $('#DocumentTypeID').text();
    isAllValid = checkValidationOnSubmit();

    if (isAllValid) {
        var data =
        {
            DocumentTypeID: DocumentTypeID,
            DocumentTypeCode: $('#GEE1510mdDocumentCode').val() == undefined ? "" : $('#GEE1510mdDocumentCode').val().trim(),
            DocumentTypeName: $("#GEE1510mdDocumentName").val() == undefined ? "" : $('#GEE1510mdDocumentName').val().trim(),
            DocumentCategoryID: $('#GEE1510mdDocumentCategory').val() == undefined ? 0 : $('#GEE1510mdDocumentCategory').val().trim(),
            Digitalallowed: $('#GEE1510mdDigitalAllowed').val(),
            IsMandatory: $('#GEE1510mdIsMandetory').val(),
            ToFollow: $('#GEE1510mdToFollow').val(),
            FollowupTypeCode: $('#GEE1510mdfollowType').val() == undefined ? 0 : $('#GEE1510mdfollowType').val().trim(),
            Remarks: $("#GEE1510mdRemark").val() == undefined ? "" : $('#GEE1510mdRemark').val().trim(),
            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/DocumentType/Edit', data, true, 'POST');
        $('#Update').attr("hidden", "hidden");
        $('#Save').removeAttr("hidden", "hidden");
        oTable = $('#tblDocumentTypedetails').DataTable();
        oTable.draw();
    }
});

$("#GEE1510mdDigitalAllowed").on('change', function () {
    if ($(this).is(':checked')) {
        $(this).attr('value', 'true');
    } else {
        $(this).attr('value', 'false');
    }
});
$("#GEE1510mdIsMandetory").on('change', function () {
    if ($(this).is(':checked')) {
        $(this).attr('value', 'true');
    } else {
        $(this).attr('value', 'false');
    }
});
$("#GEE1510mdToFollow").on('change', function () {
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
        $('#GEE1510mdDocumentCode,#GEE1510mdDocumentName,#GEE1510mdRemark').val('');
        $("#GEE1510mdDocumentCategory,#GEE1510mdfollowType").val("0").change();
        $("#GEE1510mdDigitalAllowed").attr('value', 'false');
        $("#GEE1510mdToFollow").attr('value', 'false');
        $("#GEE1510mdIsMandetory").attr('value', 'false');
        document.getElementById("GEE1510mdDigitalAllowed").checked = false;
        document.getElementById("GEE1510mdToFollow").checked = false;
        document.getElementById("GEE1510mdIsMandetory").checked = false;
    }
    else {
        $('#submit').val('Save');
    }
}

var defaultSelectedId = "51";
$(document).ready(function () {
    
    var ctrlArray = new Array("submit");
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);

    });
    $.getScript(combojsURL, function myfunction() {
        //LoadCombo('DocumentTypeAll', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.DocumentCategory + '', defaultSelectedId);
        //LoadCombo('GEE1510mdDocumentCategory', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Parent_id=' + defaultSelectedId +'');
        //LoadCombo('GEE1510mdfollowType', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.FollowType + '');

        LoadMasterDropdown('DocumentTypeAll', null, MasterTypeEnum.DocuemntMastercategory, null, null, null, false);
        LoadMasterDropdown('GEE1510mdDocumentCategory', null, MasterTypeEnum.Docuementcategory, null, null, null, false);
        LoadMasterDropdown('GEE1510mdfollowType', null, MasterTypeEnum.DocumentFollowupType, null, null, null, false);

    });

    GetAllDocumentTypeData(defaultSelectedId);
});

function Returnobj() {
    var jObj = [
    ];

    var obj1 = { "data": "DocumentTypeID", "name": "DocumentTypeID", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = { "data": "DocumentCategoryName", "name": "DocumentCategoryName", "autoWidth": true };
    jObj.push(obj2)
    var obj3 = { "data": "DocumentTypeCode", "name": "DocumentTypeCode", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "DocumentTypeName", "name": "DocumentTypeName", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "FollowupTypeCode", "name": "FollowupTypeCode", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "Remarks", "name": "Remarks", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = {
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.DocumentTypeID + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.DocumentTypeID + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";

        }
    };
    jObj.push(obj7)
    return jObj;
}


function GetAllDocumentTypeData(parentId) {
    var objData = { "id": parentId};
    
    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th>Document Type Id</th>" +
        "<th>Document Category</th>" +
        "<th>Document Code</th>" +
        "<th>Document Name</th>" +
        "<th>Follow Type Code</th>" +
        "<th>Remarks</th >" +
        "<th>Action</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblDocumentTypedetails").html(html);
    $("#tblDocumentTypedetails").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "ajax": {
            "url": '/DocumentType/Index',
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

function EditData(docId) {

    $('#Update').removeAttr("hidden", "hidden");
    $('#Save').attr("hidden", "hidden");

    $.ajax({
        type: 'GET',
        url: '/DocumentType/GetDataToEdit',
        data: { id: docId },
        dataType: "json",
        success: function (response) {
            console.log(response);
            $('#DocumentTypeID').text(response.DocumentTypeID);
            if (response.Digitalallowed == true) {
                document.getElementById("GEE1510mdDigitalAllowed").checked = true;
                $("#GEE1510mdDigitalAllowed").attr('value', 'true');
            }
            if (response.IsMandatory == true) {
                document.getElementById("GEE1510mdIsMandetory").checked = true;
                $("#GEE1510mdIsMandetory").attr('value', 'true');
            }
            if (response.ToFollow == true) {
                document.getElementById("GEE1510mdToFollow").checked = true;
                $("#GEE1510mdToFollow").attr('value', 'true');
            }
            $('#DocumentTypeID').text(response.DocumentTypeID);
            $("#GEE1510mdDocumentCategory").val(response.DocumentCategoryID);
            $("#GEE1510mdDocumentCode").val(response.DocumentTypeCode.trim());
            $('#GEE1510mdDocumentName').val(response.DocumentTypeName.trim());
            $('#GEE1510mdfollowType').val(response.FollowupTypeCode.trim());
            $('#GEE1510mdRemark').val(response.Remarks);
        }
    });
}

function DeleteData(docId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {
        $.ajax({
            type: 'GET',
            url: '/DocumentType/Delete',
            data: { DocumentTypeID: docId, ModifiedBy_ID: sessionStorage.getItem('CUserId') },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblDocumentTypedetails').DataTable();
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

$('#btnSearch').click(function () {
    $("#tblDocumentTypedetails").dataTable().fnDestroy();
    var docCatId = $('#DocumentTypeAll').val();
    console.log(docCatId);
    dropdownData = [];
    LoadCombo('GEE1510mdDocumentCategory', 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Parent_id=' + docCatId + '');

    GetAllDocumentTypeData(docCatId);
    oTable = $('#tblDocumentTypedetails').DataTable();
    oTable.draw();

});