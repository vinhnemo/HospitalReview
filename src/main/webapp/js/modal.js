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
            address = true;

    // Detect browser for css purpose
    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        $('.form form label').addClass('fontSwitch');
    }

    // Label effect
    $('input').focus(function () {

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


    // form switch
    $('a.switch').click(function (e) {
        $(this).toggleClass('active');
        e.preventDefault();

        if ($('a.switch').hasClass('active')) {
            $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
        } else {
            $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
        }
    });


    // Form submit
    $('form.signup-form').submit(function (event) {
        
        if (fnameError === true || lnameError === true || emailError === true || address === true) {
            $('.fname, .lname, .email, .address').blur();
        }
    });

    $('form.login-form').submit(function (event) {
        event.preventDefault();
        
        $('.signup, .login').addClass('switched');

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

    });

    // Reload page
    $('a.profile').on('click', function () {
        location.reload(true);
    });


});