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
    //Added by jiya
    //Date 07 April 2019
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
//Added by jiya
//Date 07 April 2019
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


function BindTable(data, searchData) {
    console.log(data);
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
    tmpHTML += "<th>Edit</th><th>Delete</th>";
    tmpHTML += tHeadClose;

    $("#example").html(tmpHTML);
    $("#example").DataTable({
        "processing": true, // for show progress bar
        "serverSide": true, // for process server side
        "filter": false, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "destroy": true,
        "ajax": {
            "url": "/CandidateDetail/GetIndexDataOnLoad",
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
function DeleteData(CandidateDetail_ID) {
    if (confirm("Are you sure you want to delete ...?")) {
       // Delete(CandidateDetail_ID);
    }
    else {
        return false;
    }
}

function Delete(CandidateDetail_ID) {
    var url = '@Url.Content("~/")' + "Enquiry/Delete";


    $.post(url, { ID: CandidateDetail_ID }, function (data) {
        if (data) {
            oTable = $('#example').DataTable();
            oTable.draw();
        }
        else {
            alert("Something Went Wrong!");
        }
    });
}


function Returnobj(selectColumnToGrid) {
    var jObj = [

    ];
    var res = selectColumnToGrid.split(",");

    for (var j = 0; j < res.length - 1; j++) {
        // tmpHTML += "<th>" + res[j] + "</th>";
        var newObj = { "data": res[j], "name": res[j], "autoWidth": true };
        jObj.push(newObj);
    }
    var objEdit = {
        "render": function (data, type, full, meta) { return '<a class="btn btn-info" href="Edit/' + full.CandidateDetail_ID + '">Edit</a>'; }
    };
    var objDelete = {
        data: null, render: function (data, type, row) {
            return "<a href='#' class='btn btn-danger' onclick=DeleteData('" + row.CandidateDetail_ID + "'); >Delete</a>";
        }
    };
    jObj.push(objEdit)
    jObj.push(objDelete)
    return jObj;
}

