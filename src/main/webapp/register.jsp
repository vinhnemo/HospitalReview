     
<%-- 
    Document   : register
    Created on : May 16, 2018, 5:46:22 PM
    Author     : MSI
--%>

<%@page import="DTO.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}"/>
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" />
</c:if>
<fmt:setBundle basename="text" />

<!DOCTYPE html>
<html lang="${language}">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <title>Doctor Strange | Hospital Review Website</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/form.css">
    </head> 

    <body>
        <%            
            Patient patient = new Patient();
            boolean filled = false;
            if (request.getAttribute("patient") != null) {
                patient = (Patient) request.getAttribute("patient");
                filled = true;
            }
        %>

        <!-- MAIN : form -->
        <main id="main">
            <div class="login-dark">
                <form class="register" id="register" action="#" method="post" style="width:600px;">
                    <h1 id="title"><fmt:message key="registeraccount"/></h1>

                    <% if (filled) {%>
                    <div class="form-group">
                        <span id="name-status"></span>
                        <input class="form-control d-inline" type="text" name="fname" id="fname" value="<%=patient.getFname()%>" required><input class="form-control d-inline" type="text" name="lname" id="lname" value="<%=patient.getLname()%>" required>
                    </div>
                    <div class="form-group">
                        <span id="status"></span>
                        <input class="form-control" type="email" id="email" name="email" value="<%=patient.getEmail()%>" required>
                        <span id="isExist"></span>
                    </div>
                    <% } else {%>
                    <div class="form-group">
                        <span id="name-status"></span>
                        <input class="form-control d-inline" type="text" name="fname" id="fname" placeholder="<fmt:message key="firstname"/>" required><input class="form-control d-inline" type="text" name="lname" id="lname" placeholder="<fmt:message key="lastname"/>" required>
                    </div>
                    <div class="form-group">
                        <span id="status"></span>
                        <input class="form-control" type="email" id="email" name="email" placeholder="Email" required>
                        <span id="isExist"></span>
                    </div>
                    <% }%>
                    <div class="form-group">
                        <input class="form-control d-inline-flex" type="password" name="password" placeholder="<fmt:message key="password"/>" style="width:200px;" minlength="6" maxlength="16" id="pass1" required>
                        <span id="pass-status"></span>
                    </div>
                    <div class="form-group">
                        <input class="form-control d-inline-flex" type="password" name="password2" placeholder="<fmt:message key="passwordconfirm"/>" style="width:200px;" minlength="6" maxlength="16" id="pass2" required>
                        <span id="confirmMessage"></span>
                    </div>
                    <div class="form-group">
                        <label style="color:#65757d; margin:0px 10px;"><fmt:message key="gender"/>:&nbsp;</label>
                        <select class="form-control d-inline" name="gender" id="gender" style="width:120px;color:#65757d;">
                            <option value="male"><fmt:message key="male"/></option>
                            <option value="female"><fmt:message key="female"/></option>
                            <option value="other"><fmt:message key="other"/></option>
                        </select>
                    </div>
                    <!-- <div class="form-group"><input class="form-control" type="date" style="color:#65757d;"></div> -->
                    <% if (filled) {%>
                    <div class="form-group">
                        <input class="form-control" type="text" name="address" id="address" value="<%=patient.getAddress()%>" style="width:420px;margin:0px 0px;" required>
                        <span id="statusAdd"></span>
                    </div>
                    <% } else {%>
                    <div class="form-group">
                        <input class="form-control" type="text" name="address" id="address" placeholder="<fmt:message key="address"/>" style="width:420px;margin:0px 0px;" required>
                        <span id="statusAdd"></span>
                    </div>
                    <% }%>
                    <input type="hidden" name="language" id="language" value="${pageContext.response.locale}">
                    <div class="form-group" style="padding-top: 20px;">
                        <input type="checkbox" required name="terms" onchange="this.setCustomValidity(validity.valueMissing ? '<fmt:message key="register.msg1"/>' : '');" id="field_terms">
                        <label for="terms"><fmt:message key="register.msg2"/> <a href="terms.php" title="<fmt:message key="register.msg3"/>"><fmt:message key="register.msg4"/></a> <fmt:message key="register.msg5"/></label>
                    </div>

                    <small><fmt:message key="register.msg6"/></small>
                    <small><fmt:message key="register.msg7"/></small>
                    <div class="form-group"><span id="form-result"></span></div>
                    <div class="form-group"><button class="btn btn-primary btn-block" type="submit" name="action" value="Signup"><fmt:message key="signup"/></button></div>
                    <a href="login" class="forgot"><fmt:message key="alreadyhaveaccount"/></a>
                </form>
            </div>
        </main>
        <!-- Footer -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-info">
                            <h3>Doctor STRANGE</h3>
                            <p> <fmt:message key="home.msg21"/></p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4><fmt:message key="usefullinks"/></h4>
                            <ul>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="home"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="aboutus"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="services"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="termsofservice"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="privacypolicy"/></a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4><fmt:message key="contact"/></h4>
                            <p>
                                69 IU Street <br>
                                Ho Chi Minh City, <br>
                                Viet Nam<br>
                                <strong><fmt:message key="phonenumber"/>:</strong> 911 <br>
                                <strong>Email:</strong> abc@gmail.com<br>
                            </p>

                            <div class="social-links">
                                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                                <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6 footer-newsletter">
                            <h4><fmt:message key="other"/></h4>
                            <p><fmt:message key="home.msg22"/> </p>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong>Doctor Strange</strong>. All Rights Reserved
                </div>
            </div>




            <script src="lib/bootstrap/js/bootstrap.min.js"></script>
            <script src="lib/jquery/jquery.min.js"></script>
            <script src="lib/jquery/jquery-migrate.min.js"></script>
            <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/superfish/hoverIntent.js"></script>
            <script src="lib/superfish/superfish.min.js"></script>
            <script src="lib/wow/wow.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/counterup/counterup.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="lib/isotope/isotope.pkgd.min.js"></script>
            <script src="lib/lightbox/js/lightbox.min.js"></script>
            <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
            <script src="js/registration.js"></script>
            <script src="js/main.js"></script>
    </body>
</html>

