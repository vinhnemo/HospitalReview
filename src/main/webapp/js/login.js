/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    var x_timer;
    $("#login").click(function (e) {
        clearTimeout(x_timer);
        $('#user-result').html('<img src="img/loading.gif" />');
        var email = $('#email').val();
        var pass = $('#password').val();
        x_timer = setTimeout(function () {
            check_login_ajax(email, pass);
        }, 1000);
    });

    function check_login_ajax(email, password) {
        $.post('validate', {'email': email, 'pass': password}, function (data) {
            $("#user-result").html(data);
        });
    }
});