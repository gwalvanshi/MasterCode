
var dropdownData = [];
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

var indexComlunDetails = "";
var StartAdmissionItem = [];

$(document).ready(function () {
    $.ajax({
        type: 'GET',
        url: '/CommonMethods/GetIndexScreenDetailByNavigation',
        data: { MenuId: sessionStorage.getItem('MenuId') },
        dataType: "json",
        success: function (response) {
            BindDropdown(response);
            BindTable(response);
            indexComlunDetails = response;
        },
        error: function () {
            alert(" An error occurred.");
        },
    })
    BindDropDownInTable();
    setTimeout(BindDropDownInTable, 2000);
   
    
});

//This method is used to  search data and bind the same with table.

function SearchData() {

    var jsonObj = [];
    if (document.getElementById("ddlFirstCriteria").selectedIndex > 0) {
        var item1 = {}
        item1["SearchParameter"] = document.getElementById("ddlFirstCriteria").value;
        item1["SearchParameterValue"] = document.getElementById("txtFirstCriteria").value;
        item1["SearchParameterDataType"] = "string";
        jsonObj.push(item1);
    }

    if (document.getElementById("ddlSecondCriteria").selectedIndex > 0) {
        var item2 = {}
        item2["SearchParameter"] = document.getElementById("ddlSecondCriteria").value;
        item2["SearchParameterValue"] = document.getElementById("txtSecondCriteria").value;
        item2["SearchParameterDataType"] = "string";
        jsonObj.push(item2);
    }
    BindTable(indexComlunDetails, jsonObj);
    BindDropDownInTable();
    setTimeout(BindDropDownInTable, 2000);

}

//This method is used to  bind data into dropdowns
function BindDropdown(data) {

    var $ele = $('#ddlFirstCriteria');
    $ele.empty();
    $ele.append($('<option />').val('0').text('Select Frist Criteria'));
    $.each(data, function (ii, vall) {
        if (vall.Search_visible == true)
            $ele.append($('<option />').val(vall.TableName + '.' + vall.ColName).text(vall.ColName));
    })

    var $ele = $('#ddlSecondCriteria');
    $ele.empty();
    $ele.append($('<option />').val('0').text('Select Second Criteria'));
    $.each(data, function (ii, vall) {
        if (vall.Search_visible == true)
            $ele.append($('<option />').val(vall.TableName + '.' + vall.ColName).text(vall.ColName));
    })

    var $ele = $('#ddlThirdCriteria');
    $ele.empty();
    $ele.append($('<option />').val('0').text('Select Third Criteria'));
    $.each(data, function (ii, vall) {
        if (vall.Search_visible == true)
            $ele.append($('<option />').val(vall.TableName + '.' + vall.ColName).text(vall.ColName));
    })
}
//This method is used to call  get method of controller and bind data into table
function BindTable(data, searchData) {

    var selectColumn = "";
    var SortColumn = "";
    var SortOrder = "";
    var selectColumnToGrid = "";
    $.each(data, function (ii, vall) {
        selectColumn += vall.TableName + '.' + vall.ColName + ",";
        if (vall.GridVisibilty == true)
            selectColumnToGrid += vall.ColName + ",";
        if (vall.DefaultSorting == true) {
            SortColumn = vall.TableName + '.' + vall.ColName;
            SortOrder = vall.DefaultSortOrder;

        }
    })
    var SchoolId = sessionStorage.getItem('schoolId');
    var GroupId = sessionStorage.getItem('groupId');
         
    var Postdata =
    {
        "PageNo": 1,
        "PageSize": 16,
        "SortColumn": SortColumn,
        "SortOrder": SortOrder,
        "IndexScreenSelectParameterModelCommaSeparate": selectColumn,
        "IndexScreenSearchParameterModel": searchData,
        "SelectColumnToGrid": selectColumnToGrid,
        "SchoolId": SchoolId,
        "GroupId": GroupId

    }


    var tmpHTML = "";
    var theadStart = "<thead class=\"bg-primary text-white\">";
    var tHeadClose = "</thead>";
    var res = selectColumnToGrid.split(",");
    tmpHTML += theadStart;
    for (var j = 0; j < res.length - 1; j++) {
        tmpHTML += "<th>" + res[j] + "</th>";
    }
    //tmpHTML += "<th>Sell App</th><th>Submit App</th><th>Submit Registration</th>";
    tmpHTML += tHeadClose;

    $("#dtStartAdmission").html(tmpHTML);
    $("#dtStartAdmission").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "destroy": true,
        "pageLength": 50,
        "ajax": {
            "url": "/StartAdmission/GetIndexDataOnLoad",
            "type": "POST",
            "datatype": "json",
            "data": Postdata
        },
        "columnDefs":
            [{
                "targets": [0],
                "visible": false
                //"searchable": false
            }],
        "columns": Returnobj(selectColumnToGrid)

    });

   

}

var BindDropDownInTable = function () {
    
    $('select.addstatus').each(function () {
        //$(this).append('<option value="foo">Bar</option>');
        var id = $(this).attr('id');
        var num = id.match(/[\d\.]+/g);
        $.getScript(combojsURL, function myfunction() {
            LoadCombo(id, 'MasterTable', 'Name', 'MasterTable_id', 'ISDeleted=0 AND Mastertabletype_id=' + MasterTypeEnum.AdmissionStatus + '',num[1]);
        });
    });
    $("#tblStartAdmission [id*=ddlAddStatus]").change(function () {
        $(this).closest("td").addClass("yellowRow");
        if (!$("table").hasClass("update"))
            $(this).closest("table").addClass("update");
    });

    $("#tblStartAdmission [id*=Startdate]").change(function () {
        $(this).closest("td").addClass("yellowRow");
        if (!$("table").hasClass("update"))
            $(this).closest("table").addClass("update");
    });

    $("#tblStartAdmission [id*=FromDOB]").change(function () {
        $(this).closest("td").addClass("yellowRow");
        if (!$("table").hasClass("update"))
            $(this).closest("table").addClass("update");
    });

    $("#tblStartAdmission [id*=TODOB]").change(function () {
        $(this).closest("td").addClass("yellowRow");
        if (!$("table").hasClass("update"))
            $(this).closest("table").addClass("update");
    });

    $("#tblStartAdmission [id*=textApplicaitonFees]").change(function () {
        $(this).closest("td").addClass("yellowRow");
        if (!$("table").hasClass("update"))
            $(this).closest("table").addClass("update");
    });

    $("#tblStartAdmission [id*=textRegistrationFees]").change(function () {
        $(this).closest("td").addClass("yellowRow");
        if (!$("table").hasClass("update"))
            $(this).closest("table").addClass("update");
    });
    
}

function Returnobj(selectColumnToGrid) {

    var jObj = [

    ];
    var res = selectColumnToGrid.split(",");

    for (var j = 0; j < res.length - 1; j++) {
        var newObj = { "data": res[j], "name": res[j], "autoWidth": true };
        if (res[j] == "AdmissionCode") {
            var i = 0;
            var objAdmissionCode = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input class="form-control form-control-sm" id="textAddCode' + full.AdmissionStatus_id + '" name="name" type="text" value="' + full.AdmissionCode + '" />';
                }
            };
            jObj.push(objAdmissionCode);
            i++;
        }
        else if (res[j] == "AdmissionStatus") {
            var i = 0;
            var objaddStatus = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<select class="select form-control form-control-sm addstatus" id="ddlAddStatus_' + full.AdmissionStatus_id + '_' + full.AdmissionStatus + '" name="Admission Status"><option> Select </option></select >';
                }

            };
            jObj.push(objaddStatus);
            i++;
        }
        else if (res[j] == "Startdate") {
            var i = 0;
            var objStartdate = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input type="date" name="bday" class="input-value" id="Startdate' + full.AdmissionStatus_id + '" value="' + full.Convertedstartdate+'"></form>';
                }
            };
            jObj.push(objStartdate);
            i++;
        }
        else if (res[j] == "FromDOB") {
            var i = 0;
            var objFromDOB = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input type="date" name="bday" class="input-value" id="FromDOB' + full.AdmissionStatus_id + '" value="' + full.Convertedfrmdob +'"></form>';
                }
            };
            jObj.push(objFromDOB);
            i++;
        }
        else if (res[j] == "TODOB") {
            var i = 0;
            var objTODOB = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input type="date" name="bday" class="input-value" id="TODOB' + full.AdmissionStatus_id + '" value="' + full.Convertedtodob +'"></form>';
                }
            };
            jObj.push(objTODOB);
            i++;
        }
        else if (res[j] == "ApplicaitonFees") {
            var i = 0;
            var objApplicaitonFees = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input class="form-control form-control-sm" id="textApplicaitonFees' + full.AdmissionStatus_id + '" name="name" type="text" value ="' + full.ApplicaitonFees + '" />';

                }
            };
            jObj.push(objApplicaitonFees);
            i++;
        }
        else if (res[j] == "RegistrationFees") {
            var i = 0;
            var objRegistrationFees = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input class="form-control form-control-sm" id="textRegistrationFees' + full.AdmissionStatus_id + '" name="name" type="text" value="' + full.RegistrationFees + '" />';

                }
            };
            jObj.push(objRegistrationFees);
            i++;
        }
        //else if (res[j] == "AdmissionStatus_id") {
        //    var i = 0;
        //    var AdmissionStatus_id = {
        //        "orderable": false,
        //        "render": function (data, type, full, meta) {
        //            return '<td hidden="hidden">' + full.AdmissionStatus_id+'</td>'
        //        }
        //    };
        //    jObj.push(AdmissionStatus_id);
        //    i++;
        //}
        else {
            jObj.push(newObj);
        }
       
    }
   
    return jObj;
}

function FormControlValueClear(isValid) {
    if (isValid) {
    }
    else {
    }
}

$("#btnUpdate").click(function () {
    if ($("table").hasClass("update")) {
        addItemFromTAble();
    }
    if (StartAdmissionItem.length > 0) {
        CommonAjaxMethod('/StartAdmission/UpdateStartAdmission', StartAdmissionItem, true, 'POST');
        $(".yellowRow").switchClass("yellowRow", "greenwRow");
        $(".update").removeClass("update");

    } else {
        var x = document.getElementById("toastmsg");
        x.innerHTML = '<p class="yellow">Please fill the form</p>';
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return false;
    }

});

function addItemFromTAble() {
    var Modified_Id = sessionStorage.getItem('CUserId');

    var table = document.getElementById('dtStartAdmission');
    var rowLength = table.rows.length;
    for (var i = 1; i < rowLength; i++) {
        var oCells = table.rows.item(i).cells;

        var classname = oCells[0].innerHTML;

        var id = oCells[1].children[0].id;
        var num = id.match(/[\d\.]+/g);
        var Admissionstatusid = num[0];
        console.log(Admissionstatusid);

        var td2 = oCells[1].children[0].id;
        var AdmissionCode = $('#' + td2).val();


        var td3 = oCells[2].children[0].id;
        var AdmissionStatus = $('#' + td3).val();

        var td5 = oCells[4].children[0].id;
        var startDate = $('#' + td5).val();

        var td6 = oCells[5].children[0].id;
        var FromDOB = $('#' + td6).val();

        var td7 = oCells[6].children[0].id;
        var ToDOB = $('#' + td7).val();

        var td8 = oCells[7].children[0].id;
        var ApplicationFees = $('#' + td8).val();

        var td9 = oCells[8].children[0].id;
        var RegistrationFees = $('#' + td9).val();


        StartAdmissionItem.push({
            AdmissionStatus_id: Admissionstatusid,
            AdmissionCode: AdmissionCode,
            AdmissionStatus: AdmissionStatus,
            Startdate: startDate,
            FromDOB: FromDOB,
            TODOB: ToDOB,
            ApplicaitonFees: ApplicationFees,
            RegistrationFees: RegistrationFees,
            ModifiedBy_ID : Modified_Id
        });
    }
}
