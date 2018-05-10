<%-- 
    Document   : registration
    Created on : May 10, 2018, 12:02:35 AM
    Author     : TGMaster
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="icon" href=" ">
        <title>Hospital Patient Registration Page</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Registration CSS -->
        <link href="css/registration.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/loading.css" rel="stylesheet">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>
        <%
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }

        %>

        <div class="container">

            <div class="row">
                <div class="col-md-6">

                    <form action="register" method="post" id="fileForm" role="form">
                        <fieldset><legend class="text-center">Registration Form</legend>

                            <%if (error.length() > 0) {%>
                            <div class="form-control-feedback">
                                <span class="text-danger align-middle">
                                    <i class="fa fa-close"></i> <%=error%>
                                </span>
                            </div>
                            <%}%>

                            <div class="form-group">
                                <label for="username"><span class="req">* </span> Username:  <small>This will be your login user name</small> </label> 
                                <input class="form-control" type="text" name="username" id = "username" minlength="6" onkeyup="ValidateName(this)" required />  
                                <span id="user-result"></span>
                            </div>

                            <div class="form-group">
                                <label for="password"><span class="req">* </span> Password: </label>
                                <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16"  id="pass1" /> </p>

                                <label for="password"><span class="req">* </span> Password Confirm: </label>
                                <input required name="password2" type="password" class="form-control inputpass" minlength="4" maxlength="16" placeholder="Re-enter password"  id="pass2" onchange="checkPass(); return false;" />
                                <input type="hidden" name="" value="">
                                <span id="confirmMessage" class="confirmMessage"></span>
                            </div>

                            <div class="form-group">
                                <label for="email"><span class="req">* </span> Email Address: </label> 
                                <input class="form-control" required type="text" name="email" id = "email"  onchange="email_validate(this.value);" />   
                                <div class="status" id="status"></div>
                            </div>

                            <div class="form-group"> 	 
                                <label for="address"><span class="req">* </span> Address: </label>
                                <input class="form-control" type="text" name="address" id = "txt" onkeyup = "add_validate(this.value)" required /> 
                                <div id="statusAdd"></div>    
                            </div>

                            <div class="form-group">
                                <label for="dob"> Date of Birth: </label> 
                                <input class="form-control" type="text" name="dob" id = "dob" onkeyup = "dob_validate(this.value)" placeholder="DD-MM-YYYY"/>  
                                <div id="statusDOB"></div>
                            </div>

                            <div class="form-group">
                                <hr>
                                <input type="checkbox" required name="terms" onchange="this.setCustomValidity(validity.valueMissing ? 'Please indicate that you accept the Terms and Conditions' : '');" id="field_terms">   <label for="terms">I agree with the <a href="terms.php" title="You may read our terms and conditions by clicking on this link">terms and conditions</a> for Registration.</label><span class="req">* </span>
                            </div>

                            <div class="form-group">
                                <input class="btn btn-success" type="submit" name="submit" value="Register">
                            </div>
                            <small>You will receive an email to complete the registration and validation process.<br></small>
                            <small>Be sure to check your spam folders. </small>


                        </fieldset>
                    </form><!-- ends register form -->
                </div><!-- ends col-6 -->

                <div class="col-md-6 text-center">
                    <svg viewBox="0 0 960 300">
                    <symbol id="s-text">
                        <text text-anchor="middle" x="50%" y="80%">Gamelord </text>
                    </symbol>

                    <g class = "g-ants">
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    <use xlink:href="#s-text" class="text-copy"></use>
                    </g>
                    </svg>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js" ></script>
        <script src="js/tether.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/registration.js"></script>

        <script type="text/javascript">document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");</script>

    </body>
</html>