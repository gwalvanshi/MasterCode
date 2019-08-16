
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var indexComlunDetails = "";
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
    var Postdata =
    {
        "PageNo": 1,
        "PageSize": 10,
        "SortColumn": SortColumn,
        "SortOrder": SortOrder,
        "IndexScreenSelectParameterModelCommaSeparate": selectColumn,
        "IndexScreenSearchParameterModel": searchData,
        "SelectColumnToGrid": selectColumnToGrid
    }


    var tmpHTML = "";
    var theadStart = "<thead class=\"bg-primary text-white\">";
    var tHeadClose = "</thead>";
    var res = selectColumnToGrid.split(",");
    tmpHTML += theadStart;
    for (var j = 0; j < res.length - 1; j++) {
        tmpHTML += "<th>" + res[j] + "</th>";
    }
    tmpHTML += "<th>Sell App</th><th>Submit App</th><th>Submit Registration</th>";
    tmpHTML += tHeadClose;

    $("#dtSellSubmit").html(tmpHTML);
    $("#dtSellSubmit").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "destroy": true,
        "ajax": {
            "url": "/SellSubmit/GetIndexDataOnLoad",
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

function Returnobj(selectColumnToGrid) {

    var jObj = [

    ];
    var res = selectColumnToGrid.split(",");

    for (var j = 0; j < res.length - 1; j++) {
        var newObj = { "data": res[j], "name": res[j], "autoWidth": true };
        if (res[j] == "ApplicaitonNo") {
            var i = 0;
            var objAppNo = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input class="form-control form-control-sm" maxlength="10" onkeypress="return manualUpdateAppNo(event,' + full.Enquiry_ID + ')" readonly="readonly" id="textAppNo' + full.Enquiry_ID + '" name="name" placeholder="App No" type="text" value="' + full.ApplicaitonNo + '" />';
                }
            };
            jObj.push(objAppNo);
            i++;
        }
        else if (res[j] == "RegistrationNo") {
            var i = 0;
            var objRegiNo = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input class="form-control form-control-sm" maxlength="10" onkeypress="return manualUpdateRegiNo(event,' + full.Enquiry_ID + ')" readonly="readonly" id="textRegiNo' + full.Enquiry_ID + '" name="name" placeholder="Regi No" type="text" value="' + full.RegistrationNo + '" />';
                }
            };
            jObj.push(objRegiNo);
            i++;
        }
        else if (res[j] == "IsSubmitted") {
            var i = 0;
            var objIsSub = {
                "orderable": false,
                "render": function (data, type, full, meta) {
                    return '<input class="form-check-input ml-2 k-checkbox" onClick=isSubmitCheck(' + full.Enquiry_ID + ') type="checkbox" id="chkIsSubmit' + full.Enquiry_ID + '" value="' + full.IsSubmitted + '"/>';
                }
            };
            jObj.push(objIsSub);
            i++;
        }
        else {
            jObj.push(newObj);
        }
    }
    var objSellApp = {
        "render": function (data, type, full, meta) {
            return "<a href='#' class='btn btn-info' onclick=SellAppClick('" + full.Enquiry_ID + "'); >Sell App</a>";
        }
    };
    var objSubmitApp = {
        data: null, render: function (data, type, row) {
            if (row.Applicationsold)
                return "<a href='#' class='btn btn-info' onclick=SubmitApp('" + row.Enquiry_ID + "'); >Submit App</a>";
            else
                return "<a href='#' style='pointer-events: none;' class='btn btn-info' onclick=SubmitApp('" + row.Enquiry_ID + "'); >Submit App</a>";
        }
    };
    var objSubmitRegistration = {
        data: null, render: function (data, type, row) {
            if (row.Applicationsold)
                return "<a href='#' class='btn btn-info' onclick=SubmitRegistration('" + row.Enquiry_ID + "'); >Submit Regi</a>";
            else
                return "<a href='#' style='pointer-events: none;' class='btn btn-info' onclick=SubmitRegistration('" + row.Enquiry_ID + "'); >Submit Regi</a>";
        }
    };
    jObj.push(objSellApp)
    jObj.push(objSubmitApp)
    jObj.push(objSubmitRegistration)
    return jObj;
}

//This function called on Sell App Click
function SellAppClick(Enquiry_ID) {

    $.ajax({
        type: 'GET',
        url: '/SellSubmit/GetIsApplicationSold',
        data: { ID: Enquiry_ID },
        dataType: "json",
        success: function (data) {
                Confirm(data,Enquiry_ID);
        },
        error: function () {
            alert(" An error occurred.");
        },
    })
}

//If  ApplicationSold=true then confirming from user
function Confirm(data, Enquiry_ID) {
    if (data) {
        if (confirm("You want to sell dupliacte appliciaton to this candidate..?")) {
            GetAutoGeneraedNo(Enquiry_ID);
        }
    } else {
        GetAutoGeneraedNo(Enquiry_ID);
    }

}

//If Application no is system generated 
function GetAutoGeneraedNo(Enquiry_ID) {
    $.ajax({
        type: 'GET',
        url: '/Enquiry/GetAutoGeneraedNo',
        data: { Id: sessionStorage.getItem('MenuCode') },
        dataType: "json",
        success: function (response) {
            console.log(response.ApplicaitonNo);
            if (response.ApplicaitonNo != null)
                UpdateApplicationNo(response.ApplicaitonNo, Enquiry_ID,false);
            else {
                $('#textAppNo' + Enquiry_ID).removeAttr("readonly");
                $('#textAppNo' + Enquiry_ID).focus();
                $('#textAppNo' + Enquiry_ID).addClass("edit");

            }
        },
        error: function () {
            alert(" An error occurred.8");
        },
    })
}

//Update Appllication No on Sell App click
function UpdateApplicationNo(ApplicaitonNo, Enquiry_ID, IsSubmitted) {
    if (ApplicaitonNo != "" || ApplicaitonNo != null) {
        var data =
        {
            Enquiry_ID: Enquiry_ID,
            ApplicaitonNo: ApplicaitonNo,
            IsSubmitted: IsSubmitted,
            ISDeleted: false,
        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/SellSubmit/UpdateApplicationNo', data, true, 'POST');
        oTable = $('#dtSellSubmit').DataTable();
        oTable.draw();
    }
}

function manualUpdateAppNo(event, enquiryId) {
    if (event.keyCode == 13) {
        var ApplicaitonNo = $('#textAppNo' + enquiryId).val();
        UpdateApplicationNo(ApplicaitonNo, enquiryId,false);
        event.preventDefault();
    }
}

//This for check and unchecked IsSubmitted checkbox 
function isSubmitCheck(Enquiry_ID) {
    $('#chkIsSubmit' + Enquiry_ID)
    if ($('#chkIsSubmit' + Enquiry_ID).is(':checked')) {
        $('#chkIsSubmit' + Enquiry_ID).attr('value', 'true');
    } else {
        $('#chkIsSubmit' + Enquiry_ID).attr('value', 'false');
    }
}

//This function called on Submit App Click
function SubmitApp(Enquiry_ID) {
    var IsSubmitted = $('#chkIsSubmit' + Enquiry_ID).val();
    var ApplicaitonNo = $('#textAppNo' + Enquiry_ID).val();
    if (IsSubmitted=="true") {
        UpdateApplicationNo(ApplicaitonNo, Enquiry_ID, IsSubmitted);
    } else {
        var x = document.getElementById("toastmsg");
        x.innerHTML = '<p class="yellow">Check IsSubmited Before Submit Application</p>';
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        return false;
    }

}

function SubmitRegistration(Enquiry_ID) {
    //check first application no is euqals to registration no
    $.ajax({
        type: 'GET',
        url: '/SellSubmit/CheckIsAppNumEqualsRegiNum',
        data: { Id: sessionStorage.getItem('MenuCode') },
        dataType: "json",
        success: function (data) {
            if (data) {
                var RegistrationNo = $('#textAppNo' + Enquiry_ID).val();
                UpdateRegistrtionNO(RegistrationNo, Enquiry_ID);
            } else {
                GetAutoGeneraedRegistrationNo(Enquiry_ID);
            }
        },
        error: function () {
            alert(" An error occurred.");
        },
    })
}

function UpdateRegistrtionNO(RegistrationNo, Enquiry_ID) {
    if (RegistrationNo != "" || RegistrationNo != null) {
        var data =
        {
            Enquiry_ID: Enquiry_ID,
            RegistrationNo: RegistrationNo,
            ISDeleted: false,
        }
        //true: this is for add common fileds into data object, in case false it will not add common value.
        //i.e.Session id school id, group id etc.Method type is post
        data.ModifiedBy_ID = sessionStorage.getItem('CUserId');
        CommonAjaxMethod('/SellSubmit/UpdateRegistrationNo', data, true, 'POST');
        oTable = $('#dtSellSubmit').DataTable();
        oTable.draw();
    }
}

//If Application no is system generated 
function GetAutoGeneraedRegistrationNo(Enquiry_ID) {
    $.ajax({
        type: 'GET',
        url: '/Enquiry/GetAutoGeneraedNo',
        data: { Id: sessionStorage.getItem('MenuCode') },
        dataType: "json",
        success: function (response) {
            console.log(response.RegistrationNo);
            if (response.RegistrationNo != null) 
                UpdateRegistrtionNO(response.RegistrationNo, Enquiry_ID);
            else {
                $('#textRegiNo' + Enquiry_ID).removeAttr("readonly");
                $('#textRegiNo' + Enquiry_ID).focus();
            }
        },
        error: function () {
            alert(" An error occurred.");
        },
    })
}

function manualUpdateRegiNo(event, enquiryId) {
    if (event.keyCode == 13) {
        var RegistrationNo = $('#textRegiNo' + enquiryId).val();
        UpdateRegistrtionNO(RegistrationNo, enquiryId, false);
        event.preventDefault();
    }
}


function FormControlValueClear(isValid) {
    if (isValid) {
    }
    else {
    }
}