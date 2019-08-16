

function LoadCombo(element, tableName, dataFieldName, dataPrimaryKeyFiled, dataWhereCondition, selectedValue) {
    dropdownData = [];
    if (dropdownData.length == 0) {
        //ajax function for fetch data
        $.ajax({
            type: "GET",
            url: '/Lookups/GetDdl',
            data: { tbName: tableName, fname: dataFieldName, code: dataPrimaryKeyFiled, cond: dataWhereCondition },
            dataType: "json",
            success: function (data) {
                
                dropdownData = data;
                //render catagory
                renderdropdownData(element, selectedValue);
            }
        })
    }
    else {
        //render catagory to the element
        renderdropdownData(element, selectedValue);
    }
}

function renderdropdownData(element, selectedValue) {
    
    var $ele = $('#'+element);
    $ele.empty();
    $ele.append($('<option/>').val('0').text('Select'));
    $.each(dropdownData, function (ii, vall) {
        
        $ele.append($('<option/>').val(vall.ddlId).text(vall.ddlName));
    })
    var ddlselectValue = selectedValue == undefined ? "" : selectedValue;  
    if (ddlselectValue!="")
        $ele.val(selectedValue);
}  

function LoadMasterDropdown(element, masterId, mastTypeId, schId, gpId, sesYear, isDel, selectedValue) {
   
    if (dropdownMasterData.length == 0) {
        //ajax function for fetch data
        $.ajax({
            type: "GET",           
            url: '/Lookups/GetMasterDropdownData',
            data: { masterTableId: masterId, masterTypeId: mastTypeId, schoolId: schId, groupId: gpId, sessionYear: sesYear, isDeleted: isDel },
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader('Authorization',  sessionStorage.getItem('accessToken') );
            },
            success: function (data) {

                dropdownMasterData = data;
                //render catagory
                BindDropDown(element, selectedValue);
            }
        })
    }
    else {
        //render catagory to the element
        BindDropDown(element, selectedValue);
    }
}

function BindDropDown(element, selectedValue) {
   
    var $ele = $('#' + element);
    $ele.empty();
    $ele.append($('<option/>').val('0').text('Select'));
    $.each(dropdownMasterData, function (ii, vall) {

        $ele.append($('<option/>').val(vall.MasterTable_id).text(vall.Name));
    })
    var ddlselectValue = selectedValue == undefined ? "" : selectedValue;
    if (ddlselectValue != "")
    $ele.val(selectedValue);
}  