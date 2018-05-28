/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    'use strict';

    var lnameError = true,
            fnameError = true,
            emailError = true,
            address = true,
            timer;

    // Detect browser for css purpose
    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        $('.form form label').addClass('fontSwitch');
    }

    // Label effect
    $('input').focus(function () {
        $(this).siblings('label').addClass('active');
    });

    $('input').each(function () {
        if ($(this).val().length > 0)
            $(this).siblings('label').addClass('active');
    });

    // Form validation
    $('input').blur(function () {

        // First Name
        if ($(this).hasClass('fname')) {
            if ($(this).val().length === 0) {
                $(this).siblings('span.error').text('Please type your first name').fadeIn().parent('.form-group').addClass('hasError');
                fnameError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                fnameError = false;
            }
        }

        // Last Name
        if ($(this).hasClass('lname')) {
            if ($(this).val().length === 0) {
                $(this).siblings('span.error').text('Please type your last name').fadeIn().parent('.form-group').addClass('hasError');
                lnameError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                lnameError = false;
            }
        }

        // Email
        if ($(this).hasClass('email')) {
            var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
            if ($(this).val().length === 0) {
                $(this).siblings('span.error').text('Please type your email').fadeIn().parent('.form-group').addClass('hasError');
                emailError = true;
            } else if (regMail.test($(this).val()) === false) {
                $(this).siblings('span.error').text('Please type your email correctly').fadeIn().parent('.form-group').addClass('hasError');
                emailError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                emailError = false;
            }
            if (emailError === false) {
                isExistEmail($(this).val());
            }
        }

        function isExistEmail(email) {
            clearTimeout(timer);
            $('#isExist').html('<img src="img/loading.gif" />');
            timer = setTimeout(function () {
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

        // Address
        if ($(this).hasClass('address')) {
            var regAdd = /^(?=.*\d)[a-zA-Z\s\d\/]+$/;
            if ($(this).val().length === 0) {
                $(this).siblings('span.error').text('Please type your address').fadeIn().parent('.form-group').addClass('hasError');
                address = true;
            } else if (regAdd.test($(this).val()) === false) {
                $(this).siblings('span.error').text('Please type your address correctly').fadeIn().parent('.form-group').addClass('hasError');
                address = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                address = false;
            }
        }

        // label effect
        if ($(this).val().length > 0) {
            $(this).siblings('label').addClass('active');
        } else {
            $(this).siblings('label').removeClass('active');
        }
    });

    $('input').keyup(function () {
        $('#user-result').hide();
    });

    // form switch
    $('a.switch').click(function (e) {

        $(this).removeClass('active');
        e.preventDefault();

        if ($(this).is('#loginsw')) {
            $('#heading').text("Login");
            animeEffectIn();
            $(this).addClass('active');
        } else {
            $('#heading').text("Sign Up");
            animeEffectIn();
            $(this).addClass('active');
        }

        if ($('a.switch').hasClass('active')) {
            $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
        } else {
            $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
        }
    });

    // Form submit
    $('form.signup-form').submit(function (event) {
        if (fnameError === true || lnameError === true || emailError === true || address === true) {
            event.preventDefault();
            $('.fname, .lname, .email, .address').blur();
        }
    });

    $('form.login-form').submit(function (event) {
        $('#user-result').show();

        event.preventDefault();

        var email = $('#email').val();
        var pass = $('#password').val();
        var remember;
        if ($('#remember').is(":checked"))
            remember = "yes";
        else
            remember = "no";

        clearTimeout(timer);
        $('#user-result').html('<img src="img/loading.gif" />');
        timer = setTimeout(function () {
            $.post('login', {'email': email, 'password': pass, 'remember': remember, 'action': "Ajax Login"}, function (data) {
                var msg = JSON.parse(data);
                if (msg.code == -1) {
                    $('#user-result').html("<i class=\"fa fa-close\" style=\"color: red\">" + msg.text + "</i>");
                } else {
                    loadEffect();
                }
            });
        }, 1000);

    });

    // Reload page
    $('a.btn-dark').on('click', function () {
        location.reload(true);
    });

    $('#myLogin').on('hide.bs.modal', function () {
        location.reload(true);
    });

});

function loadEffect() {
    $('.signup, .login').addClass('switched');
    $('#heading').fadeOut().delay(1000).hide();
    setTimeout(function () {
        $('.signup, .login').hide();
    }, 700);
    setTimeout(function () {
        $('.brand').addClass('active');
    }, 300);
    setTimeout(function () {
        $('.heading').addClass('active');
    }, 600);
    setTimeout(function () {
        $('.success-msg p').addClass('active');
    }, 900);
    setTimeout(function () {
        $('.success-msg a').addClass('active');
    }, 1050);
    setTimeout(function () {
        $('.form').hide();
    }, 700);
}

function animeEffectIn() {
    $('#heading').each(function () {
        $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
    });

    anime.timeline({loop: true})
            .add({
                targets: '.effectAnime .letter',
                translateY: [100, 0],
                translateZ: 0,
                opacity: [0, 1],
                easing: "easeOutExpo",
                duration: 1400,
                delay: function (el, i) {
                    return 300 + 30 * i;
                }
            })
            .add({
                targets: '.effectAnime .letter',
                translateY: [0, -100],
                opacity: [1, 0],
                easing: "easeInExpo",
                duration: 1200,
                delay: function (el, i) {
                    return 100 + 30 * i;
                }
            });
}