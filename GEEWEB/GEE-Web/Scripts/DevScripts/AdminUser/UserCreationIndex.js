
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
//This method is used to call  get method of controller and bind data into table
//Added by jiya
//Date 07 April 2019
function BindTable(data, searchData)
{
   
    var ctrlArray = new Array("AddNewUser");
   // GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);

        var selectColumn = "";
    var SortColumn = "";
    var SortOrder = "";
    var selectColumnToGrid = "";
    $.each(data, function (ii, vall)
    {
        selectColumn += vall.TableName + '.' + vall.ColName + ",";
        if (vall.GridVisibilty==true)
            selectColumnToGrid += vall.ColName + ",";
        if (vall.DefaultSorting == true)
        {
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
    tmpHTML += "<th>Action</th>";
tmpHTML += tHeadClose;

    $("#dtUser").html(tmpHTML);
    $("#dtUser").DataTable({
    "processing": true, // for show progress bar
    "serverSide": true, // for process server side
    "filter": false, // this is for disable filter (search box)
    "orderMulti": false, // for disable multiple column at once
    "destroy": true,
    "ajax": {
        "url": "/UserCreation/GetIndexDataOnLoad",
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
function DeleteData(CUserId) {
    if (confirm("Are you sure you want to delete ...?"))
    {
        Delete(CUserId);
    }
    else
    {
        return false;
    }
}


function Delete(CUserId)
{
   
    $.ajax({
        type: 'POST',
        url: '/UserCreation/Delete',
        data: { ID: CUserId },
        dataType: "json",
        success: function (data)
        {
            if (data)
            {
                oTable = $('#dtUser').DataTable();
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
function EditData(id) {

    window.location.href = "Edit/" + id;
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
   
    var objaction = {
        "orderable": false,
        data: null, render: function (data, type, row) {
            return "<button class='btn btn-primary btn-xs edit' id='Edit' value='Edit' onclick=EditData('" + row.CUserId + "') ><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button id='Delete' value='Delete' onclick=DeleteData('" + row.CUserId + "') class='btn btn-danger btn-xs delete'><i class='fa fa-trash' aria-hidden='true'></i></button>";

        }
    };
    jObj.push(objaction)

    return jObj;
}

