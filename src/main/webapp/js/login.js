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
        var email = $('#loginemail').val();
        var pass = $('#loginPassword').val();
        var remember = $('#remember').val();
        x_timer = setTimeout(function () {
            check_login_ajax(email, pass, remember, "Ajax Login");
        }, 1000);
    });

    function check_login_ajax(email, password, remember, action) {
        $.post('validate', {'email': email, 'pass': password, 'remember': remember, 'action': action}, function (data) {
            $("#user-result").html(data);
        });
    }
});