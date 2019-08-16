$.ajax({
    url: '/Admin/Login/Dashboard/',
    method: 'POST',
    data: {
        groupId: sessionStorage.getItem('groupId'),
        schoolId: sessionStorage.getItem('schoolId'),
        sessionYear : sessionStorage.getItem('sessionYear')
    },
    success: function (response) {
        

    },
    error: function (jqXHR) {
        $('#divErrorText').text(jqXHR.responseText);
        $('#divError').show('fade');
    }
});