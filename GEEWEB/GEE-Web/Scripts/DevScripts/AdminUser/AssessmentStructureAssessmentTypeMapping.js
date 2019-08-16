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

$('.clsSave').click(function () {
    
    var objtable  = [];
    $('.clschk').each(function () {

        if ($(this).is(':checked')) {

            var AsId = $(this).val();
            var AsAtId = $(this).attr('rel');

            var rowData = {
                AssessmentStructureAssessmentTypeMapping_Id: AsAtId,
                AssessmentStructureID: $("#ddlAssessmentStructure").val(),
                AssessmentTypeID: AsId,
                CreatedBy_ID: sessionStorage.getItem('CUserId'),
                ModifiedBy_ID: sessionStorage.getItem('CUserId'),
                SchoolID: sessionStorage.getItem('schoolId'),
                GroupID: sessionStorage.getItem('groupId'), 
                Sessionyear: sessionStorage.getItem('sessionYear'), 
            };
            objtable.push(rowData);
        }
    });
     
    var strJsonData = JSON.stringify(objtable );

    if (objtable != undefined && objtable .length > 0) {

        var _url = window.location.protocol + "//" + window.location.host;
        $.ajax({
            type: 'POST',
            url: _url + '/Admin/AssessmentStructureAssessmentTypeMapping/SaveTableData',
            data: { strJsonData: strJsonData },
            dataType: "json",
            success: function (data) {
                if (data) {
                    //$("#_tblcource tbody").html('');
                    //$(".clssublist").removeClass("clshide");
                    //$(".chksujitm").attr("checked", false);

                    var x = document.getElementById("toastmsg");
                    x.innerHTML = '<p class="green">Saved successfully!</p>';
                    x.className = "show";

                    oTable = $('#tblAssessmentStructureAssessmentTypeMapping').DataTable();
                    oTable.draw();
                    //setTimeout(function () {
                    //    x.className = x.className.replace("show", "");
                    //    window.location.href = _url + "/Admin/AssessmentStructureAssessmentTypeMapping/Create";
                    //}, 1500);

                    return;
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
    else {
        var x = document.getElementById("toastmsg");
        x.innerHTML = '<p class="red">"Please select create assessment structure!</p>';
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return;
    }
    
}); 

$(document).ready(function () {
    if ($("#hdnselId").val() != "0" && $("#hdnselId").val() != "") {
        $("#ddlAssessmentStructure").val($("#hdnselId").val());
    }

    var ctrlArray = new Array("submit");
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);
    });

    //$.getScript(combojsURL, function myfunction() {
    //    LoadMasterDropdown('ddlAssessmentStructure', null, MasterTypeEnum.AssessmentStructure, null, null, null, false);
    //});

    GetAllMasterData();

});

function Returnobj() {

    var jObj = [
    ];
    var obj1 = { "data": "AssessmentStructureAssessmentTypeMapping_Id", "name": "AssessmentType_Id", "autoWidth": true };
    jObj.push(obj1)
    var obj2 = {
        data: null, render: function (data, type, row) {
            if (row.AssessmentStructureAssessmentTypeMapping_Id != null) {
                return "<div class='custom-control custom-checkbox'><input class='custom-control-input' type='checkbox' id='chk_" + row.AssessmentType_Id + "' value='" + row.AssessmentType_Id + "' rel='" +  row.AssessmentStructureAssessmentTypeMapping_Id + "' checked=checked   disabled=disabled ><label class='custom-control-label' for='chk_" + row.AssessmentType_Id + "'></label></div>";
            }
            else {
                return "<div class='custom-control custom-checkbox'><input class='custom-control-input clschk' type='checkbox' id='chk_" + row.AssessmentType_Id + "' value='" + row.AssessmentType_Id + "' rel='0' ><label class='custom-control-label' for='chk_" + row.AssessmentType_Id + "'></label></div>";
            }             
        }
    };
    jObj.push(obj2)
    var obj3 = { "data": "AssessmentType_code", "name": "AssessmentType_code", "autoWidth": true };
    jObj.push(obj3)
    var obj4 = { "data": "AssessmentType_Name", "name": "AssessmentType_Name", "autoWidth": true };
    jObj.push(obj4)
    var obj5 = { "data": "PassingMarks", "name": "PassingMarks", "autoWidth": true };
    jObj.push(obj5)
    var obj6 = { "data": "MaxMarks", "name": "MaxMarks", "autoWidth": true };
    jObj.push(obj6)
    var obj7 = { "data": "Weightage", "name": "Weightage", "autoWidth": true };
    jObj.push(obj7)
    var obj8 = { "data": "AssessmentGroup", "name": "AssessmentGroup", "autoWidth": true };
    jObj.push(obj8)
    var obj9 = {
        data: null, render: function (data, type, row) {
            if (row.AssessmentStructureAssessmentTypeMapping_Id != null) {
                return "<button id='Delete' value='Delete' onclick=DeleteData('" + row.AssessmentStructureAssessmentTypeMapping_Id + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";
            }
            return '';
        }
    };
    jObj.push(obj9)
    return jObj;
}
function GetAllMasterData() {
     
    var html = "<thead class=\"bg-blue text-white\"> <tr>" +
        "<th> AssessmentType_Id</th>" +
        "<th><div class='custom-control custom-checkbox'><input class='custom-control-input' type = 'checkbox' onclick='chkTopAllclick()' id = 'chkTopAll'><label class='custom-control-label' for='chkTopAll'></label></div></th>" +        
        "<th>" + _Code + "</th>" +
        "<th>" + _AssesmentName + "</th>" +
        "<th>" + _PassingMarks + "</th>" +
        "<th>" + _MaxMarks + "</th>" +
        "<th>" + _WeightAge + "</th>" +
        "<th>" + _TermsName + "</th>" +
        "<th>" + _Action + "</th>" +
        " </tr>" +
        "</thead>;"
    $("#tblAssessmentStructureAssessmentTypeMapping").html(html);
    $("#tblAssessmentStructureAssessmentTypeMapping").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "searching": false,
        "ajax": {
            "url": '/AssessmentStructureAssessmentTypeMapping/Index?Id=' + $("#ddlAssessmentStructure").val(),
            "type": "POST",
            "datatype": "json",
            //"data": objData
        },
        "columnDefs":
            [{
                "targets": [0],
                "visible": false
                //"searchable": false
            },
            { 'bSortable': false, 'aTargets': [1] },
            { 'bSortable': false, 'aTargets': [8] }
            ],
        "columns": Returnobj()
    });
}

function onChnageEvent() {
    var _url = window.location.protocol + "//" + window.location.host;
    window.location.href = _url + '/Admin/AssessmentStructureAssessmentTypeMapping/Create?Id=' + $("#ddlAssessmentStructure").val();
} 

function DeleteData(RId) {
    var result = confirm("Are you Sure to want delete?");
    if (result) {

        $.ajax({
            type: 'POST',
            url: '/AssessmentStructureAssessmentTypeMapping/Delete',
            data: { ID: RId },
            dataType: "json",
            success: function (data) {
                if (data) {
                    oTable = $('#tblAssessmentStructureAssessmentTypeMapping').DataTable();
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
function chkTopAllclick() {    
    if ($('#chkTopAll').is(":checked")) {
        $(".clschk").prop("checked", true);
    }
    else {
        $(".clschk").prop("checked", false);
    }
}
