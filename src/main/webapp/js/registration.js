/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    var x_timer;

    // Validate Email
    $("#email").blur(function (e) {
        if (emailError === false) {
            isExist();
        }
    });

    // Form validation
    var lnameError = true,
            fnameError = true,
            emailError = true,
            addressError = true,
            passwordError = true,
            passwordConfirm = true;

    // Email
    $('#email').focus(function (e) {
        $('#status').show();
        $('#isExist').hide();
        if ($(this).val().length != 0) {
            checkEmail();
        }
        $(this).keyup(function (e) {
            checkEmail();
        });
    });

    function checkEmail() {
        var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
        if ($('#email').val().length === 0) {
            $('#status').html("<i class=\"fa fa-close\" style=\"color: #ff6666\"> Please enter your email</i>");
            emailError = true;
        } else if (regMail.test($('#email').val()) === false) {
            $('#status').html("<i class=\"fa fa-close\" style=\"color: #ff6666\"> Please enter your email correctly</i>");
            emailError = true;
        } else {
            $('#status').html("<i class=\"fa fa-check\" style=\"color: #66cc66\"> Your email is correct</i>");
            emailError = false;
        }
    }

    function isExist() {
        $('#status').hide();
        $('#isExist').show();
        clearTimeout(x_timer);
        $("#isExist").html('<img src="img/loading.gif" />');
        var email = $('#email').val();
        x_timer = setTimeout(function () {
            $.post('register', {'email': email, 'action': "Validate"}, function (data) {
                var msg = JSON.parse(data);
                if (msg.code == -1) {
                    $('#isExist').html("<i class=\"fa fa-close\" style=\"color: #ff6666\"> " + msg.text + "</i>");
                    emailError = true;
                } else {
                    $('#isExist').html("<i class=\"fa fa-check\" style=\"color: #66cc66\"> " + msg.text + "</i>");
                }
            });
        }, 1000);
    }

    // Name
    $('#fname').keyup(function (e) {
        var text = $(this).val().replace(/[^a-zA-Z\n\r]+/g, '');
        $(this).val(text);
    });

    $('#lname').keyup(function (e) {
        var text = $(this).val().replace(/[^a-zA-Z\n\r]+/g, '');
        $(this).val(text);
    });

    $('#lname').blur(function (e) {
        if ($(this).val().length === 0 || $('#fname').val().length === 0) {
            $('#name-status').show();
            $('#name-status').html("<i class=\"fa fa-close\" style=\"color: #ff6666\"> Please enter your name</i>");
            fnameError = true;
            lnameError = true;
        } else {
            $('#name-status').hide();
            fnameError = false;
            lnameError = false;
        }
    });

    // Address
    $('#address').blur(function (e) {
        if ($(this).val().length === 0) {
            $('#statusAdd').show();
            $('#statusAdd').html("<i class=\"fa fa-close\" style=\"color: #ff6666\"> Please enter your address</i>");
            addressError = true;
        } else {
            $('#statusAdd').hide();
            addressError = false;
        }
    });

    // Password
    $('#pass1').blur(function (e) {
        if ($(this).val().length < 6) {
            $('#pass-status').show();
            $('#pass-status').html("<i class=\"fa fa-close\" style=\"color: #ff6666\"> Please enter your password at least 6 characters</i>");
            passwordError = true;
        } else {
            $('#pass-status').hide();
            passwordError = false;
            if ($('#pass2').val().length !== 0) {
                checkPassword();
            }
        }
    });

    $('#pass2').keyup(checkPassword());

    function checkPassword() {
        if ($('#pass1').val().length === 0) {
            passwordConfirm = true;
        } else if ($('#pass1').val() !== $('#pass2').val()) {
            $('#pass2').css({'background': '#ff6666'});
            $('#confirmMessage').html("<i class=\"fa fa-close\" style=\"color: #ff6666\"> Passwords do not match</i>");
            passwordConfirm = true;
        } else {
            $('#pass2').css({'background': '#66cc66'});
            $('#confirmMessage').html("<i class=\"fa fa-check\" style=\"color: #66cc66\"> Passwords match!</i>");
            passwordConfirm = false;
        }
    }

    $('.register').submit(function (e) {
        e.preventDefault();

        if (fnameError === true || lnameError === true || emailError === true || addressError === true || passwordError === true || passwordConfirm === true) {
            $('#fname, #lname, #email, #address, #pass1, #pass2').blur();
        } else {
            var fname = $('#fname').val();
            var lname = $('#lname').val();
            var email = $('#email').val();
            var pass1 = $('#pass1').val();
            var pass2 = $('#pass2').val();
            var address = $('#address').val();
            var gender = $('#gender').val();
            var language = $('#language').val();

            clearTimeout(x_timer);
            $('#form-result').html('<img src="img/loading.gif" />');
            x_timer = setTimeout(function () {
                $.post('register', {'fname': fname,
                    'lname': lname,
                    'email': email,
                    'password': pass1,
                    'password2': pass2,
                    'address': address,
                    'gender': gender,
                    'language': language,
                    'type': "patient",
                    'action': "Register"
                }, function (data) {
                    var msg = JSON.parse(data);
                    if (msg.code == -1) {
                        $('#form-result').show();
                        $('#form-result').html("<i class=\"fa fa-close\" style=\"color: #ff6666\">" + msg.text + "</i>");
                    } else {
                        $('#form-result').hide();
                        alert(msg.text);
                        setTimeout(function () {
                            location.href = 'home.jsp';
                        }, 2000);
                    }
                });
            }, 1000);
        }
    });
});

document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");