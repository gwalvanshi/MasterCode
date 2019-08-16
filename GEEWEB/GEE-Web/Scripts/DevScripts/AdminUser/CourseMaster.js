///Created By: Amixa  on 11, may 19
var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var dropdownForParent = [];
var AllMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';


$(document).ready(function () {
    var ctrlArray = new Array("submit");
    $.getScript(commonjsURL, function myfunction() {
        GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);
    });

    $.getScript(combojsURL, function myfunction() {
        LoadMasterDropdown('ddlGradeStructure', null, MasterTypeEnum.GradeStructure, null, null, null, false);
        LoadMasterDropdown('ddlStreams', null, MasterTypeEnum.Streams, null, null, null, false);
    });
});

$('#btnMoveall').click(function () {
    
    //$("#_tblcource tbody").html('');
    var _classId = 0;
    var _className = '';
    if ($('input[name=classlist]:checked').val() == undefined || $('input[name=classlist]:checked').val() == '') {
        var x = document.getElementById("toastmsg");
        x.innerHTML = '<p class="red">"Please select class!</p>';
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return;       
    }
    else {
        _classId = $('input[name=classlist]:checked').val();
        _className = $('input[name=classlist]:checked').attr('rel');
    }
     
    $('#checkboxes input:checked').each(function () {         

        if (!$("#sbjli_" + $(this).val()).hasClass("clshide")) {
            var _rowhtml = renderCourcerRowHtml(_classId, _className, $(this).val(), $(this).attr('rel'));
            $("#_tblcource tbody").append(_rowhtml);            
            $("#sbjli_" + $(this).val()).addClass("clshide");
        }
    });

});
function delTableRow(Id) {
    $("#Sub_" + Id).attr("checked", false);
    $("#tr_" + Id).remove();    
    $("#sbjli_" + Id).removeClass("clshide");
}
function MoveToCourse(_id) {
    var _classId = 0;
    var _className = '';

    if ($('input[name=classlist]:checked').val() == undefined || $('input[name=classlist]:checked').val() == '') {
        var x = document.getElementById("toastmsg");
        x.innerHTML = '<p class="red">"Please select class!</p>';
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return;
    }
    else {
        _classId = $('input[name=classlist]:checked').val();
        _className = $('input[name=classlist]:checked').attr('rel');
    }

    var _subName = $("#Sub_" + _id).attr('rel');
    var _rowhtml = renderCourcerRowHtml(_classId, _className, _id, _subName);

    $("#_tblcource tbody").append(_rowhtml);     
    $("#sbjli_" + _id).addClass("clshide");
}
$('#Add').click(function () {     
    if ($('input[name=classlist]:checked').val() == undefined || $('input[name=classlist]:checked').val() == '') {
        
        var x = document.getElementById("toastmsg");
        x.innerHTML = '<p class="red">"Please select class!</p>';
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return;
    }
    var _classId = $('input[name=classlist]:checked').val();
    
    var objCourcetable = [];
    $('#_tblcource tbody tr').each(function () {
        var subId = $(this).attr('rel');

        var rowData = {
            ClassMaster_ID: _classId,
            SubjectMaster_ID: subId,
            Code: $("#txtCode_" + subId).val(),
            Name: $("#txtName_" + subId).val(),
            ExcfromAtt: ($("#chkAtt_" + subId).is(":checked") ? true : false),
            ISoptional: ($("#chkOpt_" + subId).is(":checked") ? true : false),
            Streams: $("#ddlStreams_" + subId).val(),
            GradeStructure: $("#ddlGradeStructure_" + subId).val(),
            CreatedBy_ID: sessionStorage.getItem('CUserId'),
            ModifiedBy_ID: sessionStorage.getItem('CUserId'),
        };
        objCourcetable.push(rowData);
    });

    var strJsonData = JSON.stringify(objCourcetable);


    if (objCourcetable != undefined && objCourcetable.length > 0) {
        
        var _url = window.location.protocol + "//" + window.location.host;
        $.ajax({
            type: 'POST',
            url: _url +'/Admin/CourseMaster/SaveCourceTable',
            data: { strJsonData: strJsonData },
            dataType: "json",
            success: function (data) {
                if (data) {                    

                    $("#_tblcource tbody").html('');
                    $(".clssublist").removeClass("clshide");
                    $(".chksujitm").attr("checked", false);

                    var x = document.getElementById("toastmsg");
                    x.innerHTML = '<p class="green">Saved successfully!</p>';
                    x.className = "show";
                    setTimeout(function () {
                    x.className = x.className.replace("show", "");
                        window.location.href = _url + "/Admin/CourseMaster/Create";
                    }, 1500);

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
    else
    {
        var x = document.getElementById("toastmsg");
        x.innerHTML = '<p class="red">"Please select create course!</p>';
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return;
    }
});

function renderCourcerRowHtml(classId, clsname, subjectid, subname) {

    var htmlddlGSopt = '';
    var htmlddlStreamsopt = '';

    $("#ddlGradeStructure  option").each(function () {
        htmlddlGSopt += '<option value="' + $(this).val() + '">' + $(this).text() + ' </option>';
    });


    $("#ddlStreams  option").each(function () {
        htmlddlStreamsopt += '<option value="' + $(this).val() + '">' + $(this).text() + ' </option>';
    });

    var strHtml = '';
    strHtml += '<tr id="tr_' + subjectid + '" rel=' + subjectid + '>';
    strHtml += '<td>' + clsname + ' </td>';
    strHtml += '<td style="width: 12%">' + subname + '</td>';
    strHtml += '<td style="width: 10%"><input class="form-control form-control-sm" type="text" placeholder="Code" id="txtCode_' + subjectid + '"></td>';
    strHtml += '<td style="width: 10%"><input class="form-control form-control-sm" type="text" placeholder="Name" id="txtName_' + subjectid + '"></td>';
    strHtml += '<td  class="text-center" style="width: 9%">';
    strHtml += '<label class="checkbox"><input name="Optional" type="checkbox" value="" id="chkOpt_' + subjectid + '" class="chkOpt"/></label>';
    strHtml += '</td>';
    strHtml += '<td style="width: 15%">';
    strHtml += '<select class="select form-control form-control-sm clsddlGradeStructure" id="ddlGradeStructure_' + subjectid + '" name="type">';
    strHtml += htmlddlGSopt;
    strHtml += '</select>';
    strHtml += '</td>';
    strHtml += '<td style="width: 15%">';
    strHtml += '<select class="select form-control form-control-sm clsddlStreams" id="ddlStreams_' + subjectid + '" name="type">';
    strHtml += htmlddlStreamsopt;
    strHtml += '</select>';
    strHtml += '</td>';
    strHtml += '<td class="text-center" style="width: 9%">';
    strHtml += '<label class="checkbox"><input name="att" type="checkbox" value="" id="chkAtt_' + subjectid + '" class="chkAtt" /></label>';
    strHtml += '</td>';
    strHtml += '<td class="text-center"><button class="btn btn-danger btn-xs" onclick="delTableRow(' + subjectid + ')" ><i class="fa fa-times" aria-hidden="true"></i></button></td>';
    strHtml += '</tr>';
    return strHtml;
}

$('#chkAllOtp').click(function () {
    if ($(this).is(":checked")) {
        $(".chkOpt").prop("checked", true);
    }
    else {
        $(".chkOpt").prop("checked", false);
    }
});
$('#chkAllAtt').click(function () {
    if ($(this).is(":checked")) {
        $(".chkAtt").prop("checked", true);
    }
    else {
        $(".chkAtt").prop("checked", false);
    }
});

$('#ddlGradeStructure').change(function () {
    var selId = $(this).val();
    $(".clsddlGradeStructure").val(selId);
});
$('#ddlStreams').change(function () {
    var selId = $(this).val();
    $(".clsddlStreams").val(selId);
});

function onChangeClass() {
    $("#_tblcource tbody").html('');
    $(".clssublist").removeClass("clshide");
    $(".chksujitm").attr("checked", false); 
}
function onclickEdit() {
    var _url = window.location.protocol + "//" + window.location.host;
    window.location.href = _url + "/Admin/CourseMaster/Edit";
}

function onclickBack() {
    var _url = window.location.protocol + "//" + window.location.host;
    window.location.href = _url + "/Admin/CourseMaster/Create";
}


