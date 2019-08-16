//*******************************Global variables************************//


//*******************************Global variables************************//




//*******************************Common Functions*********************//

function ValidateEmail(email, emailErrMsg) {
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (reg.test(email.value) == false && email.value.length != 0) {
        alert(emailErrMsg);
        //ShowAlert(emailErrMsg);
        email.focus();
        return false;
    }
    return true;
}
//window.alert = function (message) {
   
//    $('<div />').text(message).dialog({
//        modal: true,
//        title: 'Message',       
//        buttons: {
//            'OK': function () {
//                $(this).dialog('close');
//            }
//        },
//        open: function () {
//            var closeBtn = $('.ui-dialog-titlebar-close');
//            closeBtn.hide();
//        },
//        close: function () { $(this).dialog('destroy').remove(); }
//    });
//};
function ShowAlert(message) {
    $('<div />').text(message).dialog({
        modal: true,
        title: 'Message',
        buttons: {
            'OK': function () {
                $(this).dialog('close');
            }
        },
        close: function () { $(this).dialog('destroy').remove(); }
    });
}

function CheckInValidCharacters(sText) {
    var ValidChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$_";
    var Char;

    for (i = sText.length - 1; i >= 0; i--) {
        Char = sText.charAt(i);
        if (ValidChars.indexOf(Char) == -1) {
            return true;
        }
    }
    return false;
}

function IsNumeric(sText) {
    var ValidChars = "0123456789"; var IsNumber = true; var Char;
    for (i = 0; i < sText.length && IsNumber == true; i++) {
        Char = sText.charAt(i);
        if (ValidChars.indexOf(Char) == -1) {
            IsNumber = false;
        }
    }
    return IsNumber;
}

function ShowMessage(obj, message, isInformation) {
    document.getElementById(obj).innerHTML = message;
    if (isInformation == '1') document.getElementById(obj).style.color = 'Green';
    else document.getElementById(obj).style.color = 'Red';
}

// Replace a string
function replaceAll(str, from, to) {
    var idx = str.indexOf(from);
    while (idx > -1) {
        str = str.replace(from, to);
        idx = str.indexOf(from);
    }

    return str;
}

function stringFormat(str, arg1, arg2, arg3, arg4, arg5) {
    str = replaceAll(str, '{0}', arg1);
    if (arg2 != undefined) str = replaceAll(str, '{1}', arg2);
    if (arg3 != undefined) str = replaceAll(str, '{2}', arg3);
    if (arg4 != undefined) str = replaceAll(str, '{3}', arg4);
    if (arg5 != undefined) str = replaceAll(str, '{4}', arg5);

    return str;
}

function stringFor(str, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) {
    str = replaceAll(str, '{0}', arg1);
    if (arg2 != undefined) str = replaceAll(str, '{1}', arg2);
    if (arg3 != undefined) str = replaceAll(str, '{2}', arg3);
    if (arg4 != undefined) str = replaceAll(str, '{3}', arg4);
    if (arg5 != undefined) str = replaceAll(str, '{4}', arg5);
    if (arg6 != undefined) str = replaceAll(str, '{5}', arg6);
    if (arg7 != undefined) str = replaceAll(str, '{6}', arg7);
    if (arg8 != undefined) str = replaceAll(str, '{7}', arg8);
    if (arg9 != undefined) str = replaceAll(str, '{8}', arg9);
    return str;
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}



// Validates for decimal in increments of 0.25
function Decimal(obj, incrHrsMsg) {
    if (obj.value == "") return;
    if (!isNaN(obj.value)) {
        var val = eval(obj.value);

        var intVal = Math.floor(val);
        var frac = val - intVal;

        switch (frac) {
            case 0: break;
            case 0.25: break;
            case 0.5: break;
            case 0.75: break;
            default: alert(incrHrsMsg); obj.value = "0"; obj.focus();
        }
    }
}

function ValidateMobNumber(txtMobId,errorMsg)
{   
    if (isNaN(txtMobId.value))
    {
        alert(errorMsg);      
        txtMobId.focus();
        return false;
    }
    else if (!(txtMobId.value.length == 10))
    {
        alert(errorMsg);      
        txtMobId.focus();
        return false;
    }
}
function ValidateTextBoxCharLength(txtId,lenght, errorMsg)
{
    if (!(txtId.value.length > lenght)) {
        alert(errorMsg);
        txtId.value = "";
        txtId.focus();
        return false;
    }
}
function castToUpper(obj) {
    obj.value = obj.value.toUpperCase();
}
function StrCompare(str1, str2, errorMsg)
{
    if (str1.value!= str2.value) {
        alert(errorMsg);        
        str2.focus();
        return false;
    }
}

//*******************************Common Functions*********************//


//**********************************Date LookUp***********************************//

function fn_DateCompare(DateA, DateB)
{
    var a = new Date(DateA.value);
    var b = new Date(DateB.value);

    var msDateA = Date.UTC(a.getFullYear(), a.getMonth() + 1, a.getDate());
    var msDateB = Date.UTC(b.getFullYear(), b.getMonth() + 1, b.getDate());

    if (parseFloat(msDateA) < parseFloat(msDateB))
        return -1;  // less than
    else if (parseFloat(msDateA) == parseFloat(msDateB))
        return 0;  // equal
    else if (parseFloat(msDateA) > parseFloat(msDateB))
        return 1;  // greater than
    else
        return null;  // error
}
//**********************************Date LookUp***********************************//





//**********************************URL Encoding***********************************//
function decodeChar(strVal) {
    var txt = document.createElement("textarea");
    txt.innerHTML = strVal;
    return txt.value;
}
//**********************************URL Encoding***********************************//

