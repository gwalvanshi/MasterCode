function ddlvalidationCombo(ddlid) {

    var DropDownids = ddlid.split(",");

    DropDownids.forEach(dropDownValidation);
    function dropDownValidation(item, index) {

        if ($('#' + item).val() == "0") {
            isAllValid = false;
            $('#' + item).siblings('span.error').css('visibility', 'visible');
        }
        else {
            $('#' + item).siblings('span.error').css('visibility', 'hidden');
        }
    }

}


function txtvalidation(txtid) {

 var txtBoxids = txtid.split(",");

    txtBoxids.forEach(txtBoxvalidation);
    function txtBoxvalidation(item, index) {

        if (!($('#' + item).val().trim())) {
            isAllValid = false;
            $('#' + item).siblings('span.error').css('visibility', 'visible');
        }
        else {
            $('#' + item).siblings('span.error').css('visibility', 'hidden');
        }
    }

}

function validationmsz(id) {
    
    var elementids = id.split(",");
    
    elementids.forEach(myFunction);
    function myFunction(item, index) {
       
        $('#' + item).siblings('span.error').css('visibility', 'hidden');
    }
 
}