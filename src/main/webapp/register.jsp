<%-- 
    Document   : registration
    Created on : May 10, 2018, 12:02:35 AM
    Author     : TGMaster
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}" scope="session" />
<%String language = request.getParameter("language"), english = "", french = "", vietnamese = "";
    if (language == null) language = "en_US";
    if(language.equals("en_US")) {language = "English"; english = "active";}
    else if(language.equals("fr_FR")) {language = "Français"; french = "active";}
    else if(language.equals("vi_VN")) {language = "Tiếng Việt"; vietnamese = "active";}
%>
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" />
</c:if>
<fmt:setBundle basename="text" />

<!DOCTYPE html>
<html lang="${language}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="icon" href=" ">
        <title>Doctor Strange</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Registration CSS -->
        <link href="css/registration.css" rel="stylesheet">
        <link href="css/language.css" rel="stylesheet">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <script src="js/popper.min.js"></script>
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
                <div class="col-md-3"></div>
                <div class="col-md-6">

                    <form action="register" method="post" id="fileForm" role="form">
                        <fieldset><legend class="text-center"><fmt:message key="label.register.registerform"/></legend>

                            <%if (error.length() > 0) {%>
                            <div class="form-control-feedback">
                                <span class="text-danger align-middle">
                                    <i class="fa fa-close"></i> <%=error%>
                                </span>
                            </div>
                            <%}%>

                            <div class="form-group">
                                <label for="username"><span class="req">* </span> <fmt:message key="label.username"/>:  <small><fmt:message key="label.register.msg1"/></small> </label> 
                                <input class="form-control" type="text" name="username" id = "username" minlength="6" onkeyup="ValidateName(this)" required />  
                                <span id="user-result"></span>
                            </div>

                            <div class="form-group">
                                <label for="password"><span class="req">* </span> <fmt:message key="label.password"/>: </label>
                                <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16"  id="pass1" /> </p>

                                <label for="password"><span class="req">* </span> <fmt:message key="label.passwordconfirm"/>: </label>
                                <input required name="password2" type="password" class="form-control inputpass" minlength="4" maxlength="16" placeholder="Re-enter password"  id="pass2" onchange="checkPass(); return false;" />
                                <input type="hidden" name="" value="">
                                <span id="confirmMessage" class="confirmMessage"></span>
                            </div>

                            <div class="form-group">
                                <label for="email"><span class="req">* </span> <fmt:message key="label.email"/>: </label> 
                                <input class="form-control" required type="text" name="email" id = "email"  onchange="email_validate(this.value);" />   
                                <div class="status" id="status"></div>
                            </div>

                            <div class="form-group"> 	 
                                <label for="address"><span class="req">* </span> <fmt:message key="label.address"/>: </label>
                                <input class="form-control" type="text" name="address" id = "txt" onkeyup = "add_validate(this.value)" required /> 
                                <div id="statusAdd"></div>    
                            </div>

                            <div class="form-group">
                                <label for="dob"> <fmt:message key="label.dob"/>: </label> 
                                <input class="form-control" type="text" name="dob" id = "dob" onkeyup = "dob_validate(this.value)" placeholder="DD-MM-YYYY"/>  
                                <div id="statusDOB"></div>
                            </div>

                            <div class="form-group">
                                <hr>
                                <input type="checkbox" required name="terms" onchange="this.setCustomValidity(validity.valueMissing ? 'Please indicate that you accept the Terms and Conditions' : '');" id="field_terms">   <label for="terms"><fmt:message key="label.register.msg5"/> <a href="terms.php" title="You may read our terms and conditions by clicking on this link"><fmt:message key="label.register.msg6"/></a> <fmt:message key="label.register.msg7"/></label><span class="req">* </span>
                            </div>

                            <div class="form-group">
                                <input class="btn btn-success" type="submit" name="submit" value=<fmt:message key="label.register.btn"/>>
                            </div>
                            <small><fmt:message key="label.register.msg3"/>.<br></small>
                            <small><fmt:message key="label.register.msg4"/>. </small>


                        </fieldset>
                    </form><!-- ends register form -->
                </div><!-- ends col-6 -->
            </div>

        </div>

        <div class="footer">
            <div class="container-fluid">
                <div class="btn-group dropup btn-sm">
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%=language%>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item <%=english%>" href="/register?language=en_US">English</a>
                        <a class="dropdown-item <%=french%>" href="/register?language=fr_FR">Français</a>
                        <a class="dropdown-item <%=vietnamese%>" href="/register?language=vi_VN">Tiếng Việt</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/registration.js"></script>
        <script type="text/javascript">document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");</script>
    </body>
</html>