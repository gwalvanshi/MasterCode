var dropdownData = [];
var requiredFeild = [];
var dropdownMasterData = [];
var isAllValid = true;
var isSaved = true;
var commonjsURL = '/Scripts/DevScripts/common/Common.js';
var combojsURL = '/Scripts/DevScripts/common/ComboFill.js';

$('#submit').click(function () {

   // var CUserId = $('#CUserId').val();
   // isAllValid = checkValidationOnSubmit();
   // if (isAllValid) {

    if (ValidationOnSave()) {

        var groupId = $('#ddlUserGroup').val();

        var data = {
            Group_Id: groupId,
            CreatedBy_ID: sessionStorage.getItem('CUserId'),
            PermissionChildModelList: []
        }
        $('input[type=checkbox]').each(function ()
        {


            var sThisVal = (this.checked ? $(this).val() : "");
            var idSplit = this.id.split('_');
            var PData =
            {
                NavigationMenu_Id: idSplit[0],
                Navrolepermisisonmapping_ID: idSplit[2],
                IsPermission: this.checked == true ? 1 : 0
            }
            data.PermissionChildModelList.push(PData);

        });
        if (data.PermissionChildModelList.length > 0 && groupId != "")
        {         
            

            CommonAjaxMethod('/Permission/SavePermission', data, true, 'POST');
        }
        else {
            alert('Please select valid data.');
        }
      

        }
   // }


});
function ValidationOnSave()
{
    //if (ValidateEmail(document.getElementById('UserGroup1401lmdEmailID'), ValidEmail) == false) {
    //    return false;
    //}
    //else if (ValidateMobNumber(document.getElementById('UserGroup1401lmdPhoneNumber'), ValidContactNumber) == false) {
    //    return false;
    //}
    //else if (StrCompare(document.getElementById('UserGroup1401lmdPassword'), document.getElementById('UserGroup1401lblconfirmpassword'), PwdCompare) == false) {
    //    return false;
    //}
    return true;
}
//For control clear in case form submitted succesfuly.
function FormControlValueClear(isValid)
{

    //if (isValid)
    //{
    //    $('#CUserId,#UserGroup1401lmdEmailID,#UserGroup1401lmdPassword,#UserGroup1401lmdPhoneNumber,#UserGroup1401lmdLoginID,#UserGroup1401lmdFirstName,#UserGroup1401lmdLastName').val('');
    //    $("#UserGroup1401lmdUserType,#UserGroup1401lmdGroup").val("0").change();
    //}
    //else {
    //    $('#submit').val('Save');
    //}
}
$(document).ready(function () {

    var ctrlArray = new Array("submit");

    $.getScript(commonjsURL, function myfunction() {
        // GetKeyForValidation(sessionStorage.getItem('MenuCode'));
        // GetPermission(sessionStorage.getItem('groupId'), sessionStorage.getItem('MenuId'), ctrlArray);
        // BindModule();
    });

    $.getScript(combojsURL, function myfunction() {
        LoadCombo('ddlUserGroup', 'UserGroup', 'UserGroupName', 'UserGroupId', 'ISDeleted=0');
    });


});
function ClearPermissionControls() {  
    $('#tblPermission').empty();  
    $('#ulUnmappedModule').empty(); 
    $('#ulmappedModule').empty();
}
function GetModule(group) {
    //Database hard code value for menu param to set main root menu code.   
    var groupId = group.value;
    ClearPermissionControls();
    if (group.selectedIndex > 0) {
        $.ajax({
            type: 'POST',
            url: '/Permission/GetModuleList',
            data: { userGroup: groupId, menuId: 1 },
            dataType: "json",
            success: function (response) {
                console.log("response", response);

                BindUnmappedModule(response, groupId)
                BindmappedModule(response, groupId);
            },
            error: function () {
                alert(" An error occurred.10");
            },
        })
    }
}

function BindUnmappedModule(moduleList, groupId) {
   
    var ctrlid = 1;
   
    $.each(moduleList, function (key, val) {
        if (val.IsPermission != 1) {

            var li = "<li class=\"list-group-item list-group-item-action\">" +
                "<div class=\"custom-control custom-radio\">" +
                "<input class=\"custom-control-input\" id=\"module-" + ctrlid + "\" type=\"radio\" name=\"radio\" onclick=\"LoadMenu(" + val.NavigationMenuId + "," + groupId + ")\" />" +
                "<label class=\"custom-control-label\" for=\"module-" + ctrlid + "\">" +
                val.NavigationMenuName
            "</label></div></li>";
            $('#ulUnmappedModule').append(li)
            ctrlid++;
        }
    });



}
function BindmappedModule(moduleList, groupId) {
    
    var ctrlid = 50;
    
    $.each(moduleList, function (key, val) {
        if (val.IsPermission == 1) {
            var li = "<li class=\"list-group-item list-group-item-action\">" +
                "<div class=\"custom-control custom-radio\">" +
                "<input class=\"custom-control-input\" id=\"module-" + ctrlid + "\" type=\"radio\" name=\"radio\" onclick=\"LoadMenu(" + val.NavigationMenuId + "," + groupId + ")\" />" +
                "<label class=\"custom-control-label\" for=\"module-" + ctrlid + "\">" +
                val.NavigationMenuName
            "</label></div></li>";
            $('#ulmappedModule').append(li)
            ctrlid++;
        }
    });
}


function LoadMenu(moduleId, groupId) {
   
    $.ajax({
        type: 'POST',
        url: '/Permission/GeMenu',
        data: { moduleId: moduleId, userGroupId: groupId },
        dataType: "json",
        success: function (response) {
            console.log("response", response);
          
            BindPermissionMatrix(response)
        },
        error: function () {
            alert(" An error occurred.10");
        },
    })
   

}
function GetCheckTDwithoutPermission() {
    var Td = "<td class=\"text-center\">" +
        "<label class=\"checkbox\">" +
        "</label>" +
        "</td>";
    return Td;
}
function BindPermissionMatrix(response) {
   
    var $ele = $('#tblPermission');
    $ele.empty();
    
    var tbodyClose = " </tbody>";
    var header = "<thead class=\"bg-blue text-white\">"+
                 "<tr>"+
        "<th>Modules</th>"+
        "<th>Add</th>"+
        "<th>Edit</th>"+
        "<th>Delete</th>"+
        "<th>View</th>"+
        "<th>SendSMS</th>"+
        "<th>SendEmail</th>"+
        "<th>PrintDocument</th>"+
        "<th>WorkflowApproval</th>"+
        "</tr>"+
        "</thead><tbody>";
    var trData = "";
    for (var i = 0; i < response.length; i++)
    {
        var trOpen = "<tr>";
        var trClosed = "</tr>";
       // var tdModule = "<td class=\"subtr\"><div><span>" + response[i].NavigationMenuName + "</span> <span class=\"float-right\"><i class=\"fa fa-caret-down\" aria-hidden=\"true\"></i></span></div></td>";            

        var tdModule = "<td class=\"\">" + response[i].NavigationMenuName + "</td>";            
        var AddTd = GetCheckTDwithoutPermission();
        var EditTd = GetCheckTDwithoutPermission();       
        var DeleteTd = GetCheckTDwithoutPermission();
        var ViewTd = GetCheckTDwithoutPermission();
        var SMSTd = GetCheckTDwithoutPermission();
        var EmailTd = GetCheckTDwithoutPermission();
        var PrintTd = GetCheckTDwithoutPermission();
        var WorkFlowTd = GetCheckTDwithoutPermission();

        for (var j = 0; j < response[i].PermissionChildModelList.length; j++)
        {
            
            if (response[i].PermissionChildModelList[j].Permission == "add")
            {
                AddTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);
            }
            if (response[i].PermissionChildModelList[j].Permission == "Update") {
                EditTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);

            }
            if (response[i].PermissionChildModelList[j].Permission == "Delete") {
                DeleteTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);

            }
            if (response[i].PermissionChildModelList[j].Permission == "View") {
                ViewTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);

            }
            if (response[i].PermissionChildModelList[j].Permission == "SendSMS") {
                SMSTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);

            }
            if (response[i].PermissionChildModelList[j].Permission == "SendEmail") {
                EmailTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);

            }
            if (response[i].PermissionChildModelList[j].Permission == "PrintDocument") {
                PrintTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);

            }
            if (response[i].PermissionChildModelList[j].Permission == "WorkflowApproval") {
                WorkFlowTd = ReturnCheckBoxTD(response[i].NavigationMenuId + "_" + response[i].PermissionChildModelList[j].Permission + "_" + response[i].PermissionChildModelList[j].Navrolepermisisonmapping_ID, response[i].PermissionChildModelList[j].IsPermission);

            }
        }
        trData = trData + trOpen + tdModule + AddTd + EditTd + DeleteTd + ViewTd+ SMSTd + EmailTd + PrintTd + WorkFlowTd + trClosed;

    }
    var tableHTML = header + trData + tbodyClose;
   // $('#tblPermission').html(tableHTML);
    $ele.append(tableHTML);


}
function ReturnCheckBoxTD(checkBoxId, isPermission)
{
    var checkBoxTd = "";
    if (isPermission==1) {
        checkBoxTd = "<td class=\"text-center\"><div class=\"custom-control custom-checkbox\">" +
           
            "<input name = \"checkbox\" class=\"custom-control-input\" type = \"checkbox\" checked  id=\"" + checkBoxId + "\"/>" +
            "<label class=\"custom-control-label\" for=\"" + checkBoxId + "\">" +
            "</label>" +
            "</div></td>";
    }
    else {
        checkBoxTd = "<td class=\"text-center\"><div class=\"custom-control custom-checkbox\">" +
            
            "<input name = \"checkbox\" class=\"custom-control-input\"  type = \"checkbox\"   id=\"" + checkBoxId + "\"/>" +
            "<label class=\"custom-control-label\" for=\"" + checkBoxId + "\">" +
            "</label>" +
            "</div></td>";
    }
    return checkBoxTd;
}



