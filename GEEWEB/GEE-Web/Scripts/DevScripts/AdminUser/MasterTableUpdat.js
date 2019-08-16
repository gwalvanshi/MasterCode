var masterTableDetails = []
var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var dropdownForParent = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#Update').click(function () {
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
            ISDeleted: false,

        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        CommonAjaxMethod('/MasterTable/Edit', data, true, 'POST');

    }
});

//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid) {

    if (isValid) {
        $('#GEE1505MDcode,#GEE1505MDName').val('');
        $("#GEE1505MDMasterName,#GEE1505MDParentValue,GEE1505MDParentName").val("0").change();
    }
    else {
        $('#Update').val('Update');
    }
}

$("#GEE1505MDMasterName").on('change', function () {
    var masterTableTypeId = $(this).val();
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

function GetMasterTableDetails() {
    var MasterTable_id = $('#MasterTableId').text();

    $.ajax({
        type: 'GET',
        url: '/MasterTable/Editasy',
        data: { Id: MasterTable_id },
        dataType: "json",
        success: function (response) {
            masterTableDetails = response;
            BindEdit();
            $.getScript(combojsURL, function myfunction() {
                LoadCombo('GEE1505MDMasterName', 'MasterTabletype', 'MastertableName', 'Mastertabletype_id', 'ISDeleted=0', String(masterTableDetails.Mastertabletype_id));
                GetParent(masterTableDetails.Mastertabletype_id);
            });
        },
        error: function () {
            alert(" An error occurred.");
        },
    })
}

function GetParent(Mastertabletype_id) {
    var masterTableTypeId = Mastertabletype_id;
    $.ajax({
        type: 'GET',
        url: '/MasterTable/GetParentValues',
        data: { Id: masterTableTypeId },
        dataType: "json",
        success: function (response) {
            console.log(response);
            dropdownForParent = response;
            LoadParentDropDown();
        }
    })
}

function LoadParentDropDown() {
    $('#GEE1505MDParentName').empty();
    $("#GEE1505MDParentValue").empty();

    $('#GEE1505MDParentName').append($('<option/>').val(dropdownForParent.Mastertabletype_id).text(dropdownForParent.MastertableName));
    $('#GEE1505MDParentName').val(dropdownForParent.Mastertabletype_id);

    $("#GEE1505MDParentValue").append($('<option/>').val('0').text('Select'));
    $.each(dropdownForParent.MasterTables, function (ii, vall) {
        $("#GEE1505MDParentValue").append($('<option/>').val(vall.MasterTable_id).text(vall.Name));
    })
    $('#GEE1505MDParentValue').val(masterTableDetails.Parent_id);
}
function BindEdit() {
    if (masterTableDetails.IsDefault == true) {
        $('#GEE1505MDisDefault:checked').val();
    }
        $("#GEE1505MDMasterName").val(masterTableDetails.Mastertabletype_id);
        $("#GEE1505MDcode").val(masterTableDetails.Code);
        $('#GEE1505MDName').val(masterTableDetails.Name);
        $('#GEE1505MDParentValue').val(masterTableDetails.Parent_id);
}

$(document).ready(function () {
    GetMasterTableDetails();
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(1505);

    });
    $.getScript(combojsURL, function myfunction() {
        LoadCombo('GEE1505MDMasterName', 'MasterTabletype', 'MastertableName', 'Mastertabletype_id', 'ISDeleted=0');
    });

});


