/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    var timer;
    
    $('#login-form').submit(function (event) {
        event.preventDefault();

        var email = $('#email').val();
        var pass = $('#password').val();
        var remember;
        if ($('#remember').is(":checked")) remember = "yes";
        else remember = "no";

        clearTimeout(timer);
        $('#user-result').html('<img src="img/loading.gif" />');
        timer = setTimeout(function () {
            $.post('login', {'email': email, 'password': pass, 'remember': remember, 'action': "Ajax Login"}, function (data) {
                if (data === "1") {
                    $("#user-result").html("<i class=\"fa fa-close\"></i> User account does not exist");
                } else if (data === "2") {
                    $("#user-result").html("<i class=\"fa fa-close\"></i> Password is not correct");
                } else if (data === "3") {
                    $("#user-result").html("<i class=\"fa fa-close\"></i> Please type your email and password");
                } else {
                    window.location = 'home.jsp';
                }
            });
        }, 1000);
    });
});