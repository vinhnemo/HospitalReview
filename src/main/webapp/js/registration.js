/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if (pass1.value === pass2.value) {
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!";
    } else {
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!";
    }
}
// validates username only
function ValidateName(txt) {
    txt.value = txt.value.replace(/[^a-zA-Z0-9\n\r.]+/g, '');
}
// validates text only
function ValidateText(txt) {
    txt.value = txt.value.replace(/[^a-zA-Z\n\r]+/g, '');
}
// validate email
function email_validate(email)
{
    var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
    var message = document.getElementById("status");

    if (regMail.test(email) === false)
    {
        message.style.color = "#ff6666";
        message.innerHTML = "<span class='warning'><i class=\"fa fa-times\" aria-hidden=\"true\"> Email address is not valid yet.</span>";
    } else
    {
        message.style.color = "#66cc66";
        message.innerHTML = "<span class='valid'><i class=\"fa fa-check\" aria-hidden=\"true\"> Email address is valid!</span>";
    }
}
// validate date of birth
function dob_validate(dob)
{
    var regDOB = /^(\d{1,2})[-\/](\d{1,2})[-\/](\d{4})$/;

    if (regDOB.test(dob) === false)
    {
        document.getElementById("statusDOB").innerHTML = "<span class='warning'>DOB is only used to verify your age.</span>";
    } else
    {
        document.getElementById("statusDOB").innerHTML = "<span class='valid'>Thanks, you have entered a valid DOB!</span>";
    }
}
// validate address
function add_validate(address)
{
    var regAdd = /^(?=.*\d)[a-zA-Z\s\d\/]+$/;
    var message = document.getElementById("statusAdd");

    if (regAdd.test(address) === false)
    {
        message.style.color = "#ff6666";
        message.innerHTML = "<span class='warning'>Address is not valid yet.</span>";
    } else
    {
        message.style.color = "#66cc66";
        message.innerHTML = "<span class='valid'>Thanks, Address looks valid!</span>";
    }
}

function validatephone(phone) 
{
    var maintainplus = '';
    var numval = phone.value;
    if ( numval.charAt(0)==='+' )
    {
        var maintainplus = '';
    }
    curphonevar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g,'');
    phone.value = maintainplus + curphonevar;
    var maintainplus = '';
    phone.focus;
}

$(document).ready(function () {
    var x_timer;
    $("#username").keyup(function (e) {
        clearTimeout(x_timer);
        $("#user-result").html('<img src="img/loading.gif" />');
        var user_name = $(this).val();
        x_timer = setTimeout(function () {
            check_username_ajax(user_name);
        }, 1000);
    });

    function check_username_ajax(username) {
        $.post('validate', {'username': username}, function (data) {
            $("#user-result").html(data);
        });
    }
});
