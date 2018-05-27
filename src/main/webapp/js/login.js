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
                var msg = JSON.parse(data);
                
                if (msg.code === 0) {
                    $('#user-result').html("<i class=\"fa fa-close\" style=\"color: red\">" + msg.text + "</i>");
                } else {
                    $('#user-result').html("<i class=\"fa fa-check\" style=\"color: green\">" + msg.text + "</i>");
                }
            });
        }, 1000);
    });
});