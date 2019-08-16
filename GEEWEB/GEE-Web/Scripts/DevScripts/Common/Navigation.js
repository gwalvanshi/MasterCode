///These function are using to generate the navigation menu based on logged in user.
// It is using in main layout page
/// Added by jiya
var obj;
var response;
var data;
$.ajax({
    type: 'POST',
    url: '/CommonMethods/GetMenuList',
    data: { "UserName": sessionStorage.getItem('userName'), "Action": 1 },
    success: function (response) {
        if (response != null || response!="" ) {
           // data = JSON.parse(response);
            BindData(response);
            myfunction();
        }
    },
    error: function () {
        alert(" An error occurred.5");
    },
});





////var data = response;
//var data = [{"Name":"Home","Menus_CTE2":[{"Name":"Admission","Menus_CTE3":[{"Name":"Add Enquiry","menuurl":"\/Admission\/Enquiry\/Add","Menus_CTE4":[{"Name":"Sell and Submit Form","menuurl":"\/UserManagement\/Group\/Create","Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Submit Documents","menuurl":"\/Admission\/Documents\/Update","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Index","menuurl":"\/Admission\/Students\/Index","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Dashboard","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Confirm Admission","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Setup","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Reports","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]}]},{"Name":"UserMangement","menuurl":"\/UserManagement\/iNDEX","Menus_CTE3":[{"Name":"Createuser","menuurl":"\/UserManagement\/Create","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Createbulkuser","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"CreateGroup","menuurl":"\/UserManagement\/Group\/Create","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"AssignPermession","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"Resetpassword","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]}]},{"Name":"Exammodule","Menus_CTE3":[{"Name":"setexam","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"ViewExam","menuurl":"NULL","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]},{"Name":"ViewExam1","menuurl":"NULL","Menus_CTE4":[{"Menus_CTE5":[{"Menus_CTE6":[{}]}]}]}]}]}];

$(".sidebar").append('<ul id="myUL"><li style = "margin-bottom: 1px; "> <a class="border-secondary" onclick="closeNav()"><i class="fas fa-ellipsis-h side-menu-icon"></i>Quick Links<i class="fas fa-chevron-circle-left closebtn"></i></a></li >');
//BindData(data);
function BindData(data) {
   
    var j = 3;
    var ct2 = 0;
    var ct3 = 0;
    if (data.Name == "Home") {
        $('#myUL').append('<li><a href="#"><i class="fas fa-home side-menu-icon"></i>' + data.Name + '</a></li>')

        if (data.Menus_CTE2.length > 0) {

            var count = 0;
            for (var k = 0; k < data.Menus_CTE2.length; k++) {
                $('#myUL').append('<li id="FirstLevelLI' + k + '"><a href="#" class="caret"><i class="far fa-address-card side-menu-icon"></i>' + data.Menus_CTE2[k].Name + '</a>');
                //$(".sidebar").append('<li id="FirstLevelLI' + k + '"><a href="' + data.Menus_CTE2[k].menuurl + '" class="caret"><i class="far fa-address-card side-menu-icon"></i>' + data.Menus_CTE2[k].Name + '</a>');
                if (data.Menus_CTE2[k].Menus_CTE3.length > 0) {
                    if (ct2 == 0) {
                        $('#FirstLevelLI' + k + '').append('<ul class="nested" id="parentli' + count + '">'); 

                        for (var kk = 0; kk < data.Menus_CTE2[k].Menus_CTE3.length; kk++) {
                            $('#parentli' + count + '').append('<li id="ChildUL' + kk + '"><a  class="caret" onclick=SaveMenuID("' + data.Menus_CTE2[k].Menus_CTE3[kk].MenuID + '","' + data.Menus_CTE2[k].Menus_CTE3[kk].MenuCode +'") href="' + data.Menus_CTE2[k].Menus_CTE3[kk].menuurl + '">' + data.Menus_CTE2[k].Menus_CTE3[kk].Name + '</a>');

                            if (ct3 == 0) {
                                $('#ChildUL' + kk + '').append('<ul class="nested"><li id="ChildULL' + j + '">');
                                for (var jk = 0; jk < data.Menus_CTE2[k].Menus_CTE3[kk].Menus_CTE4.length; jk++) {
                                    if (data.Menus_CTE2[k].Menus_CTE3[kk].Menus_CTE4[jk].Name != undefined) {
                                        $('#ChildULL' + j + '').append('<a class="" onclick=SaveMenuID("' + data.Menus_CTE2[k].Menus_CTE3[kk].Menus_CTE4[jk].MenuID + '","' + data.Menus_CTE2[k].Menus_CTE3[kk].Menus_CTE4[jk].MenuCode +'")  href="' + data.Menus_CTE2[k].Menus_CTE3[kk].Menus_CTE4[jk].menuurl + '">' + data.Menus_CTE2[k].Menus_CTE3[kk].Menus_CTE4[jk].Name + '</a>');
                                    }




                                }
                                j = j + 1;

                            }




                        }

                    }

                }
                count = count + 1;
            }
        }
    }
}

function myfunction() {
   
    var toggler = document.getElementsByClassName("caret");
    var i;

    for (i = 0; i < toggler.length; i++) {
        toggler[i].addEventListener("click", function ()
        {
            if (this.parentElement.querySelector(".nested") != null) {
                this.parentElement.querySelector(".nested").classList.toggle("active");
                this.classList.toggle("caret-down");
            }
        });
    }
}